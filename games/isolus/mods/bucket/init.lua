-- Isolus mod: bucket
-- See README.txt for licensing and other information.

-- Load support for MT game translation.
local S = core.get_translator("bucket")


core.register_alias("bucket", "bucket:bucket_empty")
core.register_alias("bucket_water", "bucket:bucket_water")
core.register_alias("bucket_lava", "bucket:bucket_lava")

core.register_craft({
	output = "bucket:bucket_empty",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "bucket:clay_bucket_unfired",
	recipe = {
		{"default:clay_lump", "default:stick"},
		{"", "default:clay_lump"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:clay_lump 4",
	recipe = {"bucket:clay_bucket_unfired", "bucket:clay_bucket_unfired"}
})

if core.registered_items["vessels:clay_bowl_unfired"] then
	core.register_craft({
		output = "vessels:clay_bowl_unfired 4",
		recipe = {{"bucket:clay_bucket_unfired"}}
	})
end

core.register_craft({
	type = "cooking",
	output = "bucket:clay_bucket_empty",
	recipe = "bucket:clay_bucket_unfired",
	cooktime = 3,
})

core.register_craft({
	output = "bucket:wooden_bucket_empty",
	recipe = {
		{"fabric:string"},
		{"default:axe_steel"},
		{"group:wood"}
	},
	replacements = {{"default:axe_steel", "default:axe_steel"}}
})

if core.registered_items["vessels:wood_bowl"] then
	core.register_craft({
		output = "vessels:wood_bowl 2",
		recipe = {{"bucket:wooden_bucket_empty"}}
	})
end

bucket = {}
bucket.liquids = {}
bucket.wliquids = {}
bucket.cliquids = {}

local function check_protection(pos, name, text, btype)
	if core.is_protected(pos, name) then
		btype = btype or "steel"
		core.log("action", (name ~= "" and name or "A mod")
			.." tried to ".. text
			.." at protected position "
			.. core.pos_to_string(pos)
			.." with a ".. btype .." bucket")
		core.record_protection_violation(pos, name)
		return true
	end
	return false
end

local function log_action(pos, name, action)
	core.log("action", (name ~= "" and name or "A mod")
		.." ".. action .." at ".. core.pos_to_string(pos) .." with a bucket")
end

-- Register a new liquid
--    source = name of the source node
--    flowing = name of the flowing node
--    itemname = name of the new bucket item (or nil if liquid is not takeable)
--    inventory_image = texture of the new bucket item (ignored if itemname == nil)
--    name = text description of the bucket item
--    groups = (optional) groups of the bucket item, for example {water_bucket = 1}
--    force_renew = (optional) bool. Force the liquid source to renew if it has a
--                  source neighbour, even if defined as 'liquid_renewable = false'.
--                  Needed to avoid creating holes in sloping rivers.
-- This function can be called from any mod (that depends on bucket).
function bucket.register_liquid(source, flowing, itemname, inventory_image, name,
		groups, force_renew, glow, btype)
	local itemname_raw = itemname
	itemname = itemname and itemname:match("^:(.+)") or itemname
	local emptyform = "bucket:bucket_empty"

if btype == nil or btype == "" then
	bucket.liquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
		force_renew = force_renew,
	}
	bucket.liquids[flowing] = bucket.liquids[source]
elseif btype == "clay" then
	bucket.cliquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
		force_renew = force_renew,
	}
	bucket.cliquids[flowing] = bucket.cliquids[source]
	emptyform = "bucket:clay_bucket_empty"
elseif btype == "wooden" then
	bucket.wliquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
		force_renew = force_renew,
	}
	bucket.wliquids[flowing] = bucket.wliquids[source]
	emptyform = "bucket:wooden_bucket_empty"
end
	if itemname ~= nil then
		core.register_craftitem(itemname_raw, {
			description = name,
			inventory_image = inventory_image,
			stack_max = 1,
			liquids_pointable = true,
			light_source = glow or 0,
			groups = groups,

			on_place = function(itemstack, user, pointd)
				-- Must be pointing to node
				if pointd.type ~= "node" then
					return
				end

				local node = core.get_node_or_nil(pointd.under)
				local ndef = node and core.registered_nodes[node.name]

		-- Call on_rightclick if the pointed node defines it
		if ndef and ndef.on_rightclick and
			not (user and user:is_player() and user:get_player_control().sneak) then
			return ndef.on_rightclick(pointd.under, node, user, itemstack)
		end

				local lpos

				-- Check if pointing at a buildable to node
				if ndef and ndef.buildable_to then
					-- buildable; replace the node
					lpos = pointd.under
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced

					lpos = pointd.above
					node = core.get_node_or_nil(lpos)
					local above_ndef = node and core.registered_nodes[node.name]

					if not above_ndef or not above_ndef.buildable_to then
						-- do not replace the bucket
						return itemstack
					end
				end

				local pname = user and user:get_player_name() or ""
				if check_protection(lpos, pname, "place ".. source, btype) then
					return
				end

				core.set_node(lpos, {name = source})
				log_action(lpos, pname, "placed ".. source)
				return ItemStack(emptyform)
			end
		})
	end
end

core.register_craftitem("bucket:bucket_empty", {
	description = S("Empty Bucket"),
	inventory_image = "bucket.png",
	groups = {tool = 1},
	liquids_pointable = true,
	on_use = function(itemstack, user, pointd)
		if pointd.type == "object" then
			pointd.ref:punch(user, 1., { full_punch_interval=1. }, nil)
			return user:get_wielded_item()
		elseif pointd.type ~= "node" then
			-- do nothing if it's neither object nor node
			return
		end
		-- Check if pointing to a liquid source
		local pos = pointd.under
		local node = core.get_node(pos)
		local liquiddef = bucket.liquids[node.name]
		local item_count = user:get_wielded_item():get_count()

		if liquiddef ~= nil
		and liquiddef.itemname ~= nil
		and node.name == liquiddef.source then
			local pname = user and user:get_player_name() or ""
			if check_protection(pos, pname, "take ".. node.name) then
				return
			end

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucket, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name=liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local upos = user:get_pos()
					upos.y = math.floor(upos.y + .5)
					core.add_item(upos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "bucket:bucket_empty ".. tostring(item_count-1)
			end

			-- force_renew requires a source neighbour
			local source_neighbor = false
			if liquiddef.force_renew then
				source_neighbor = core.find_node_near(pos, 1, liquiddef.source)
			end
			if source_neighbor and liquiddef.force_renew then
				log_action(pos, pname, "picked up ".. liquiddef.source .." (force renewed)")
			else
				core.set_node(pos, {name = "air"})
				log_action(pos, pname, "picked up ".. liquiddef.source)
			end

			return ItemStack(giving_back)
		else
			-- non-liquid nodes will have their on_punch triggered
			local node_def = core.registered_nodes[node.name]
			if node_def then
				node_def.on_punch(pos, node, user, pointd)
			end
			return user:get_wielded_item()
		end
	end,
})

core.register_craftitem("bucket:clay_bucket_empty", {
	description = S("Empty Clay Bucket"),
	inventory_image = "earthbuild_clay_pot.png",
	groups = {tool = 1},
	liquids_pointable = true,
	on_use = function(itemstack, user, pointd)
		if pointd.type == "object" then
			pointd.ref:punch(user, 1., { full_punch_interval=1. }, nil)
			return user:get_wielded_item()
		elseif pointd.type ~= "node" then
			-- do nothing if it's neither object nor node
			return
		end
		-- Check if pointing to a liquid source
		local pos = pointd.under
		local node = core.get_node(pos)
		local liquiddef = bucket.cliquids[node.name]
		local item_count = user:get_wielded_item():get_count()

		if liquiddef ~= nil
		and liquiddef.itemname ~= nil
		and node.name == liquiddef.source then
			local pname = user and user:get_player_name() or ""
			if check_protection(pos, pname, "take ".. node.name, "clay") then
				return
			end

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucket, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name=liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local upos = user:get_pos()
					upos.y = math.floor(upos.y + .5)
					core.add_item(upos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "bucket:clay_bucket_empty ".. tostring(item_count-1)
			end

			-- force_renew requires a source neighbour
			local source_neighbor = false
			if liquiddef.force_renew then
				source_neighbor = core.find_node_near(pos, 1, liquiddef.source)
			end
			if source_neighbor and liquiddef.force_renew then
				log_action(pos, pname, "picked up ".. liquiddef.source .." (force renewed)")
			else
				core.set_node(pos, {name = "air"})
				log_action(pos, pname, "picked up ".. liquiddef.source)
			end

			return ItemStack(giving_back)
		else
			-- non-liquid nodes will have their on_punch triggered
			local node_def = core.registered_nodes[node.name]
			if node_def then
				node_def.on_punch(pos, node, user, pointd)
			end
			return user:get_wielded_item()
		end
	end,
})

core.register_craftitem("bucket:clay_bucket_unfired", {
	description = "Unfired Clay Bucket",
	inventory_image = "earthbuild_unfired_clay_pot.png",
})

core.register_craftitem("bucket:wooden_bucket_empty", {
	description = S("Empty Wooden Bucket"),
	inventory_image = "bucket_wooden.png",
	groups = {tool = 1, flammable = 2},
	liquids_pointable = true,
	on_use = function(itemstack, user, pointd)
		if pointd.type == "object" then
			pointd.ref:punch(user, 1., { full_punch_interval=1. }, nil)
			return user:get_wielded_item()
		elseif pointd.type ~= "node" then
			-- do nothing if it's neither object nor node
			return
		end
		-- Check if pointing to a liquid source
		local pos = pointd.under
		local node = core.get_node(pos)
		local liquiddef = bucket.wliquids[node.name]
		local item_count = user:get_wielded_item():get_count()

		if liquiddef ~= nil
		and liquiddef.itemname ~= nil
		and node.name == liquiddef.source then
			local pname = user and user:get_player_name() or ""
			if check_protection(pos, pname, "take ".. node.name, "wooden") then
				return
			end

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucket, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name=liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local upos = user:get_pos()
					upos.y = math.floor(upos.y + .5)
					core.add_item(upos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "bucket:wooden_bucket_empty ".. tostring(item_count-1)
			end

			-- force_renew requires a source neighbour
			local source_neighbor = false
			if liquiddef.force_renew then
				source_neighbor = core.find_node_near(pos, 1, liquiddef.source)
			end
			if source_neighbor and liquiddef.force_renew then
				log_action(pos, pname, "picked up ".. liquiddef.source .." (force renewed)")
			else
				core.set_node(pos, {name = "air"})
				log_action(pos, pname, "picked up ".. liquiddef.source)
			end

			return ItemStack(giving_back)
		else
			-- non-liquid nodes will have their on_punch triggered
			local node_def = core.registered_nodes[node.name]
			if node_def then
				node_def.on_punch(pos, node, user, pointd)
			end
			return user:get_wielded_item()
		end
	end,
})

bucket.register_liquid(
	"default:water_source",
	"default:water_flowing",
	"bucket:bucket_water",
	"bucket_water.png",
	S("Water Bucket"),
	{tool = 1, water_bucket = 1, salt_water_bucket = 1}
)

-- Fresh water source is 'liquid_renewable = false' to avoid horizontal spread
-- of water sources in sloping rivers that can cause water to overflow
-- riverbanks and cause floods.
-- Fresh water source is instead made renewable by the 'force renew' option
-- used here.

bucket.register_liquid(
	"default:fresh_water_source",
	"default:fresh_water_flowing",
	"bucket:bucket_fresh_water",
	"bucket_fresh_water.png",
	S("Fresh Water Bucket"),
	{tool = 1, water_bucket = 1, fresh_water_bucket = 1},
	true
)

bucket.register_liquid(
	"default:lava_source",
	"default:lava_flowing",
	"bucket:bucket_lava",
	"bucket_lava.png",
	S("Lava Bucket"),
	{tool = 1},
	false,
	default.LIGHT_MAX - 2	-- Greater than 6
)

bucket.register_liquid(
	"default:water_source",
	"default:water_flowing",
	"bucket:clay_bucket_water",
	"earthbuild_clay_pot_water.png",
	"Water Clay Bucket",
	{tool = 1, water_bucket = 1, salt_water_bucket = 1, water_bucket_clay = 1},
	false, nil,
	"clay"
)

bucket.register_liquid(
	"default:fresh_water_source",
	"default:fresh_water_flowing",
	"bucket:clay_bucket_fresh_water",
	"earthbuild_clay_pot_fresh_water.png",
	"Fresh Water Clay Bucket",
	{tool = 1, water_bucket = 1, fresh_water_bucket = 1, water_bucket_clay = 1},
	true, nil,
	"clay"
)

bucket.register_liquid(
	"default:lava_source",
	"default:lava_flowing",
	"bucket:clay_bucket_lava",
	"earthbuild_clay_pot_lava.png",
	"Lava Clay Bucket",
	{tool = 1},
	false,
	default.LIGHT_MAX - 2,	-- Greater than 6
	"clay"
)

bucket.register_liquid(
	"default:water_source",
	"default:water_flowing",
	"bucket:wooden_bucket_water",
	"bucket_wooden_water.png",
	"Water Wooden Bucket",
	{tool = 1, water_bucket = 1, salt_water_bucket = 1, water_bucket_wooden = 1},
	false, nil,
	"wooden"
)

bucket.register_liquid(
	"default:fresh_water_source",
	"default:fresh_water_flowing",
	"bucket:wooden_bucket_fresh_water",
	"bucket_wooden_fresh_water.png",
	"Fresh Water Wooden Bucket",
	{tool = 1, water_bucket = 1, fresh_water_bucket = 1, water_bucket_wooden = 1},
	true, nil,
	"wooden"
)

core.register_craft({
	type = "fuel",
	recipe = "bucket:bucket_lava",
	burntime = 60,
	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}}
})

core.register_craft({
	type = "fuel",
	recipe = "bucket:clay_bucket_lava",
	burntime = 60,
	replacements = {{"bucket:clay_bucket_lava", "bucket:clay_bucket_empty"}}
})

core.register_craft({
	type = "fuel",
	recipe = "bucket:wooden_bucket_empty",
	burntime = 22,
})

-- Register buckets as dungeon loot
if core.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "bucket:bucket_empty", chance = .55},
		{name = "bucket:clay_bucket_empty", chance = .56},
		{name = "bucket:wooden_bucket_empty", chance = .58},
		-- water in deserts/ice or above ground, lava otherwise
		{name = "bucket:bucket_water", chance = .45,
			types = {"sandstone", "desert", "ice"}},
		{name = "bucket:wooden_bucket_water", chance = .46,
			types = {"sandstone", "desert", "ice"}},
		{name = "bucket:bucket_water", chance = .45, y = {0, 32768},
			types = {"normal"}},
		{name = "bucket:clay_bucket_water", chance = .46, y = {0, 32768},
			types = {"normal"}},
		{name = "bucket:wooden_bucket_water", chance = .48, y = {0, 32768},
			types = {"normal"}},
		{name = "bucket:bucket_lava", chance = .45, y = {-32768, -1},
			types = {"normal"}},
	})
end

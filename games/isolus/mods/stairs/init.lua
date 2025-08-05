-- stairs/init.lua

-- Isolus mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}

-- Load support for MT game translation.
local S = core.get_translator("stairs")
-- Same as S, but will be ignored by translation file update scripts
local T = S


-- Register aliases for new pine node names

core.register_alias("stairs:stair_pinewood", "stairs:stair_pine_wood")
core.register_alias("stairs:slab_pinewood", "stairs:slab_pine_wood")


-- Get setting for replace ABM

local replace = core.settings:get_bool("enable_stairs_replace_abm")

local function rotate_and_place(itemstack, placer, pointd)
	local p0 = pointd.under
	local p1 = pointd.above
	local param2 = 0

	if placer then
		local placer_pos = placer:get_pos()
		if placer_pos then
			local diff = vector.subtract(p1, placer_pos)
			param2 = core.dir_to_facedir(diff)
			-- The player places a node on the side face of the node he is standing on
			if p0.y == p1.y and math.abs(diff.x) <= 0.5 and math.abs(diff.z) <= 0.5 and diff.y < 0 then
				-- reverse node direction
				param2 = (param2 + 2) % 4
			end
		end

		local finepos = core.pointed_thing_to_face_pos(placer, pointd)
		local fpos = finepos.y % 1

		if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
				or (fpos < -0.5 and fpos > -0.999999999) then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end
	end
	return core.item_place(itemstack, placer, pointd, param2)
end

local function warn_if_exists(nodename)
	if core.registered_nodes[nodename] then
		core.log("warning", "Overwriting stairs node: " .. nodename)
	end
end

-- Set backface culling and world-aligned textures
local function set_textures(images, worldaligntex)
	local stair_images = {}
	for i, image in ipairs(images) do
		stair_images[i] = type(image) == "string" and {name = image} or table.copy(image)
		if stair_images[i].backface_culling == nil then
			stair_images[i].backface_culling = true
		end
		if worldaligntex and stair_images[i].align_style == nil then
			stair_images[i].align_style = "world"
		end
	end
	return stair_images
end

-- Register stair
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description,
		sounds, worldaligntex)
	local def = core.registered_nodes[recipeitem] or {}
	local stair_images = set_textures(images, worldaligntex)
	local new_groups = table.copy(groups)
	new_groups.stair = 1
	warn_if_exists("stairs:stair_".. subname)
	core.register_node(":stairs:stair_".. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = stair_images,
		use_texture_alpha = def.use_texture_alpha,
		sunlight_propagates = def.sunlight_propagates,
		light_source = def.light_source,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = new_groups,
		sounds = sounds or def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-.5, -.5, -.5, .5, 0, .5},
				{-.5, 0, 0, .5, .5, .5}
			}
		},
		on_place = function(itemstack, placer, pointd)
			if pointd.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointd)
		end,
	})

	-- for replace ABM
	if replace then
		core.register_node(":stairs:stair_".. subname .."upside_down", {
			replace_name = "stairs:stair_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		-- Recipe matches appearence in inventory
		core.register_craft({
			output = "stairs:stair_".. subname .." 8",
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem}
			}
		})

		-- Use stairs to craft full blocks again (1:1)
		core.register_craft({
			output = recipeitem .." 3",
			recipe = {
				{"stairs:stair_".. subname, "stairs:stair_".. subname},
				{"stairs:stair_".. subname, "stairs:stair_".. subname}
			}
		})

		-- Fuel
		local baseburntime = core.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			core.register_craft({
				type = "fuel",
				recipe = "stairs:stair_".. subname,
				burntime = math.floor(baseburntime * .75),
			})
		end
	end
end


-- Register slab
-- Node will be called stairs:slab_<subname>

function stairs.register_slab(subname, recipeitem, groups, images, description,
		sounds, worldaligntex)
	local def = core.registered_nodes[recipeitem] or {}
	local slab_images = set_textures(images, worldaligntex)
	local new_groups = table.copy(groups)
	new_groups.slab = 1
	warn_if_exists("stairs:slab_".. subname)
	core.register_node(":stairs:slab_".. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = slab_images,
		use_texture_alpha = def.use_texture_alpha,
		sunlight_propagates = def.sunlight_propagates,
		light_source = def.light_source,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = new_groups,
		sounds = sounds or def.sounds,
		node_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, 0, .5}
		},
		on_place = function(itemstack, placer, pointd)
			local under = core.get_node(pointd.under)
			local wield_item = itemstack:get_name()
			local pname = placer and placer:get_player_name() or ""

			if under and under.name:find("^stairs:slab_") then
				-- place slab using under node orientation
				local dir = core.dir_to_facedir(vector.subtract(
					pointd.above, pointd.under), true)

				local p2 = under.param2

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				core.item_place_node(ItemStack(wield_item), placer, pointd, p2)
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
				return itemstack
			else
				return rotate_and_place(itemstack, placer, pointd)
			end
		end,
	})

	-- for replace ABM
	if replace then
		core.register_node(":stairs:slab_".. subname .."upside_down", {
			replace_name = "stairs:slab_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		core.register_craft({
			output = "stairs:slab_".. subname .." 6",
			recipe = {
				{recipeitem, recipeitem, recipeitem}
			}
		})

		-- Use 2 slabs to craft a full block again (1:1)
		core.register_craft({
			output = recipeitem,
			recipe = {
				{"stairs:slab_".. subname},
				{"stairs:slab_".. subname}
			}
		})

		-- Fuel
		local baseburntime = core.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			core.register_craft({
				type = "fuel",
				recipe = "stairs:slab_".. subname,
				burntime = math.floor(baseburntime * .5),
			})
		end
	end
end


-- Optionally replace old "upside_down" nodes with new param2 versions.
-- Disabled by default.

if replace then
	core.register_abm({
		label = "Slab replace",
		nodenames = {"group:slabs_replace"},
		interval = 16,
		chance = 1,
		action = function(pos, node)
			node.name = core.registered_nodes[node.name].replace_name
			node.param2 = node.param2 + 20
			if node.param2 == 21 then
				node.param2 = 23
			elseif node.param2 == 23 then
				node.param2 = 21
			end
			core.set_node(pos, node)
		end,
	})
end


-- Register inner stair
-- Node will be called stairs:stair_inner_<subname>

function stairs.register_stair_inner(subname, recipeitem, groups, images,
		description, sounds, worldaligntex, full_description)
	local def = core.registered_nodes[recipeitem] or {}
	local stair_images = set_textures(images, worldaligntex)
	local new_groups = table.copy(groups)
	new_groups.stair = 1
	if full_description then
		description = full_description
	else
		description = "Inner ".. description
	end
	warn_if_exists("stairs:stair_inner_".. subname)
	core.register_node(":stairs:stair_inner_".. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = stair_images,
		use_texture_alpha = def.use_texture_alpha,
		sunlight_propagates = def.sunlight_propagates,
		light_source = def.light_source,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = new_groups,
		sounds = sounds or def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-.5, -.5, -.5, .5, 0, .5},
				{-.5, 0, 0, .5, .5, .5},
				{-.5, 0, -.5, 0, .5, 0}
			}
		},
		on_place = function(itemstack, placer, pointd)
			if pointd.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointd)
		end,
	})

	if recipeitem then
		core.register_craft({
			output = "stairs:stair_inner_".. subname .." 7",
			recipe = {
				{"", recipeitem, ""},
				{recipeitem, "", recipeitem},
				{recipeitem, recipeitem, recipeitem}
			}
		})

		-- Use inner stairs to craft full blocks again (1:1)
		core.register_craft({
			output = recipeitem .." 6",
			recipe = {
				{"", "stairs:stair_inner_".. subname, ""},
				{"stairs:stair_inner_".. subname, "stairs:stair_inner_".. subname, "stairs:stair_inner_".. subname},
				{"stairs:stair_inner_".. subname, "stairs:stair_inner_".. subname, "stairs:stair_inner_".. subname}
			}
		})

		-- Fuel
		local baseburntime = core.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			core.register_craft({
				type = "fuel",
				recipe = "stairs:stair_inner_".. subname,
				burntime = math.floor(baseburntime * .875),
			})
		end
	end
end


-- Register outer stair
-- Node will be called stairs:stair_outer_<subname>

function stairs.register_stair_outer(subname, recipeitem, groups, images,
		description, sounds, worldaligntex, full_description)
	local def = core.registered_nodes[recipeitem] or {}
	local stair_images = set_textures(images, worldaligntex)
	local new_groups = table.copy(groups)
	new_groups.stair = 1
	if full_description then
		description = full_description
	else
		description = "Outer ".. description
	end
	warn_if_exists("stairs:stair_outer_".. subname)
	core.register_node(":stairs:stair_outer_".. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = stair_images,
		use_texture_alpha = def.use_texture_alpha,
		sunlight_propagates = def.sunlight_propagates,
		light_source = def.light_source,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = new_groups,
		sounds = sounds or def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-.5, -.5, -.5, .5, 0, .5},
				{-.5, 0, 0, 0, .5, .5}
			}
		},
		on_place = function(itemstack, placer, pointd)
			if pointd.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointd)
		end,
	})

	if recipeitem then
		core.register_craft({
			output = "stairs:stair_outer_".. subname .." 6",
			recipe = {
				{"", recipeitem, ""},
				{recipeitem, recipeitem, recipeitem}
			}
		})

		-- Use outer stairs to craft full blocks again (1:1)
		core.register_craft({
			output = recipeitem .." 4",
			recipe = {
				{"stairs:stair_outer_".. subname, "stairs:stair_outer_".. subname, "stairs:stair_outer_".. subname},
				{"stairs:stair_outer_".. subname, "stairs:stair_outer_".. subname, "stairs:stair_outer_".. subname}
			}
		})

		-- Fuel
		local baseburntime = core.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			core.register_craft({
				type = "fuel",
				recipe = "stairs:stair_outer_".. subname,
				burntime = math.floor(baseburntime * .625),
			})
		end
	end
end


-- Stair/slab registration function.
-- Nodes will be called stairs:{stair,slab}_<subname>

function stairs.register_stair_and_slab(subname, recipeitem, groups, images,
		desc_stair, desc_slab, sounds, worldaligntex,
		desc_stair_inner, desc_stair_outer)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair,
		sounds, worldaligntex)
	stairs.register_stair_inner(subname, recipeitem, groups, images,
		desc_stair, sounds, worldaligntex, desc_stair_inner)
	stairs.register_stair_outer(subname, recipeitem, groups, images,
		desc_stair, sounds, worldaligntex, desc_stair_outer)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab,
		sounds, worldaligntex)
end

-- Local function so we can apply translations
local function my_register_stair_and_slab(subname, recipeitem, groups, images,
		desc_stair, desc_slab, sounds, worldaligntex)
	stairs.register_stair(subname, recipeitem, groups, images, S(desc_stair),
		sounds, worldaligntex)
	stairs.register_stair_inner(subname, recipeitem, groups, images, "",
		sounds, worldaligntex, T("Inner " .. desc_stair))
	stairs.register_stair_outer(subname, recipeitem, groups, images, "",
		sounds, worldaligntex, T("Outer " .. desc_stair))
	stairs.register_slab(subname, recipeitem, groups, images, S(desc_slab),
		sounds, worldaligntex)
end


-- Register default stairs and slabs

my_register_stair_and_slab(
	"acacia_wood",
	"default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"default_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"apple_wood",
	"default:apple_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_apple_wood.png"},
	"Apple Wood Stair",
	"Apple Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"aspen_wood",
	"default:aspen_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 1},
	{"default_aspen_wood.png"},
	"Aspen Wood Stair",
	"Aspen Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"wood",
	"default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_wood.png"},
	"Wooden Stair",
	"Wooden Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"birch_wood",
	"default:birch_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_birch_wood.png"},
	"Birch Wood Stair",
	"Birch Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"coco_palm_wood",
	"default:coco_palm_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_coco_palm_wood.png"},
	"Coco Palm Wood Stair",
	"Coco Palm Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"jungle_wood",
	"default:jungle_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"default_jungle_wood.png"},
	"Jungle Wood Stair",
	"Jungle Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"mangrove_wood",
	"default:mangrove_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_mangrove_wood.png"},
	"Mangrove Wood Stair",
	"Mangrove Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"pine_wood",
	"default:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 4},
	{"default_pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	default.node_sound_wood_defaults(),
	false
)

my_register_stair_and_slab(
	"stone",
	"default:stone",
	{cracky = 3},
	{"default_stone.png"},
	"Stone Stair",
	"Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"rocks",
	"default:rocks",
	{cracky = 3, oddly_breakable_by_hand=1, falling_node=1, falling_node_damage=5},
	{"default_rocks.png"},
	"Rocks Stair",
	"Rocks Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"cobble",
	"default:cobble",
	{cracky = 3},
	{"default_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"stone_brick",
	"default:stone_brick",
	{cracky = 2},
	{"default_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"stone_block",
	"default:stone_block",
	{cracky = 2},
	{"default_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"mossystone",
	"default:mossystone",
	{cracky = 3},
	{"default_stone.png^default_mossy.png"},
	"Mossy Stone Stair",
	"Mossy Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"mossycobble",
	"default:mossycobble",
	{cracky = 3},
	{"default_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"mossystone_brick",
	"default:mossystone_brick",
	{cracky = 2},
	{"default_mossy_stone_brick.png"},
	"Mossy Stone Brick Stair",
	"Mossy Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"mossystone_block",
	"default:mossystone_block",
	{cracky = 2},
	{"default_stone_block.png^default_mossy.png"},
	"Mossy Stone Block Stair",
	"Mossy Stone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"basalt",
	"default:basalt",
	{cracky = 2},
	{"default_basalt.png"},
	"Basalt Stair",
	"Basalt Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_stone",
	"default:desert_stone",
	{cracky = 3},
	{"default_desert_stone.png"},
	"Desert Stone Stair",
	"Desert Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_rocks",
	"default:desert_rocks",
	{cracky = 3, oddly_breakable_by_hand=1, falling_node=1, falling_node_damage=5},
	{"default_desert_rocks.png"},
	"Desert Rocks Stair",
	"Desert Rocks Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_cobble",
	"default:desert_cobble",
	{cracky = 3},
	{"default_desert_cobble.png"},
	"Desert Cobblestone Stair",
	"Desert Cobblestone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_stone_brick",
	"default:desert_stone_brick",
	{cracky = 2},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick Stair",
	"Desert Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"desert_stone_block",
	"default:desert_stone_block",
	{cracky = 2},
	{"default_desert_stone_block.png"},
	"Desert Stone Block Stair",
	"Desert Stone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"pumice",
	"default:pumice",
	{cracky=3, crumbly=2},
	{"default_pumice.png"},
	"Pumice Stair",
	"Pumice Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_stone",
	"default:ocean_stone",
	{cracky = 3, cools_lava = 1},
	{"default_ocean_stone.png"},
	"Ocean Stone Stair",
	"Ocean Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_cobble",
	"default:ocean_cobble",
	{cracky = 3, cools_lava = 1},
	{"default_ocean_cobble.png"},
	"Ocean Cobblestone Stair",
	"Ocean Cobblestone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_stone_carved",
	"default:ocean_stone_carved",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_carved.png"},
	"Carved Ocean Stone Stair",
	"Carved Ocean Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_stone_circular",
	"default:ocean_stone_circular",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_circular.png"},
	"Circular Ocean Stone Stair",
	"Circular Ocean Stone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_stone_pillar",
	"default:ocean_stone_pillar",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_circular.png", "default_ocean_stone_circular.png", "default_ocean_stone_pillar.png"},
	"Ocean Stone Pillar Stair",
	"Ocean Stone Pillar Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"ocean_stone_brick",
	"default:ocean_stone_brick",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_brick.png"},
	"Ocean Stone Brick Stair",
	"Ocean Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"sandstone",
	"default:sandstone",
	{crumbly = 1, cracky = 3},
	{"default_sandstone.png"},
	"Sandstone Stair",
	"Sandstone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"sandstone_brick",
	"default:sandstone_brick",
	{cracky = 2},
	{"default_sandstone_brick.png"},
	"Sandstone Brick Stair",
	"Sandstone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"sandstone_block",
	"default:sandstone_block",
	{cracky = 2},
	{"default_sandstone_block.png"},
	"Sandstone Block Stair",
	"Sandstone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_sandstone",
	"default:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"default_desert_sandstone.png"},
	"Desert Sandstone Stair",
	"Desert Sandstone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"desert_sandstone_brick",
	"default:desert_sandstone_brick",
	{cracky = 2},
	{"default_desert_sandstone_brick.png"},
	"Desert Sandstone Brick Stair",
	"Desert Sandstone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"desert_sandstone_block",
	"default:desert_sandstone_block",
	{cracky = 2},
	{"default_desert_sandstone_block.png"},
	"Desert Sandstone Block Stair",
	"Desert Sandstone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"silver_sandstone",
	"default:silver_sandstone",
	{crumbly = 1, cracky = 3},
	{"default_silver_sandstone.png"},
	"Silver Sandstone Stair",
	"Silver Sandstone Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"silver_sandstone_brick",
	"default:silver_sandstone_brick",
	{cracky = 2},
	{"default_silver_sandstone_brick.png"},
	"Silver Sandstone Brick Stair",
	"Silver Sandstone Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"silver_sandstone_block",
	"default:silver_sandstone_block",
	{cracky = 2},
	{"default_silver_sandstone_block.png"},
	"Silver Sandstone Block Stair",
	"Silver Sandstone Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"obsidian",
	"default:obsidian",
	{cracky = 3},
	{"default_obsidian.png"},
	"Obsidian Stair",
	"Obsidian Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"obsidian_brick",
	"default:obsidian_brick",
	{cracky = 2},
	{"default_obsidian_brick.png"},
	"Obsidian Brick Stair",
	"Obsidian Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"obsidian_block",
	"default:obsidian_block",
	{cracky = 2},
	{"default_obsidian_block.png"},
	"Obsidian Block Stair",
	"Obsidian Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"white_marble",
	"default:white_marble",
	{cracky = 3},
	{"default_white_marble.png"},
	"White Marble Stair",
	"White Marble Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"white_marble_block",
	"default:white_marble_block",
	{cracky = 2},
	{"default_white_marble_block.png"},
	"White Marble Block Stair",
	"White Marble Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"marble",
	"default:marble",
	{cracky = 3},
	{"default_marble.png"},
	"Marble Stair",
	"Marble Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"marble_brick",
	"default:marble_brick",
	{cracky = 2},
	{"default_marble_brick.png"},
	"Marble Brick Stair",
	"Marble Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"diamite",
	"default:diamite",
	{cracky = 1, level = 2},
	{"default_diamite.png"},
	"Diamite Stair",
	"Diamite Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"granite",
	"default:granite",
	{cracky = 1, level = 2},
	{"default_granite.png"},
	"Granite Stair",
	"Granite Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"bedrock",
	"default:bedrock",
	{cracky = 1, level = 3},
	{"default_bedrock.png"},
	"Bedrock Stair",
	"Bedrock Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"concrete",
	"default:concrete",
	{cracky = 1, level = 2},
	{"technic_concrete_block.png"},
	"Concrete Stair",
	"Concrete Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"cement_block",
	"default:cement_block",
	{cracky=2},
	{"basic_materials_cement_block.png"},
	"Cement Block Stair",
	"Cement Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"concrete_block",
	"default:concrete_block",
	{cracky=1, level=2},
	{"basic_materials_concrete_block.png"},
	"Concrete Block Stair",
	"Concrete Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"brick",
	"default:brick",
	{cracky = 3},
	{"default_brick.png"},
	"Brick Stair",
	"Brick Slab",
	default.node_sound_stone_defaults(),
	false
)

my_register_stair_and_slab(
	"wrought_iron_block",
	"default:wrought_iron_block",
	{cracky = 1, level = 2},
	{"default_wrought_iron_block.png"},
	"Wrought Iron Block Stair",
	"Wrought Iron Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"cast_iron_block",
	"default:cast_iron_block",
	{cracky = 1, level = 2},
	{"default_cast_iron_block.png"},
	"Cast Iron Block Stair",
	"Cast Iron Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"steel_block",
	"default:steel_block",
	{cracky = 1, level = 2},
	{"default_steel_block.png"},
	"Steel Block Stair",
	"Steel Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"stainless_steel_block",
	"default:stainless_steel_block",
	{cracky = 1, level = 2},
	{"default_stainless_steel_block.png"},
	"Stainless Steel Block Stair",
	"Stainless Steel Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"copper_block",
	"default:copper_block",
	{cracky = 1, level = 2},
	{"default_copper_block.png"},
	"Copper Block Stair",
	"Copper Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"tin_block",
	"default:tin_block",
	{cracky = 1, level = 2},
	{"default_tin_block.png"},
	"Tin Block Stair",
	"Tin Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"brass_block",
	"default:brass_block",
	{cracky = 1, level = 2},
	{"default_brass_block.png"},
	"Brass Block Stair",
	"Brass Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"bronze_block",
	"default:bronze_block",
	{cracky = 1, level = 2},
	{"default_bronze_block.png"},
	"Bronze Block Stair",
	"Bronze Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"chromium_block",
	"default:chromium_block",
	{cracky = 1, level = 2},
	{"default_chromium_block.png"},
	"Chromium Block Stair",
	"Chromium Block Slab",
	default.node_sound_stone_defaults(),
	true
)

my_register_stair_and_slab(
	"zinc_block",
	"default:zinc_block",
	{cracky = 1, level = 2},
	{"default_zinc_block.png"},
	"Zinc Block Stair",
	"Zinc Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"silver_block",
	"default:silver_block",
	{cracky = 1, level = 2},
	{"default_silver_block.png"},
	"Silver Block Stair",
	"Silver Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"gold_block",
	"default:gold_block",
	{cracky = 1},
	{"default_gold_block.png"},
	"Gold Block Stair",
	"Gold Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"orichalc_block",
	"default:orichalc_block",
	{cracky = 1, level = 3},
	{"default_orichalc_block.png"},
	"Orichalc Block Stair",
	"Orichalc Block Slab",
	default.node_sound_metal_defaults(),
	true
)

my_register_stair_and_slab(
	"crystal_block",
	"default:crystal_block",
	{cracky = 1, level = 2, cools_lava = 1},
	{"crystal_block.png"},
	"Frost Crystal Block Stair",
	"Frost Crystal Block Slab",
	default.node_sound_glass_defaults(),
	true
)

my_register_stair_and_slab(
	"snow_block",
	"default:snow_block",
	{crumbly = 3, cools_lava = 1, snowy = 1, melttoflo= 1},
	{"default_snow.png"},
	"Snow Block Stair",
	"Snow Block Slab",
	default.node_sound_snow_defaults(),
	true
)

my_register_stair_and_slab(
	"snow_brick",
	"default:snow_brick",
	{crumbly = 3, cools_lava = 1, snowy = 1, melttoflo= 1},
	{"default_snow_brick.png"},
	"Snow Brick Stair",
	"Snow Brick Slab",
	default.node_sound_snow_defaults(),
	false
)

my_register_stair_and_slab(
	"ice",
	"default:ice",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice.png"},
	"Ice Stair",
	"Ice Slab",
	default.node_sound_ice_defaults(),
	true
)

my_register_stair_and_slab(
	"ice_brick",
	"default:ice_brick",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice_brick.png"},
	"Ice Brick Stair",
	"Ice Brick Slab",
	default.node_sound_ice_defaults(),
	false
)

my_register_stair_and_slab(
	"ice_block",
	"default:ice_block",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice_block.png"},
	"Ice Block Stair",
	"Ice Block Slab",
	default.node_sound_ice_defaults(),
	true
)

my_register_stair_and_slab(
	"meselamp",
	"default:meselamp",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"default_meselamp.png"},
	"Mese Lamp Stair",
	"Mese Lamp Slab",
	default.node_sound_glass_defaults(),
	true
)

my_register_stair_and_slab(
	"ocealitelamp",
	"default:ocealitelamp",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"default_ocealitelamp.png"},
	"Ocealite Lamp Stair",
	"Ocealite Lamp Slab",
	default.node_sound_glass_defaults(),
	true
)

-- Glass stair nodes need to be registered individually to utilize specialized textures.

stairs.register_stair(
	"glass",
	"default:glass",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"stairs_glass_split.png", "default_glass.png",
	"stairs_glass_stairside.png^[transformFX", "stairs_glass_stairside.png",
	"default_glass.png", "stairs_glass_split.png"},
	S("Glass Stair"),
	default.node_sound_glass_defaults(),
	false
)

stairs.register_slab(
	"glass",
	"default:glass",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"default_glass.png", "default_glass.png", "stairs_glass_split.png"},
	S("Glass Slab"),
	default.node_sound_glass_defaults(),
	false
)

stairs.register_stair_inner(
	"glass",
	"default:glass",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"stairs_glass_stairside.png^[transformR270", "default_glass.png",
	"stairs_glass_stairside.png^[transformFX", "default_glass.png",
	"default_glass.png", "stairs_glass_stairside.png"},
	"",
	default.node_sound_glass_defaults(),
	false,
	S("Inner Glass Stair")
)

stairs.register_stair_outer(
	"glass",
	"default:glass",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"stairs_glass_stairside.png^[transformR90", "default_glass.png",
	"stairs_glass_outer_stairside.png", "stairs_glass_stairside.png",
	"stairs_glass_stairside.png^[transformR90","stairs_glass_outer_stairside.png"},
	"",
	default.node_sound_glass_defaults(),
	false,
	S("Outer Glass Stair")
)

stairs.register_stair(
	"obsidian_glass",
	"default:obsidian_glass",
	{cracky = 3, oddly_breakable_by_hand = 1},
	{"stairs_obsidian_glass_split.png", "default_obsidian_glass.png",
	"stairs_obsidian_glass_stairside.png^[transformFX", "stairs_obsidian_glass_stairside.png",
	"default_obsidian_glass.png", "stairs_obsidian_glass_split.png"},
	S("Obsidian Glass Stair"),
	default.node_sound_glass_defaults(),
	false
)

stairs.register_slab(
	"obsidian_glass",
	"default:obsidian_glass",
	{cracky = 3, oddly_breakable_by_hand = 1},
	{"default_obsidian_glass.png", "default_obsidian_glass.png", "stairs_obsidian_glass_split.png"},
	S("Obsidian Glass Slab"),
	default.node_sound_glass_defaults(),
	false
)

stairs.register_stair_inner(
	"obsidian_glass",
	"default:obsidian_glass",
	{cracky = 3, oddly_breakable_by_hand = 1},
	{"stairs_obsidian_glass_stairside.png^[transformR270", "default_obsidian_glass.png",
	"stairs_obsidian_glass_stairside.png^[transformFX", "default_obsidian_glass.png",
	"default_obsidian_glass.png", "stairs_obsidian_glass_stairside.png"},
	"",
	default.node_sound_glass_defaults(),
	false,
	S("Inner Obsidian Glass Stair")
)

stairs.register_stair_outer(
	"obsidian_glass",
	"default:obsidian_glass",
	{cracky = 3, oddly_breakable_by_hand = 1},
	{"stairs_obsidian_glass_stairside.png^[transformR90", "default_obsidian_glass.png",
	"stairs_obsidian_glass_outer_stairside.png", "stairs_obsidian_glass_stairside.png",
	"stairs_obsidian_glass_stairside.png^[transformR90","stairs_obsidian_glass_outer_stairside.png"},
	"",
	default.node_sound_glass_defaults(),
	false,
	S("Outer Obsidian Glass Stair")
)

-- Dummy calls to S() to allow translation scripts to detect the strings.
-- To update this add this code to my_register_stair_and_slab:
-- for _,x in ipairs({"","Inner ","Outer "}) do print(("S(%q)"):format(x..desc_stair)) end
-- print(("S(%q)"):format(desc_slab))

--[[
S("Wooden Stair")
S("Inner Wooden Stair")
S("Outer Wooden Stair")
S("Wooden Slab")
S("Jungle Wood Stair")
S("Inner Jungle Wood Stair")
S("Outer Jungle Wood Stair")
S("Jungle Wood Slab")
S("Pine Wood Stair")
S("Inner Pine Wood Stair")
S("Outer Pine Wood Stair")
S("Pine Wood Slab")
S("Acacia Wood Stair")
S("Inner Acacia Wood Stair")
S("Outer Acacia Wood Stair")
S("Acacia Wood Slab")
S("Aspen Wood Stair")
S("Inner Aspen Wood Stair")
S("Outer Aspen Wood Stair")
S("Aspen Wood Slab")
S("Stone Stair")
S("Inner Stone Stair")
S("Outer Stone Stair")
S("Stone Slab")
S("Cobblestone Stair")
S("Inner Cobblestone Stair")
S("Outer Cobblestone Stair")
S("Cobblestone Slab")
S("Mossy Cobblestone Stair")
S("Inner Mossy Cobblestone Stair")
S("Outer Mossy Cobblestone Stair")
S("Mossy Cobblestone Slab")
S("Stone Brick Stair")
S("Inner Stone Brick Stair")
S("Outer Stone Brick Stair")
S("Stone Brick Slab")
S("Stone Block Stair")
S("Inner Stone Block Stair")
S("Outer Stone Block Stair")
S("Stone Block Slab")
S("Desert Stone Stair")
S("Inner Desert Stone Stair")
S("Outer Desert Stone Stair")
S("Desert Stone Slab")
S("Desert Cobblestone Stair")
S("Inner Desert Cobblestone Stair")
S("Outer Desert Cobblestone Stair")
S("Desert Cobblestone Slab")
S("Desert Stone Brick Stair")
S("Inner Desert Stone Brick Stair")
S("Outer Desert Stone Brick Stair")
S("Desert Stone Brick Slab")
S("Desert Stone Block Stair")
S("Inner Desert Stone Block Stair")
S("Outer Desert Stone Block Stair")
S("Desert Stone Block Slab")
S("Sandstone Stair")
S("Inner Sandstone Stair")
S("Outer Sandstone Stair")
S("Sandstone Slab")
S("Sandstone Brick Stair")
S("Inner Sandstone Brick Stair")
S("Outer Sandstone Brick Stair")
S("Sandstone Brick Slab")
S("Sandstone Block Stair")
S("Inner Sandstone Block Stair")
S("Outer Sandstone Block Stair")
S("Sandstone Block Slab")
S("Desert Sandstone Stair")
S("Inner Desert Sandstone Stair")
S("Outer Desert Sandstone Stair")
S("Desert Sandstone Slab")
S("Desert Sandstone Brick Stair")
S("Inner Desert Sandstone Brick Stair")
S("Outer Desert Sandstone Brick Stair")
S("Desert Sandstone Brick Slab")
S("Desert Sandstone Block Stair")
S("Inner Desert Sandstone Block Stair")
S("Outer Desert Sandstone Block Stair")
S("Desert Sandstone Block Slab")
S("Silver Sandstone Stair")
S("Inner Silver Sandstone Stair")
S("Outer Silver Sandstone Stair")
S("Silver Sandstone Slab")
S("Silver Sandstone Brick Stair")
S("Inner Silver Sandstone Brick Stair")
S("Outer Silver Sandstone Brick Stair")
S("Silver Sandstone Brick Slab")
S("Silver Sandstone Block Stair")
S("Inner Silver Sandstone Block Stair")
S("Outer Silver Sandstone Block Stair")
S("Silver Sandstone Block Slab")
S("Obsidian Stair")
S("Inner Obsidian Stair")
S("Outer Obsidian Stair")
S("Obsidian Slab")
S("Obsidian Brick Stair")
S("Inner Obsidian Brick Stair")
S("Outer Obsidian Brick Stair")
S("Obsidian Brick Slab")
S("Obsidian Block Stair")
S("Inner Obsidian Block Stair")
S("Outer Obsidian Block Stair")
S("Obsidian Block Slab")
S("Brick Stair")
S("Inner Brick Stair")
S("Outer Brick Stair")
S("Brick Slab")
S("Steel Block Stair")
S("Inner Steel Block Stair")
S("Outer Steel Block Stair")
S("Steel Block Slab")
S("Tin Block Stair")
S("Inner Tin Block Stair")
S("Outer Tin Block Stair")
S("Tin Block Slab")
S("Copper Block Stair")
S("Inner Copper Block Stair")
S("Outer Copper Block Stair")
S("Copper Block Slab")
S("Bronze Block Stair")
S("Inner Bronze Block Stair")
S("Outer Bronze Block Stair")
S("Bronze Block Slab")
S("Gold Block Stair")
S("Inner Gold Block Stair")
S("Outer Gold Block Stair")
S("Gold Block Slab")
S("Ice Stair")
S("Inner Ice Stair")
S("Outer Ice Stair")
S("Ice Slab")
S("Snow Block Stair")
S("Inner Snow Block Stair")
S("Outer Snow Block Stair")
S("Snow Block Slab")
--]]

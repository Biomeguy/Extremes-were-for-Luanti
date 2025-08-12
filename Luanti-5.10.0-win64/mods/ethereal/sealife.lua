
local S = ethereal.intllib

-- Fish (Thanks to Altairas for her Fish image on DeviantArt)
core.register_craftitem("ethereal:fish", {
	description = S("Fish"),
	inventory_image = "ethereal_fish.png",
	groups = {fish_raw = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- Cooked Fish
core.register_craftitem("ethereal:fish_cooked", {
	description = S("Cooked Fish"),
	inventory_image = "ethereal_fish_cooked.png",
	groups = {fish = 1, flammable = 2},
	on_use = core.item_eat(5),
})

core.register_craft({
	type = "cooking",
	output = "ethereal:fish_cooked",
	recipe = "ethereal:fish",
	cooktime = 2,
})

-- Sable Fish
core.register_craftitem("ethereal:fish_sable", {
	description = S("Black Cod"),
	inventory_image = "ethereal_fish_sable.png",
	groups = {fish_raw = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- Cooked Sable Fish
core.register_craftitem("ethereal:fish_sable_cooked", {
	description = S("Cooked Black Cod"),
	inventory_image = "ethereal_fish_sable_cooked.png",
	groups = {fish = 1, flammable = 2},
	on_use = core.item_eat(5),
})

core.register_craft({
	type = "cooking",
	output = "ethereal:fish_sable_cooked",
	recipe = "ethereal:fish_sable",
	cooktime = 2,
})

-- Sashimi (Thanks to Natalia Grosner for letting me use the sashimi image)
core.register_craftitem("ethereal:sashimi", {
	description = S("Sashimi"),
	inventory_image = "sashimi.png",
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "ethereal:sashimi 2",
	recipe = {
		{'group:seaweed','group:fish_raw','group:seaweed'},
	}
})

-- Worm
core.register_craftitem("ethereal:worm", {
	description = S("Worm"),
	inventory_image = "worm.png",
})

-- Used when right-clicking with fishing rod to check for worm and bait rod
local rod_use = function(itemstack, placer, pointd)

	local inv = placer:get_inventory()

	if inv:contains_item("main", "ethereal:worm") then
		inv:remove_item("main", "ethereal:worm")
		return ItemStack("ethereal:fishing_rod_baited")
	end
end

-- Fishing Rod
core.register_craftitem("ethereal:fishing_rod", {
	description = S("Fishing Rod (Right-Click with rod to bait with worm from inventory)"),
	inventory_image = "fishing_rod.png",
	stack_max = 1,

	on_place = rod_use,
	on_secondary_use = rod_use
})

core.register_craft({
	output = "ethereal:fishing_rod",
	recipe = {
		{"","","group:stick"},
		{"", "group:stick", "fabric:string"},
		{"group:stick", "", "fabric:string"}
	}
})

-- Sift through 2 Dirt Blocks to find Worm (wrong)
core.register_craft({
	output = "ethereal:worm",
	recipe = {
		{"default:dirt","default:dirt"},
	}
})

-- default ethereal fish
ethereal.fish = {
	{"ethereal:fish"},
}
ethereal.fish[2] = {"ethereal:fish_sable"}

-- xanadu server additional fish
if core.get_modpath("xanadu") then
	ethereal.fish[3] = {"mobs:clownfish_raw"}
	ethereal.fish[4] = {"mobs:bluefish_raw"}
end

-- Fishing Rod (Baited)
core.register_craftitem("ethereal:fishing_rod_baited", {
	description = S("Baited Fishing Rod"),
	inventory_image = "fishing_rod_baited.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function (itemstack, user, pointd)

		if pointd.type ~= "node" then
			return
		end

		local pos = pointd.under
		local node = core.get_node(pos).name

		if (node == "default:water_source" or node == "default:fresh_water_source")
		and math.random(1, 100) < 5 then

			local type = ethereal.fish[math.random(1, #ethereal.fish)][1]
			local inv = user:get_inventory()

			if inv:room_for_item("main", {name = type}) then
				inv:add_item("main", {name = type})
				core.sound_play("default_water_footstep", {pos = pos})

				pos.y = pos.y + .5

				core.add_particlespawner({
					amount = 5,
					time = .3,
					pos = pos,
					minvel = {x = 2, y = .5, z = 2},
					maxvel = {x = 2, y = .5, z = 2},
					minacc = {x = 1, y = .1, z = 1},
					maxacc = {x = 1, y = .1, z = 1},
					exptime = {min = .3, max = .5},
					minsize = .5,
					maxsize = 1,
					texture = "bubble.png",
					playername = "singleplayer"})

				return ItemStack("ethereal:fishing_rod")
			else
				core.chat_send_player(user:get_player_name(),
					S("Inventory full, Fish Got Away!"))
			end
		end
	end,
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:fishing_rod_baited",
	recipe = {"ethereal:fishing_rod", "ethereal:worm"}
})

core.register_craft({
	output = "dye:dark_green 3",
	recipe = {{"default:seaweed"}}
})

-- agar powder
core.register_craftitem("ethereal:agar_powder", {
	description = S("Agar Powder"),
	inventory_image = "ethereal_agar_powder.png",
	groups = {food_gelatin = 1, flammable = 2},
})

core.register_craft({
	output = "ethereal:agar_powder 3",
	recipe = {
		{"group:seaweed", "group:seaweed", "group:seaweed"},
		{"bucket:bucket_water", "bucket:bucket_water", "default:torch"},
		{"bucket:bucket_water", "bucket:bucket_water", "default:torch"}
	},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty 4"},
		{"default:torch", "default:torch"},
		{"default:torch", "default:torch"}
	}
})

-- sponges

core.register_node("ethereal:sponge_air", {
	drawtype = "airlike",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	pointable = false,
	drop = "",
	groups = {not_in_creative_inventory = 1},
})


core.register_node("ethereal:sponge", {
	description = S("Sponge"),
	tiles = {"ethereal_sponge.png"},
	groups = {crumbly = 3},
	sounds = default.node_sound_sand_defaults(),

	after_place_node = function(pos, placer, itemstack, pointd)

		-- get player name
		local pname = placer:get_player_name()

		-- is area protected
		if core.is_protected(pos, pname) then
			return
		end

		-- get water nodes within range
		local num = core.find_nodes_in_area({x = pos.x - 3, y = pos.y - 3, z = pos.z - 3},
			{x = pos.x + 3, y = pos.y + 3, z = pos.z + 3}, {"group:water"})

		-- no water
		if #num == 0 then return end

		-- replace water nodes with sponge air
		for _, w in pairs(num) do

			if not core.is_protected(pos, pname) then
				core.swap_node(w, {name = "ethereal:sponge_air"})
			end
		end

		-- replace dry sponge with wet sponge
		core.swap_node(pos, {name = "ethereal:sponge_wet"})
	end
})


core.register_node("ethereal:sponge_wet", {
	description = S("Wet sponge"),
	tiles = {"ethereal_sponge_wet.png"},
	groups = {crumbly = 3, timer_check = 1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	on_timer = function(pos)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Don't grow if not on sand.
		if core.get_item_group(node_under.name, "sand") == 0 then
			core.get_node_timer(pos):start(300)
			return
		end

		local spos = {x = pos.x, y = pos.y, z = pos.z}
		local node = core.get_node(spos)
		local height = 0
		while node.name == "ethereal:sponge_wet" and height < 3 do
			height = height + 1
			spos.y = spos.y + 1
			node = core.get_node(spos)
		end
		if height == 3 or node.name ~= "default:water_source" then
			core.get_node_timer(pos):start(300)
			return
		end
		core.set_node(spos, {name = "ethereal:sponge_wet"})
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	sounds = default.node_sound_sand_defaults(),
})

-- cook wet sponge into dry sponge
core.register_craft({
	type = "cooking",
	recipe = "ethereal:sponge_wet",
	output = "default:fresh_water_source 172",
	cooktime = 3,
	replacements = {{"ethereal:sponge_wet", "ethereal:sponge"}},
})

-- use leaf decay to remove sponge air nodes
default.register_leafdecay({
	trunks = {"ethereal:sponge_wet"},
	leaves = {"ethereal:sponge_air"},
	radius = 3
})

-- dry sponges can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "ethereal:sponge",
	burntime = 5,
})

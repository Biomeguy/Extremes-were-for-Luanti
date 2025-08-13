
local path = core.get_modpath("mapgen")
dofile(path.. "/bakedclay.lua")
dofile(path.. "/nodes.lua")

core.register_node("mapgen:lunar_meteor", {
	description = "Lunar Meteor",
	tiles = {"meteorite_lunar_meteor.png"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		core.get_node_timer(pos):start(1)
if core.get_node({x= pos.x, y= pos.y+ 1, z= pos.z}).name == "mapgen:fire" then
	pos.y = pos.y + 1.5
	core.add_particlespawner({
		amount = 2,
		time = .9,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x= -.5, y= .1, z= -.5},
		maxvel = {x= .5, y= .5, z= .5},
		exptime = {min = 1.7, max = 1.9},
		minsize = 16,
		maxsize = 24,
		texture = "farlands_explosion.png",
		animation = {type= "vertical_frames", aspect_w=1, aspect_h=1, length=-1},
		glow = 12
	})
	core.add_particlespawner({
		amount = 16,
		time = .9,
		minpos = vector.subtract(pos, .8),
		maxpos = vector.add(pos, .8),
		minvel = {x= -.7, y= .7, z= -.7},
		maxvel = {x= .7, y= 2, z= .7},
		exptime = {min = .8, max = .9},
		minsize = 12,
		maxsize = 20,
		texture = "farlands_explosion_small.png",
		animation = {type= "vertical_frames", aspect_w=1, aspect_h=1, length=-1},
		glow = 10
	})
	pos.y = pos.y + 1
	core.add_particlespawner({
		amount = 32,
		time = .9,
		minpos = vector.subtract(pos, 1),
		maxpos = vector.add(pos, 1),
		minvel = {x= -.5, y= .7, z= -.5},
		maxvel = {x= .5, y= 2, z= .5},
		exptime = {min = .97, max = 1.27},
		minsize = 8,
		maxsize = 10,
		texture = "farlands_smoke.png",
		animation = {type= "vertical_frames", aspect_w=1, aspect_h=1, length=-1},
	})
end
	end,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craftitem("mapgen:lunar_meteor_piece", {
	description = "Lunar Meteor Piece",
	inventory_image = "meteorite_meteor_piece.png",
})

core.register_craft({
	output = "mapgen:lunar_meteor_piece 6",
	recipe = {{"mapgen:lunar_meteor"}}
})

core.register_lbm({
	name = "mapgen:start_lunar_meteor_timer",
	nodenames = {"mapgen:lunar_meteor"},
	action = function(pos)
		core.get_node_timer(pos):start(10)
	end
})

core.register_node("mapgen:crate", {
	description = "Sokoban Crate",
	tiles = {"crate.png"},
	paramtype = "light",
	light_source = 10,
	is_ground_content = false,
	groups = {immortal = 1},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, player)
		local p = player:get_pos()
		local q = {x=pos.x,y=pos.y,z=pos.z}
		p.x=p.x-q.x;p.y=p.y-q.y;p.z=p.z-q.z
		if math.abs(p.y+.5)>0 then return end
		if math.abs(p.x)>math.abs(p.z) then
			if p.z<-.5 or p.z>.5 or math.abs(p.x)>1.5 then return end
			if p.x+q.x>q.x then q.x= q.x-1
				else q.x = q.x+1
			end
		else
			if p.x<-.5 or p.x>.5 or math.abs(p.z)>1.5 then return end
			if p.z+q.z>q.z then q.z= q.z-1
				else q.z = q.z+1
			end
		end

		if core.get_node(q).name == "air" then
			core.remove_node(pos)
			core.set_node(q,{name = "mapgen:crate"})
			core.sound_play("default_dig_dig_immediate", {pos=q, gain=.5, max_hear_distance = 24})
		end
	end,
})

core.register_craftitem("mapgen:impervium_lump", {
	description = "Impervium Lump",
	inventory_image = "impervium_lump.png",
})

core.register_craftitem("mapgen:impervium_brick", {
	description = "Impervium Brick",
	inventory_image = "impervium_brick.png",
})

core.register_node("mapgen:impervium", {
	description = "Impervium",
	tiles = {"impervium_Kopija.png"},
	is_ground_content = false,
	on_blast = function() end,
	groups = {hard = 3, unbreakable = 2},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_cracky", gain= .7},
	}),
})

core.register_craft({
	type = "cooking",
	output = "mapgen:impervium_brick",
	recipe = "mapgen:impervium_lump",
	cooktime = 20,
})

register_nine("mapgen:impervium", "mapgen:impervium_brick")

core.register_node("mapgen:big_table", {
	description = "Big Table",
	tiles = {"mapgen_bigtable_top.png", "mapgen_bigtable.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .375, -.5, .5, .5, .5},
			{-.5, -.5, .1875, -.1875, .375, .5}
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults()
})

core.register_craft({
	output = "mapgen:big_table 6",
	recipe = {
		{"default:acacia_wood", "default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "", ""},
		{"default:acacia_wood", "", ""}
	}
})

core.register_node("mapgen:crystal_1", {
	description = "Cave Crystal (Blue)",
	tiles = {"mapgen_crystal1.png"},
	groups = {cracky=1},
	drawtype = "nodebox",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-.125, -.5, -.0625, .1875, .4375, .25},
			{0, -.5, -.3125, .1875, .1875, -.125},
			{-.3125, -.5, -.1875, -.0625, -.0625, .0625},
			{.1875, -.5, .0625, .3125, 0, .1875},
			{-.25, -.5, .125, 0, .0625, .375}
		}
	},
	sounds = default.node_sound_glass_defaults()
})

core.register_node("mapgen:crystal_3", {
	description = "Cave Crystal (Green)",
	tiles = {"mapgen_crystal3.png"},
	groups = {cracky=1},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-.1875, -.5, -.25, 0, .1875, -.0625},
			{0, -.5, .0625, .25, .5, .3125},
			{-.375, -.5, .0625, -.1875, -.0625, .25}
		}
	},
	sounds = default.node_sound_glass_defaults()
})

core.register_node("mapgen:crystal_2", {
	description = "Cave Crystal (Purple)",
	tiles = {"mapgen_crystal2.png"},
	groups = {cracky=1},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-.125, -.5, -.1875, .125, .4375, .125},
			{.0625, -.5, .1875, .25, .1875, .375},
			{-.375, -.5, -.25, -.1875, -.0625, -.0625},
			{-.3125, -.5, .0625, -.0625, .125, .3125},
			{.0625, -.5, -.3125, .25, .25, -.125}
		}
	},
	sounds = default.node_sound_glass_defaults()
})

if core.get_modpath("mobs_loz") then
core.register_tool("mapgen:pendant1", {
	description = "Pendant of Power",
	inventory_image = "mapgen_pendant1.png",
	on_use = function(item, user, pointd)
if core.get_modpath("mtools") then
	core.sound_play("Villageforest", {to_player = user:get_player_name()})
	local pos = user:get_pos()
	core.add_particlespawner({
		amount = 5,
		time = .1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=4,z=-.5},
		maxacc = {x=.5,y=4,z=.5},
		exptime = {min = .5, max = 1},
		minsize = 8,
		maxsize = 10,
		texture = "mtools_powder2.png",
		glow = 9 })
end
	end
})

core.register_craft({
	output = "mapgen:pendant1",
	recipe = {
		{"fabric:string"},
		{"mapgen:waterstone"}
	}
})

core.register_tool("mapgen:pendant2", {
	description = "Pendant of Courage",
	inventory_image = "mapgen_pendant2.png",
	on_use = function(item, user, pointd)
if core.get_modpath("mtools") then
	core.sound_play("Downtime", {to_player = user:get_player_name()})
	local pos = user:get_pos()
	core.add_particlespawner({
		amount = 5,
		time = .1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=4,z=-.5},
		maxacc = {x=.5,y=4,z=.5},
		exptime = {min = .5, max = 1},
		minsize = 8,
		maxsize = 10,
		texture = "mtools_powder3.png",
		glow = 9 })
end
	end
})

core.register_craft({
	output = "mapgen:pendant2",
	recipe = {
		{"fabric:string"},
		{"mapgen:earthstone"}
	}
})

core.register_tool("mapgen:pendant3", {
	description = "Pendant of Wisdom",
	inventory_image = "mapgen_pendant3.png",
	on_use = function(item, user, pointd)
if core.get_modpath("mtools") then
	core.sound_play("BrassFleece", {to_player = user:get_player_name()})
	local pos = user:get_pos()
	core.add_particlespawner({
		amount = 5,
		time = .1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=4,z=-.5},
		maxacc = {x=.5,y=4,z=.5},
		exptime = {min = .5, max = 1},
		minsize = 8,
		maxsize = 10,
		texture = "mtools_powder4.png",
		glow = 9 })
end
	end
})

core.register_craft({
	output = "mapgen:pendant3",
	recipe = {
		{"fabric:string"},
		{"mapgen:firestone"}
	}
})

core.register_node("mapgen:zol_stone", {
	description = "Zol Stone",
	tiles = {"mapgen_zol_stone.png"},
	groups = {},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, item)
	for i=1, 10 do
		core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:zol")
	end
		core.remove_node(pos)
	end
})

core.register_node("mapgen:octorock_stone", {
	description = "Octorock Stone",
	tiles = {"mapgen_octorock_stone.png"},
	groups = {},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, item)
	for i=1, 8 do
		core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:octorock")
	end
		core.remove_node(pos)
	end
})

core.register_craft({
	output = "mapgen:octorock_stone",
	recipe = {
		{"mapgen:subrosian_sand", "mapgen:subrosian_sand", "mapgen:subrosian_sand"},
		{"mapgen:subrosian_sand", "mobs_loz:nut", "mapgen:subrosian_sand"},
		{"mapgen:subrosian_sand", "mapgen:subrosian_sand", "mapgen:subrosian_sand"}
	}
})

dofile(path.. "/mapgen_lom_schems.lua")

core.register_node("mapgen:ganon_spawn", {
	description = "Ganon spawner",
	tiles = {"mapgen_gspawn.png"},
	groups = {oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
core.place_schematic({x=pos.x-6, y=pos.y-1, z=pos.z-6}, ganon_dungeon, "0", nil, false)
core.after(5, function()
core.add_entity({x=pos.x+5, y=pos.y+1, z=pos.z+5}, "mobs_loz:ganon")
end)
	end,
})

core.register_node("mapgen:volvagia_spawn", {
	description = "Volvagia spawner",
	tiles = {"mapgen_vspawn.png"},
	groups = {oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
core.after(5, function()
core.add_entity({x=pos.x, y=pos.y+.5, z=pos.z}, "mobs_loz:volvagia")
core.sound_play("BrassFleece", {gain=.3})
end)
	end,
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mtools:sword" then
			core.set_node(pos, {name="mapgen:ganon_spawn"})
		end
	end
})

core.register_craft({
	output = "mapgen:volvagia_spawn",
	recipe = {
		{"", "default:stone", ""},
		{"bucket:bucket_lava", "mapgen:pendant3", "bucket:bucket_lava"},
		{"", "default:stone", ""}
	}
})

core.register_node("mapgen:poe_spawn", {
	description = "Poe spawner",
	tiles = {"mapgen_pspawn.png"},
	groups = {oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
core.after(5, function()
	for i=1, 10 do
core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:poe")
	end
end)
	end,
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mtools:sword" then
			core.set_node(pos, {name="mapgen:ganon_spawn"})
		end
	end
})

core.register_craft({
	output = "mapgen:poe_spawn",
	recipe = {
		{"", "default:stone", ""},
		{"ecology:eye", "mapgen:pendant1", "ecology:eye"},
		{"", "default:stone", ""}
	}
})

core.register_node("mapgen:dodongo_spawn", {
	description = "King Dodongo spawner",
	tiles = {"mapgen_dspawn.png"},
	groups = {oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
core.after(5, function()
core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:dodongo_boss")
end)
	end,
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mtools:sword" then
			core.set_node(pos, {name="mapgen:ganon_spawn"})
		end
	end
})

core.register_craft({
	output = "mapgen:dodongo_spawn",
	recipe = {
		{"", "default:stone", ""},
		{"bucket:bucket_lava", "mapgen:pendant2", "bucket:bucket_lava"},
		{"", "default:stone", ""}
	}
})

if core.get_modpath("ecology") then
core.register_craftitem("mapgen:puzzle_box_spawner", {
	description = "21 Chests Puzzle box spawner",
	inventory_image = "mapgen_puzzle_box_spawner.png",
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		local pos = pointd.under
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pos)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pos, node_ptu, user, item, pointd)
			end
		end

local po2 = user:get_pos()
core.add_particlespawner({
	amount = 99,
	time = .7,
	minpos = {x=po2.x -.5, y=po2.y -.5, z=po2.z -.5},
	maxpos = {x=po2.x +.5, y=po2.y +.7, z=po2.z +.5},
	minvel = {x=0, y=5, z=0},
	maxvel = {x=0, y=5, z=0},
	minacc = {x=0, y=5, z=0},
	maxacc = {x=0, y=5, z=0},
	exptime = {min = 2, max = 2.5},
	minsize = 7,
	maxsize = 9,
	vertical = true,
	texture = "mapgen_teleport_beam.png",
	glow = 14 })
		user:set_pos({x=pos.x+17, y=204, z=pos.z})
		core.place_schematic({x=pos.x, y=200, z=pos.z}, lom_puzzle_box, "0", nil, false)
		item:take_item()
		return item
	end,
})
end

core.register_craftitem("mapgen:zols_lair_spawner", {
	description = "Zol's Lair spawner",
	inventory_image = "mapgen_zols_lair_spawner.png",
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		local pos = pointd.under
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pos)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pos, node_ptu, user, item, pointd)
			end
		end

		core.place_schematic(pos, zols_lair, "0", nil, false)
		item:take_item()
		return item
	end,
})
end

core.register_node("mapgen:ice_waterfall", {
	description = "Frozen Waterfall",
	drawtype = "glasslike",
	tiles = {"mapgen_ice_waterfall.png"},
	inventory_image = core.inventorycube"mapgen_ice_waterfall.png^[brighten",
	paramtype = "light",
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	liquids_pointable = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	post_effect_color = {a = 160, r = 120, g = 160, b = 180},
})

core.register_node("mapgen:clear_ice", {
	description = "Clear Ice",
	drawtype = "glasslike",
	tiles = {"mapgen_clear_ice.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	liquids_pointable = true,
	sunlight_propagates = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	post_effect_color = {a = 150, r = 120, g = 140, b = 150},
})

core.register_node("mapgen:clear_ice_white", {
	description = "Clear Ice White",
	drawtype = "glasslike",
	tiles = {"mapgen_clear_ice_white.png"},
	inventory_image = core.inventorycube"mapgen_clear_ice_white.png^[brighten",
	paramtype = "light",
	use_texture_alpha = "blend",
	liquids_pointable = true,
	sunlight_propagates = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	post_effect_color = {a = 160, r = 140, g = 160, b = 160},
})

core.register_node("mapgen:clear_ice_blue", {
	description = "Clear Ice Blue",
	drawtype = "glasslike",
	tiles = {"mapgen_clear_ice_blue.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	liquids_pointable = true,
	sunlight_propagates = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	post_effect_color = {a = 200, r = 120, g = 160, b = 180},
})

core.register_node("mapgen:clear_ice_cyan", {
	description = "Clear Ice Cyan",
	drawtype = "glasslike",
	tiles = {"mapgen_clear_ice_cyan.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	liquids_pointable = true,
	sunlight_propagates = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	post_effect_color = {a = 180, r = 120, g = 180, b = 190},
})

core.register_node("mapgen:crumbled_ice", {
	description = "Crumbled Ice",
	tiles = {"mapgen_crumbled_ice.png"},
	paramtype = "light",
	liquids_pointable = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {crumbly=2, oddly_breakable_by_hand = 1, cools_lava = 1, slippery = 1, icy = 1},
	sounds = default.node_sound_ice_defaults(),
})

core.register_craft({
	output = "mapgen:crumbled_ice",
	recipe = {{"mapgen:clear_ice_white"}}
})

core.register_node("mapgen:ice_spike", {
	description = "Ice spike",
	drawtype = "nodebox",
	tiles = {"default_ice.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.25, -.5, -.25, .25, .5, .25},
			{-.1875, .4375, -.1875, .1875, 1.1875, .1875},
			{-.125, 1.1875, -.125, .125, 1.6875, .125},
			{-.0625, 1.6875, -.0625, .0625, 2.0625, .0625}
		}
	},
	drop = "",
	on_timer = default.melt_near_heat,
	groups = {cracky=3, cools_lava=1, icy = 1, melttoflo = 1},
	sounds = default.node_sound_ice_defaults(),
	on_destruct = function(pos)
		core.add_item({x=pos.x, y=pos.y+.1, z=pos.z}, "mapgen:ice_shard")
		core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "mapgen:ice_shard")
		core.add_item({x=pos.x, y=pos.y+.9, z=pos.z}, "mapgen:ice_shard")
		core.add_item({x=pos.x, y=pos.y+1.5, z=pos.z}, "mapgen:ice_shard")
	end,
})

core.register_node("mapgen:obsidian_spike", {
	description = "Obsidian spike",
	drawtype = "nodebox",
	tiles = {"default_obsidian.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.25, -.5, -.25, .25, .5, .25},
			{-.1875, .4375, -.1875, .1875, 1.1875, .1875},
			{-.125, 1.1875, -.125, .125, 1.6875, .125},
			{-.0625, 1.6875, -.0625, .0625, 2.0625, .0625}
		}
	},
	drop = "",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		core.add_item({x=pos.x, y=pos.y+.1, z=pos.z}, "default:obsidian_shard")
		core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "default:obsidian_shard")
		core.add_item({x=pos.x, y=pos.y+.9, z=pos.z}, "default:obsidian_shard")
		core.add_item({x=pos.x, y=pos.y+1.5, z=pos.z}, "default:obsidian_shard")
	end,
})

core.register_node("mapgen:sinkingsand", {
	description = "Sinking Sand",
	drawtype = "glasslike",
	tiles = {{name = "mapgen_sinkingsand.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.}
	}},
	inventory_image = "mapgen_sinkingsand_inv.png",
	walkable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	liquid_viscosity = 7,
	liquid_range = 0,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mapgen:sinkingsand",
	liquid_alternative_source = "mapgen:sinkingsand",
	damage_per_second = 3,
	groups = {liquid=1, sand=1, disable_jump=1}
})

core.register_craftitem("mapgen:dart_h", {
	description = "Healing Dart (TODO)",
	inventory_image = "decor_dart_h.png",
})

core.register_craft({
	output = "mapgen:dart_h 16",
	recipe = {{"default:dirt_with_coniferous_litter", "mtools:heart"}},
	replacements = {{"default:dirt_with_coniferous_litter", "default:dirt"}}
})

core.register_entity("mapgen:dart", {
	initial_properties = {
		visual = "cube",
		textures = {"decor_dart.png", "decor_dart.png", "decor_dart.png",
		"decor_dart.png", "decor_dart.png", "decor_dart.png"},
		visual_size={x=.1,y=.1},
		collisionbox = {0,0,0,0,0,0},
		physical = false,
		automatic_rotate = 5,
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > .5 then self.object:remove() return end

		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y-.5,z=pos.z}, .5)
		for k, obj in pairs(objs) do
			if obj:is_player() then
		local item = obj:get_wielded_item():get_name()
		if item ~= "mapgen:shield" then
				obj:punch(self.object, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=3},
				}, nil)
		end
				self.object:remove()
			end
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
				if obj:get_luaentity().name ~= "mapgen:dart" and obj:get_luaentity().name ~= "__builtin:item" then
				obj:punch(self.object, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=3},
				}, nil)
				self.object:remove()
				end
			end
		end
	end
})

core.register_craftitem("mapgen:dart_p", {
	description = "Poison Dart",
	inventory_image = "decor_dart_p.png",
})

core.register_craft({
	output = "mapgen:dart_p 16",
	recipe = {{"default:dirt_with_coniferous_litter", "group:poison"}},
	replacements = {{"default:dirt_with_coniferous_litter", "default:dirt"}}
})

core.register_node("mapgen:dartblock", {
	description = "Dart Trap",
	tiles = {"decor_dartblock_top.png", "decor_dartblock_top.png", "decor_dartblock_sides.png",
		"decor_dartblock_sides.png", "decor_dartblock_sides.png", "decor_dartblock_front.png"},
	paramtype2 = "facedir",
	drop = "mapgen:dart_p 5",
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.5)
	end,
	on_timer = function(pos)
		local p2 = core.get_node(pos).param2
		local x = 0
		local z = 0
		if p2 == 0 then
			z = -1
		elseif p2 == 2 then
			z = 1
		elseif p2 == 1 then
			x = -1
		elseif p2 == 3 then
			x = 1
		end
		--core.chat_send_all(p2)
		for num=1,5 do
		local objs = core.get_objects_inside_radius({x=pos.x+x*num, y=pos.y-.5, z=pos.z+z*num}, 1)
		for _, obj in ipairs(objs) do
			if obj:is_player() then
				local ent = core.add_entity(pos, "mapgen:dart")
				ent:set_velocity({x=25*x, y=0, z=25*z})
			end
		end
		end
		core.get_node_timer(pos):start(.5)
	end,
	groups = {cracky = 1, timer_check = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_tool("mapgen:blowpipe", {
	description = "Dart Blow Pipe",
	inventory_image = "decor_blowdart.png",
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local pname = user:get_player_name()
		local inv = core.get_inventory({type="player", name=pname})
		if inv:contains_item("main", "mapgen:dart_p") then
	local ent = core.add_entity({x=pos.x+1*dir.x, y=pos.y+1.5, z=pos.z+1*dir.z}, "mapgen:dart")
	ent:set_velocity({x=25*dir.x, y=25*dir.y, z=25*dir.z})
	inv:remove_item("main", "mapgen:dart_p")
		end
	end,
})

core.register_craft({
	output = "mapgen:blowpipe",
	recipe = {{"default:reed", "group:leaves"}}
})

core.register_node("mapgen:spikes", {
	description = "Spikes",
	drawtype = "firelike",
	tiles = {"decor_spikes.png"},
	wield_image = "decor_spikes.png",
	inventory_image = "decor_spikes.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	is_ground_content = false,
	damage_per_second = 3,
	groups = {cracky=3},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.3, .5}
	}
})

core.register_craft({
	output = "mapgen:spikes 4",
	recipe = {{"group:rock"},
		{"mapgen:spikes_large"},
		{"mapgen:spikes_large"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_node("mapgen:spikes_large", {
	description = "Large Spike Trap",
	drawtype = "plantlike",
	tiles = {"mapgen_spikes_large.png"},
	wield_image = "mapgen_spikes_large.png",
	inventory_image = "mapgen_spikes_large.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=2, fall_damage_add_percent = 199},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.3, .5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.45, .5}
	}
})

core.register_craft({
	output = "mapgen:spikes_large 4",
	recipe = {{"", "group:rock", ""},
		{"default:steel_bar", "default:steel_bar", "default:steel_bar"},
		{"", "default:wrought_iron_ingot", ""}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_node("mapgen:skull", {
	description = "Skull",
	drawtype = "nodebox",
	tiles = {"horror_skull_top.png", "horror_skull_bottom.png", "horror_skull_right.png",
		"horror_skull_left.png", "horror_skull_back.png", "horror_skull_front.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {dig_immediate = 2},
	node_box = {
		type = "fixed",
		fixed = {-.3125, -.5, -.3125, .3125, .125, .3125}
	}
})
-- non player skeletons
core.register_node("mapgen:old_skull", {
	description = "Old Skull",
	drawtype = "mesh",
	mesh = "human_skull.obj",
	tiles = {"human_skull.png"},
	visual_scale = .5,
	wield_image = "decor_skull_item.png",
	wield_scale = {x=1.0, y=1.0, z=1.0},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .0, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .0, .3}
	},
	inventory_image = "decor_skull_item.png",
	groups = {dig_immediate = 2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:old_skeleton", {
	description = "Old Skeleton",
	drawtype = "mesh",
	mesh = "decor_old_skeleton.obj",
	tiles = {"decor_old_skeleton.png"},
	visual_scale = .5,
	wield_image = "decor_skull_item.png",
	wield_scale = {x=1., y=1., z=1.},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.4, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.4, .3}
	},
	inventory_image = "decor_skull_item.png",
	groups = {cracky = 1, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:old_skeleton_alt", {
	description = "Old Skeleton alt",
	drawtype = "mesh",
	mesh = "decor_old_skeleton2.obj",
	tiles = {"decor_old_skeleton.png"},
	visual_scale = .5,
	wield_image = "decor_skull_item.png",
	wield_scale = {x=1., y=1., z=1.},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.4, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.4, .3}
	},
	inventory_image = "decor_skull_item.png",
	groups = {cracky = 1, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults()
})


local chest_items = {
	{"mtools:boomerang", 7},
	{"mtools:flame_rod", 10},
	{"mtools:lava_dagger", 8},
	{"mtools:frost_wand", 10},
	{"mtools:medallion", 10},
	{"mtools:medallion2", 10},
	{"mtools:gboomerang", 9},
	{"mtools:magic_wand", 10},
	{"mtools:rocfeather", 8},
	{"mapgen:eye", 5},
	{"mapgen:magic_sapling", 5},
	{"mapgen:impervium_lump 27", 9},
	{"mapgen:blue_rupee 20", 5},
	{"mapgen:red_rupee 10", 5},
	{"mapgen:nyan_rupee", 5},
	{"mapgen:green_rupee 20", 3},
	{"default:gold_ingot", 7},
	{"default:steel_ingot 3", 3},
	{"default:stick 29", 1},
	{"default:gold_lump 3", 1},
}

core.register_node("mapgen:chest", {
	description = "Dungeon Chest",
	tiles = {"mapgen_chest_top.png", "mapgen_chest_top.png", "mapgen_chest_side.png",
		"mapgen_chest_side.png", "mapgen_chest_back.png", "mapgen_chest_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	on_rightclick = function(pos, node, clicker, item)
		local pname = clicker:get_player_name()
		if item:get_name() == "mapgen:key" or item:get_name() == "mapgen:key_boss" then
			if item:get_name() == "mapgen:key" then
			item:take_item()
			end
			for _, row in ipairs(chest_items) do
		if math.random(row[2]) == 1 then
			core.add_item(pos, row[1])
		end
			end
		local nname = core.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
	if nname ~= "mapgen:dungeon_brick" and nname ~= "mapgen:dungeon_tile"
		and nname ~= "mapgen:dungeon_brick2" and nname ~= "mapgen:dungeon_tile2" then
		if math.random(45) == 1 then
		core.add_item(pos, "mapgen:key_boss")
		else
		core.add_item(pos, "mapgen:key")
		end
	else
		core.add_item(pos, "default:gold_lump")
	end
			core.remove_node(pos)
		else
	core.chat_send_player(pname, "It's locked, you need a key!")
		end
	end,
	after_place_node = function(pos)
		local meta = core.get_meta(pos):set_string("placed", "true")
	end,
	after_dig_node = function(pos, oldnode, oldmeta)
		local meta = core.get_meta(pos)
		meta:from_table(oldmeta)
		if meta:get_string("placed") ~= "true" and math.random(30) == 1 then
		local nname = core.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
	if nname ~= "mapgen:dungeon_brick" and nname ~= "mapgen:dungeon_tile"
		and nname ~= "mapgen:dungeon_brick2" and nname ~= "mapgen:dungeon_tile2" then
		core.add_item(pos, "mapgen:key")
	else
		core.add_item(pos, "default:gold_lump")
	end
		end
	end,
})

core.register_craftitem("mapgen:key", {
	description = "Dungeon Chest Key",
	inventory_image = "mapgen_key.png",
})

core.register_craftitem("mapgen:key_boss", {
	description = "Boss Dungeon Chest Key",
	inventory_image = "mapgen_key_boss.png",
})

core.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "mapgen:key",
	cooktime = 5,
})

core.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "mapgen:key_boss",
	cooktime = 5,
	replacements = {{"mapgen:key_boss", "gems:ruby"}}
})

local function open_door(pos, player)
	if doors.get then
	local doorss = core.find_nodes_in_area({x=pos.x-5, y=pos.y, z=pos.z-5},
		{x=pos.x+5, y=pos.y, z=pos.z+5}, "group:door")
	for i = 1, #doorss do
		local dpos = {x=doorss[i].x, y=doorss[i].y, z=doorss[i].z}
		local door = doors.get(dpos)
		door:toggle(player)
	end
	end
end

core.register_node("mapgen:floor_lamp", {
	description = "Floor Lamp",
	tiles = {"mapgen_lamptop.png", "mapgen_lamptop.png", "mapgen_lampside.png"},
	use_texture_alpha = "clip",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{.375, -.5, .375, .5, 0, .5},
			{.375, -.5, -.5, .5, 0, -.375},
			{-.5, -.5, -.5, -.375, 0, -.375},
			{-.5, -.5, .375, -.375, 0, .5},
			{-.375, -.5, -.375, .375, -1/16, .375},
			{-.375, -.375, -7/16, .375, 1/16, -.3125},
			{-.375, -.375, .3125, .375, 1/16, 7/16},
			{.3125, -.375, -.375, 7/16, 1/16, .375},
			{-7/16, -.375, -.375, -.3125, 1/16, .375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -7/16, -7/16, 7/16, 0, 7/16}
	},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mtools:lantern" then
	core.set_node(pos, {name="mapgen:floor_lamp_lit"})
	local ttl = math.random(28, 32)
	core.get_node_timer(pos):start(ttl)
	local meta = core.get_meta(pos)
	local id = meta:get_int("lamp_flames")
	id = core.add_particlespawner({
		amount = 800,
		time = ttl,
		minpos = {x=pos.x-.2, y=pos.y, z=pos.z-.2},
		maxpos = {x=pos.x+.2, y=pos.y, z=pos.z+.2},
		minvel = {x=0, y=.5, z=0},
		maxvel = {x=0, y=1, z=0},
		minacc = {x=-.5, y=.5, z=-.5},
		maxacc = {x=.5, y=.5, z=.5},
		exptime = {min = .2, max = .6},
		minsize = 4,
		maxsize = 8,
		texture = "mapgen_flame.png",
		glow = 9 })
	meta:set_int("lamp_flames", id)
	open_door(pos, clicker)
		end
	end,
	groups = {cracky=1},
})

core.register_node("mapgen:floor_lamp_lit", {
	tiles = {"mapgen_lamptop.png", "mapgen_lamptop.png", "mapgen_lampside.png"},
	use_texture_alpha = "clip",
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 10,
	drop = "mapgen:floor_lamp",
	node_box = {
		type = "fixed",
		fixed = {
			{.375, -.5, .375, .5, 0, .5},
			{.375, -.5, -.5, .5, 0, -.375},
			{-.5, -.5, -.5, -.375, 0, -.375},
			{-.5, -.5, .375, -.375, 0, .5},
			{-.375, -.5, -.375, .375, -1/16, .375},
			{-.375, -.375, -7/16, .375, 1/16, -.3125},
			{-.375, -.375, .3125, .375, 1/16, 7/16},
			{.3125, -.375, -.375, 7/16, 1/16, .375},
			{-7/16, -.375, -.375, -.3125, 1/16, .375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -7/16, -7/16, 7/16, 0, 7/16}
	},
	groups = {cracky=1, timer_check=1, not_in_creative_inventory=1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(14, 16))
	end,
	on_destruct = function(pos)
		local id = core.get_meta(pos):get_int("lamp_flames")
		core.delete_particlespawner(id)
	end,
	on_timer = function(pos)
		core.set_node(pos, {name="mapgen:floor_lamp"})
	end,
})

core.register_node("mapgen:geyser_steam", {
	description = "Geyser Steam",
	inventory_image = "default_item_smoke.png^[colorize:white:120^default_invisible_node_overlay.png",
	wield_image = "default_item_smoke.png^[colorize:white:120^default_invisible_node_overlay.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	drop = "",
	damage_per_second = 2,
	groups = {attached_node = 1, timer_check = 1, not_in_creative_inventory = 1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos)
		core.remove_node(pos)
	end
})

core.register_node("mapgen:geyser", {
	description = "Geyser",
	tiles = {"default_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, timer_check=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, -3/16},
			{-.5, -.5, -.5, -3/16, .5, .5},
			{-.5, -.5, 3/16, .5, .5, .5},
			{3/16, -.5, -.5, .5, .5, .5}
		}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 7))
	end,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	on_timer = function(pos)
		local steam_pos = {x= pos.x, y= pos.y+ 1, z= pos.z}
		if core.get_node(steam_pos).name == "air" then
	core.set_node(steam_pos, {name = "mapgen:geyser_steam"})
	core.get_node_timer(steam_pos):start(2)
	core.add_particlespawner({
		amount = 21,
		time = 2,
		minpos = {x=pos.x, y=pos.y, z=pos.z},
		maxpos = {x=pos.x, y=pos.y, z=pos.z},
		minvel = {x=-.1, y=1, z=-.1},
		maxvel = {x=.1, y=2, z=.1},
		minacc = {x=-.1, y=.15, z=-.1},
		maxacc = {x=.1, y=.5, z=.1},
		exptime = {min = .8, max = 1},
		minsize = 3,
		maxsize = 5,
		collisiondetection = true,
		texture = "default_item_smoke.png^[colorize:white:120"})
		end
		core.get_node_timer(pos):start(math.random(5, 7))
	end
})

core.register_node("mapgen:grupee", {
	description = "Green Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {"mapgen_grupee.png"},
	use_texture_alpha = "blend",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:rrupee", {
	description = "Red Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {"mapgen_rrupee.png"},
	use_texture_alpha = "blend",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:brupee", {
	description = "Blue Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {"mapgen_brupee.png"},
	use_texture_alpha = "blend",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:nrupee", {
	description = "Nyan Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {"mapgen_nrupee.png"},
	use_texture_alpha = "blend",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

register_nine("mapgen:grupee", "mapgen:green_rupee")
register_nine("mapgen:rrupee", "mapgen:red_rupee")
register_nine("mapgen:brupee", "mapgen:blue_rupee")
register_nine("mapgen:nrupee", "mapgen:nyan_rupee")

core.register_node("mapgen:dark_sandstone", {
	description = "Dark Sandstone",
	tiles = {"mapgen_dark_sandstone.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab(
	"dark_sandstone",
	"mapgen:dark_sandstone",
	{cracky = 3},
	{"mapgen_dark_sandstone.png"},
	"Dark Sandstone Stair",
	"Dark Sandstone Slab",
	default.node_sound_stone_defaults(),
	true
)

core.register_node("mapgen:dark_sandstone_tile", {
	description = "Dark Sandstone Tile",
	tiles = {"mapgen_dark_sandstone_tile.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dark_sandstone_decorated", {
	description = "Dark Sandstone Decorated",
	tiles = {"mapgen_dark_sandstone.png", "mapgen_dark_sandstone.png", "mapgen_dark_sandstone_decorated.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dark_sandstone_decorated2", {
	description = "Dark Sandstone Decorated 2",
	tiles = {"mapgen_dark_sandstone.png", "mapgen_dark_sandstone.png", "mapgen_dark_sandstone_decorated2.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dark_sandstone_pillar", {
	description = "Dark Sandstone Pillar",
	drawtype = "nodebox",
	tiles = {"mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_pillar.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	groups = {cracky=2, falling_node=1, stone=1},
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .5, .25}
	},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dark_sandstone_pillar_base", {
	description = "Dark Sandstone Pillar (base)",
	drawtype = "nodebox",
	tiles = {"mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_pillar_base.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	groups = {cracky=2, falling_node=1, stone=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.4375, .4375, -.4375, .4375},
			{-.375, -.4375, -.375, .375, -.3125, .375},
			{-.3125, -.3125, -.3125, .3125, -.1875, .3125},
			{-.25, -.1875, -.25, .25, .5, .25}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dark_sandstone_pillar_top", {
	description = "Dark Sandstone Pillar (top)",
	drawtype = "nodebox",
	tiles = {"mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_tile.png", "mapgen_dark_sandstone_pillar_top.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	groups = {cracky=2, falling_node=1, stone=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, .4375, -.4375, .4375, .5, .4375},
			{-.375, .3125, -.375, .375, .4375, .375},
			{-.3125, .1875, -.3125, .3125, .3125, .3125},
			{-.25, -.5, -.25, .25, .1875, .25}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:green_tile", {
	description = "Green Tile",
	tiles = {"mapgen_green_tile.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:green_tile 2",
	recipe = {
		{"default:stone", "mapgen:crystal_3"},
		{"mapgen:crystal_3", "default:stone"}
	}
})

core.register_node("mapgen:darkgreen_tile", {
	description = "Dark Green Tile",
	tiles = {"mapgen_darkgreen_tile.png"},
	groups = {cracky=1},
	sounds = default.node_sound_glass_defaults()
})

core.register_craft({
	type = "cooking",
	output = "mapgen:darkgreen_tile",
	recipe = "mapgen:green_tile",
})

core.register_node("mapgen:beamoswall", {
	description = "Beamos Block",
	tiles = {"mapgen_beamos_wall.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:beamoswall 2",
	recipe = {{"default:stone", "mapgen:glowstone", "default:stone"}}
})

core.register_node("mapgen:railblock", {
	description = "Rail Block",
	tiles = {"mapgen_railblock.png"},
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults()
})

core.register_craft({
	output = "mapgen:railblock",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""}
	}
})

core.register_node("mapgen:stained_glass", {
	description = "Stained Glass",
	drawtype = "glasslike",
	tiles = {"mapgen_stainedglass.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 10,
	sunlight_propagates = true,
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

core.register_craft({
	type = "cooking",
	output = "mapgen:stained_glass",
	recipe = "mapgen:subrosian_sand",
})

core.register_node("mapgen:ganon_sphere", {
	description = "Ganon Sphere",
	drawtype = "nodebox",
	tiles = {"mapgen_ganonsphere.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 10,
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-.375, -.1875, -.1875, .375, .1875, .1875},
			{-.1875, -.375, -.1875, .1875, .375, .1875},
			{-.3125, -.25, -.25, .3125, .25, .25},
			{-.25, -.25, -.3125, .25, .25, .3125},
			{-.25, -.3125, -.25, .25, .3125, .25},
			{-.1875, -.1875, -.375, .1875, .1875, .375}
		}
	},
	drop = "",
	groups = {cracky=4, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

core.register_node("mapgen:floortile", {
	description = "Floor Tile",
	tiles = {"mapgen_floortile.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:floortile 2",
	recipe = {
		{"default:stone", "mapgen:crystal_1"},
		{"mapgen:crystal_1", "default:stone"}
	}
})

stairs.register_stair_and_slab(
	"floortile",
	"mapgen:floortile",
	{cracky = 1},
	{"mapgen_floortile.png"},
	"Floor Tile Stair",
	"Floor Tile Slab",
	default.node_sound_stone_defaults(),
	true
)

core.register_node("mapgen:carpet", {
	description = "Carpet Block",
	tiles = {"mapgen_carpet.png"},
	groups = {fleshy=1, dig_immediate=2, oddly_breakable_by_hand=1, flammable=3},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "mapgen:carpet",
	recipe = {{"fabric:block_red", "fabric:sheet_pink"}}
})

core.register_node("mapgen:carpet_trap", {
	description = "Carpet Trap",
	tiles = {"mapgen_carpet.png"},
	walkable = false,
	damage_per_second = 3,
	groups = {fleshy=1, dig_immediate=2, oddly_breakable_by_hand=1, flammable=1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "mapgen:carpet_trap 2",
	recipe = {{"mapgen:carpet", "mapgen:spikes", "mapgen:carpet"}}
})

core.register_node("mapgen:magnblock", {
	description = "Magnetic Block (almost unbreakeable)",
	tiles = {"mapgen_magnblock.png"},
	groups = {cracky=7, magnetic=1}
})

core.register_node("mapgen:flameblock", {
	description = "Flame Block (almost unbreakeable)",
	tiles = {"mapgen_flameblock.png"},
	groups = {cracky=7, flammable=1}
})

core.register_node("mapgen:rock", {
	description = "Rock",
	drawtype = "nodebox",
	tiles = {"mapgen_rock.png"},
	paramtype = "light",
	groups = {cracky=1, falling_node=1},
	on_destruct = function(pos)
		if math.random(3,5) == 5 then
		core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "mapgen:green_rupee")
		end
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-.375, -.5, -.375, .3125, -.125, .3125},
			{-.4375, -.4375, -.3125, .375, -.125, .25},
			{-.3125, -.125, -.375, .25, -.0625, .3125},
			{-.3125, -.4375, -.4375, .25, -.125, .375},
			{-.25, -.0625, -.3125, .1875, 0, .25},
			{-.375, -.125, -.25, .3125, -.0625, .1875}
		}
	}
})

core.register_node("mapgen:wallring", {
	description = "Wall Ring",
	tiles = {"mapgen_railblock.png", "mapgen_railblock.png", "mapgen_wallring.png"},
	groups = {cracky=1, hook=1}
})

core.register_craft({
	output = "mapgen:wallring",
	recipe = {{"mapgen:railblock", "default:steel_ingot"}}
})

core.register_node("mapgen:coarse_dirt", {
	description = "Coarse Dirt",
	tiles = {"mapgen_coarse_dirt.png"},
	groups = {crumbly=2, oddly_breakable_by_hand=1, soil = 1},
	sounds = default.node_sound_dirt_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "mapgen:coarse_dirt 3",
	recipe = {"default:dirt", "default:dirt", "default:gravel"}
})

core.register_node("mapgen:dungeon_barrier", {
	description = "Retro Dungeon Barrier",
	tiles = {"mapgen_dungeon_barrier.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_barrier 4",
	recipe = {
		{"mapgen:dungeon_tile", "mapgen:dungeon_tile"},
		{"mapgen:dungeon_tile", "mapgen:dungeon_tile"}
	}
})

core.register_node("mapgen:dungeon_tile", {
	description = "Retro Dungeon Tile",
	tiles = {"mapgen_dungeon_tile.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_tile 4",
	recipe = {
		{"mapgen:dungeon_brick", "mapgen:dungeon_brick"},
		{"mapgen:dungeon_brick", "mapgen:dungeon_brick"}
	}
})

core.register_node("mapgen:dungeon_brick", {
	description = "Retro Dungeon Brick",
	tiles = {"mapgen_dungeon_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_brick 2",
	recipe = {
		{"default:stone", "mapgen:crystal_1"},
		{"mapgen:crystal_3", "default:stone"}
	}
})

core.register_node("mapgen:dungeon_barrier2", {
	description = "Retro Dungeon Barrier 2",
	tiles = {"mapgen_dungeon_barrier2.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_barrier2 4",
	recipe = {
		{"mapgen:dungeon_tile2", "mapgen:dungeon_tile2"},
		{"mapgen:dungeon_tile2", "mapgen:dungeon_tile2"}
	}
})

core.register_node("mapgen:dungeon_tile2", {
	description = "Retro Dungeon Tile 2",
	tiles = {"mapgen_dungeon_tile2.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_tile2 4",
	recipe = {
		{"mapgen:dungeon_brick2", "mapgen:dungeon_brick2"},
		{"mapgen:dungeon_brick2", "mapgen:dungeon_brick2"}
	}
})

core.register_node("mapgen:dungeon_brick2", {
	description = "Retro Dungeon Brick 2",
	tiles = {"mapgen_dungeon_brick2.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:dungeon_brick2 2",
	recipe = {
		{"default:stone", "mapgen:crystal_2"},
		{"mapgen:crystal_2", "default:stone"}
	}
})

stairs.register_stair_and_slab(
	"dungeon_brick2",
	"mapgen:dungeon_brick2",
	{cracky = 3},
	{"mapgen_dungeon_brick2.png"},
	"Retro Dungeon Brick 2 Stair",
	"Retro Dungeon Brick 2 Slab",
	default.node_sound_stone_defaults(),
	false
)

core.register_node("mapgen:dungeon_torch", {
	description = "Dungeon Torch",
	drawtype = "plantlike",
	visual_scale = 1.6,
	walkable = false,
	tiles = {{name = "mapgen_torch.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = .5}}
	},
	inventory_image = "mapgen_torch_inv.png",
	wield_image = "mapgen_torch_inv.png",
	paramtype = "light",
	light_source = 14,
	use_texture_alpha = "clip",
	groups = {choppy=1},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.2, .5}
	},
})

core.register_node("mapgen:subrosian_tile", {
	description = "Subrosian Tile",
	tiles = {"mapgen_subrosiantile.png"},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab(
	"subrosian_tile",
	"mapgen:subrosian_tile",
	{cracky = 2},
	{"mapgen_subrosiantile.png"},
	"Subrosian Tile Stair",
	"Subrosian Tile Slab",
	default.node_sound_stone_defaults(),
	true
)

core.register_craft({
	output = "mapgen:subrosian_tile 2",
	recipe = {
		{"", "mapgen:subrosian_sand", ""},
		{"mapgen:subrosian_sand", "mapgen:stained_glass", "mapgen:subrosian_sand"},
		{"", "mapgen:subrosian_sand", ""}
	}
})

core.register_node("mapgen:subrosian_sand", {
	description = "Subrosian Sand",
	tiles = {"mapgen_subrosiansand.png",
		"mapgen_subrosiansand.png^[colorize:black:50",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:10",
		"mapgen_subrosiansand.png^[colorize:black:60"},
	paramtype = "light",
	light_source = 10,
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_sand_defaults({
		footstep = {name= "subrosian_sand_footstep", gain= .12},
		dug = {name= "subrosian_sand_footstep", gain= .24}
	}),
})

core.register_node("mapgen:subrosian_sand_with_blue_ore", {
	description = "Subrosian Sand Blue Ore",
	tiles = {"mapgen_subrosiansand.png",
		"mapgen_subrosiansand.png^[colorize:black:50",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:10",
		"mapgen_subrosiansand.png^[colorize:black:60"},
	paramtype = "light",
	light_source = 10,
	drop = "mapgen:blue_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xn=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults({
		footstep = {name= "subrosian_sand_footstep", gain= .12},
		dug = {name= "subrosian_sand_footstep", gain= .24}
	}),
})

core.register_node("mapgen:subrosian_sand_with_red_ore", {
	description = "Subrosian Sand Red Ore",
	tiles = {"mapgen_subrosiansand.png",
		"mapgen_subrosiansand.png^[colorize:black:50",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:20",
		"mapgen_subrosiansand.png^[colorize:black:10",
		"mapgen_subrosiansand.png^[colorize:black:60"},
	paramtype = "light",
	light_source = 10,
	drop = "mapgen:red_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xn=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults({
		footstep = {name= "subrosian_sand_footstep", gain= .12},
		dug = {name= "subrosian_sand_footstep", gain= .24}
	}),
})

if core.get_modpath("moreblocks") then
stairsplus:register_all("mapgen", "dark_sandstone", "mapgen:dark_sandstone", {
	description = "Dark Sandstone",
	tiles = {"mapgen_dark_sandstone.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "floortile", "mapgen:floortile", {
	description = "Floor Tile",
	tiles = {"mapgen_floortile.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "dungeon_brick2", "mapgen:dungeon_brick2", {
	description = "Retro Dungeon Brick 2",
	tiles = {"mapgen_dungeon_brick2.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "subrosian_tile", "mapgen:subrosian_tile", {
	description = "Subrosian Tile",
	tiles = {"mapgen_subrosiantile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})
end

core.register_node("mapgen:statue", {
	description = "Gossip Stone",
	tiles = {"mapgen_statue_side.png", "mapgen_statue_side.png", "mapgen_statue_side.png",
		"mapgen_statue_side.png", "mapgen_statue_side.png", "mapgen_statue_front.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.1875, .4375, .4375, .25},
			{-.375, .4375, -.1875, .375, .5, .25}
		}
	},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mapgen:eye" then
			core.set_node(pos, {name="mapgen:statue_active", param2=node.param2})
		end
	end
})

core.register_node("mapgen:statue_active", {
	tiles = {"mapgen_statue_side.png", "mapgen_statue_side.png", "mapgen_statue_side.png",
		"mapgen_statue_side.png", "mapgen_statue_side.png", "mapgen_statue_active.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	light_source = 5,
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.1875, .4375, .4375, .25},
			{-.375, .4375, -.1875, .375, .5, .25}
		}
	},
	drop = "mapgen:statue",
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mapgen:eye" then
			core.set_node(pos, {name="mapgen:statue", param2=node.param2})
		end
	end
})

core.register_node("mapgen:glowstone", {
	description = "Glowstone",
	drawtype = "glasslike",
	tiles = {"mapgen_glowstone.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 14,
	groups = {cracky= 3, oddly_breakable_by_hand= 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Magic tree
local L = {name = "mapgen:magic_leaves"}
local M = {name = "mapgen:magic_leaves", prob = 223}
local T = {name = "mapgen:magic_trunk", force_place = true}

magic_tree = {size = {x = 10, y = 13, z = 10}, data = {
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,_,_,_,_,_,
_,_,_,_,L,M,_,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,M,_,_,_,_,_,_,_,
_,_,L,_,_,_,_,M,_,_,
_,_,L,_,L,_,_,L,_,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,
_,_,_,_,_,_,_,_,L,_,
_,_,L,_,_,_,_,L,L,_,
_,_,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,M,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,_,_,
_,L,_,_,T,L,_,_,_,_,
_,L,L,L,T,L,L,L,L,_,
_,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,M,
_,_,_,_,T,T,_,_,_,L,
_,_,_,L,L,L,T,_,L,L,
L,L,L,L,L,L,T,L,L,L,
_,L,L,L,L,L,T,L,L,_,
_,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,_,_,_,_,

_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,
M,_,_,_,T,T,_,_,_,M,
L,_,_,_,T,T,_,_,_,L,
L,L,_,T,L,L,L,_,_,L,
L,L,L,T,L,L,L,L,L,L,
_,L,L,T,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,_,_,_,_,
_,L,L,L,L,T,L,L,L,_,
_,L,L,L,L,T,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,M,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,M,_,
_,L,_,_,_,_,_,_,L,_,
_,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,
_,_,M,_,_,_,_,L,_,_,
_,_,L,_,_,L,_,L,_,_,
_,_,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,_,_,_,_,_,
_,_,_,_,L,M,_,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_}}

local function grow_magic_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	core.log("action", "A magic sapling grows into a tree at "..core.pos_to_string(pos))
	add_tree(pos, 4, 1, 4, magic_tree)
end

core.register_node("mapgen:magic_sapling", {
	description = "Magic Tree Sapling",
	drawtype = "plantlike",
	tiles = {"mapgen_magic_sapling.png"},
	inventory_image = "mapgen_magic_sapling.png",
	wield_image = "mapgen_magic_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_magic_tree,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .35, .3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"mapgen:magic_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 11, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 8,
})

core.register_node("mapgen:magic_trunk", {
	description = "Magic Tree Trunk",
	tiles = {"mapgen_magic_trunk_top.png", "mapgen_magic_trunk_top.png", "mapgen_magic_trunk.png"},
	paramtype = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("mapgen:magic_leaves", {
	description = "Magic Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"mapgen_magic_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("mapgen_magic_leaves.png"),
	wield_image = leaf_image("mapgen_magic_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 1, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:magic_sapling"}, rarity = 20},
			{items = {"mapgen:magic_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	output = "default:acacia_wood 4",
	recipe = {{"mapgen:magic_trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "mapgen:magic_trunk",
	burntime = 30,
})

core.register_lbm({
	name = "mapgen:convert_magic_saplings_to_node_timer",
	nodenames = {"mapgen:magic_sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"mapgen:magic_trunk"},
	leaves = {"mapgen:magic_leaves"},
	radius = 3,
})

if core.get_modpath("bonemeal") then
bonemeal:add_sapling({
	{"mapgen:magic_sapling", grow_magic_tree, "soil"}
})
end


core.register_node("mapgen:shield", {
	description = "Wall Shield",
	drawtype = "signlike",
	tiles = {"mapgen_swdshld.png"},
	inventory_image = "mapgen_swdshld.png",
	wield_image = "mapgen_swdshld.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1}
})

core.register_craft({
	output = "mapgen:shield 1",
	recipe = {
		{"default:steel_ingot", "mapgen:red_ore", "default:steel_ingot"},
		{"default:steel_ingot", "dye:blue", "default:steel_ingot"},
		{"", "default:sword_steel", ""}
	}
})

core.register_node("mapgen:pot", {
	description = "Pot",
	tiles = {"mapgen_vase_top.png", "mapgen_vase_base.png", "mapgen_vase.png"},
	drawtype = "nodebox",
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	paramtype = "light",
	groups = {dig_immediate=3, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.25, -.5, -.25, .25, -.4375, .25},
			{-.4375, -.4375, -.375, .4375, 0, .375},
			{-.375, -.4375, -.4375, .375, 0, .4375},
			{-.375, -.0625, -.3125, .375, .125, .3125},
			{-.3125, 0, -.375, .3125, .125, .375},
			{-.25, .125, -.25, .25, .25, -.125},
			{-.25, .125, .125, .25, .25, .25},
			{.125, .125, -.25, .25, .25, .25},
			{-.25, .125, -.25, -.125, .25, .25},
			{-.3125, .25, .25, .3125, .3125, .3125},
			{-.3125, .25, -.3125, .3125, .3125, -.25},
			{.25, .25, -.3125, .3125, .3125, .3125},
			{-.3125, .25, -.3125, -.25, .3125, .3125}
		}
	},
	on_destruct = function(pos)
		if math.random(3,5) == 5 then
		core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "mapgen:green_rupee")
		end
	if core.get_modpath("mobs_fairy") then
		if math.random(1,10) == 5 then
	core.add_entity(pos, "mobs_fairy:fairy")
		end
	end
		if core.get_modpath("aztec") and core.get_meta(pos):get_string("aztec_seeds") == "true" then
	core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "farming:seed_cotton ".. math.random(50,144))
	core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "farming:seed_quinoa ".. math.random(50,144))
local seeds = {{"farming:maize_yellow"}, {"aztec:seed_cotton_red"}, {"aztec:seed_cotton_orange"},
{"aztec:seed_cotton_yellow"}, {"aztec:seed_cotton_green"}, {"aztec:seed_cotton_cyan"}, {"aztec:seed_cotton_light_blue"},
{"aztec:seed_cotton_blue"}, {"aztec:seed_cotton_violet"}, {"aztec:seed_cotton_magenta"}, {"aztec:seed_cotton_pink"},
{"aztec:seed_cotton_dark_green"}, {"aztec:seed_cotton_brown"}, {"aztec:seed_cotton_black"}}
for _, n in ipairs(seeds) do
	if math.random(14) > 3 then
	core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, n[1].." ".. math.random(50,144))
	end
end
		end
	end,
})

core.register_node("mapgen:pot2", {
	description = "Blue Pot",
	tiles = {"mapgen_vase_top2.png", "mapgen_vase_base2.png", "mapgen_vase2.png"},
	drawtype = "nodebox",
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	paramtype = "light",
	groups = {dig_immediate=3, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.25, -.5, -.25, .25, -.4375, .25},
			{-.4375, -.4375, -.375, .4375, 0, .375},
			{-.375, -.4375, -.4375, .375, 0, .4375},
			{-.375, -.0625, -.3125, .375, .125, .3125},
			{-.3125, 0, -.375, .3125, .125, .375},
			{-.25, .125, -.25, .25, .25, -.125},
			{-.25, .125, .125, .25, .25, .25},
			{.125, .125, -.25, .25, .25, .25},
			{-.25, .125, -.25, -.125, .25, .25},
			{-.3125, .25, .25, .3125, .3125, .3125},
			{-.3125, .25, -.3125, .3125, .3125, -.25},
			{.25, .25, -.3125, .3125, .3125, .3125},
			{-.3125, .25, -.3125, -.25, .3125, .3125}
		}
	},
	on_destruct = function(pos)
		if math.random(3,5) == 5 then
		core.add_item({x=pos.x, y=pos.y+.5, z=pos.z}, "mapgen:green_rupee")
		end
	if core.get_modpath("mobs_fairy") then
		if math.random(1,10) == 5 then
	core.add_entity(pos, "mobs_fairy:fairy")
		end
	end
	end,
})

core.register_craft({
	output = "mapgen:pot 5",
	recipe = {
		{"default:clay_lump", "", "default:clay_lump"},
		{"default:clay_lump", "dye:brown", "default:clay_lump"},
		{"", "default:clay_lump", ""}
	}
})

core.register_craft({
	output = "mapgen:pot2 5",
	recipe = {
		{"default:clay_lump", "", "default:clay_lump"},
		{"default:clay_lump", "dye:cyan", "default:clay_lump"},
		{"", "default:clay_lump", ""}
	}
})

core.register_craftitem("mapgen:red_rupee", {
	description = "Red Rupee",
	inventory_image = "mapgen_red_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

core.register_craftitem("mapgen:green_rupee", {
	description = "Green Rupee",
	inventory_image = "mapgen_green_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

core.register_craftitem("mapgen:blue_rupee", {
	description = "Blue Rupee",
	inventory_image = "mapgen_blue_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

core.register_craftitem("mapgen:nyan_rupee", {
	description = "Nyan Rupee",
	inventory_image = "mapgen_nyan_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

core.register_craftitem("mapgen:red_ore", {
	description = "Red Ore",
	inventory_image = "mapgen_red_ore.png",
	stack_max = 1000,
})

core.register_craftitem("mapgen:blue_ore", {
	description = "Blue Ore",
	inventory_image = "mapgen_blue_ore.png",
	stack_max = 1000,
})

core.register_tool("mapgen:doompick", {
	description = "Doom Pickaxe",
	inventory_image = "mapgen_doompick.png",
	on_use = function(item, user, pointd)
		local used
		if pointd.type == "nothing" then return
		elseif pointd.type == "node" and pointd.under.y > -30912 then
	core.remove_node(pointd.under)
	used = true
		elseif pointd.type == "object" then
			if pointd.ref:is_player() then
	used = true
			else
local entity = pointd.ref:get_luaentity().name
if entity ~= "default:plasma" and entity ~= "__builtin:item" and entity ~= "__builtin:falling_node"
and entity ~= "mtools:block_dummy" and pointd.ref:get_hp() > 2 then
	used = true
end
			end
	pointd.ref:punch(user, .5, {
		full_punch_interval=.5,
		damage_groups={fleshy=1000},
	}, nil)
		end
		if not core.is_creative_enabled(user:get_player_name()) and used then
	item:add_wear(9)
--core.chat_send_all("Wear is "..item:get_wear())
	return item
		end
	end,
})

core.register_craft({
	output = "mapgen:doompick",
	recipe = {
		{"mapgen:ganon_sphere", "mapgen:ganon_sphere", "mapgen:ganon_sphere"},
		{"", "default:obsidian_shard", ""},
		{"", "default:obsidian_shard", ""}
	}
})

core.register_node("mapgen:fire", {
	description = "Magical Fire",
	drawtype = "plantlike",
	tiles = {{
		name = "mapgen_magic_fire.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.7},
	}},
	inventory_image = "mapgen_magic_fire_inv.png",
	wield_image = "mapgen_magic_fire_inv.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 14,
	damage_per_second = 2,
	groups = {dig_immediate = 3},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	}
})

core.register_node("mapgen:stand", {
	description = "Stand",
	drawtype = "nodebox",
	tiles = {"mapgen_stand.png", "mapgen_stand.png", "mapgen_stand_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky=3},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	on_construct = function(pos)
		core.get_meta(pos):set_string("stand_item", "empty")
	end,
	can_dig = function(pos)
		if core.get_meta(pos):get_string("stand_item") == "empty" then
			return true
		end
		return false
	end,
	on_rightclick = function(pos, node, clicker, item)
		local meta = core.get_meta(pos)
		local item_name
		if meta:get_string("stand_item") == "" then
			item_name = "mtools:sword"
		elseif meta:get_string("stand_item") ~= "empty" then
			item_name = meta:get_string("stand_item")
		elseif item:get_name() ~= "" then
			meta:set_string("stand_item", item:get_name())
			item:take_item()
			return item
		end
		core.add_item({x=pos.x, y=pos.y+.3, z=pos.z}, item_name)
		meta:set_string("stand_item", "empty")
	end,
	on_blast = function() end,
})

core.register_craft({
	output = "mapgen:stand",
	recipe = {
		{"", "", ""},
		{"gems:quartz_crystal", "gems:quartz_crystal", "gems:quartz_crystal"},
		{"gems:quartz_crystal", "gems:quartz_crystal", "gems:quartz_crystal"}
	}
})

core.register_craft({
	output = "gems:quartz_crystal 6",
	recipe = {{"mapgen:stand"}}
})

core.register_craftitem("mapgen:waterstone", {
	description = "Zora's Water stone",
	inventory_image = "mapgen_waterstone.png"
})

core.register_craftitem("mapgen:earthstone", {
	description = "Kokiri's Earth stone",
	inventory_image = "mapgen_earthstone.png"
})

core.register_craftitem("mapgen:firestone", {
	description = "Goron's Fire stone",
	inventory_image = "mapgen_firestone.png"
})

core.register_craftitem("mapgen:eye", {
	description = "Eye of Truth",
	inventory_image = "mapgen_truth_eye.png",
})

core.register_craft({
	output = "mapgen:eye",
	recipe = {
		{"mapgen:red_ore", "mapgen:red_ore", "mapgen:red_ore"},
		{"mapgen:blue_ore", "vessels:glass_fragments", "mapgen:blue_ore"},
		{"", "mapgen:blue_ore", ""}
	}
})

core.register_node("mapgen:dirt_with_grass_hole", {
	description = "Dirt with Grass (hole)",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png", tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = "default:dirt",
	walkable = false,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mapgen:eye" then
			core.set_node(pos, {name="mapgen:dirt_with_grass_invisible"})
		end
	end
})

core.register_node("mapgen:dirt_with_grass_invisible", {
	drawtype = "airlike",
	paramtype = "light",
	groups = {crumbly = 3, soil = 1},
	drop = "default:dirt",
	walkable = false,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "mapgen:eye" then
			core.set_node(pos, {name="mapgen:dirt_with_grass_hole"})
		end
	end
})

core.register_craft({
	output = "mapgen:dirt_with_grass_hole",
	recipe = {{"default:dirt", "default:grass_1"}}
})

-- tools
core.register_craftitem("mapgen:ice_shard", {
	description = "Ice Shard",
	inventory_image = "mapgen_ice_shard.png"
})

register_nine("default:ice", "mapgen:ice_shard")

core.register_tool("mapgen:ice_sword", {
	description = "Ice Sword",
	inventory_image = "mapgen_ice_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	}
})

core.register_tool("mapgen:ice_axe", {
	description = "Ice Axe",
	inventory_image = "mapgen_ice_axe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

core.register_craft({
	output = "mapgen:ice_sword",
	recipe = {
		{"mapgen:ice_shard"},
		{"mapgen:ice_shard"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "mapgen:ice_axe",
	recipe = {
		{"mapgen:ice_shard", "mapgen:ice_shard"},
		{"mapgen:ice_shard", "group:stick"},
		{"", "group:stick"}
	}
})

core.register_tool("mapgen:obsidian_sword", {
	description = "Obsidian Sword",
	inventory_image = "mapgen_obsidian_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=20, maxlevel=4},
		},
		damage_groups = {fleshy=5},
	}
})

core.register_craft({
	output = "mapgen:obsidian_sword",
	recipe = {
		{"default:obsidian_shard"},
		{"default:obsidian_shard"},
		{"group:stick"}
	}
})

core.register_tool("mapgen:obsidian_axe", {
	description = "Obsidian Axe",
	inventory_image = "mapgen_tool_obaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_craft({
	output = "mapgen:obsidian_axe",
	recipe = {
		{"default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "group:stick"},
		{"", "group:stick"}
	}
})

if core.get_modpath("habitents") and core.get_modpath("mtools") then
	dofile(path.. "/mapgen_trader_house.lua")
schem_spawn.register("mapgen:trader_house", "B", "Trader house", "4 (-2, 5) 4 (Centered)", 4, 2, mg_trader_house)
end
dofile(path.. "/mapgen_schems.lua")
schem_spawn.register("mapgen:pyramid_aztec", "B", "Aztec pyramid", "12 (13) 12 (Centered)", 12, 0, pyramid_aztec)
schem_spawn.register("mapgen:pyramid_egypt", "B", "Egyptian pyramid", "10 (12) 10 (Centered)", 10, 0, pyramid_egypt)

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then

--Makes a stratus of rocks
--name of the rock to generate
--wherein kind of node to replace, for example default:stone
--minp, maxp the corners of the map to be generated
--seed random seed
--stratus_chance inverse probability in a given radius 1:2, 1:3 etc
--radius horizontal radius of the stratus
--radius_y vertical radius of the stratus
--deep how deep can be from the ground
local function generate_stratus(name, wherein, ceilin, ceil, minp, maxp, seed, stratus_chance, radius, radius_y, deep, hy_min, hy_max)
	if maxp.y < hy_min or minp.y > hy_max then
		return
	end
	-- it will be only generate a stratus for every 100 m of area
	local stratus_per_volume=1
	local area=45
	local y_min = math.max(minp.y, hy_min)
	local y_max = math.min(maxp.y, hy_max)
	local volume = ((maxp.x-minp.x+1)/area)*((y_max-y_min+1)/area)*((maxp.z-minp.z+1)/area)
	local pr = PseudoRandom(seed)
	local blocks = math.floor(stratus_per_volume*volume)
	print(" <<"..dump(name)..">>");
	if blocks == 0 then
		blocks = 1
	end
	print("blocks: "..dump(blocks).." in vol: "..dump(volume).." ("..dump(maxp.x-minp.x+1)..","..dump(y_max-y_min+1)..","..dump(maxp.z-minp.z+1)..")")
	for i=1,blocks do
		local x = pr:next(1,stratus_chance)
		if x == 1 then
			-- TODO deep
			local y0=y_max-radius_y+1
			if y0 < y_min then
				y0=y_min
			else
				y0=pr:next(y_min, y0)
			end
			local x0 = maxp.x-radius+1
			if x0 < minp.x then
				x0 = minp.x
			else
				x0 = pr:next(minp.x, x0)
			end
			local z0 = maxp.z-radius+1
			if z0 < minp.z then
				x0 = minp.z
			else
				z0 = pr:next(minp.z, z0)
			end
			local p0 = {x=x0, y=y0, z=z0}
			local n = core.get_node(p0).name
			local i = 0
			--print("upper node "..n)
			x = 0
			for k, v in ipairs(ceilin) do
				if n == v then
					x = 1
					break
				end
			end
			if x == 1 then
				-- search for the node to replace
				--print("Searching nodes to replace from "..dump(y0-1).." to "..dump(y_min))
				for y1=y0-1,y_min,-1 do
					p0.y=y1
					n = core.get_node(p0).name
					x = 0
					for k, v in ipairs(wherein) do
						if n == v then
							x = 1
							break
						end
					end
					if x == 1 then
						y0=y1-deep
						if y0 < y_min then
							y0 = y_min
						end
						break
					end
				end
				local rx=pr:next(radius/2,radius)+1
				local rz=pr:next(radius/2,radius)+1
				local ry=pr:next(radius_y/2,radius_y)+1
				--print("area of generation ("..dump(rx)..","..dump(rz)..","..dump(ry)..")")
				for x1=0,rx do
					rz = rz + 3 - pr:next(1,6)
					if rz < 1 then 
						rz = 1
					end
					for z1=pr:next(1,3),rz do
						local ry0=ry+ pr:next(1,3)
						for y1=pr:next(1,3),ry0 do
							local x2 = x0+x1
							local y2 = y0+y1
							local z2 = z0+z1
							local p2 = {x=x2, y=y2, z=z2}
							n = core.get_node(p2).name
							x = 0
							for k, v in ipairs(wherein) do
								if n == v then
									x = 1
									break
								end
							end
							if x == 1 then
								if ceil == nil then
									core.set_node(p2, {name=name})
									i = i +1
								else
									local p3 = {p2.x,p2.y+1,p2}
									if core.get_node(p3).name == ceil then
										 core.set_node(p2, {name=name})
										 i = i +1
									end
								end
							end
						end
					end
				end
				print("generated "..dump(i).." blocks in ("..dump(x0)..","..dump(y0)..","..dump(z0)..")")
			end
		end
	end
end

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, hy_min, hy_max)
	if maxp.y < hy_min or minp.y > hy_max then
		return
	end
	local y_min = math.max(minp.y, hy_min)
	local y_max = math.min(maxp.y, hy_max)
	local volume = (maxp.x- minp.x +1)*(y_max -y_min +1)*(maxp.z -minp.z +1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks:"..dump(num_chunks))
	for i=1, num_chunks do
		local y0 = pr:next(y_min, y_max -chunk_size +1)
		if y0 >= hy_min and y0 <= hy_max then
			local x0 = pr:next(minp.x, maxp.x -chunk_size +1)
			local z0 = pr:next(minp.z, maxp.z -chunk_size +1)
			local p0 = {x= x0, y= y0, z= z0}
			for x1=0, chunk_size-1 do
			for y1=0, chunk_size-1 do
			for z1=0, chunk_size-1 do
				if pr:next(1, inverse_chance) == 1 then
					local x2 = x0+ x1
					local y2 = y0+ y1
					local z2 = z0+ z1
					local p2 = {x= x2, y= y2, z= z2}
					if core.get_node(p2).name == wherein then
						core.set_node(p2, {name= name})
					end
				end
			end
			end
			end
		end
	end
end

local BasicStones = "default:stone", "default:diamite", "default:bedrock"

core.register_on_generated(function(minp, maxp, seed)
	if maxp.y > -2000 and maxp.y < -90 then
local spot = core.find_nodes_in_area(minp, maxp, {"default:stone"})
for n = 1, #spot do
	if math.random(1, 75) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
		if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" and pos.y <= -100 then
			if math.random(1,6) == 1 and pos.y <= -500 then
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "mapgen:crystal", param2 = math.random(0,3)})
			elseif math.random(1,4) == 1 and pos.y <= -500 then
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "mapgen:crystal_small", param2 = math.random(0,3)})
			elseif math.random(1,2) == 1 then
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "mapgen:crystal_1", param2 = math.random(0,3)})
			elseif math.random(1,2) == 1 then
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "mapgen:crystal_2", param2 = math.random(0,3)})
			else
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "mapgen:crystal_3", param2 = math.random(0,3)})
			end
		end
	end
end
	end
	generate_ore("default:desert_stone_with_iron", "default:desert_stone", minp, maxp, seed, 1/7/7/7, 5, -15, 40)
	generate_stratus("mapgen:chalk", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+3, 4, 25, 7, 0, -200, 50)
	generate_stratus("mapgen:shale", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+4, 4, 23, 7, 50, -50, 20)
	generate_stratus("mapgen:slate", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+5, 6, 23, 5, 50, -500, 0)
	generate_stratus("mapgen:schist", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+6, 6, 19, 6, 50, -31000, -10)
	generate_stratus("default:basalt", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+7, 5, 20, 5, 20, -31000, -50)
	generate_stratus("default:white_marble", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+8, 4, 25, 6, 50, -31000, -75)
	generate_stratus("mapgen:serpentine", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+9, 4, 28, 8, 50, -31000, -350)
	generate_stratus("mapgen:gneiss", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+10, 4, 15, 5, 50, -31000, -250)
	generate_stratus("mapgen:granite_pink", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+11, 5, 24, 5, 40, -31000, -30)
	generate_stratus("mapgen:granite_black", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+12, 5, 24, 5, 40, -31000, -30)
	generate_stratus("mapgen:granite_brown", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+13, 5, 24, 5, 40, -31000, -30)
	generate_stratus("mapgen:limestone", 
		{BasicStones}, {"default:stone","air"}, nil, minp, maxp, seed+14, 6, 19, 6, 30, -31000, -10)
	generate_ore("mapgen:limestone_with_nodules", "mapgen:limestone", minp, maxp, seed + 485, 1 /21 /21 /21, 11, -16, 32)
end)

local sea_level = core.get_mapgen_setting("water_level")

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:glowore",
	wherein        = {BasicStones},
	clust_scarcity = 36 * 36 * 36,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = 31000,
	y_min          = sea_level,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:glowore",
	wherein        = {BasicStones},
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = sea_level + 20,
	y_min          = sea_level - 30,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:glowore",
	wherein        = {BasicStones},
	clust_scarcity = 36 * 36 * 36,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = sea_level - 1,
	y_min          = -31000,
})

core.register_ore({
	ore_type	= "scatter",
	ore			= "mapgen:dirt_with_nodules",
	wherein		= {"default:dirt"},
	clust_scarcity	= 19 * 19 * 19,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max		= 64,
	y_min		= -8,
})

core.register_ore({
	ore_type	= "scatter",
	ore			= "mapgen:sand_with_nodules",
	wherein		= {"default:sand"},
	clust_scarcity	= 17 * 17 * 17,
	clust_num_ores	= 8,
	clust_size		= 4,
	y_max		= 16,
	y_min		= -63,
})

core.register_ore({
	ore_type	= "scatter",
	ore			= "mapgen:gravel_with_nodules",
	wherein		= {"default:gravel"},
	clust_scarcity	= 16 * 16 * 16,
	clust_num_ores	= 8,
	clust_size		= 4,
	y_max		= 16,
	y_min		= -63,
})

core.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 16,
	fill_ratio = .00001,
	biomes = {"desert"},
	decoration = "mapgen:lunar_meteor",
})

local ocean_shores = {"icesheet_ocean", "tundra_ocean", "taiga_ocean", "snowy_grassland_ocean", "grassland_ocean", "coniferous_forest_ocean", "deciduous_forest_ocean",
	"deciduous_forest_shore", "desert_ocean", "sandstone_desert_ocean", "cold_desert_ocean", "savanna_ocean", "subtropical_forest_ocean", "rainforest_ocean"}

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 4,
	noise_params = {
		offset = 1.5,
		scale = 1.5,
		spread = {x = 48, y = 48, z = 48},
		seed = 329,
		octaves = 3,
		persist = 1.
	},
	biomes = ocean_shores,
	y_max = 1,
	y_min = -1,
	decoration = "mapgen:mud",
	place_offset_y = -1,
	flags = "force_placement",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand", "default:dirt"},
	sidelen = 4,
	noise_params = {
		offset = 0,
		scale = -1.5,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 2,
		persist = .6
	},
	biomes = ocean_shores,
	y_max = 0,
	y_min = -2,
	decoration = "default:silt",
	place_offset_y = -1,
	flags = "force_placement",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 64,
	fill_ratio = .00005,
	biomes = {"sandstone_desert"},
	y_max = 100,
	y_min = 1,
	decoration = "mapgen:pyramid_egypt",
	spawn_by = "default:sand",
	num_spawn_by = 8,
	param2 = 0,
	param2_max = 3,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 64,
	fill_ratio = .00005,
	biomes = {"rainforest"},
	y_max = 100,
	y_min = 1,
	decoration = "mapgen:pyramid_aztec",
	spawn_by = "default:dirt_with_rainforest_litter",
	num_spawn_by = 8,
	param2 = 0,
	param2_max = 3,
})

core.register_decoration({-- appears in ice caves
	deco_type = "simple",
	place_on = {"default:cave_ice"},
	sidelen = 16,
	noise_params = {
		offset = 0.008,
		scale = 0.06,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"icesheet"},
	y_max = 31000,
	y_min = -8,
	decoration = "mapgen:ice_spike",
	flags = "all_floors",
})

if core.get_modpath("ethereal") then
core.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:dry_dirt_with_fiery_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.006,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"fiery"},
	y_max = 31000,
	y_min = 5,
	decoration = "mapgen:obsidian_spike",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:dry_dirt_with_fiery_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0.004,
		scale = 0.016,
		spread = {x = 50, y = 50, z = 50},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"fiery"},
	y_max = 50,
	y_min = 0,
	decoration = "mapgen:geyser",
	place_offset_y = -1,
	flags = "force_placement",
})
end

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:permafrost_with_stones", "default:dirt_with_grass", "default:sand", "default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = 0.004,
		scale = 0.006,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"tundra", "deciduous_forest", "sandstone_desert", "desert"},
	decoration = "mapgen:rock",
	y_max = 40,
	y_min = 15,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:clay_dirt_with_savanna_grass", "default:dirt_with_grass", "default:snow_block", "default:dirt_with_swamp_grass"},
	sidelen = 200,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	y_max = 31000,
	y_min = 5,
	decoration = "mapgen:statue",
	param2 = 0,
	param2_max = 3,
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:clay_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0.01,
		scale = .0002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.06
	},
	biomes = {"savanna"},
	y_max = 31000,
	y_min = -14,
	schematic = magic_tree,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

if core.get_modpath("habitents") and core.get_modpath("mtools") then
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:clay_dirt_with_savanna_grass"},
	sidelen = 64,
	fill_ratio = .00005,
	biomes = {"savanna"},
	y_max = 100,
	y_min = 1,
	decoration = "mapgen:trader_house",
	spawn_by = "default:clay_dirt_with_savanna_grass",
	num_spawn_by = 8,
	param2 = 0,
	param2_max = 3,
})
end

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:adamantium_ore",
	wherein        = {BasicStones},
	clust_scarcity = 30 * 30 * 30,
	clust_num_ores = 12,
	clust_size     = 3,
	y_max          = 1025,
	y_min          = -1000,
})

core.register_ore({
	ore_type        = "stratum",
	ore             = "mapgen:salt_pink",
	wherein         = {BasicStones},
	clust_scarcity  = 1,
	y_max           = 156,
	y_min           = 147,
	biomes = {"mountain"},
})

core.register_ore({
	ore_type        = "stratum",
	ore             = "mapgen:salt",
	wherein         = {BasicStones},
	clust_scarcity  = 1,
	y_max           = 187,
	y_min           = 178,
	biomes = {"mountain"},
})

-- Fossils
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_ammonite",
	wherein        = {BasicStones},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = 31000,
	y_min          = 625,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_bone",
	wherein        = {BasicStones},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 8,
	clust_size     = 2,
	y_max          = 31000,
	y_min          = 625,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:glowstone",
	wherein        = {BasicStones},
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 2,
	clust_size     = 2,
	y_max          = -66,
	y_min          = -3113,
})

core.register_ore({
	ore_type        = "blob",
	ore             = "mapgen:oil_source",
	wherein         = {BasicStones},
	clust_scarcity  = 48 * 48 * 48,
	clust_size      = 7,
	y_max           = -3115,
	y_min           = -3500,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 8, y = 5, z = 8},
		seed = -316,
		octaves = 1,
		persist = 0.0
	},
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:subrosian_sand_with_red_ore",
	wherein        = "mapgen:subrosian_sand",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 3,
	y_max          = -1200,
	y_min          = -1400,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:subrosian_sand_with_blue_ore",
	wherein        = "mapgen:subrosian_sand",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 12,
	clust_size     = 3,
	y_max          = -1200,
	y_min          = -1400,
})

-- Rupees
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_redrupee",
	wherein        = {BasicStones},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = 30,
	y_min          = -115,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_redrupee",
	wherein        = {BasicStones},
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = -46,
	y_min          = -163,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_greenrupee",
	wherein        = {BasicStones},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = 2,
	y_min          = -15,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_greenrupee",
	wherein        = {BasicStones},
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = -16,
	y_min          = -63,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_bluerupee",
	wherein        = {BasicStones},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = 20,
	y_min          = -150,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:stone_with_bluerupee",
	wherein        = {BasicStones},
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = -26,
	y_min          = -630,
})
core.register_ore({
	ore_type        = "stratum",
	ore             = "mapgen:savanna_stone",
	wherein         = {BasicStones},
	clust_scarcity  = 1,
	y_max           = 46,
	y_min           = 10,
	noise_params    = {
		offset = 28,
		scale = 16,
		spread = {x = 128, y = 128, z = 128},
		seed = 90122,
		octaves = 1,
	},
	stratum_thickness = 4,
	biomes = {"savanna", "savanna_shore"}
})

core.register_ore({
	ore_type        = "stratum",
	ore             = "mapgen:savanna_stone",
	wherein         = {BasicStones},
	clust_scarcity  = 1,
	y_max           = 42,
	y_min           = 6,
	noise_params    = {
		offset = 24,
		scale = 16,
		spread = {x = 128, y = 128, z = 128},
		seed = 90122,
		octaves = 1,
	},
	stratum_thickness = 2,
	biomes = {"savanna", "savanna_shore"}
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:savanna_coal",
	wherein        = {"mapgen:savanna_stone", BasicStones},
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 12,
	clust_size     = 3,
	y_max          = 46,
	y_min          = 6,
	biomes = {"savanna", "savanna_shore"}
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mapgen:savanna_tin",
	wherein        = {"mapgen:savanna_stone", BasicStones},
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 3,
	y_max          = 46,
	y_min          = 6,
	biomes = {"savanna", "savanna_shore"}
})
end

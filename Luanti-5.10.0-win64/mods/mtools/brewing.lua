
local S = core.get_translator("mtools")

--Magic Ore/Gem/Crystal...

--  Magic Ore
core.register_node("mtools:magic_ore", {
	description = S("Magic Ore"),
	tiles = {"default_stone.png^magic_ore.png"},
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{tools = {"mtools:magic_pickaxe", "default:pick_mithril"}, items = {"mtools:magic_crystal 5", "default:rock 4"}, rarity = 9},
			{tools = {"mtools:magic_pickaxe", "default:pick_mithril"}, items = {"mtools:magic_crystal 4", "default:rock 5"}, rarity = 6},
			{tools = {"mtools:magic_pickaxe", "default:pick_mithril"}, items = {"mtools:magic_crystal 3", "default:rock 6"}, rarity = 3},
			{tools = {"mtools:magic_pickaxe", "default:pick_mithril"}, items = {"mtools:magic_crystal 2", "default:rock 7"}},
			{items = {"mtools:magic_crystal 3", "mtools:magic_crystal_piece", "default:rock 4"}, rarity = 9},
			{items = {"mtools:magic_crystal 2", "mtools:magic_crystal_piece", "default:rock 5"}, rarity = 6},
			{items = {"mtools:magic_crystal 2", "default:rock 6"}, rarity = 3},
			{items = {"mtools:magic_crystal", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_ore({
	ore_type = "scatter",
	ore = "mtools:magic_ore",
	wherein = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 5,
	clust_size = 5,
	y_max = -1000,
	y_min = -31000,
})

--  Magic Crystal
core.register_craftitem("mtools:magic_crystal", {
	description = S("Magic Crystal"),
	inventory_image = "magic_crystal_full.png",
})

core.register_craftitem("mtools:magic_crystal_piece", {
	description = S("Magic Crystal Piece"),
	inventory_image = "magic_crystal_piece.png",
})

core.register_craftitem("mtools:magic_crystal_dust", {
	description = S("Magic Crystal Dust"),
	inventory_image = "magic_crystal_dust.png"
})

-- Magic Block
core.register_node("mtools:magic_block", {
	description = S("Magic Block"),
	tiles = {"brewing_magic_block.png"},
	groups = {cracky = 1, level = 2},
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
})

--Crafting Magic

-- Magic Crystal Piece
core.register_craft({
	output = "mtools:magic_crystal_piece 3",
	recipe = {{"mtools:magic_crystal"}}
})

-- Magic Dust
core.register_craft({
	output = "mtools:magic_crystal_dust",
	recipe = {{"mtools:magic_crystal_piece"}}
})

-- Magic Block
register_nine("mtools:magic_block", "mtools:magic_crystal")

stairs.register_stair_and_slab(
	"magic_block",
	"mtools:magic_block",
	{cracky = 1, level = 2},
	{"brewing_magic_block.png"},
	S("Stair Magic Block"),
	S("Slab Magic Block"),
	default.node_sound_glass_defaults()
)

--Magic Cross
core.register_craftitem("mtools:magic_cross", {
	description = S("Magic Cross"),
	inventory_image = "magic_cross.png"
})

core.register_craft({
	output = "mtools:magic_cross",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "mtools:magic_crystal", "default:gold_ingot"},
		{"", "default:gold_ingot", ""}
	}
})

--Magic Heart
core.register_craftitem("mtools:magic_heart", {
	description = S("Magic Heart"),
	inventory_image = "brewing_magic_heart.png"
})

core.register_craft({
	output = "mtools:magic_heart",
	recipe = {
		{"mtools:magic_crystal_piece", "default:gold_ingot", "mtools:magic_crystal_piece"},
		{"mtools:magic_crystal_piece", "mtools:magic_crystal_piece", "mtools:magic_crystal_piece"},
		{"", "mtools:magic_crystal_piece", ""}
	}
})

--Magic Apple

core.register_node("mtools:magic_apple", {
	description = S("Magic Apple"),
	drawtype = "plantlike",
	tiles = {"magic_apple.png"},
	inventory_image = "magic_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -7/16, -.2, .2, .2, .2}
	},
	groups = {fleshy = 3, dig_immediate = 3},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
	sounds = default.node_sound_leaves_defaults(),
	sound = {eat = "eat_crunchy_juicy"}
})

core.register_craft({
	output = "mtools:magic_apple",
	recipe = {
		{"mtools:magic_crystal_piece", "mtools:magic_crystal_piece", "mtools:magic_crystal_piece"},
		{"mtools:magic_crystal_piece", "default:apple", "mtools:magic_crystal_piece"},
		{"mtools:magic_crystal_piece", "mtools:magic_crystal_piece", "mtools:magic_crystal_piece"}
	}
})

-- Blue Tear Crystal

core.register_craftitem("mtools:blue_tear_crystal", {
	description = S("Blue Tear Crystal"),
	inventory_image = "mtools_blue_tear_crystal.png",
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 5. then return end
		self.ctimer = 0

		if self.node_inside and self.node_inside.name ~= "default:fern_1"
		and self.node_inside.name ~= "default:fern_2" and self.node_inside.name ~= "default:fern_3" then
			return
		end

		local objs = core.get_objects_inside_radius(pos, .8)

		if not objs or #objs ~= 2 then return end

		local tear, mese, ent = nil, nil, nil

		for k, obj in pairs(objs) do

			ent = obj:get_luaentity()

			if ent and ent.name == "__builtin:item" then

				if ent.itemstring == "default:mese_crystal_fragment" and not mese then

					mese = obj

				elseif ent.itemstring == "mtools:blue_tear_crystal" and not tear then

					tear = obj
				end
			end
		end

		if mese and tear then

			mese:remove()
			tear:remove()
core.remove_node(pos)
core.add_particle({
	pos = pos,
	acceleration = {x=math.random(-.5,.5), y=4, z=math.random(-.5,.5)},
	expirationtime = math.random(.5,1),
	size = math.random(8,10),
	texture = "mtools_powder3.png",
	glow = 9 })

			core.add_item(pos, "mtools:blue_tear_crystal_finder")

			return false
		end
	end
})

core.register_craft({
	output = "mtools:blue_tear_crystal",
	recipe = {
		{"ecology:arctic_carrot_leaves"},
		{"gems:quartz_crystal_fragment"}
	}
})

-- Blue Tear Gem

core.register_craftitem("mtools:magic_blue_tear_gem", {
	description = S("Magic Blue Tear Gem"),
	inventory_image = "brewing_magic_blue_tear_gem.png",
})

core.register_craft({
	output = "mtools:magic_blue_tear_gem",
	recipe = {
		{"", "mtools:blue_tear_crystal", ""},
		{"mtools:blue_tear_crystal", "mtools:blue_tear_crystal", "mtools:blue_tear_crystal"},
		{"", "mtools:blue_tear_crystal", ""}
	}
})

-- Blue Star

core.register_craftitem("mtools:magic_blue_star", {
	description = S("Magic Blue Star"),
	inventory_image = "brewing_magic_blue_star.png",
})

core.register_craft({
	output = "mtools:magic_blue_star",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "mtools:magic_blue_tear_gem", ""},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

-- Laurel Leaves

core.register_craftitem("mtools:laurel_leaves", {
	description = S("Laurel Leaves"),
	inventory_image = "brewing_laurel_leaves.png",
})

core.register_craft({
	output = "mtools:laurel_leaves 5",
	recipe = {{"ecology:laurel"}}
})

-- Saffron

core.register_craftitem("mtools:saffron", {
	description = S("Saffron Bag"),
	inventory_image = "brewing_saffron.png",
})

core.register_craft({
	output = "mtools:saffron",
	recipe = {
		{"ecology:saffron_crocus"},
		{"default:paper"}
	}
})

core.register_craftitem("mtools:pearl", {
	description = S("Pearl"),
	inventory_image = "mtools_pearl.png",
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 5. then return end
		self.ctimer = 0

		if self.node_inside and self.node_inside.name ~= "mtools:pot_ggreen" then
			return
		end

if self.itemstring == "mtools:pearl" then
	self.object:remove()
	core.add_item(pos, "mtools:black_pearl")

		return false
end
	end
})

core.register_craft({
	output = "mtools:pearl",
	recipe = {{"ecology:pearl_oyster"}},
	replacements = {{"ecology:pearl_oyster", "ecology:pearl_oyster_empty"}}
})

core.register_craftitem("mtools:black_pearl", {
	description = S("Black Pearl"),
	inventory_image = "mtools_black_pearl.png",
})

--Magic Donut

core.register_craftitem("mtools:magic_donut", {
	description = S("Magic Donut"),
	inventory_image = "brewing_magic_donut.png",
	on_use = function (itemstack, user, pointd)	   	
		if core.get_modpath("chi") then
			chi.add_up_to(user, brewing.settings.chi_magic_donut)
		end
		return core.do_item_eat(brewing.settings.donut_eat_hp, nil, itemstack, user, pointd)
	end,
	groups = {flammable = 2, food = 3},
})

core.register_craftitem("mtools:magic_donut_dough", {
	description = S("Magic Donut Dough"),
	inventory_image = "brewing_magic_donut_dough.png",	
	on_use = core.item_eat(2),
	groups = {flammable = 2, food = 1},
})

core.register_craft({
	type = "cooking",
	output = "mtools:magic_donut",
	recipe = "mtools:magic_donut_dough",
	cooktime = 3,
})

core.register_craft({
	output = "mtools:magic_donut_dough",
	recipe = {
		{"farming:wheat_flour", "group:sugar", "mtools:magic_crystal_dust"},
		{"", "group:water_bucket", ""}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

--Lemonade

core.register_craftitem("mtools:lemonade", {
	description = S("Lemonade"),
	inventory_image = "brewing_lemonade.png",
	on_use = core.item_eat(4, "vessels:drinking_glass"),
	groups = {flammable = 2, food = 3},
})

core.register_craft({
	output = "mtools:lemonade",
	recipe = {
		{"", "farming:lemon", ""},
		{"", "group:sugar", ""},
		{"", "vessels:drinking_glass", ""}
	}
})

--Lemon Pie

core.register_craftitem("mtools:lemon_pie", {
	description = S("Lemon Pie"),
	inventory_image = "brewing_lemon_pie.png",
	on_use = core.item_eat(5),
	groups = {flammable = 2, food = 3},
})

core.register_craftitem("mtools:lemon_pie_dough", {
	description = S("Lemon Pie Dough"),
	inventory_image = "brewing_lemon_pie_dough.png",
	on_use = core.item_eat(5),
	groups = {flammable = 2, food = 3},
})

core.register_craft({
	type = "cooking",
	output = "mtools:lemon_pie",
	recipe = "mtools:lemon_pie_dough",
	cooktime = 3,
})

core.register_craft({
	output = "mtools:lemon_pie_dough",
	recipe = {
		{"group:sugar"},
		{"farming:wheat_flour"},
		{"mtools:lemonade"}
	}
})

--Fay Cake

core.register_craftitem("mtools:fay_cake", {
	description = S("Fay Cake"),
	inventory_image = "brewing_fay_cake.png",
	on_use = function (itemstack, user, pointd)
		if core.get_modpath("chi") then
			chi.add_up_to(user, brewing.settings.chi_fay_cake)
		end
		return core.do_item_eat(7, nil, itemstack, user, pointd)
	end,
	groups = {flammable = 2, food = 3},
})

core.register_craft({
	output = "mtools:fay_cake",
	recipe = {
		{"farming:lemon", "ecology:arctic_carrot", "group:sugar"},
		{"", "farming:wheat_flour", ""}
	}
})

--Nymph Salad

core.register_craftitem("mtools:nymph_salad", {
	description = S("Nymph Salad"),
	inventory_image = "brewing_nymph_salad.png",
	on_use = function (itemstack, user, pointd)
		if core.get_modpath("chi") then
			chi.add_up_to(user, brewing.settings.chi_nymph_salad)
		end
		return core.do_item_eat(8, nil, itemstack, user, pointd)
	end,	
	groups = {flammable = 2, food = 3},
})

core.register_craft({
	output = "mtools:nymph_salad",
	recipe = {
		{"flowers:mushroom_brown", "farming:lemon", "mtools:laurel_leaves"},
		{"", "vessels:clay_bowl", ""}
	}
})

-- Tools Registration

-- Magic Pickaxe
core.register_tool("mtools:magic_pickaxe", {
	description = S("Magic Pickaxe"),
	inventory_image = "magic_pickaxe.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.8, [2]=.9, [3]=.4}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:magic_pickaxe",
	recipe = {
		{"mtools:magic_crystal", "mtools:magic_crystal", "mtools:magic_crystal"},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

-- Magic Axe
core.register_tool("mtools:magic_axe", {
	description = S("Magic Axe"),
	inventory_image = "magic_axe.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	on_secondary_use = function(item, user)
		local inv = user:get_inventory()
		local leftpos = user:get_wield_index()-1
		local rightpos = user:get_wield_index()+1
		local leftitem = inv:get_stack("main", leftpos)
		local rightitem = inv:get_stack("main", rightpos)
	if core.get_item_group(leftitem:get_name(), "wood") > 0 and
		rightitem:get_name() == "mtools:magic_crystal_piece" then
	local pname = user:get_player_name()
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 5 then
		user:get_meta():set_int("_extra_energy", extra_energy - 5)
	elseif chi.subtract(pname, 5) then
	else
		user:set_hp(user:get_hp()-1)
	end
		end
	if not core.is_creative_enabled(pname) then
		inv:set_stack("main", leftpos, leftitem:get_name() .." ".. leftitem:get_count()-1)
		inv:set_stack("main", rightpos, rightitem:get_name() .." ".. rightitem:get_count()-1)
		item:add_wear(5)
	end
		local pos = user:get_pos()
		if inv:room_for_item("main", {name="mtools:pentagram"}) then
	inv:add_item("main", "mtools:pentagram")
		else
	core.add_item(pos, {name = "mtools:pentagram"})
		end
		if inv:room_for_item("main", {name="default:stick"}) then
	inv:add_item("main", "default:stick 3")
		else
	core.add_item(pos, ItemStack("default:stick 3"))
		end
	end
		return item
	end,
})

core.register_craft({
	output = "mtools:magic_axe",
	recipe = {
		{"mtools:magic_crystal", "mtools:magic_crystal", ""},
		{"mtools:magic_crystal", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

-- Magic Shovel
core.register_tool("mtools:magic_shovel", {
	description = S("Magic Shovel"),
	inventory_image = "magic_shovel.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=.90, [3]=.40}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:magic_shovel",
	recipe = {
		{"mtools:magic_crystal"},
		{"default:stick"},
		{"default:stick"}
	}
})

-- Magic Hoe
farming.register_hoe("mtools:magic_hoe", {
	description = S("Magic Hoe"),
	inventory_image = "magic_hoe.png",
	max_uses = 500,
	material = "mtools:magic_crystal_piece"
})

core.register_craft({
	output = "mtools:magic_hoe",
	recipe = {
		{"mtools:magic_crystal", "mtools:magic_crystal", ""},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

-- Magic Sword
core.register_tool("mtools:magic_sword", {
	description = S("Magic Sword"),
	inventory_image = "magic_sword.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.8, [2]=.8, [3]=.25}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:magic_sword",
	recipe = {
		{"mtools:magic_crystal"},
		{"mtools:magic_crystal"},
		{"default:stick"}
	}
})

-- Magic Sword
core.register_tool("mtools:fury_sun_sword", {
	description = S("Fury of Sun Sword"),
	inventory_image = "brewing_fury_sun_sword.png",
	tool_capabilities = {
		full_punch_interval = .4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.8, [2]=.8, [3]=.25}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:fury_sun_sword",
	recipe = {
		{"mtools:magic_crystal"},
		{"ecology:fire_flower"},
		{"default:sword_mese"}
	}
})

-- Magic Wand
core.register_craftitem("mtools:magic_wand", {
	description = S("Magic Wand"),
	inventory_image = "magic_wand.png",
	on_use = function(itemstack, user, pointd)
		if pointd.type == "nothing" then return end
		local pos = user:get_pos()
		core.add_particlespawner({
			amount = 12,
			time = 1,
			minpos = {x=pos.x-4, y=pos.y, z=pos.z-4},
			maxpos = {x=pos.x+4, y=pos.y+1, z=pos.z+4},
			minvel = {x=-.2, y=.2, z=-.2},
			maxvel = {x=.2, y=.3, z=.2},
			minacc = {x=-.2, y=.2, z=-.2},
			maxacc = {x=.2, y=.2, z=.2},
			exptime = 1,
			minsize = 1.2,
			maxsize = 1.5,
			collisiondetection = true,
			collision_removal = true,
			texture = "weather_pollen_"..math.random(1,2)..".png",
			glow = 5
		})
		pos.y = pos.y+.5

		local enemy_pos =  core.get_pointed_thing_position(pointd, true)

		core.add_particlespawner({
			amount = 5,
			time = 1,
			minpos = pos,
			maxpos = enemy_pos,
			minvel = {x=-1, y=.5, z=-1},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-1, y=.5, z=-1},
			maxacc = {x=1, y=1, z=1},
			exptime = 1,
			size = 1,
			texture = "brewing_magic_particle.png",
			glow = 9
		})
if pointd.type == "object" and pointd.ref:get_hp() > 0 then
	local xnlvl = tonumber(user:get_meta():get_int("_extra_energy"))
	pointd.ref:punch(user, 1., {
		full_punch_interval=1.,
		damage_groups={fleshy=xnlvl},
	}, nil) end
	if pointd.type == "node" and core.get_node(pointd.above).name == "air" then
		core.set_node(pointd.above, {name = "mtools:magic_apple"})
	end
		brewing.magic_sound("object", pointd, "brewing_magic_sound")
		if core.get_modpath("chi") then
			chi.subtract_up_to(user, brewing.settings.chi_magic_wand)
		end
	end,
	on_secondary_use = function(item, user)
		local ctrl = user:get_player_control()
		local name = user:get_player_name()
		local xnlvl = tonumber(user:get_meta():get_int("_extra_energy"))
if ctrl.sneak then	core.chat_send_player(name, "Extra energy at ".. xnlvl) return end
	local equal = false
	local pp = user:get_pos()
	pp.y = pp.y+.5
if xnlvl == 50 then
	core.add_item(pp, "vessels:glass_bottle")
	equal = true
end
if xnlvl == 100 then
	core.add_item(pp, "default:sword_steel")
	equal = true
end
if xnlvl == 150 then
	core.add_item(pp, "default:gold_block")
	equal = true
end
if xnlvl == 200 then
	core.add_item(pp, "default:ice 5")
	equal = true
end
if xnlvl == 250 then
	core.add_item(pp, "bucket:bucket_empty")
	equal = true
end
if xnlvl == 300 then
	core.add_item(pp, "mapgen:zols_lair_spawner")
	equal = true
end
if xnlvl == 350 or xnlvl == 400 or xnlvl == 450 then
	core.add_item(pp, "default:mese")
	equal = true
end
if core.get_modpath("mapgen") and core.get_modpath("ecology") and xnlvl == 500 or xnlvl == 800 then
	core.add_item(pp, "mapgen:puzzle_box_spawner")
	equal = true
end
if xnlvl == 650 or xnlvl == 900 then
	core.add_item(pp, "default:sword_mese")
	equal = true
end
if xnlvl == 1000 then
	core.add_item(pp, "mtools:crest")
	equal = true
end
if user:get_meta():get_string("_infinite_energy") ~= "true" and equal then
	if not core.is_creative_enabled(name) then
		user:get_meta():set_int("_extra_energy", 0)
	end
end
if equal then core.sound_play("level_up", {to_player = name}) end
	end,
})

core.register_craft({
	output = "mtools:magic_wand",
	recipe = {
		{"", "", "mtools:magic_crystal"},
		{"", "default:stick", ""},
		{"default:stick", "", ""}
	}
})

core.register_craft({
	output = "mtools:magic_crystal",
	recipe = {{"mtools:magic_wand"}},
	replacements = {{"mtools:magic_wand", "default:stick"}}
})

-- Blue Tear Crystal Finder

core.register_tool("mtools:blue_tear_crystal_finder", {
	description = S("Blue Tear Crystal Node Finder"),
	inventory_image = "mtools_blue_tear_crystal_finder.png",
	on_use = function(item, user)
	local name = user:get_player_name()
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 2 then
		user:get_meta():set_int("_extra_energy", extra_energy - 2)
	elseif chi.subtract(name, 2) then
	else
		user:set_hp(user:get_hp()-1)
	end
		end
	local sname = item:get_meta():get_string("seeks")
	local pos = user:get_pos()
	if sname == "bring_items" then
for _,obj in ipairs(core.get_objects_inside_radius(pos, 31)) do
	if not obj:is_player() and obj:get_hp() > 0 and obj:get_luaentity()
		and (obj:get_luaentity().name == "__builtin:item" or obj:get_luaentity().name == "extra_energy:orb") then
		obj:move_to({x=pos.x, y=pos.y +1, z=pos.z})
		obj:set_velocity({x=0, y=0, z=0})
		obj:get_luaentity().age = 0
	end
end
		return
	end
	local idef=core.registered_nodes[sname]
	if not idef then
core.chat_send_player(name, "It can't look for an undefined or unknown node!")
		return
	end
	local pp = user:get_pos()
	pp.y = pp.y+1.5
for _, o in pairs(core.find_nodes_in_area(vector.subtract(pos, 15), vector.add(pos, 15), sname)) do
core.add_particlespawner({
	amount = 3,
	time = .5,
	minpos = vector.subtract(o, .4),
	maxpos = vector.add(o, .4),
	minvel = {x=pp.x-o.x, y=pp.y-o.y, z=pp.z-o.z},
	maxvel = {x=pp.x-o.x, y=pp.y-o.y, z=pp.z-o.z},
	exptime = {min = .6, max = 1},
	minsize = 3,
	maxsize = 4,
	texture = "mtools_star.png",
	glow = 9,
	playername = name })
end
	end,
	on_secondary_use = function(item, user)
		local sname = item:get_meta():get_string("seeks")
		core.show_formspec(user:get_player_name(), "looks_for", "size[5.5,2.5]field[.5,.5;5,1;name;Enter a node name to look for;"..sname.."]button_exit[1,1.5;3.5,1;ok;OK]")
	end,
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user, item, pointd)
			end
		end

		local sname = item:get_meta():get_string("seeks")
		core.show_formspec(user:get_player_name(), "looks_for", "size[5.5,2.5]field[.5,.5;5,1;name;Enter a node name to look for;"..sname.."]button_exit[1,1.5;3.5,1;ok;OK]")
	end
})

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname=="looks_for" and fields.name and fields.ok then
		local pname=player:get_player_name()
		local stack=player:get_wielded_item()
		local meta=stack:get_meta()

if not meta then
	core.chat_send_player(pname, "For some reason, the metadata couldn't be acquired. Try again!")
	return
end

		meta:set_string("seeks", fields.name)
		--write back
		player:set_wielded_item(stack)
	end
end)

core.register_craft({
	output = "mtools:blue_tear_crystal_finder",
	recipe = {
		{"default:fern_1"},
		{"mtools:blue_tear_crystal"},
		{"default:mese_crystal_fragment"}
	}
})

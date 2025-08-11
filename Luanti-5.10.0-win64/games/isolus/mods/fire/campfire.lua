
campfire = {}

campfire.cooking = 1        -- nil - not cooked, 1 - cooked
campfire.limited = 1        -- nil - unlimited campfire, 1 - limited
campfire.flames_ttl = 30    -- Time in seconds until a fire burns down into embers
campfire.embers_ttl = 60    -- seconds until embers burn out completely leaving ash and an empty fireplace.
campfire.flare_up = 2       -- seconds from adding a stick to embers before it flares into a fire again
campfire.stick_time = campfire.flames_ttl/2;   -- How long does the stick increase. In sec.

-- Load support for MT game translation.
local S = core.get_translator("fire")

local function fire_particles_on(pos) -- 3 layers of fire
	local meta = core.get_meta(pos)
	local id = core.add_particlespawner({ -- 1 layer big particles fire
		amount = 9,
		time = 1.3,
		minpos = {x = pos.x - .2, y = pos.y - .4, z = pos.z - .2},
		maxpos = {x = pos.x + .2, y = pos.y - .1, z = pos.z + .2},
		minvel = {x= 0, y= 0, z= 0},
		maxvel = {x= 0, y= .1, z= 0},
		minacc = {x= 0, y= 0, z= 0},
		maxacc = {x= 0, y= .7, z= 0},
		exptime = {min = .5, max = .7},
		minsize = 2,
		maxsize = 5,
		vertical = true,
		texture = "campfire_anim_fire.png",
		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = .8},
	})
	meta:set_int("layer_1", id)

	local id = core.add_particlespawner({ -- 2 layer small particles fire
		amount = 1,
		time = 1.3,
		minpos = {x = pos.x - .1, y = pos.y - .05, z = pos.z - .1},
		maxpos = {x = pos.x + .1, y = pos.y + .2, z = pos.z + .1},
		minvel = {x= 0, y= .25, z= 0},
		maxvel = {x= 0, y= .75, z= 0},
		minacc = {x= 0, y= 0, z= 0},
		maxacc = {x= 0, y= .025, z= 0},
		exptime = {min = .4, max = .6},
		minsize = .5,
		maxsize = .7,
		vertical = true,
		texture = "campfire_anim_fire.png",
		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = .7},
	})
	meta:set_int("layer_2", id)

	local id = core.add_particlespawner({ -- 3 layer smoke
		amount = 1,
		time = 1.3,
		minpos = {x = pos.x - .1, y = pos.y - .2, z = pos.z - .1},
		maxpos = {x = pos.x + .2, y = pos.y + .4, z = pos.z + .2},
		minvel = {x= 0, y= 0, z= 0},
		maxvel = {x= 0, y= .1, z= 0},
		minacc = {x= 0, y= 0, z= 0},
		maxacc = {x= 0, y= 1, z= 0},
		exptime = {min = .6, max = .8},
		minsize = 2,
		maxsize = 4,
		collisiondetection = true,
		vertical = true,
		texture = "campfire_anim_smoke.png",
		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = .9},
	})
	meta:set_int("layer_3", id)
end

local function fire_particles_off(pos)
	local meta = core.get_meta(pos)
	local id_1 = meta:get_int("layer_1");
	local id_2 = meta:get_int("layer_2");
	local id_3 = meta:get_int("layer_3");
	core.delete_particlespawner(id_1)
	core.delete_particlespawner(id_2)
	core.delete_particlespawner(id_3)
end

-- we do this to determine the number of bytes each block symbol takes in the
-- user's current encoding (they're 3-byte UTF8 on my box, but that may not be
-- the case elsewhere)

local utf8_len_1=string.find("▓X", "X")-1
local utf8_len_2=string.find("▒X", "X")-1

local function indicator(maxVal, curVal)
	local percent_val = math.floor(curVal / maxVal * 100)
	local v = math.min(math.ceil(percent_val / 10), 10)

	return "\n"
	       ..string.sub("▓▓▓▓▓▓▓▓▓▓", 1, v*utf8_len_1)
	       ..string.sub("▒▒▒▒▒▒▒▒▒▒", 1, (10-v)*utf8_len_2)
	       .." "..percent_val.."%"
end

local function effect(pos, texture, vlc, acc, time, size)
	core.add_particle({
		pos = pos,
		velocity = vlc,
		acceleration = acc,
		expirationtime = time,
		size = size,
		collisiondetection = true,
		vertical = true,
		texture = texture,
	})
end

local function infotext_edit(meta)
	local infotext = S("Active campfire")

	if campfire.limited and campfire.flames_ttl > 0 then
		local it_val = meta:get_int("it_val");
		infotext = infotext..indicator(campfire.flames_ttl, it_val)
	end

	local cooked_time = meta:get_int("cooked_time");
	if campfire.cooking and cooked_time ~= 0 then
		local cooked_cur_time = meta:get_int("cooked_cur_time");
		infotext = infotext.."\n"..S("Cooking")..indicator(cooked_time, cooked_cur_time)
	end

	meta:set_string("infotext", infotext)
end

local function cooking(pos, itemstack, pname)
	local meta = core.get_meta(pos)
	local cooked, _ = core.get_craft_result({method = "cooking", width = 1, items = {itemstack}})
	local cookable = cooked.time ~= 0

	if cookable and campfire.cooking then
		local eat_y = ItemStack(cooked.item:to_table().name):get_definition().on_use
		if string.find(core.serialize(eat_y), "do_item_eat") and meta:get_int("cooked_time") == 0 then
			meta:set_int("cooked_time", cooked.time);
			meta:set_int("cooked_cur_time", 0);
			local name = itemstack:get_name()
			local texture = itemstack:get_definition().inventory_image

			infotext_edit(meta)

	effect({x = pos.x, y = pos.y+0.2, z = pos.z}, texture, {x=0, y=0, z=0}, {x=0, y=0, z=0}, cooked.time, 4)

			core.after(cooked.time/2, function()
				if meta:get_int("it_val") > 0 then

					local item = cooked.item:to_table().name
					core.after(cooked.time/2, function(item)
						if meta:get_int("it_val") > 0 then
							core.add_item({x=pos.x, y=pos.y+0.2, z=pos.z}, item)
							meta:set_int("cooked_time", 0);
							meta:set_int("cooked_cur_time", 0);
						else
							core.add_item({x=pos.x, y=pos.y+0.2, z=pos.z}, name)
						end
					end, item)
				else
					core.add_item({x=pos.x, y=pos.y+0.2, z=pos.z}, name)
				end
			end)

			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
				return itemstack
			end
		end
	end
end

local function add_stick(pos, itemstack, pname)
	local meta = core.get_meta(pos)
	local name = itemstack:get_name()
	if itemstack:get_definition().groups.stick == 1 then
		local it_val = meta:get_int("it_val") + (campfire.flames_ttl);
		meta:set_int("it_val", it_val);
	effect(pos, "default_stick.png", {x=0, y=-1, z=0}, {x=0, y=0, z=0}, 1, 6)
		infotext_edit(meta)
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
			return itemstack
		end
		return true
	end
end

core.register_craftitem("fire:grille", {
	description = S("Metal Grille"),
	inventory_image = "campfire_grille.png"
})

core.register_craftitem("fire:ash", {
	description = S("Ash"),
	inventory_image = "campfire_ash.png"
})

local function burn_out(pos, node)
	if string.find(node.name, "embers") then
		core.set_node(pos, {name = string.gsub(node.name, "_with_embers", "")})
		core.add_item(pos, "fire:ash")
	else
		fire_particles_off(pos)
		core.set_node(pos, {name = string.gsub(node.name, "campfire_active", "fireplace_with_embers")})
	end
end

local sbox = {
	type = "fixed",
	fixed = {-8/16, -8/16, -8/16, 8/16, -6/16, 8/16},
}

local grille_sbox = {
	type = "fixed",
	fixed = {-8/16, -8/16, -8/16, 8/16, 2/16, 8/16},
}

local grille_cbox = {
	type = "fixed",
	fixed = {
		{-8/16, 1/16, -8/16, 8/16, 2/16, 8/16},
		{-8/16, -8/16, -8/16, -7/16, 1/16, -7/16},
		{8/16, -8/16, 8/16, 7/16, 1/16, 7/16},
		{8/16, -8/16, -8/16, 7/16, 1/16, -7/16},
		{-8/16, -8/16, 8/16, -7/16, 1/16, 7/16}
	}
}

core.register_node("fire:fireplace", {
	description = S("Fireplace (Unused?)"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "blank.png", "blank.png", "blank.png"},
	use_texture_alpha = "clip",
	walkable = false,
	buildable_to = false,
	sunlight_propagates = false,
	paramtype = "light",
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	selection_box = sbox,
	sounds = default.node_sound_stone_defaults(),
	drop = "default:rock 5",
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if a then
			core.set_node(pos, {name = "fire:campfire"})
		elseif name == "fire:grille" then
			itemstack:take_item()
			core.swap_node(pos, {name = "fire:fireplace_with_grille"})
		end
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", S("Fireplace"));
		meta:set_int("it_val", 0)
		meta:set_int("em_val", 0)
	end,
})

core.register_node("fire:campfire", {
	description = S("Campfire"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "default_wood.png", "blank.png", "blank.png"},
	inventory_image = "campfire_campfire.png",
	use_texture_alpha = "clip",
	walkable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = {dig_immediate=3},
	paramtype = "light",
	selection_box = sbox,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", 0)
		meta:set_int("em_val", 0)
		meta:set_string("infotext", S("Campfire"));
	end,
	on_rightclick = function(pos, node, player, itemstack, pointd)
		local itemname = itemstack:get_name()
		if itemname == "fire:flint_and_steel" then
			core.sound_play("fire_flint_and_steel",{pos = pos, gain = 0.5, max_hear_distance = 8})
			core.set_node(pos, {name = "fire:campfire_active"})
			core.add_particle({
				pos = {x = pos.x, y = pos.y, z = pos.z},
				velocity = {x=0, y=0.1, z=0},
				acceleration = {x=0, y=0, z=0},
				expirationtime = 2,
				size = 4,
				collisiondetection = true,
				vertical = true,
				texture = "campfire_anim_smoke.png",
				animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = 2.5},
			})
		elseif itemname == "fire:grille" then
			itemstack:take_item()
			core.swap_node(pos, {name = "fire:campfire_with_grille"})
		end
	end,
})

core.register_node("fire:campfire_active", {
	description = S("Active campfire"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "campfire_wood.png", "blank.png", "blank.png"},
	inventory_image = "campfire_campfire.png",
	use_texture_alpha = "clip",
	walkable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = {oddly_breakable_by_hand=3, igniter=1, not_in_creative_inventory=1},
	paramtype = "light",
	light_source = 13,
	damage_per_second = 3,
	drop = "fire:campfire",
	sounds = default.node_sound_stone_defaults(),
	selection_box = sbox,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if not a then
			if name == "fire:grille" then
				itemstack:take_item()
				core.swap_node(pos, {name = "fire:campfire_active_with_grille"})
			end
		end
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", campfire.flames_ttl)
		meta:set_int("em_val", 0)
		infotext_edit(meta)
		core.get_node_timer(pos):start(2)
	end,
	on_destruct = function(pos, oldnode, oldmetadata, digger)
		fire_particles_off(pos)
		local meta = core.get_meta(pos)
		local handle = meta:get_int("handle")
		core.sound_stop(handle)
	end,
	on_timer = function(pos) -- Every 6 seconds play sound fire_small
		local meta = core.get_meta(pos)
		local handle = core.sound_play("fire_small",{pos=pos, max_hear_distance = 18, loop=false, gain=0.1})
		meta:set_int("handle", handle)
		core.get_node_timer(pos):start(6)
	end,
})

core.register_node("fire:fireplace_with_embers", {
	description = S("Fireplace with embers"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "blank.png", "blank.png", {
		name = "campfire_anim_embers.png",
		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	walkable = false,
	buildable_to = false,
	sunlight_propagates = false,
	light_source = 5,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	selection_box = sbox,
	sounds = default.node_sound_stone_defaults(),
	drop = "default:rock 5",
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if a then
			core.swap_node(pos, {name = "fire:campfire"})
			core.after(campfire.flare_up, function()
				if core.get_meta(pos):get_int("it_val") > 0 then
					core.swap_node(pos, {name="fire:campfire_active"})
					core.get_node_timer(pos):start(1)
				end
			end)
		elseif name == "fire:grille" then
			itemstack:take_item()
			core.swap_node(pos, {name = "fire:fireplace_with_embers_with_grille"})
		end
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", 0)
		meta:set_int("em_val", campfire.embers_ttl)
		meta:set_string("infotext", S("Fireplace with embers"));
	end,
})

core.register_node("fire:fireplace_with_embers_with_grille", {
	description = S("Fireplace with embers and grille"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "blank.png", "default_steel_block.png", {
		name = "campfire_anim_embers.png",
		animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = false,
	sunlight_propagates = false,
	light_source = 5,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	selection_box = grille_sbox,
	node_box = grille_cbox,
	sounds = default.node_sound_metal_defaults(),
	drop = {
		items = {
			{items = {"default:rock 5", "fire:grille"}}
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if a then
			core.swap_node(pos, {name = "fire:campfire_with_grille"})
			core.after(campfire.flare_up, function()
				if core.get_meta(pos):get_int("it_val") > 0 then
					core.swap_node(pos, {name="fire:campfire_active_with_grille"})
					core.get_node_timer(pos):start(1)
				end
			end)
		end
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", 0)
		meta:set_int("em_val", campfire.embers_ttl)
		meta:set_string("infotext", S("Fireplace with embers"));
	end,
})

core.register_node("fire:fireplace_with_grille", {
	description = S("Fireplace with grille"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "blank.png", "default_steel_block.png", "blank.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = false,
	sunlight_propagates = false,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	selection_box = grille_sbox,
	node_box = grille_cbox,
	sounds = default.node_sound_metal_defaults(),
	drop = {
		items = {
			{items = {"default:rock 5", "fire:grille"}}
		}
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", 0)
		meta:set_int("em_val", 0)
		meta:set_string("infotext", S("Fireplace"));
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if a then
			core.set_node(pos, {name = "fire:campfire_with_grille"})
		end
	end,
})

core.register_node("fire:campfire_with_grille", {
	description = S("Campfire with grille"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "default_wood.png", "default_steel_block.png", "blank.png"},
	inventory_image = "campfire_campfire.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = false,
	sunlight_propagates = true,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	selection_box = grille_sbox,
	node_box = grille_cbox,
	drop = {
		items = {
			{items = {"fire:campfire", "fire:grille"}}
		}
	},
	sounds = default.node_sound_metal_defaults(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", 0)
		meta:set_int("em_val", 0)
		meta:set_string("infotext", S("Campfire"));
	end,
	on_rightclick = function(pos, node, player, itemstack, pointd)
		if itemstack:get_name() == "fire:flint_and_steel" then
			core.sound_play("fire_flint_and_steel",{pos = pos, gain = 0.5, max_hear_distance = 8})
			core.set_node(pos, {name = "fire:campfire_active_with_grille"})
			core.add_particle({
				pos = {x = pos.x, y = pos.y, z = pos.z},
				velocity = {x=0, y=0.1, z=0},
				acceleration = {x=0, y=0, z=0},
				expirationtime = 2,
				size = 4,
				collisiondetection = true,
				vertical = true,
				texture = "campfire_anim_smoke.png",
				animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length = 2.5},
			})
		end
	end,
})

core.register_node("fire:campfire_active_with_grille", {
	description = S("Active campfire with grille"),
	drawtype = "mesh",
	mesh = "contained_campfire.obj",
	tiles = {"default_stone.png", "campfire_wood.png", "default_steel_block.png", "blank.png"},
	inventory_image = "campfire_campfire.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 13,
	buildable_to = false,
	sunlight_propagates = true,
	groups = {oddly_breakable_by_hand=3, igniter=1, not_in_creative_inventory=1},
	damage_per_second = 3,
	drop = {
		items = {
			{items = {"fire:campfire", "fire:grille"}}
		}
	},
	sounds = default.node_sound_metal_defaults(),
	selection_box = grille_sbox,
	node_box = grille_cbox,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local name = itemstack:get_name()
		local pname = clicker:get_player_name()
		local a = add_stick(pos, itemstack, pname)
		if not a then
			cooking(pos, itemstack, pname)
		end
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_int("it_val", campfire.flames_ttl)
		meta:set_int("em_val", 0)
		infotext_edit(meta)
		core.get_node_timer(pos):start(2)
	end,
	on_destruct = function(pos, oldnode, oldmetadata, digger)
		fire_particles_off(pos)
		local meta = core.get_meta(pos)
		local handle = meta:get_int("handle")
		core.sound_stop(handle)
	end,
	on_timer = function(pos) -- Every 6 seconds play sound fire_small
		local meta = core.get_meta(pos)
		local handle = core.sound_play("fire_small",{pos=pos, max_hear_distance = 18, loop=false, gain=0.1})
		meta:set_int("handle", handle)
		core.get_node_timer(pos):start(6)
	end,
})

core.register_abm({
	nodenames = {"fire:campfire_active", "fire:campfire_active_with_grille",
		"fire:fireplace_with_embers", "fire:fireplace_with_embers_with_grille"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos, node)
		if node.name == "fire:campfire_active" or node.name == "fire:campfire_active_with_grille" then
			local fpos, num = core.find_nodes_in_area(
				{x=pos.x-1, y=pos.y, z=pos.z-1},
				{x=pos.x+1, y=pos.y+1, z=pos.z+1},
				{"group:water"}
			)
			if #fpos > 0 then
				if string.find(node.name, "embers") then
					burn_out(pos, node)
				else
					core.set_node(pos, {name = string.gsub(node.name, "_active", "")})
				end
				core.sound_play("fire_extinguish_flame",{pos = pos, max_hear_distance = 16, gain = 0.15})
			else
				local meta = core.get_meta(pos)
				local it_val = meta:get_int("it_val") - 1;

				if campfire.limited and campfire.flames_ttl > 0 then
					if it_val <= 0 then
						burn_out(pos, node)
						return
					end
					meta:set_int("it_val", it_val);
				end

				if campfire.cooking then
					if meta:get_int("cooked_cur_time") <= meta:get_int("cooked_time") then
						meta:set_int("cooked_cur_time", meta:get_int("cooked_cur_time") + 1);
					else
						meta:set_int("cooked_time", 0);
						meta:set_int("cooked_cur_time", 0);
					end
				end
				infotext_edit(meta)
				fire_particles_on(pos)
			end
		elseif node.name == "fire:fireplace_with_embers" or node.name == "fire:fireplace_with_embers_with_grille" then
			local meta = core.get_meta(pos)
			local em_val = meta:get_int("em_val")
			meta:set_int("em_val", em_val - 1)
			if em_val <= 0 then
				burn_out(pos, node)
			end
		end
	end
})

core.register_craft({
    output = "fire:grille",
	recipe = {
		{"default:steel_bar", "", "default:steel_bar"},
		{"", "basic_materials:steel_wire", ""},
		{"default:steel_bar", "", "default:steel_bar"}
	},
	replacements = {{"basic_materials:steel_wire", "basic_materials:empty_spool"}}
})

core.register_craft({
	output = "fire:campfire",
	recipe = {
		{"", "group:stick", ""},
		{"group:rock","group:stick", "group:rock"},
		{"group:rock", "group:rock", "group:rock"}
	}
})

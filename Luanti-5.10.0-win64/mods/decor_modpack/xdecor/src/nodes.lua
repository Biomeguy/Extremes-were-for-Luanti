screwdriver = screwdriver or {}
local S = core.get_translator("xdecor")
local ALPHA_CLIP = core.features.use_texture_alpha_string_modes and "clip" or true
local ALPHA_OPAQUE = core.features.use_texture_alpha_string_modes and "opaque" or false

local function register_pane(name, desc, def)
	xpanes.register_pane(name, {
		description = desc,
		tiles = {"xdecor_" .. name .. ".png"},
		drawtype = "airlike",
		paramtype = "light",
		textures = def.textures or {"xdecor_" .. name .. ".png", "" ,"xdecor_" .. name .. ".png"},
		inventory_image = "xdecor_" .. name .. ".png",
		wield_image = "xdecor_" .. name .. ".png",
		groups = def.groups,
		sounds = def.sounds or default.node_sound_defaults(),
		recipe = def.recipe
	})
end

register_pane("bamboo_frame", S("Bamboo Frame"), {
	groups = {choppy = 3, oddly_breakable_by_hand = 2, pane = 1, flammable = 2},
	recipe = {
		{"ecology:bamboo_small", "ecology:bamboo_small", "ecology:bamboo_small"},
		{"ecology:bamboo_small", "fabric:string", "ecology:bamboo_small"},
		{"ecology:bamboo_small", "ecology:bamboo_small", "ecology:bamboo_small"}
	},
	sounds = default.node_sound_wood_defaults(),
})

register_pane("chainlink", S("Chainlink"), {
	groups = {cracky = 3, oddly_breakable_by_hand = 2, pane = 1},
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

register_pane("rusty_bar", S("Rusty Iron Bars"), {
	sounds = default.node_sound_stone_defaults(),
	textures = {"xdecor_rusty_bar.png", "", "xdecor_rusty_bar_top.png"},
	groups = {cracky = 2, pane = 1},
	recipe = {
		{"", "default:dirt", ""},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
	},
	sounds = default.node_sound_metal_defaults(),
})

register_pane("wood_frame", S("Wood Frame"), {
	sounds = default.node_sound_wood_defaults(),
	textures = {"xdecor_wood_frame.png", "", "xdecor_wood_frame_top.png"},
	groups = {choppy = 2, pane = 1, flammable = 2},
	recipe = {
		{"group:wood", "group:stick", "group:wood"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:wood", "group:stick", "group:wood"}
	}
})

xdecor.register("baricade", {
	description = S("Barricade"),
	drawtype = "plantlike",
	paramtype2 = "facedir",
	inventory_image = "xdecor_baricade.png",
	tiles = {"xdecor_baricade.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	is_ground_content = false,
	damage_per_second = 4,
	selection_box = xdecor.nodebox.slab_y(0.3),
	collision_box = xdecor.pixelbox(2, {{0, 0, 1, 2, 2, 0}})
})

xdecor.register("barrel", {
	description = S("Barrel"),
	tiles = {"xdecor_barrel_top.png", "xdecor_barrel_top.png", "xdecor_barrel_sides.png"},
	on_place = core.rotate_node,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults()
})

local function blast_storage(pos)
	local drops = xdecor.get_inventory_drops(pos, {"main"})
	core.remove_node(pos)
	return drops
end

local function register_storage(name, desc, def)
	xdecor.register(name, {
		description = desc,
		_tt_help = def._tt_help,
		inventory = {size = def.inv_size or 24},
		infotext = desc,
		tiles = def.tiles,
		use_texture_alpha = ALPHA_OPAQUE,
		node_box = def.node_box,
		on_rotate = def.on_rotate,
		on_place = def.on_place,
		on_blast = blast_storage,
		groups = def.groups or {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		is_ground_content = false,
		sounds = default.node_sound_wood_defaults()
	})
end

register_storage("cabinet", S("Wooden Cabinet"), {
	_tt_help = S("24 inventory slots"),
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"xdecor_cabinet_sides.png", "xdecor_cabinet_sides.png",
		"xdecor_cabinet_sides.png", "xdecor_cabinet_sides.png",
		"xdecor_cabinet_sides.png", "xdecor_cabinet_front.png"
	}
})

register_storage("cabinet_half", S("Half Wooden Cabinet"), {
	inv_size = 8,
	_tt_help = S("8 inventory slots"),
	node_box = xdecor.nodebox.slab_y(0.5, 0.5),
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"xdecor_cabinet_sides.png", "xdecor_cabinet_sides.png",
		"xdecor_half_cabinet_sides.png", "xdecor_half_cabinet_sides.png",
		"xdecor_half_cabinet_sides.png", "xdecor_half_cabinet_front.png"
	}
})

if core.get_modpath("moreblocks") then
	core.register_alias("xdecor:empty_shelf", "moreblocks:empty_shelf")
else
	-- Node renamed from "Empty Shelf" because it was misleading.
	-- (you can still put things in it, making it non-empty)
	register_storage("empty_shelf", S("Plain Shelf"), {
		_tt_help = S("24 inventory slots"),
		on_rotate = screwdriver.rotate_simple,
		tiles = {
			"default_wood.png", "default_wood.png", "default_wood.png",
			"default_wood.png", "default_wood.png^xdecor_empty_shelf.png"
		},
	})

	-- Update infotext of old empty_shelf nodes to "Plain Shelf"
	core.register_lbm({
		label = "Update plain shelf infotext",
		name = "xdecor:empty_shelf_to_plain_shelf",
		nodenames = {"xdecor:empty_shelf"},
		run_at_every_load = false,
		action = function(pos, node)
			local meta = core.get_meta(pos)
			meta:set_string("infotext", S("Plain Shelf"))
		end,
	})
end

register_storage("multishelf", S("Multi Shelf"), {
	_tt_help = S("24 inventory slots"),
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "default_wood.png^xdecor_multishelf.png"
	},
})

xdecor.register("candle", {
	description = S("Candle"),
	light_source = 12,
	drawtype = "torchlike",
	inventory_image = "xdecor_candle_inv.png",
	wield_image = "xdecor_candle_wield.png",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {dig_immediate = 3, attached_node = 1},
	is_ground_content = false,
	tiles = {
		{name = "xdecor_candle_floor.png", animation = {type="vertical_frames", length = 1.5}},
		{name = "xdecor_candle_hanging.png", animation = {type="vertical_frames", length = 1.5}},
		{name = "xdecor_candle_wall.png", animation = {type="vertical_frames", length = 1.5}}
	},
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.25, -0.3, -0.25, 0.25, 0.5, 0.25},
		wall_bottom = {-0.25, -0.5, -0.25, 0.25, 0.1, 0.25},
		wall_side = {-0.5, -0.35, -0.15, -0.15, 0.4, 0.15}
	}
})

xdecor.register("chair", {
	description = S("Chair"),
	tiles = {"xdecor_wood.png"},
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = xdecor.pixelbox(16, {
		{3,  0, 11,   2, 16, 2},
		{11, 0, 11,   2, 16, 2},
		{5,  9, 11.5, 6,  6, 1},
		{3,  0,  3,   2,  6, 2},
		{11, 0,  3,   2,  6, 2},
		{3,  6,  3,  10,  2, 8}
	}),
	can_dig = player_api.sit_dig_centered,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_centered(pos, node, clicker, pointd)
		return itemstack
	end,
	_xdecor_itemframe_offset = -1.5,
})

xdecor.register("cobweb", {
	description = S("Cobweb"),
	drawtype = "plantlike",
	tiles = {"xdecor_cobweb.png"},
	inventory_image = "xdecor_cobweb.png",
	move_resistance = 8,
	walkable = false,
	selection_box = {type = "regular"},
	groups = {snappy = 3, flammable = 3},
	is_ground_content = false,
	sounds = default.node_sound_leaves_defaults()
})

local curtain_colors = {
	red = { S("Red Curtain"), "fabric_block_red.png", "fabric:block_red" },
}

local CURTAIN_OFFSET = 1/16

-- For preserve_metadata for curtains.
-- Erases metadata from the drops
-- because the item metadata should be empty
-- to allow proper item stacking.
local cleanup_curtain_meta = function(_,_,_,drops)
	for d=1, #drops do
		local meta = drops[d]:get_meta()
		meta:set_string("palette_index", "")
	end
end

for c, info in pairs(curtain_colors) do
	local desc = info[1]
	local base_texture = info[2]
	local craft_item = info[3]
	xdecor.register("curtain_" .. c, {
		description = desc,
		walkable = false,
		tiles = {base_texture, "("..base_texture..")^[transformFY", base_texture},
		use_texture_alpha = ALPHA_CLIP,
		inventory_image = base_texture.."^xdecor_curtain_open_overlay.png^[makealpha:255,126,126",
		wield_image = base_texture.."^xdecor_curtain_open_overlay.png^[makealpha:255,126,126",
		drawtype = "nodebox",
		paramtype2 = "wallmounted",
		node_box = {
			type = "wallmounted",
			wall_side = { -0.5, -0.5, -0.5, -0.5+CURTAIN_OFFSET, 0.5, 0.5 },
			wall_top = { -0.5, 0.5-CURTAIN_OFFSET, -0.5, 0.5, 0.5, 0.5 },
			wall_bottom = { -0.5, -0.5, -0.5, 0.5, -0.5+CURTAIN_OFFSET, 0.5 },
		},
		groups = {dig_immediate = 3, flammable = 3},
		is_ground_content = false,
		on_rightclick = function(pos, node, _, itemstack)
			core.set_node(pos, {name = "xdecor:curtain_open_" .. c, param2 = node.param2})
			return itemstack
		end,
		preserve_metadata = cleanup_curtain_meta,
	})

	local open_tile = base_texture.."^xdecor_curtain_open_overlay.png^[makealpha:255,126,126"
	xdecor.register("curtain_open_" .. c, {
		tiles = {
			open_tile,
			"("..open_tile..")^[transformFY",
			base_texture,
			base_texture,
			base_texture.."^xdecor_curtain_open_overlay_top.png^[makealpha:255,126,126",
			base_texture.."^xdecor_curtain_open_overlay_bottom.png^[makealpha:255,126,126",
		},
		use_texture_alpha = ALPHA_CLIP,
		drawtype = "nodebox",
		paramtype2 = "wallmounted",
		node_box = {
			type = "wallmounted",
			wall_side = { -0.5, -0.5, -0.5, -0.5+CURTAIN_OFFSET, 0.5, 0.5 },
			wall_top = { -0.5, 0.5-CURTAIN_OFFSET, -0.5, 0.5, 0.5, 0.5 },
			wall_bottom = { -0.5, -0.5, -0.5, 0.5, -0.5+CURTAIN_OFFSET, 0.5 },
		},
		walkable = false,
		groups = {dig_immediate = 3, flammable = 3, not_in_creative_inventory = 1},
		is_ground_content = false,
		drop = "xdecor:curtain_" .. c,
		on_rightclick = function(pos, node, _, itemstack)
			core.set_node(pos, {name="xdecor:curtain_" .. c, param2 = node.param2})
			return itemstack
		end,
		preserve_metadata = cleanup_curtain_meta,
	})

	core.register_craft({
		output = "xdecor:curtain_" .. c .. " 4",
		recipe = {
			{"", craft_item, ""},
			{"", craft_item, ""}
		}
	})
end

xdecor.register("cushion", {
	description = S("Cushion"),
	tiles = {"xdecor_cushion.png"},
	groups = {snappy = 3, flammable = 3, fall_damage_add_percent = -50},
	is_ground_content = false,
	on_place = core.rotate_node,
	node_box = xdecor.nodebox.slab_y(.5),
	can_dig = player_api.sit_dig_centered,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_centered(pos, node, clicker, pointd)
		return itemstack
	end
})

xdecor.register("cushion_block", {
	description = S("Cushion Block"),
	tiles = {"xdecor_cushion.png"},
	groups = {snappy = 3, flammable = 3, fall_damage_add_percent = -75},
	is_ground_content = false,
})

local function door_access(name)
	return name:find("prison")
end

local xdecor_doors = {
	japanese = {
		recipe = {
			{"group:wood", "default:paper"},
			{"default:paper", "group:wood"},
			{"group:wood", "default:paper"}
		},
		desc = S("Japanese Door"),
	},
	prison = {
		recipe = {
			{"xpanes:bar_flat", "xpanes:bar_flat"},
			{"xpanes:bar_flat", "default:steel_ingot"},
			{"xpanes:bar_flat", "xpanes:bar_flat"}
		},
		desc = S("Prison Door"),
		sounds = default.node_sound_metal_defaults(),
		sound_open = "xpanes_steel_bar_door_open",
		sound_close = "xpanes_steel_bar_door_close",
		gain_open = 0.18,
		gain_close = 0.16,
	},
	rusty_prison = {
		recipe = {
			{"xpanes:rusty_bar_flat", "xpanes:rusty_bar_flat"},
			{"xpanes:rusty_bar_flat", "xpanes:rusty_bar_flat"},
			{"xpanes:rusty_bar_flat", "xpanes:rusty_bar_flat"}
		},
		desc = S("Rusty Prison Door"),
		sounds = default.node_sound_metal_defaults(),
		sound_open = "xpanes_steel_bar_door_open",
		sound_close = "xpanes_steel_bar_door_close",
		gain_open = 0.21,
		gain_close = 0.19,
	},
	screen = {
		recipe = {
			{"group:wood", "group:wood"},
			{"xpanes:chainlink_flat", "xpanes:chainlink_flat"},
			{"group:wood", "group:wood"}
		},
		desc = S("Screen Door"),
	},
	slide = {
		recipe = {
			{"default:paper", "default:paper"},
			{"default:paper", "default:paper"},
			{"group:wood", "group:wood"}
		},
		desc = S("Paper Door"),
	},
	woodglass = {
		recipe = {
			{"default:glass", "default:glass"},
			{"group:wood", "group:wood"},
			{"group:wood", "group:wood"}
		},
		desc = S("Woodglass Door"),
	},
}

local mesecons_register

if core.global_exists("mesecon") then
	mesecons_register = { effector = {
		action_on = function(pos, node)
			local door = doors.get(pos)
			if door then
				door:open()
			end
		end,
		action_off = function(pos, node)
			local door = doors.get(pos)
			if door then
				door:close()
			end
		end,
		rules = mesecon.rules.pplate
	}}
end

for name, def in pairs(xdecor_doors) do
	if not doors.register then break end
	doors.register(name .. "_door", {
		tiles = {
			{name = "xdecor_" .. name .. "_door.png", backface_culling = true}
		},
		description = def.desc,
		inventory_image = "xdecor_" .. name .. "_door_inv.png",
		sounds = def.sounds,
		sound_open = def.sound_open,
		sound_close = def.sound_close,
		gain_open = def.gain_open,
		gain_close = def.gain_close,
		protected = door_access(name),
		groups = {choppy = 2, cracky = 2, oddly_breakable_by_hand = 1, door = 1, node = 1},
		recipe = def.recipe,
		mesecons = mesecons_register,
	})
end

xdecor.register("enderchest", {
	description = S("Ender Chest"),
	_tt_help = S("Interdimensional inventory"),
	tiles = {
		"xdecor_enderchest_top.png", "xdecor_enderchest_top.png",
		"xdecor_enderchest_side.png", "xdecor_enderchest_side.png",
		"xdecor_enderchest_side.png", "xdecor_enderchest_front.png"
	},
	groups = {cracky = 1, choppy = 1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", [[ size[8,9]
				list[current_player;enderchest;0,0;8,4;]
				list[current_player;main;0,5;8,4;]
				listring[current_player;enderchest]
				listring[current_player;main] ]]
				 .. xdecor.xbg .. default.get_hotbar_bg(0,5))

		meta:set_string("infotext", S("Ender Chest"))
	end
})

core.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("enderchest", 8*4)
end)

xdecor.register("ivy", {
	description = S("Ivy"),
	drawtype = "signlike",
	tiles = {"xdecor_ivy.png"},
	inventory_image = "xdecor_ivy.png",
	wield_image = "xdecor_ivy.png",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	groups = {snappy = 3, attached_node = 1, plant = 1, flammable = 3},
	selection_box = {type="wallmounted"},
	sounds = default.node_sound_leaves_defaults()
})

xdecor.register("rooster", {
	description = S("Weathercock"),
	drawtype = "torchlike",
	inventory_image = "xdecor_rooster.png",
	walkable = false,
	groups = {snappy = 3, attached_node = 1},
	is_ground_content = false,
	tiles = {"xdecor_rooster.png"},
	sounds = default.node_sound_metal_defaults(),
})

-- Lantern which attaches to the floor.
-- Has a hanging variant
xdecor.register("lantern", {
	description = S("Lantern"),
	light_source = 13,
	drawtype = "plantlike",
	inventory_image = "xdecor_lantern_inv.png",
	wield_image = "xdecor_lantern_inv.png",
	walkable = false,
	groups = {snappy = 3, attached_node = 3},
	is_ground_content = false,
	tiles = {
		{
			name = "xdecor_lantern.png",
			animation = {type="vertical_frames", length = 1.5}
		}
	},
	selection_box = xdecor.pixelbox(16, {{4, 0, 4, 8, 16, 8}}),
	sounds = default.node_sound_metal_defaults(),
	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" then
			return itemstack
		end

		-- Use pointed node's on_rightclick function first, if present
		if placer and not placer:get_player_control().sneak then
			local node = core.get_node(pointd.under)
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointd.under, node, placer, itemstack) or itemstack
			end
		end
		-- Check protection
		if core.is_protected(pointd.above, placer:get_player_name()) and
				not core.check_player_privs(placer, "protection_bypass") then
			core.record_protection_violation(pointd.above, placer:get_player_name())
			return itemstack
		end

		-- Decide whether the lantern attaches the the floor
		-- (default) or the ceiling.
		local leftover, place_pos, nodename
		local up = vector.new(pointd.above.x, pointd.above.y+1, pointd.above.z)
		local upnode = core.get_node(up)
		local updef = core.registered_nodes[upnode.name]
		local down = vector.new(pointd.above.x, pointd.above.y-1, pointd.above.z)
		local downnode = core.get_node(down)
		local downdef = core.registered_nodes[downnode.name]
		local sound_play = false
		if pointd.under.y > pointd.above.y then
			nodename = "xdecor:lantern_hanging"
			if downdef and not downdef.walkable then
				sound_play = true
			end
		elseif downdef and not downdef.walkable and updef and updef.walkable then
			nodename = "xdecor:lantern_hanging"
			sound_play = true
		else
			nodename = "xdecor:lantern"
		end
		leftover, place_pos = core.item_place_node(ItemStack(nodename), placer, pointd)
		if place_pos == nil then
			return
		end
		if leftover:get_count() == 0 and
				not core.is_creative_enabled(placer:get_player_name()) then
			itemstack:take_item()
		end

		if sound_play then
			core.sound_play(default.node_sound_metal_defaults().place, {pos=place_pos}, true)
		end

		return itemstack
	end,
})

-- Same as lantern, but attaches to ceiling
xdecor.register("lantern_hanging", {
	description = S("Hanging Lantern"),
	light_source = 13,
	drawtype = "plantlike",
	inventory_image = "xdecor_lantern_inv.png^xdecor_lantern_hanging_overlay_inv.png",
	wield_image = "xdecor_lantern_inv.png",
	walkable = false,
	groups = {snappy = 3, attached_node = 4, not_in_creative_inventory = 1},
	is_ground_content = false,
	tiles = {
		{
			name = "xdecor_lantern.png",
			animation = {type="vertical_frames", length = 1.5}
		}
	},
	selection_box = xdecor.pixelbox(16, {{4, 0, 4, 8, 16, 8}}),
	sounds = default.node_sound_metal_defaults(),
	drop = "xdecor:lantern",
})

-- Update legacy lantern (back when they were wallmounted)
-- that are hanging to the proper node.
core.register_lbm({
	label = "Update hanging lanterns",
	name = "xdecor:update_hanging_lanterns",
	nodenames = {"xdecor:lantern"},
	run_at_every_load = false,
	action = function(pos, node)
		if node.param2 == 0 then -- wallmounted 0 value means attached to the ceiling
			-- Only convert the node if it needs to hang
			-- (walkable node above, non-walkable node below)
			local up = vector.new(pos.x, pos.y+1, pos.z)
			local upnode = core.get_node(up)
			local updef = core.registered_nodes[upnode.name]
			local down = vector.new(pos.x, pos.y-1, pos.z)
			local downnode = core.get_node(down)
			local downdef = core.registered_nodes[downnode.name]
			if updef and updef.walkable and downdef and not downdef.walkable then
				core.swap_node(pos, {name="xdecor:lantern_hanging"})
			end
		end
	end,
})

local xdecor_lightbox = {
	iron = S("Steel Lattice Light Box"),
	wooden = S("Wooden Cross Light Box"),
	wooden2 = S("Wooden Rhombus Light Box"),
}

for l, desc in pairs(xdecor_lightbox) do
	xdecor.register(l .. "_lightbox", {
		description = desc,
		tiles = {"xdecor_" .. l .. "_lightbox.png"},
		groups = {cracky = 3, choppy = 3, oddly_breakable_by_hand = 2},
		is_ground_content = false,
		light_source = 13,
		sounds = default.node_sound_glass_defaults()
	})
end

local xdecor_potted = {
	daisy = S("Potted Daisy"),
	dandelion = S("Potted Dandelion"),
	geranium = S("Potted Geranium"),
	rose = S("Potted Rose"),
	tulip = S("Potted Tulip"),
	viola = S("Potted Viola"),
}

for f, desc in pairs(xdecor_potted) do
	xdecor.register("potted_" .. f, {
		description = desc,
		walkable = false,
		groups = {snappy = 3, flammable = 3, plant = 1, potted_flower = 1},
		is_ground_content = false,
		tiles = {"xdecor_" .. f .. "_pot.png"},
		inventory_image = "xdecor_" .. f .. "_pot.png",
		drawtype = "plantlike",
		sounds = default.node_sound_leaves_defaults({
			place = default.node_sound_stone_defaults().place,
			dug = default.node_sound_stone_defaults().dug,
		}),
		selection_box = xdecor.nodebox.slab_y(0.3)
	})

	core.register_craft({
		output = "xdecor:potted_" .. f,
		recipe = {
			{"default:clay_brick", "flowers:" .. f, "default:clay_brick"},
			{"", "default:clay_brick", ""}
		}
	})
end

local painting_box = {
	type = "wallmounted",
	wall_top = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
	wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
	wall_side = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375}
}

xdecor.register("painting_1", {
	description = S("Painting"),
	tiles = {"xdecor_painting_1.png"},
	use_texture_alpha = ALPHA_OPAQUE,
	inventory_image = "xdecor_painting_empty.png",
	wield_image = "xdecor_painting_empty.png",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, attached_node = 1},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	node_box = painting_box,
	node_placement_prediction = "",
	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" then
			return itemstack
		end

		-- Use pointed node's on_rightclick function first, if present
		if placer and not placer:get_player_control().sneak then
			local node = core.get_node(pointd.under)
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointd.under, node, placer, itemstack) or itemstack
			end
		end
		-- Check protection
		if core.is_protected(pointd.above, placer:get_player_name()) and
				not core.check_player_privs(placer, "protection_bypass") then
			core.record_protection_violation(pointd.above, placer:get_player_name())
			return itemstack
		end

		local num = math.random(4)
		local leftover, place_pos = core.item_place_node(
			ItemStack("xdecor:painting_" .. num), placer, pointd)

		if not place_pos then
			return itemstack
		end

		if leftover:get_count() == 0 and
				not core.is_creative_enabled(placer:get_player_name()) then
			itemstack:take_item()
		end

		-- Play 'place' sound manually
		core.sound_play(default.node_sound_wood_defaults().place, {pos=place_pos}, true)

		return itemstack
	end,
	sounds = default.node_sound_wood_defaults(),
})

for i = 2, 4 do
	xdecor.register("painting_" .. i, {
		tiles = {"xdecor_painting_" .. i .. ".png"},
		use_texture_alpha = ALPHA_OPAQUE,
		paramtype2 = "wallmounted",
		drop = "xdecor:painting_1",
		sunlight_propagates = true,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2,
			attached_node = 1, not_in_creative_inventory = 1},
		is_ground_content = false,
		sounds = default.node_sound_wood_defaults(),
		node_box = painting_box
	})
end

xdecor.register("stonepath", {
	description = S("Garden Stone Path"),
	tiles = {"default_stone.png"},
	groups = {snappy = 3},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	sounds = default.node_sound_stone_defaults(),
	sunlight_propagates = true,
	node_box = xdecor.pixelbox(16, {
		{8, 0,  8, 6, .5, 6}, {1,  0, 1, 6, .5, 6},
		{1, 0, 10, 5, .5, 5}, {10, 0, 2, 4, .5, 4}
	}),
	selection_box = xdecor.nodebox.slab_y(0.05)
})

local function register_hard_node(name, desc, def)
	def = def or {}
	xdecor.register(name, {
		description = desc,
		tiles = def.tiles or {"xdecor_" .. name .. ".png"},
		groups = def.groups or {cracky = 1},
		is_ground_content = false,
		sounds = def.sounds or default.node_sound_stone_defaults()
	})
end

register_hard_node("cactusbrick", S("Cactus Brick"))
register_hard_node("coalstone_tile", S("Coal Stone Tile"))
register_hard_node("desertstone_tile", S("Polished Desert Stone Block"))
register_hard_node("compressed_clay", S("Compressed Clay"))
register_hard_node("moonbrick", S("Moon Brick"))
register_hard_node("stone_rune", S("Runestone"))

-- renamed from stone_tile to fix naming collision with moreblocks
-- mod for the registrations under the 'stairs:' namespace
register_hard_node("stone_tile_x", S("Polished Stone Block"), {
	tiles = {"xdecor_stone_tile.png"},
})
xdecor.register_legacy_aliases("stone_tile", "stone_tile_x")

-- renamed from wood_tile to fix naming collision with moreblocks
-- mod for the registrations under the 'stairs:' namespace
register_hard_node("wood_tile_x", S("Wooden Tile"), {
	groups = {choppy = 1, wood = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	tiles = {"xdecor_wood_tile.png"},
})
xdecor.register_legacy_aliases("wood_tile", "wood_tile_x")

xdecor.register("table", {
	description = S("Table"),
	tiles = {"xdecor_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	node_box = xdecor.pixelbox(16, {
		{0, 14, 0, 16, 2, 16}, {5.5, 0, 5.5, 5, 14, 6}
	})
})

xdecor.register("tatami", {
	description = S("Tatami"),
	tiles = {"xdecor_tatami.png"},
	wield_image = "xdecor_tatami.png",
	groups = {snappy = 3, flammable = 3},
	is_ground_content = false,
	sunlight_propagates = true,
	node_box = xdecor.nodebox.slab_y(0.0625)
})

xdecor.register("trampoline", {
	description = S("Trampoline"),
	tiles = {"xdecor_trampoline.png", "xdecor_trampoline_bottom.png", "xdecor_trampoline_sides.png"},
	use_texture_alpha = ALPHA_CLIP,
	groups = {cracky = 3, oddly_breakable_by_hand = 1, fall_damage_add_percent = -80, bouncy = 90},
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -1/16, -0.5, 0.5, 0, 0.5 }, -- bouncy top
			{ -0.5, -0.5, -0.5, -3/16, 0, -3/16 }, -- leg 1
			{ 3/16, -0.5, -0.5, 0.5, 0, -3/16 }, -- leg 2
			{ -0.5, -0.5, 3/16, -3/16, 0, 0.5 }, -- leg 3
			{ 3/16, -0.5, 3/16, 0.5, 0, 0.5 }, -- leg 4
			{ -3/16, -5/16, -0.5, 3/16, -1/16, -7/16 }, -- connector 1
			{ -0.5, -5/16, -3/16, -7/16, -1/16, 3/16 }, -- connector 2
			{ -3/16, -5/16, 7/16, 3/16, -1/16, 0.5 }, -- connector 3
			{ 7/16, -5/16, -3/16, 0.5, -1/16, 3/16 } -- connector 4
		}
	},
	selection_box = xdecor.nodebox.slab_y(0.5),
	collision_box = xdecor.nodebox.slab_y(0.5),
	sounds = default.node_sound_defaults({
		footstep = {
			name = "xdecor_bouncy", gain = .8},
		dig = default.node_sound_wood_defaults().dig,
	}),
})

xdecor.register("tv", {
	description = S("Television"),
	light_source = 11,
	groups = {cracky = 3, oddly_breakable_by_hand = 2},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"xdecor_television_left.png^[transformR270",
		"xdecor_television_left.png^[transformR90",
		"xdecor_television_left.png^[transformFX",
		"xdecor_television_left.png", "xdecor_television_back.png",
		{
			name = "xdecor_television_front_animated.png",
			animation = {type = "vertical_frames", length = 80.}
		}
	},
	sounds = default.node_sound_metal_defaults(),
})

xdecor.register("woodframed_glass", {
	description = S("Wood Framed Glass"),
	drawtype = "glasslike_framed",
	sunlight_propagates = true,
	tiles = {"xdecor_woodframed_glass.png", "xdecor_woodframed_glass_detail.png"},
	use_texture_alpha = ALPHA_CLIP,
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
	_xdecor_custom_noncube_tiles = {
		stair = {
			"xdecor_woodframed_glass_split.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_stairside_flip.png",
			"xdecor_woodframed_glass_stairside.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_split.png",
		},
		stair_inner = {
			"xdecor_woodframed_glass_stairside.png^[transformR270",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_stairside_flip.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_stairside.png",
		},
		stair_outer = {
			"xdecor_woodframed_glass_stairside.png^[transformR90",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_outer_stairside.png",
			"xdecor_woodframed_glass_stairside_flip.png",
			"xdecor_woodframed_glass_stairside.png^[transformR90",
			"xdecor_woodframed_glass_outer_stairside.png",
		},
		halfstair = {
			"xdecor_woodframed_glass_cube.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_stairside_flip.png",
			"xdecor_woodframed_glass_stairside.png",
			"xdecor_woodframed_glass_split.png^[transformR90",
			"xdecor_woodframed_glass_cube.png",
		},
		slab = {
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass.png",
			"xdecor_woodframed_glass_split.png",
		},
		cube = { "xdecor_woodframed_glass_cube.png" },
		thinstair = { "xdecor_woodframed_glass_split.png" },
		micropanel = { "xdecor_woodframed_glass_split.png" },
		panel = {
			"xdecor_woodframed_glass_split.png",
			"xdecor_woodframed_glass_split.png",
			"xdecor_woodframed_glass_cube.png",
			"xdecor_woodframed_glass_cube.png",
			"xdecor_woodframed_glass_split.png",
		},
	},
})

local devices = {
	{ "radio", S("Radio"), default.node_sound_metal_defaults() },
	{ "speaker", S("Speaker"), default.node_sound_metal_defaults() },
}
for _, v in pairs(devices) do
	xdecor.register(v[1], {
		description = v[2],
		on_rotate = screwdriver.rotate_simple,
		tiles = {
			"xdecor_" .. v[1] .. "_top.png",
			"xdecor_" .. v[1] .. "_side.png",
			"xdecor_" .. v[1] .. "_side.png",
			"xdecor_" .. v[1] .. "_side.png",
			"xdecor_" .. v[1] .. "_back.png",
			"xdecor_" .. v[1] .. "_front.png",
		},
		groups = {cracky = 2, not_cuttable = 1},
		is_ground_content = false,
		sounds = v[3],
	})
end

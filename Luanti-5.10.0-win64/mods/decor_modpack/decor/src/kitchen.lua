-- This file supplies Kitchen cabinets and kitchen sink

local S = homedecor_i18n.gettext

-- steel-textured fridge
homedecor.register("refrigerator_steel", {
	mesh = "homedecor_refrigerator.obj",
	tiles = {"homedecor_refrigerator_steel.png"},
	inventory_image = "homedecor_refrigerator_steel_inv.png",
	description = S("Refrigerator (stainless steel)"),
	groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	expand = { top="placeholder" },
	infotext=S("Refrigerator"),
	inventory = {
		size=50,
		lockable=true,
	},
	can_dig = function(pos, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main") and default.can_interact_with_node(player, pos)
	end,
	on_rotate = screwdriver.rotate_simple
})

-- white, enameled fridge
homedecor.register("refrigerator_white", {
	mesh = "homedecor_refrigerator.obj",
	tiles = {"homedecor_refrigerator_white.png"},
	inventory_image = "homedecor_refrigerator_white_inv.png",
	description = S("Refrigerator"),
	groups = {snappy=3},
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	sounds = default.node_sound_stone_defaults(),
	expand = { top="placeholder" },
	infotext=S("Refrigerator"),
	inventory = {
		size=50,
		lockable=true,
	},
	can_dig = function(pos, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main") and default.can_interact_with_node(player, pos)
	end,
	on_rotate = screwdriver.rotate_simple
})

local cabinet_sides = "(default_wood.png^[transformR90)^homedecor_kitchen_cabinet_bevel.png"
local cabinet_bottom = "(default_wood.png^[colorize:#000000:100)^(homedecor_kitchen_cabinet_bevel.png^[colorize:#46321580)"

local function N_(x) return x end

local counter_materials = { "", N_("granite"), N_("marble"), N_("steel") }

for _, mat in ipairs(counter_materials) do

	local desc = S("Kitchen Cabinet")
	local material = ""

	if mat ~= "" then
		desc = S("Kitchen Cabinet (@1 top)", S(mat))
		material = "_"..mat
	end

	homedecor.register("kitchen_cabinet"..material, {
		description = desc,
		tiles = {'homedecor_kitchen_cabinet_top'..material..'.png',
			cabinet_bottom, cabinet_sides, cabinet_sides, cabinet_sides,
			'homedecor_kitchen_cabinet_front.png'},
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		infotext=S("Kitchen Cabinet"),
		inventory = {
			size=24,
			lockable=true,
		},
		can_dig = function(pos, player)
			local meta = core.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:is_empty("main") and default.can_interact_with_node(player, pos)
		end,
	})
end

local kitchen_cabinet_half_box = homedecor.nodebox.slab_y(0.5, 0.5)
homedecor.register("kitchen_cabinet_half", {
	description = S('Half-height Kitchen Cabinet (on ceiling)'),
	tiles = {
		cabinet_sides,
		cabinet_bottom,
		cabinet_sides,
		cabinet_sides,
		cabinet_sides,
		'homedecor_kitchen_cabinet_front_half.png'
	},
	selection_box = kitchen_cabinet_half_box,
	node_box = kitchen_cabinet_half_box,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Kitchen Cabinet"),
	inventory = {
		size=12,
		lockable=true,
	},
	can_dig = function(pos, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main") and default.can_interact_with_node(player, pos)
	end,
})

homedecor.register("kitchen_cabinet_with_sink", {
	description = S("Kitchen Cabinet with sink"),
	mesh = "homedecor_kitchen_sink.obj",
	tiles = {
		"homedecor_kitchen_sink_top.png",
		"homedecor_kitchen_cabinet_front.png",
		cabinet_sides,
		cabinet_bottom
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Under-sink cabinet"),
	inventory = {
		size=16,
		lockable=true,
	},
	can_dig = function(pos, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main") and default.can_interact_with_node(player, pos)
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16, -8/16,  8/16, 6/16,  8/16 },
			{ -8/16,  6/16, -8/16, -6/16, 8/16,  8/16 },
			{  6/16,  6/16, -8/16,  8/16, 8/16,  8/16 },
			{ -8/16,  6/16, -8/16,  8/16, 8/16, -6/16 },
			{ -8/16,  6/16,  6/16,  8/16, 8/16,  8/16 },
		}
	},
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z})
	end
})

local kf_cbox = {
	type = "fixed",
	fixed = { -2/16, -8/16, 1/16, 2/16, -1/16, 8/16 }
}

homedecor.register("kitchen_faucet", {
	mesh = "homedecor_kitchen_faucet.obj",
	tiles = { "homedecor_generic_metal_bright.png" },
	inventory_image = "homedecor_kitchen_faucet_inv.png",
	description = S("Kitchen Faucet"),
	groups = {snappy=3},
	selection_box = kf_cbox,
	walkable = false,
	on_rotate = screwdriver.disallow,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local below = core.get_node_or_nil({x=pos.x, y=pos.y-1, z=pos.z})
		if below and
		  below.name == "decor:sink" or
		  below.name == "decor:kitchen_cabinet_with_sink" or
		  below.name == "decor:kitchen_cabinet_with_sink_locked" then
			local particledef = {
				outlet      = { x = 0, y = -0.19, z = 0.13 },
				velocity_x  = { min = -0.05, max = 0.05 },
				velocity_y  = -0.3,
				velocity_z  = { min = -0.1,  max = 0 },
				spread      = 0
			}
			homedecor.start_particle_spawner(pos, node, particledef, "homedecor_faucet")
		end
		return itemstack
	end,
	on_destruct = homedecor.stop_particle_spawner
})

homedecor.register("paper_towel", {
	mesh = "homedecor_paper_towel.obj",
	tiles = {
		"homedecor_generic_quilted_paper.png",
		"default_wood.png"
	},
	inventory_image = "homedecor_paper_towel_inv.png",
	description = S("Paper towels"),
	groups = { snappy=3 },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, 0.125, 0.0625, 0.4375, 0.4375, 0.5 }
	},
})

homedecor.register("dartboard", {
	description = S("Dartboard"),
	mesh = "homedecor_dartboard.obj",
	tiles = { "homedecor_dartboard.png" },
	inventory_image = "homedecor_dartboard_inv.png",
	wield_image = "homedecor_dartboard_inv.png",
	paramtype2 = "wallmounted",
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("beer_tap", {
	description = S("Beer tap"),
	mesh = "homedecor_beer_taps.obj",
	tiles = {
		"homedecor_generic_metal_bright.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black }
	},
	inventory_image = "homedecor_beertap_inv.png",
	groups = { snappy=3 },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.4375, 0.25, 0.235, 0 }
	},
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local inv = clicker:get_inventory()

		local wieldname = itemstack:get_name()
		if wieldname == "vessels:drinking_glass" then
			if inv:room_for_item("main", "decor:beer_mug 1") then
				itemstack:take_item()
				clicker:set_wielded_item(itemstack)
				inv:add_item("main", "decor:beer_mug 1")
				core.chat_send_player(clicker:get_player_name(),
						S("Ahh, a frosty cold beer - look in your inventory for it!"))
			else
				core.chat_send_player(clicker:get_player_name(),
						S("No room in your inventory to add a beer mug!"))
			end
		end
	end
})

homedecor.register("beer_mug", {
	description = S("Beer mug"),
	drawtype = "mesh",
	mesh = "homedecor_beer_mug.obj",
	tiles = { "homedecor_beer_mug.png" },
	inventory_image = "homedecor_beer_mug_inv.png",
	groups = { snappy=3, oddly_breakable_by_hand=3 },
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -5/32, -8/16, -9/32 , 7/32, -2/16, 1/32 }
	},
	on_use = function(itemstack, user, pointd)
		local inv = user:get_inventory()
		if not core.is_creative_enabled(user:get_player_name()) then
			if inv:room_for_item("main", "vessels:drinking_glass 1") then
				inv:add_item("main", "vessels:drinking_glass 1")
			else
				local pos = user:get_pos()
				local dir = user:get_look_dir()
				local fdir = core.dir_to_facedir(dir)
				local pos_fwd = {	x = pos.x + homedecor.fdir_to_fwd[fdir+1][1],
									y = pos.y + 1,
									z = pos.z + homedecor.fdir_to_fwd[fdir+1][2] }
				core.add_item(pos_fwd, "vessels:drinking_glass")
			end
			core.do_item_eat(2, nil, itemstack, user, pointd)
			return itemstack
		end
	end
})

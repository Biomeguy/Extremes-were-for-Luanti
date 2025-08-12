
local S = homedecor_i18n.gettext

local desk_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 1.5, 0.5, 0.5 }
}
homedecor.register("desk", {
	description = S("Desk"),
	mesh = "homedecor_desk.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_desk_drawers.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black }
	},
	inventory_image = "homedecor_desk_inv.png",
	selection_box = desk_cbox,
	collision_box = desk_cbox,
	sounds = default.node_sound_wood_defaults(),
	groups = { snappy = 3 },
	expand = { right="placeholder" },
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

local globe_cbox = {
	type = "fixed",
	fixed = {-.4, -.5, -.3, .3, .3, .3}
}

homedecor.register("desk_globe", {
	description = S("Desk globe"),
	mesh = "homedecor_desk_globe.obj",
	tiles = {
		"homedecor_generic_wood_red.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_earth.png"
	},
	inventory_image = "homedecor_desk_globe_inv.png",
	selection_box = globe_cbox,
	collision_box = globe_cbox,
	groups = {choppy=2, oddly_breakable_by_hand=2},
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
})

local ofchairs_sbox = {
	type = "fixed",
	fixed = { -8/16, -8/16, -8/16, 8/16, 29/32, 8/16 }
}
local ofchairs_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16,   1/16, -7/16,  5/16,   4/16,  7/16 }, -- seat
		{ -5/16,   4/16,  4/16,  5/16,  29/32, 15/32 }, -- seatback
		{ -1/16, -11/32, -1/16,  1/16,   1/16,  1/16 }, -- cylinder
		{ -8/16,  -8/16, -8/16,  8/16, -11/32,  8/16 }  -- legs/wheels
	}
}

local chairs = {
	{ "basic",   S("Basic office chair") },
	{ "upscale", S("Upscale office chair") },
}

for _, c in pairs(chairs) do
	local name, desc = unpack(c)
	homedecor.register("office_chair_"..name, {
		description = desc,
		drawtype = "mesh",
		tiles = { "homedecor_office_chair_"..name..".png" },
		mesh = "homedecor_office_chair_"..name..".obj",
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = ofchairs_sbox,
		collision_box = ofchairs_cbox,
		expand = { top = "placeholder" },
		on_rotate = screwdriver.rotate_simple
	})
end

local trash_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.125, 0.25 }
}

homedecor.register("trash_can", {
	drawtype = "mesh",
	mesh = "homedecor_trash_can.obj",
	tiles = { "homedecor_trash_can.png" },
	inventory_image = "homedecor_trash_can_inv.png",
	use_texture_alpha = "clip",
	description = S("Small Trash Can"),
	groups = {snappy=3},
	selection_box = trash_cbox,
	collision_box = trash_cbox,
})

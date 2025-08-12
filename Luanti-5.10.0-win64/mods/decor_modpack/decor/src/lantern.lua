
--[[	lantern mod - formerly "Torch Mod"
======================

(c) Copyright BlockMen (2013-2015)
(C) Copyright sofar <sofar@foo-projects.org> (2016)
(C) Copyright tobyplowy (aka toby109tt) (2017)

License:
~~~~~~~~
(c) Copyright BlockMen (2013-2015)

Textures and Meshes/Models:
CC-BY 3.0 tobyplowy (aka toby109tt)

Code:
Licensed under the GNU LGPL version 2.1 or higher.
You can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License
as published by the Free Software Foundation;

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

See LICENSE.txt and http://www.gnu.org/licenses/lgpl-2.1.txt

--]]

function decor.lantern_glow(pos)
		local tod = core.get_timeofday()
		if tod <= .6 and tod >= .2 then
		core.get_node_timer(pos):start(7) return end
	local offx = pos.x
	local offy = pos.y-.25
	local offz = pos.z
	local p2 = core.get_node(pos).param2

	if p2 == 0 then
		offy = pos.y
	elseif p2 == 2 then
		offx = pos.x+.3
	elseif p2 == 3 then
		offx = pos.x-.3
	elseif p2 == 4 then
		offz = pos.z+.3
	elseif p2 == 5 then
		offz = pos.z-.3
	end
	local glt = math.random(5, 6)
	core.add_particle({
		pos = {x=offx, y=offy, z=offz},
		expirationtime = glt,
		size = 15,
		texture = "decor_glow.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = .75},
		glow = 9 })
	core.get_node_timer(pos):start(glt)
end

core.register_node("decor:lantern", {
	description = "Lantern",
	drawtype = "mesh",
	mesh = "lantern_floor.obj",
	inventory_image = "decor_lantern_item.png",
	wield_image = "decor_lantern_item.png",
	tiles = {{
		name = "decor_lantern.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 13,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {cracky=2, dig_immediate=3, attached_node=1, lantern=1, timer_check=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -.5, -1/8, 1/8, 1/8, 1/8}
	},
	sounds = default.node_sound_defaults({
		place = {name = "default_place_node_hard", gain = .5},
		dug = {name = "default_metal_footstep", gain = .1, pitch = 1.3},
	}),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("decor:lantern_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("decor:lantern")
		else
			fakestack:set_name("decor:lantern_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("decor:lantern")

		return itemstack
	end,
	on_timer = decor.lantern_glow,
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_rotate = false
})

core.register_node("decor:lantern_wall", {
	drawtype = "mesh",
	mesh = "lantern_wall.obj",
	tiles = {{
		name = "decor_lantern.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 13,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {cracky=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, lantern=1, timer_check=1},
	drop = "decor:lantern",
	selection_box = {
		type = "wallmounted",
		wall_side = {-.2, -.5, -1/8, -.45, 1/8, 1/8}
	},
	sounds = default.node_sound_defaults({
		dug = {name = "default_metal_footstep", gain = .1, pitch = 1.3},
	}),
	on_timer = decor.lantern_glow,
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_rotate = false
})

core.register_node("decor:lantern_ceiling", {
	drawtype = "mesh",
	mesh = "lantern_ceiling.obj",
	tiles = {{
		name = "decor_lantern.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 13,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {cracky=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, lantern=1, timer_check=1},
	drop = "decor:lantern",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -2/8, -1/8, 1/8, .5, 1/8}
	},
	sounds = default.node_sound_defaults({
		dug = {name = "default_metal_footstep", gain = .1, pitch = 1.3},
	}),
	on_timer = decor.lantern_glow,
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_rotate = false
})

core.register_craft({
	output = "decor:lantern",
	recipe = {
		{"default:iron_lump", ""},
		{"default:meselamp_torch", "vessels:glass_fragments"},
		{"default:iron_lump", "vessels:glass_fragments"}
	}
})

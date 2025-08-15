-- contains the node definition for a general travelnet that can be used by anyone
--	further travelnets can only be installed by the owner or by people with the travelnet_attach priv
--	digging of such a travelnet is limited to the owner and to people with the travelnet_remove priv (useful for admins to clean up)
--	(this can be overrided in config.lua)
-- Autor: Sokomine

core.register_node("travelnet:travelnet", {
	description = "Travelnet box",
	drawtype = "mesh",
	mesh = "travelnet.obj",
	tiles = {"travelnet_travelnet_front.png", -- backward view
		"travelnet_travelnet_back.png", -- front view
		"travelnet_travelnet_side.png", -- sides :)
		"default_steel_block.png", -- view from top
		"default_clay.png"}, -- view from bottom
	inventory_image = "travelnet_inv.png",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	paramtype = 'light',
	paramtype2 = "facedir",
	wield_scale = {x=.6, y=.6, z=.6},
	light_source = 10,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 1.5, .5}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{.44,-.44,-.5,.5,1.44,.5},
			{-.5,-.44,.44,.44,1.44,.5},
			{-.5,-.44,-.5,-.44,1.44,.5},

			{-.5,-.5,-.5,.5,-.44,.5},

			{-.5,1.44,-.5,.5,1.5,.5}
		}
	},
	groups = {cracky=1,choppy=1,snappy=1},
	after_place_node = function(pos, placer, itemstack)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", "Travelnet-box (unconfigured)")
		meta:set_string("station_name", "")
		meta:set_string("station_network", "")
		meta:set_string("owner", placer:get_player_name() )
		-- request initial data
		meta:set_string("formspec", 
			"size[12,10]"..
			"field[.3,5.6;6,.7;station_name;Name of this station:;]"..
			"field[.3,6.6;6,.7;station_network;Assign to Network:;]"..
			"field[.3,7.6;6,.7;owner_name;(optional) owned by:;]"..
			"button_exit[6.3,6.2;1.7,.7;station_set;Store]" )

		local p2 = core.dir_to_facedir(placer:get_look_dir())
		core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="doors:hidden", param2=p2+1})
	end,

	on_receive_fields = travelnet.on_receive_fields,
	on_punch = function(pos, node, puncher)
		travelnet.update_formspec(pos, puncher:get_player_name())
	end,

	can_dig = function( pos, player )
		return travelnet.can_dig( pos, player, 'travelnet box' )
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		travelnet.remove_box( pos, oldnode, oldmetadata, digger)
		core.remove_node({x= pos.x, y= pos.y+ 1, z= pos.z})
		core.check_for_falling({x= pos.x, y= pos.y+ 1, z= pos.z})
	end,

	-- taken from VanessaEs homedecor fridge
	on_place = function(itemstack, placer, pointd)

		local pos = pointd.above
		if( core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" ) then

			core.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place the travelnet box!' )
			return
		end
		return core.item_place(itemstack, placer, pointd)
	end,

	on_destruct = function(pos)
		core.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
	end,
	on_blast = function(pos)
		core.remove_node(pos)
		core.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		return {"travelnet:travelnet"}
	end
})

core.register_craft({
	output = "travelnet:travelnet",
	recipe = travelnet.travelnet_recipe,
})

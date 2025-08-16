core.register_craft({
	output = 'rangedweapons:m79_uld',
	recipe = {
		{'default:steel_ingot', '', 'default:mese_crystal'},
		{'default:steel_block', 'default:steel_block', 'default:beech_trunk'},
		{'default:beech_trunk', 'default:beech_trunk', 'default:beech_trunk'}
	}
})

core.register_craftitem("rangedweapons:m79_uld", {
	stack_max= 1,
	wield_scale = {x=2.0,y=2.0,z=2.5},
	range = 0,
		description = "" ..core.colorize("#35cdff","M79\n") ..core.colorize("#FFFFFF", "Explosion radius: 2\n") ..core.colorize("#FFFFFF", "Bullet gravitational pull: 5\n") ..core.colorize("#FFFFFF", "Ammunition: 40mm grenades\n") ..core.colorize("#FFFFFF", "Reload time: 1.25\n") ..core.colorize("#be0d00", "The gun is NOT loaded! (Right-click to load)\n")..core.colorize("#FFFFFF", "Gun type:Grenade launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 15"),
	inventory_image = "rangedweapons_m79.png",
	on_use = function(user)
		core.sound_play("rangedweapons_empty", {user})
	end,
})

	local timer = 0
core.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.001 then
	for _, player in pairs(core.get_connected_players()) do
		local inv = player:get_inventory()
		local controls = player:get_player_control()
		if player:get_wielded_item():get_name() == "rangedweapons:m79_uld" 
		and inv:contains_item("main", "rangedweapons:40mm")then
		if controls.RMB then
		inv:remove_item("main", "rangedweapons:40mm")
		player:set_wielded_item("rangedweapons:m79_rld")
		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:empty_shell_grenade")
				core.sound_play("", {object=obj})
				obj:set_velocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:set_acceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or player
				end
			end
		timer = 0
				core.sound_play("rangedweapons_reload_a", {player})

end
	end

	if timer >= 1.25 and
		 player:get_wielded_item():get_name() == "rangedweapons:m79_rld" then
		player:set_wielded_item("rangedweapons:m79")
		timer = 0
				core.sound_play("rangedweapons_reload_b", {player})



		end
			end
				end
				end)


core.register_craftitem("rangedweapons:m79_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=2.0,y=2.0,z=2.5},
	description = "**RELOADING M79**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_m79_rld.png",
})


core.register_tool("rangedweapons:m79", {
		description = "" ..core.colorize("#35cdff","M79\n") ..core.colorize("#FFFFFF", "Explosion radius: 2\n") ..core.colorize("#FFFFFF", "Bullet gravitational pull: 5\n") ..core.colorize("#FFFFFF", "Ammunition: 40mm grenades\n") ..core.colorize("#FFFFFF", "Reload time: 1.25\n") ..core.colorize("#27a600", "The gun is loaded!\n")..core.colorize("#FFFFFF", "Gun type:Grenade launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 15"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=2.0,y=2.0,z=2.5},
	inventory_image = "rangedweapons_m79.png",
	on_use = function(itemstack, user, pointd)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:he_grenade")
			if obj then
				core.sound_play("rangedweapons_rocket", {object=obj})
				obj:set_velocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:set_acceleration({x=dir.x * -1, y=-5, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
	core.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 1.5,
		size = 10,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:m79_uld"
				end
			end
		end
		return itemstack
	end,
})





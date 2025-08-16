core.register_craft({
	output = 'rangedweapons:awp_uld',
	recipe = {
		{'rangedweapons:gunsteel_ingot', 'default:diamond_block', 'rangedweapons:gunsteel_ingot'},
		{'rangedweapons:gunsteel_ingot', 'rangedweapons:gunsteel_ingot', 'rangedweapons:gunsteel_ingot'},
		{'dye:dark_green', 'default:diamond', 'rangedweapons:plastic_sheet'}
	}
})

core.register_craftitem("rangedweapons:awp_uld", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	range = 0,
		description = "" ..core.colorize("#35cdff","A.W.P. \n") ..core.colorize("#FFFFFF", "Ranged damage: 100/sec of bullet lifetime\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 15\n") ..core.colorize("#FFFFFF", "Critical chance: 45%\n") ..core.colorize("#FFFFFF", "Critical damage: 250/sec of bullet lifetime\n") ..core.colorize("#FFFFFF", "Ammunition: 308.Winchester rounds\n") ..core.colorize("#FFFFFF", "Reload time: 1.5\n") ..core.colorize("#be0d00", "The gun is NOT loaded! (Right-click to load)\n")..core.colorize("#FFFFFF", "Gun type: Rifle\n") ..core.colorize("#FFFFFF", "Bullet velocity: 60"),
	inventory_image = "rangedweapons_awp.png",
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
		if player:get_wielded_item():get_name() == "rangedweapons:awp_uld" 
		and inv:contains_item("main", "rangedweapons:308winchester")then
		if controls.RMB then
		inv:remove_item("main", "rangedweapons:308winchester")
		player:set_wielded_item("rangedweapons:awp_rld")
		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:empty_shell")
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

	if timer >= 1.5 and
		 player:get_wielded_item():get_name() == "rangedweapons:awp_rld" then
		player:set_wielded_item("rangedweapons:awp")
		timer = 0
				core.sound_play("rangedweapons_reload_b", {player})



		end
			end
				end
				end)


core.register_craftitem("rangedweapons:awp_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	description = "**RELOADING A.W.P.**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_awp_rld.png",
})


core.register_tool("rangedweapons:awp", {
		description = "" ..core.colorize("#35cdff","A.W.P. \n") ..core.colorize("#FFFFFF", "Ranged damage: 100/sec of bullet lifetime\n")..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 15\n") ..core.colorize("#FFFFFF", "Critical chance: 45%\n") ..core.colorize("#FFFFFF", "Critical damage: 250/sec of bullet lifetime\n") ..core.colorize("#FFFFFF", "Ammunition: 308.Winchester rounds\n") ..core.colorize("#FFFFFF", "Reload time: 1.5\n") ..core.colorize("#27a600", "The gun is loaded!\n")..core.colorize("#FFFFFF", "Gun type: Rifle\n") ..core.colorize("#FFFFFF", "Bullet velocity: 60"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=1.9,y=1.9,z=1.1},
	inventory_image = "rangedweapons_awp.png",
	on_use = function(itemstack, user, pointd)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:awpshot")
			if obj then
				core.sound_play("rangedweapons_rifle_a", {object=obj})
				obj:set_velocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
				obj:set_yaw(yaw + math.pi)
	core.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 1.5,
		size = 8,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:awp_uld"
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_awpshot = {
	initial_properties = {
physical = false,
visual = "sprite",
visual_size = {x=.3, y=.3},
textures = {"blank.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_awpshot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.05 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:awpshot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 45 then
					local damage = 250 * self.timer
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 30},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = 100 * self.timer
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 15},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 45 then
				local damage = 250 * self.timer
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = 100 * self.timer
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
				end
			end
		if timer >= 0.002 + tiem then
	core.add_particle({
		pos = pos,
		velocity = 0,
          acceleration = {x=0, y=0, z=0},
		expirationtime = 0.06,
		size = 3,
		texture = "rangedweapons_bullet_fly.png",
		glow = 15,
	})
		tiem = tiem + 0.002 
			end
		if self.timer >= 4.0 then
		self.object:remove()
			end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") then
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
		if node.name == "rangedweapons:barrel" or
		node.name == "doors:door_glass_a" or
		node.name == "doors:door_glass_b" or
		node.name == "xpanes:pane" or
		node.name == "xpanes:pane_flat" or
		node.name == "vessels:drinking_glass" or
		node.name == "vessels:glass_bottle" or
		   node.name == "default:glass" then
		core.get_node_timer(pos):start(0)
		end
		self.object:remove()
	end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end
end
end



core.register_entity("rangedweapons:awpshot", rangedweapons_awpshot )



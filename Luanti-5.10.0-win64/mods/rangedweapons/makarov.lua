
	local timer = 0
core.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.5 then
	for _, player in pairs(core.get_connected_players()) do
	if player:get_wielded_item():get_name() == "rangedweapons:makarov_rld" then
		player:set_wielded_item("rangedweapons:makarov")
				core.sound_play("", {player})

		end

		end
			end
				end)

core.register_craftitem("rangedweapons:makarov_rld", {
	stack_max= 1,
	wield_scale = {x=0.9,y=0.9,z=1.0},
	description = "***RELOADING MAKAROV PISTOL***",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_makarov_rld.png",
})

core.register_tool("rangedweapons:makarov", {
		description = "" ..core.colorize("#35cdff","Makarov pistol\n") ..core.colorize("#FFFFFF", "Ranged damage: 4-6\n")..core.colorize("#FFFFFF", "Accuracy: 90%\n")  ..core.colorize("#FFFFFF", "Mob knockback: 3\n") ..core.colorize("#FFFFFF", "Critical chance: 12%\n") ..core.colorize("#FFFFFF", "Critical damage: 8-12\n") ..core.colorize("#FFFFFF", "Ammunition: 9mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.5\n") ..core.colorize("#FFFFFF", "Gun type: Handgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	range = 0,
	wield_scale = {x=0.9,y=0.9,z=1.0},
	inventory_image = "rangedweapons_makarov.png",
	on_use = function(itemstack, user, pointd)
		timer = 0
		local inv = user:get_inventory()
		if not inv:contains_item("main", "rangedweapons:9mm 1") then
			core.sound_play("rangedweapons_empty", {object=user})
			return itemstack
		end
		if not core.setting_getbool("creative_mode") then
			inv:remove_item("main", "rangedweapons:9mm")
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:makarovshot")
			if obj then
				core.sound_play("rangedweapons_makarov", {object=obj})
				obj:set_velocity({x=dir.x * 20, y=dir.y * 20, z=dir.z * 20})
				obj:set_acceleration({x=dir.x * math.random(-1.0,1.0), y=math.random(-1.0,1.0), z=dir.z * math.random(-1.0,1.0)})
				obj:set_yaw(yaw + math.pi)
			pos.y = pos.y + 0
			local obj = core.add_entity(pos, "rangedweapons:empty_shell")
				core.sound_play("", {object=obj})
				obj:set_velocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:set_acceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:set_yaw(yaw + math.pi)
	core.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 0.75,
		size = 5,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:makarov_rld"
				end
			end
		end
		return itemstack
	end,
})
core.register_craft({
	output = 'rangedweapons:makarov',
	recipe = {
		{'', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'default:mese_crystal_fragment', 'default:beech_trunk'},
		{'', '', 'dye:black'}
	}
})

local rangedweapons_makarovshot = {
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
rangedweapons_makarovshot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.165 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:makarovshot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 12 then
					local damage = math.random(8,12)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 6},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(4,6)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 3},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 12 then
				local damage = math.random(8,12)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(4,6)
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

core.register_entity("rangedweapons:makarovshot", rangedweapons_makarovshot )

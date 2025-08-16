---wooden---


core.register_craftitem("rangedweapons:shuriken_wooden", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_wooden_shuriken.png",
})

core.register_craftitem("rangedweapons:wooden_shuriken", {
		description = "" ..core.colorize("#35cdff","Wooden shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 1-3\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 4\n") ..core.colorize("#FFFFFF", "Critical chance: 4%\n") ..core.colorize("#FFFFFF", "Critical damage: 2-5\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 10%\n")..core.colorize("#FFFFFF", "Projectile gravity: 8\n") ..core.colorize("#FFFFFF", "Projectile velocity: 12"),
	range = 0,
	stack_max= 100,
	inventory_image = "rangedweapons_wooden_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:woodensr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 12, y=dir.y * 12, z=dir.z * 12})
				obj:set_acceleration({x=dir.x * -1, y=-8, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_woodensr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_wooden"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_woodensr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.25 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:woodensr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 4 then
					local damage = math.random(2,5)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=8},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(1,3)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 4 then
				local damage = math.random(2,5)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(1,3)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 10 then
				core.add_item(self.lastpos, "rangedweapons:wooden_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:woodensr", rangedweapons_woodensr)

core.register_craft({
	output = 'rangedweapons:wooden_shuriken 20',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', '', 'group:wood'},
		{'', 'group:wood', ''}
	}
})


---stone---


core.register_craftitem("rangedweapons:shuriken_stone", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_stone_shuriken.png",
})

core.register_craftitem("rangedweapons:stone_shuriken", {
		description = "" ..core.colorize("#35cdff","stone shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 2-5\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 7\n") ..core.colorize("#FFFFFF", "Critical chance: 5%\n") ..core.colorize("#FFFFFF", "Critical damage: 4-8\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 15%\n")..core.colorize("#FFFFFF", "Projectile gravity: 9\n") ..core.colorize("#FFFFFF", "Projectile velocity: 10"),
	range = 0,
	stack_max= 125,
	inventory_image = "rangedweapons_stone_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:stonesr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 10, y=dir.y * 10, z=dir.z * 10})
				obj:set_acceleration({x=dir.x * -1, y=-9, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_stonesr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_stone"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_stonesr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.30 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:stonesr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 5 then
					local damage = math.random(4,8)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=14},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(2,5)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=7},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 5 then
				local damage = math.random(4,8)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(2,5)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 15 then
				core.add_item(self.lastpos, "rangedweapons:stone_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:stonesr", rangedweapons_stonesr)

core.register_craft({
	output = 'rangedweapons:stone_shuriken 10',
	recipe = {
		{'', 'default:rocks', ''},
		{'default:rocks', '', 'default:rocks'},
		{'', 'default:rocks', ''}
	}
})

---steel---


core.register_craftitem("rangedweapons:shuriken_steel", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_steel_shuriken.png",
})

core.register_craftitem("rangedweapons:steel_shuriken", {
		description = "" ..core.colorize("#35cdff","steel shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 3-8\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 2\n") ..core.colorize("#FFFFFF", "Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical damage: 7-16\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 25%\n")..core.colorize("#FFFFFF", "Projectile gravity: 6\n") ..core.colorize("#FFFFFF", "Projectile velocity: 15"),
	range = 0,
	stack_max= 175,
	inventory_image = "rangedweapons_steel_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:steelsr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:set_acceleration({x=dir.x * -1, y=-6, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_steelsr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_steel"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_steelsr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.17 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:steelsr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 6 then
					local damage = math.random(7,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(3,8)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=2},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 6 then
				local damage = math.random(7,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(3,8)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 25 then
				core.add_item(self.lastpos, "rangedweapons:steel_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:steelsr", rangedweapons_steelsr)

core.register_craft({
	output = 'rangedweapons:steel_shuriken 30',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''}
	}
})

---bronze---


core.register_craftitem("rangedweapons:shuriken_bronze", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_bronze_shuriken.png",
})

core.register_craftitem("rangedweapons:bronze_shuriken", {
		description = "" ..core.colorize("#35cdff","bronze shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 3-8\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 2\n") ..core.colorize("#FFFFFF", "Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical damage: 7-16\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 30%\n")..core.colorize("#FFFFFF", "Projectile gravity: 6\n") ..core.colorize("#FFFFFF", "Projectile velocity: 15"),
	range = 0,
	stack_max= 200,
	inventory_image = "rangedweapons_bronze_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:bronzesr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:set_acceleration({x=dir.x * -1, y=-6, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_bronzesr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_bronze"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_bronzesr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.17 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:bronzesr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 6 then
					local damage = math.random(7,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(3,8)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=2},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 6 then
				local damage = math.random(7,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(3,8)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 30 then
				core.add_item(self.lastpos, "rangedweapons:bronze_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:bronzesr", rangedweapons_bronzesr)

core.register_craft({
	output = 'rangedweapons:bronze_shuriken 35',
	recipe = {
		{'', 'default:bronze_ingot', ''},
		{'default:bronze_ingot', '', 'default:bronze_ingot'},
		{'', 'default:bronze_ingot', ''}
	}
})

---golden---


core.register_craftitem("rangedweapons:shuriken_golden", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_golden_shuriken.png",
})

core.register_craftitem("rangedweapons:golden_shuriken", {
		description = "" ..core.colorize("#35cdff","golden shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 4-10\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 4\n") ..core.colorize("#FFFFFF", "Critical chance: 7%\n") ..core.colorize("#FFFFFF", "Critical damage: 10-22\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 36%\n")..core.colorize("#FFFFFF", "Projectile gravity: 7\n") ..core.colorize("#FFFFFF", "Projectile velocity: 12"),
	range = 0,
	stack_max= 275,
	inventory_image = "rangedweapons_golden_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:goldensr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 12, y=dir.y * 12, z=dir.z * 12})
				obj:set_acceleration({x=dir.x * -1, y=-7, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_goldensr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_golden"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_goldensr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.24 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:goldensr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 7 then
					local damage = math.random(10,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=8},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(4,10)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 7 then
				local damage = math.random(10,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(4,10)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 36 then
				core.add_item(self.lastpos, "rangedweapons:golden_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:goldensr", rangedweapons_goldensr)

core.register_craft({
	output = 'rangedweapons:golden_shuriken 42',
	recipe = {
		{'', 'default:gold_ingot', ''},
		{'default:gold_ingot', '', 'default:gold_ingot'},
		{'', 'default:gold_ingot', ''}
	}
})

---mese---


core.register_craftitem("rangedweapons:shuriken_mese", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_mese_shuriken.png",
})

core.register_craftitem("rangedweapons:mese_shuriken", {
		description = "" ..core.colorize("#35cdff","mese shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 5-12\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 1\n") ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical damage: 13-28\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 45%\n")..core.colorize("#FFFFFF", "Projectile gravity: 5\n") ..core.colorize("#FFFFFF", "Projectile velocity: 20"),
	range = 0,
	stack_max= 340,
	inventory_image = "rangedweapons_mese_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:mesesr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 20, y=dir.y * 20, z=dir.z * 20})
				obj:set_acceleration({x=dir.x * -1, y=-5, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_mesesr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_mese"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_mesesr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.15 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:mesesr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 8 then
					local damage = math.random(13,28)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=2},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(5,12)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=1},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 8 then
				local damage = math.random(13,28)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(5,12)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 45 then
				core.add_item(self.lastpos, "rangedweapons:mese_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:mesesr", rangedweapons_mesesr)

core.register_craft({
	output = 'rangedweapons:mese_shuriken 55',
	recipe = {
		{'', 'default:mese_crystal', ''},
		{'default:mese_crystal', '', 'default:mese_crystal'},
		{'', 'default:mese_crystal', ''}
	}
})

---diamond---


core.register_craftitem("rangedweapons:shuriken_diamond", {
	wield_scale = {x=0.5,y=0.5,z=0.20},
	inventory_image = "rangedweapons_diamond_shuriken.png",
})

core.register_craftitem("rangedweapons:diamond_shuriken", {
		description = "" ..core.colorize("#35cdff","diamond shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 6-15\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 1\n") ..core.colorize("#FFFFFF", "Critical chance: 9%\n") ..core.colorize("#FFFFFF", "Critical damage: 18-35\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 60%\n")..core.colorize("#FFFFFF", "Projectile gravity: 4\n") ..core.colorize("#FFFFFF", "Projectile velocity: 25"),
	range = 0,
	stack_max= 420,
	inventory_image = "rangedweapons_diamond_shuriken.png",
	on_use = function(itemstack, user, pointd)
			if not core.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointd.type ~= "nothing" then
			local pointed = core.get_pointed_thing_position(pointd)
			if vector.distance(user:get_pos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = core.add_entity(pos, "rangedweapons:diamondsr")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 25, y=dir.y * 25, z=dir.z * 25})
				obj:set_acceleration({x=dir.x * -1, y=-4, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_diamondsr = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.33, y=.33},
textures = {"rangedweapons:shuriken_diamond"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_diamondsr.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.12 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:diamondsr" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 9 then
					local damage = math.random(18,35)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=2},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(6,15)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=1},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else

				if math.random(1, 100) <= 9 then
				local damage = math.random(18,35)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(6,15)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 60 then
				core.add_item(self.lastpos, "rangedweapons:diamond_shuriken")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:diamondsr", rangedweapons_diamondsr)

core.register_craft({
	output = 'rangedweapons:diamond_shuriken 69',
	recipe = {
		{'', 'default:diamond', ''},
		{'default:diamond', '', 'default:diamond'},
		{'', 'default:diamond', ''}
	}
})

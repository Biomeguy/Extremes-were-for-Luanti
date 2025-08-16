-- Platinum revolver

core.register_tool("xtraores:platinum_revolver", {
	description = "".. core.colorize("#68fff6", "Platinum revolver\n").. "Ranged damage: 6\nBullet speed: 30\nReload delay: 20\nXtraores gun level: 2",
	inventory_image = "xtraores_platinum_revolver.png",
	wield_scale = {x=1.0,y=1.0,z=1.0},
	range = 0,
	on_use = function(item, user, pointd)
		meta = user:get_meta()
		xo_wpn_c_down = meta:get_int("xo_weapon_cooldown") or 0
		if xo_wpn_c_down > 20 then
		shooter = user
			meta:set_int("xo_weapon_cooldown",0) 
			local inv = user:get_inventory()
			if not inv:contains_item("main", "xtraores:platinum_bullet 1") then
				core.sound_play("xtraores_empty", {object=user})
				return item
			end
			if not core.settings:get_bool("creative_mode") then
				inv:remove_item("main", "xtraores:platinum_bullet")	
				item:add_wear(65535/1000)
			end
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local yaw = user:get_look_horizontal()
			if pos and dir and yaw then
				pos.y = pos.y + 1.6
				local obj = core.add_entity(pos, "xtraores:platinumshot")
				if obj then
					core.sound_play("xtraores_revolver", {object=obj})
					obj:set_velocity({x=dir.x * 30, y=dir.y * 30, z=dir.z * 30})
					obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
					obj:set_yaw(yaw + math.pi)
				pos.y = pos.y - 0.2
				local obj = core.add_entity(pos, "xtraores:gunsmoke")
					core.sound_play("xtraores_revolver", {object=obj})
					obj:set_velocity({x=dir.x * 3, y=dir.y * 3, z=dir.z * 3})
					obj:set_acceleration({x=dir.x * -4, y=2, z=dir.z * -4})
					obj:set_yaw(yaw + math.pi)

					local ent = obj:get_luaentity()
					if ent then
						ent.player = ent.player or user
					end
				end
			end
		end
		return item
	end,
})

local xtraores_platinumshot = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=0.25, y=0.4,},
textures = {'xtraores:platinum_shot'},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_platinumshot.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.10 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:platinumshot" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 6},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 6},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:platinumshot", xtraores_platinumshot)

core.register_craftitem("xtraores:platinum_shot", {
	inventory_image = "xtraores_platinum_shot.png",
})

core.register_craftitem("xtraores:platinum_bullet", {
	description = "".. core.colorize("#68fff6", "Platinum  bullet\n").. "Used by guns of level 2\nXtraores ammo level: 2",
	stack_max = 500,
	inventory_image = "xtraores_platinum_bullet.png",
})

core.register_craft( {
	type = "shapeless",
	output = "xtraores:platinum_revolver",
	recipe = {"xtraores:platinum_revolver_base", "xtraores:platinum_mag", "xtraores:revolver_handle"},
})

core.register_craft({
	output = 'xtraores:platinum_bullet 25',
	recipe = {
		{'default:gold_ingot'},
		{'xtraores:platinum_ingot'},
		{'xtraores:platinum_ingot'},
	}
})

-- Cobalt handgun

core.register_tool("xtraores:cobalt_handgun", {
	description = "".. core.colorize("#68fff6", "Cobalt handgun\n").. "Ranged damage: 12\nBullet speed: 45\nReload delay: 15\nXtraores gun level: 4",
	inventory_image = "xtraores_cobalt_handgun.png",
	wield_scale = {x=1.0,y=1.0,z=1.0},
	range = 0,
	on_use = function(item, user, pointd)
		meta = user:get_meta()
		xo_wpn_c_down = meta:get_int("xo_weapon_cooldown") or 0
		if xo_wpn_c_down > 15 then
		shooter = user
			meta:set_int("xo_weapon_cooldown",0) 
			local inv = user:get_inventory()
			if not inv:contains_item("main", "xtraores:cobalt_bullet 1") then
				core.sound_play("xtraores_empty", {object=user})
				return item
			end
			if not core.settings:get_bool("creative_mode") then
				inv:remove_item("main", "xtraores:cobalt_bullet")	
				item:add_wear(65535/1750)
			end
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local yaw = user:get_look_horizontal()
			if pos and dir and yaw then
				pos.y = pos.y + 1.6
				local obj = core.add_entity(pos, "xtraores:cobaltshot")
				if obj then
					core.sound_play("xtraores_handgun", {object=obj})
					obj:set_velocity({x=dir.x * 45, y=dir.y * 45, z=dir.z * 45})
					obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
					obj:set_yaw(yaw + math.pi)
				pos.y = pos.y - 0.2
				local obj = core.add_entity(pos, "xtraores:gunsmoke")
					core.sound_play("xtraores_handgun", {object=obj})
					obj:set_velocity({x=dir.x * 3, y=dir.y * 3, z=dir.z * 3})
					obj:set_acceleration({x=dir.x * -4, y=2, z=dir.z * -4})
					obj:set_yaw(yaw + math.pi)

					local ent = obj:get_luaentity()
					if ent then
						ent.player = ent.player or user
					end
				end
			end
		end
		return item
	end,
})

local xtraores_cobaltshot = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=0.25, y=0.4,},
textures = {'xtraores:cobalt_shot'},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_cobaltshot.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.07 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:cobaltshot" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 12},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 12},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:cobaltshot", xtraores_cobaltshot)

core.register_craftitem("xtraores:cobalt_shot", {
	inventory_image = "xtraores_cobalt_shot.png",
})

core.register_craftitem("xtraores:cobalt_bullet", {
	description = "".. core.colorize("#68fff6", "Cobalt  bullet\n").. "Used by guns of level 4\nXtraores ammo level: 4",
	stack_max = 500,
	inventory_image = "xtraores_cobalt_bullet.png",
})

core.register_craft( {
	type = "shapeless",
	output = "xtraores:cobalt_handgun",
	recipe = {"xtraores:cobalt_top", "xtraores:cobalt_base", "xtraores:cobalt_handle"},
})

core.register_craft({
	output = 'xtraores:cobalt_bullet 25',
	recipe = {
		{'xtraores:cobalt_ingot'},
		{'xtraores:cobalt_ingot'},
		{'default:mese_crystal'},
	}
})

-- Orichalcum rifle

core.register_tool("xtraores:orichalcum_rifle", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle\n").. "Ranged damage: 26\nBullet speed: 70\nReload delay: 50\nXtraores gun level: 10",
	inventory_image = "xtraores_orichalcum_rifle.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 0,
	on_use = function(item, user, pointd)
		meta = user:get_meta()
		xo_wpn_c_down = meta:get_int("xo_weapon_cooldown") or 0
		if xo_wpn_c_down > 50 then
		shooter = user
			meta:set_int("xo_weapon_cooldown",0) 
			local inv = user:get_inventory()
			if not inv:contains_item("main", "xtraores:orichalcum_bullet 1") then
				core.sound_play("xtraores_empty", {object=user})
				return item
			end
			if not core.settings:get_bool("creative_mode") then
				inv:remove_item("main", "xtraores:orichalcum_bullet")	
				item:add_wear(65535/9001)
			end
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local yaw = user:get_look_horizontal()
			if pos and dir and yaw then
				pos.y = pos.y + 1.6
				local obj = core.add_entity(pos, "xtraores:orichalcumshot")
				if obj then
					core.sound_play("xtraores_rifle", {object=obj})
					obj:set_velocity({x=dir.x * 70, y=dir.y * 70, z=dir.z * 70})
					obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
					obj:set_yaw(yaw + math.pi)
				pos.y = pos.y - 0.2
				local obj = core.add_entity(pos, "xtraores:gunsmoke")
					core.sound_play("xtraores_rifle", {object=obj})
					obj:set_velocity({x=dir.x * 3, y=dir.y * 3, z=dir.z * 3})
					obj:set_acceleration({x=dir.x * -4, y=2, z=dir.z * -4})
					obj:set_yaw(yaw + math.pi)

					local ent = obj:get_luaentity()
					if ent then
						ent.player = ent.player or user
					end
				end
			end
		end
		return item
	end,
})

local xtraores_orichalcumshot = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=.4, y=.8},
textures = {'xtraores:orichalcum_shot'},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_orichalcumshot.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.05 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:orichalcumshot" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 26},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 26},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:orichalcumshot", xtraores_orichalcumshot)

core.register_craftitem("xtraores:orichalcum_shot", {
	inventory_image = "xtraores_orichalcum_shot.png",
	wield_scale = {x=2.0,y=1.0,z=1.0},
})

core.register_craftitem("xtraores:orichalcum_bullet", {
	description = "".. core.colorize("#68fff6", "Orichalcum  bullet\n").. "Used by guns of level 10\nXtraores ammo level: 10",
	stack_max = 500,
	inventory_image = "xtraores_orichalcum_bullet.png",
})

core.register_craft( {
	type = "shapeless",
	output = "xtraores:orichalcum_rifle",
	recipe = {"xtraores:orichalcum_rifle_barrel", "xtraores:orichalcum_rifle_scope", "xtraores:orichalcum_rifle_base",
	"xtraores:orichalcum_rifle_stock", "xtraores:orichalcum_rifle_grip", "xtraores:orichalcum_rifle_handle" },
})

core.register_craft({
	output = 'xtraores:orichalcum_bullet 30',
	recipe = {
		{'xtraores:orichalcum_ingot'},
		{'xtraores:orichalcum_ingot'},
		{'xtraores:antracite_ore'},
	}
})

local xtraores_gunsmoke = {
	initial_properties = {
physical = false,
visual = "sprite",
visual_size = {x=0.5, y=0.5,},
textures = {'tnt_smoke.png'},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_gunsmoke.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 1 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 100)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:gunsmoke" and obj:get_luaentity().name ~= "__builtin:item" then

					self.object:remove()
				end
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end

			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end
core.register_entity("xtraores:gunsmoke", xtraores_gunsmoke)

-- Radioactive sword

core.register_tool("xtraores:sword_radioactive", {
	description = "".. core.colorize("#68fff6", "Radioactive sword\n").. "Mele damage: 30\nFull punch interval: 0.60\nRange: 5.9\nLaunches radioactive projectiles that deal 15 damage when swung\nXtraores tool level: 11",
	inventory_image = "xtraores_sword_radioactive.png",
	projectile_attack = "xtraores:radioactive_ray",
	projectile_sound = "xtraores_swosh",
	needed_ammo = "",
	consumed_ammo = 0,
	projectile_cooldown = 30,
	projectile_velocity = 40,
	projectile_gravity = 0,
	projectile_spread = 0,
	range = 5.9,
	tool_capabilities = {
		full_punch_interval = 0.60,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.44, [2]=0.26, [3]=0.012}, uses=390, maxlevel=3},
		},
		damage_groups = {fleshy=30},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = 'xtraores:sword_radioactive',
	recipe = {
		{'', 'xtraores:uranium_ingot', 'xtraores:uranium_ingot'},
		{'', 'xtraores:uranium_ingot', ''},
		{'xtraores:titanium_ingot', 'xtraores:duraglass_handle', ''},
	}
})

local xtraores_radioactive_ray = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=.4, y=.8},
textures = {"xtraores:radioactive_ray_shot"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_radioactive_ray.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.1 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.6)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:radioactive_ray" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 15},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 15},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:radioactive_ray", xtraores_radioactive_ray)

core.register_craftitem("xtraores:radioactive_ray_shot", {
	inventory_image = "xtraores_radioactive_projectile.png",
	wield_scale = {x=2.0,y=2.0,z=3.5},
})

-- Titanium guns

core.register_tool("xtraores:titanium_machinegun", {
	description = "".. core.colorize("#68fff6", "Titanium machinegun\n").. "Ranged damage: 22\nBullet speed: 45\nReload delay: 5\nXtraores gun level: 11",
	inventory_image = "xtraores_titanium_machinegun.png",
	projectile_attack = "xtraores:titaniumshot_machinegun",
	projectile_sound = "xtraores_machinegun",
	needed_ammo = "xtraores:titanium_bullet 1",
	consumed_ammo = 0,
	projectile_cooldown = 7,
	projectile_velocity = 45,
	projectile_gravity = 0,
	projectile_spread = 20,
	range = 0,
})

core.register_tool("xtraores:titanium_handgun", {
	description = "".. core.colorize("#68fff6", "Titanium handgun\n").. "Ranged damage: 28\nBullet speed: 55\nReload delay: 12\nXtraores gun level: 11",
	inventory_image = "xtraores_titanium_handgun.png",
	wield_scale = {x=1.0,y=1.0,z=1.0},
	range = 0,
	on_use = function(item, user, pointd)
		meta = user:get_meta()
		xo_wpn_c_down = meta:get_int("xo_weapon_cooldown") or 0
		if xo_wpn_c_down > 12 then
		shooter = user
			meta:set_int("xo_weapon_cooldown",0) 
			local inv = user:get_inventory()
			if not inv:contains_item("main", "xtraores:titanium_bullet 1") then
				core.sound_play("xtraores_empty", {object=user})
				return item
			end
			if not core.settings:get_bool("creative_mode") then
				inv:remove_item("main", "xtraores:titanium_bullet")	
				item:add_wear(65535/20000)
			end
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local yaw = user:get_look_horizontal()
			if pos and dir and yaw then
				pos.y = pos.y + 1.6
				local obj = core.add_entity(pos, "xtraores:titaniumshot_handgun")
				if obj then
					core.sound_play("xtraores_handgun", {object=obj})
					obj:set_velocity({x=dir.x * 55, y=dir.y * 55, z=dir.z * 55})
					obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
					obj:set_yaw(yaw + math.pi)
				pos.y = pos.y - 0.2
				local obj = core.add_entity(pos, "xtraores:gunsmoke")
					core.sound_play("xtraores_handgun", {object=obj})
					obj:set_velocity({x=dir.x * 3, y=dir.y * 3, z=dir.z * 3})
					obj:set_acceleration({x=dir.x * -4, y=2, z=dir.z * -4})
					obj:set_yaw(yaw + math.pi)

					local ent = obj:get_luaentity()
					if ent then
						ent.player = ent.player or user
					end
				end
			end
		end
		return item
	end,
})

local xtraores_titaniumshot_handgun = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=.25, y=.4},
textures = {'xtraores:titanium_shot'},
collisionbox = {0,0,0, 0,0,0},
	},
	lastpos= {},
	timer = 0,
}
xtraores_titaniumshot_handgun.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.08 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:titaniumshot_handgun" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 28},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 28},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:titaniumshot_handgun", xtraores_titaniumshot_handgun)

local xtraores_titaniumshot_machinegun = {
	initial_properties = {
physical = false,
glow = 20,
visual = "wielditem",
visual_size = {x=.25, y=.4},
textures = {'xtraores:titanium_shot'},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
xtraores_titaniumshot_machinegun.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	local shooter = shooter or self.object

	if self.timer > 0.1 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:titaniumshot_machinegun" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(shooter, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = 22},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			else
				obj:punch(shooter, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = 22},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:titaniumshot_machinegun", xtraores_titaniumshot_machinegun)

core.register_craftitem("xtraores:titanium_shot", {
	inventory_image = "xtraores_titanium_shot.png",
})

core.register_craftitem("xtraores:titanium_bullet", {
	description = "".. core.colorize("#68fff6", "titanium  bullet\n").. "Used by guns of level 11\nXtraores ammo level: 11",
	stack_max = 500,
	inventory_image = "xtraores_titanium_bullet.png",
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:titanium_handgun",
	recipe = {"xtraores:titanium_gun_barrel","xtraores:titanium_handgun_base", "xtraores:titanium_gun_handle"},
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:titanium_machinegun",
	recipe = {"xtraores:titanium_gun_barrel", "xtraores:titanium_machinegun_base", "xtraores:titanium_machinegun_stock",
	"xtraores:titanium_gun_barrel", "xtraores:titanium_machinegun_mag", "xtraores:titanium_gun_handle"},
})

core.register_craft({
	output = 'xtraores:titanium_bullet 100',
	recipe = {
		{'default:diamond'},
		{'xtraores:titanium_ingot'},
		{'xtraores:titanium_ingot'},
	}
})



	local timer = 0
core.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.4 then
	for _, player in pairs(core.get_connected_players()) do
	if player:get_wielded_item():get_name() == "rangedweapons:beretta_rld" then
		player:set_wielded_item("rangedweapons:beretta")
				core.sound_play("", {player})
	end
		end
			end
				end)


core.register_craftitem("rangedweapons:beretta_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "***RELOADING BERETTA M9***",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_beretta_rld.png",
})


core.register_tool("rangedweapons:beretta", {
		description = "" ..core.colorize("#35cdff","Beretta M9\n") ..core.colorize("#FFFFFF", "Ranged damage: 5-8\n") ..core.colorize("#FFFFFF", "Accuracy: 94%\n")     ..core.colorize("#FFFFFF", "Mob knockback: 3\n")  ..core.colorize("#FFFFFF", "Critical chance: 15%\n") ..core.colorize("#FFFFFF", "Critical damage: 9-14\n") ..core.colorize("#FFFFFF", "Ammunition: 9mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.4\n") ..core.colorize("#FFFFFF", "Gun type: Handgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	wield_scale = {x=1.1,y=1.1,z=1.05},
	range = 0,
	inventory_image = "rangedweapons_beretta.png",
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
			local obj = core.add_entity(pos, "rangedweapons:berettashot")
			if obj then
				core.sound_play("rangedweapons_beretta", {object=obj})
				obj:set_velocity({x=dir.x * 25, y=dir.y * 25, z=dir.z * 25})
				obj:set_acceleration({x=dir.x * math.random(-0.6,0.6), y=math.random(-0.6,0.6), z=dir.z * math.random(-0.6,0.6)})
				obj:set_yaw(yaw + math.pi)
			pos.y = pos.y + 0
			local obj = core.add_entity(pos, "rangedweapons:empty_shell")
				core.sound_play("", {object=obj})
				obj:set_velocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:set_acceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:set_yaw(yaw + math.pi)
			local obj = core.add_entity(pos, "rangedweapons:smoke")
	core.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 0.7,
		size = 5,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:beretta_rld"
				end
			end
		end
		return itemstack
	end,
})
core.register_craft({
	output = 'rangedweapons:beretta',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'default:mese_crystal', 'rangedweapons:plastic_sheet'},
		{'', '', 'rangedweapons:plastic_sheet'}
	}
})

local rangedweapons_berettashot = {
	initial_properties = {
physical = false,
visual = "sprite",
visual_size = {x=0, y=0},
textures = {"blank.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_berettashot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.11 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:berettashot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 15 then
					local damage = math.random(9,14)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=6},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(5,8)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=3},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 15 then
				local damage = math.random(9,14)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(5,8)
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

core.register_entity("rangedweapons:berettashot", rangedweapons_berettashot )

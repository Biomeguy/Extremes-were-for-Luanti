
core.register_craftitem("rangedweapons:thrown_javelin", {
	wield_scale = {x=2.0,y=2.0,z=1.0},
	inventory_image = "rangedweapons_thrown_javelin.png",
})

core.register_craftitem("rangedweapons:javelin", {
		description = "" ..core.colorize("#35cdff","Javelin\n") ..core.colorize("#FFFFFF", "Mele damage: 9\n") ..core.colorize("#FFFFFF", "Mele range: 5\n")..core.colorize("#FFFFFF", "Full punch interval: 1.25\n")  ..core.colorize("#FFFFFF", "Ranged damage: 4-16\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 10\n") ..core.colorize("#FFFFFF", "Critical chance: 15%\n") ..core.colorize("#FFFFFF", "Critical damage: 25-45\n") ..core.colorize("#FFFFFF", "javelin survival rate: 95%\n")..core.colorize("#FFFFFF", "Projectile gravity: 4\n") ..core.colorize("#FFFFFF", "Projectile velocity: 20\n")..core.colorize("#ffc000", "Right-click to throw, Left-click to stab") ,
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 5,
	stack_max= 10,
	inventory_image = "rangedweapons_javelin.png",
	on_secondary_use = function(itemstack, user, pointd)
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
			local obj = core.add_entity(pos, "rangedweapons:javelin")
			if obj then
				core.sound_play("rangedweapons_throw", {object=obj})
				obj:set_velocity({x=dir.x * 20, y=dir.y * 20, z=dir.z * 20})
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
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level = 0,
		groupcaps = {
			stabby = {times={[1]=0.25, [2]=0.50, [3]=0.75}, uses=0, maxlevel=1},
		},
		damage_groups = {fleshy=9,knockback=10},
	}
})

local rangedweapons_javelin = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.5, y=.5},
textures = {"rangedweapons:thrown_javelin"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_javelin.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer > 0.15 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:javelin" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 15 then
					local damage = math.random(25,45)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=20},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				core.add_item(self.lastpos, "rangedweapons:javelin")
			end
					else
					local damage = math.random(4,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=10},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				core.add_item(self.lastpos, "rangedweapons:javelin")
			end
				end
			end
			else

				if math.random(1, 100) <= 15 then
				local damage = math.random(25,45)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					core.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				core.add_item(self.lastpos, "rangedweapons:javelin")
			end
				else
				local damage = math.random(4,16)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				core.add_item(self.lastpos, "rangedweapons:javelin")
			end
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				core.add_item(self.lastpos, "rangedweapons:javelin")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:javelin", rangedweapons_javelin)

core.register_craft({
	output = "rangedweapons:javelin",
	recipe = {
		{"default:diamond", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "group:stick"},
		{"", "", "group:stick"}
	}
})

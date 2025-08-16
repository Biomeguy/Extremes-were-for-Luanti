core.register_craft({
	output = "rangedweapons:hand_grenade",
	recipe = {
		{"", "", "default:mese_crystal_fragment"},
		{"default:steel_ingot", "tnt:gunpowder", ""},
		{"tnt:gunpowder", "tnt:gunpowder", ""}
	}
})

core.register_craftitem("rangedweapons:pin", {
	wield_scale = {x=2.5,y=2.5,z=1.0},
	inventory_image = "rangedweapons_pin.png",
})

local rangedweapons_grenade_pin = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=0.15, y=0.15},
textures = {"rangedweapons:pin"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_grenade_pin.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
		self.object:remove()
			core.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
			end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end



core.register_entity("rangedweapons:grenade_pin", rangedweapons_grenade_pin)

local grenade_boom = {
	name = "rangedweapons:grenade_explosion",
	--description = "DuN mInD mEh...",
	radius = 3,
	tiles = {
		side = "blank.png",
		top = "blank.png",
		bottom = "blank.png",
		burning = "blank.png"
	},
}

core.register_craftitem("rangedweapons:hand_grenade", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
		description = "" ..core.colorize("#35cdff","Hand grenade\n") ..core.colorize("#FFFFFF", "Explosion radius: 3\n")..core.colorize("#FFFFFF", "Throw force: 12\n")  ..core.colorize("#FFFFFF", "Grenade gravitational pull: 6\n") ..core.colorize("#ffc000", "Right-click to unpin, Left click to throw after unpinning\n") ..core.colorize("#ffc000", "Thrown or not, it will explode after 3 secons from unpinning, be careful!"),
	range = 0,
	inventory_image = "rangedweapons_hand_grenade.png",
})
core.register_craftitem("rangedweapons:hand_grenade_nopin", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "***HURRY UP AND THROW IT!!!***",
	range = 0,
	inventory_image = "rangedweapons_hand_grenade_nopin.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointd)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:grenade")
			if obj then
				obj:set_velocity({x=dir.x * 12, y=dir.y * 12, z=dir.z * 12})
				obj:set_acceleration({x=dir.x * -1, y=-6, z=dir.z * -1})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = ""
				end
			end
		end
		return itemstack
	end,
})

tnt.register_tnt(grenade_boom)

	local timer = 0
core.register_globalstep(function(dtime, player, pos)
	timer = timer + dtime;
	if timer >= 0.001 then
	for _, player in pairs(core.get_connected_players()) do
		local pos = player:get_pos()
		local controls = player:get_player_control()
		if player:get_wielded_item():get_name() == "rangedweapons:hand_grenade" then
		if controls.RMB then
		player:set_wielded_item("rangedweapons:hand_grenade_nopin")
		timer = 0
				core.sound_play("rangedweapons_reload_a", {player})
		local dir = player:get_look_dir()
		local yaw = player:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "rangedweapons:grenade_pin")
				core.sound_play("", {object=obj})
obj:set_velocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
obj:set_acceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:set_yaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or player
				end
			end

end
	end

	if timer >= 3.0 and
		 player:get_wielded_item():get_name() == "rangedweapons:hand_grenade_nopin" then
		player:set_wielded_item("")
		timer = 0
		tnt.boom(pos, grenade_boom)

		end
			end
				end
				end)

local rangedweapons_grenade = {
	initial_properties = {
physical = false,
visual = "sprite",
visual_size = {x=0.5, y=0.5},
textures = {"rangedweapons_hand_grenade_nopin.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_grenade.on_step = function(self, dtime, pos)
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.x ~= nil then
	if core.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-1, z=vel.z*-0.3})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end
	end
	self.timer = timer
	if self.timer > 3.0 then
	tnt.boom(pos, grenade_boom)
	self.object:remove()
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}

end



core.register_entity("rangedweapons:grenade", rangedweapons_grenade)



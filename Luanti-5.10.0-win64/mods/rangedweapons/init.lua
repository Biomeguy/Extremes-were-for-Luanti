local modpath = core.get_modpath(core.get_current_modname())

dofile(modpath.."/settings.lua")
dofile(modpath.."/misc.lua")
dofile(modpath.."/ammo.lua")
dofile(modpath.."/bullet_stuff.lua")

if shurikens == true then
	dofile(modpath.."/shurikens.lua")
end

if handguns == true then
	dofile(modpath.."/makarov.lua")
	dofile(modpath.."/luger.lua")
	dofile(modpath.."/beretta.lua")
	dofile(modpath.."/glock17.lua")
end

if javelins == true then
	dofile(modpath.."/javelin.lua")
end

if power_weapons == true then
	dofile(modpath.."/generator.lua")
	dofile(modpath.."/laser_blaster.lua")
	dofile(modpath.."/laser_rifle.lua")
	dofile(modpath.."/laser_shotgun.lua")
end

if machine_pistols == true then
	dofile(modpath.."/tmp.lua")
	dofile(modpath.."/tec9.lua")
	dofile(modpath.."/uzi.lua")
	dofile(modpath.."/kriss_sv.lua")
end
if shotguns == true then
	dofile(modpath.."/remington.lua")
	dofile(modpath.."/spas12.lua")
	dofile(modpath.."/benelli.lua")
	dofile(modpath.."/jackhammer.lua")
	dofile(modpath.."/aa12.lua")
end
if sub_machineguns == true then
	dofile(modpath.."/mp5.lua")
	dofile(modpath.."/ump.lua")
	dofile(modpath.."/mp40.lua")
end
if rifles == true then
	dofile(modpath.."/awp.lua")
	dofile(modpath.."/svd.lua")
	dofile(modpath.."/m200.lua")
end
if heavy_machineguns == true then
	dofile(modpath.."/m60.lua")
	dofile(modpath.."/rpk.lua")
	dofile(modpath.."/minigun.lua")
end
if magnums_and_revolvers == true then
	dofile(modpath.."/deagle.lua")
	dofile(modpath.."/python.lua")
	dofile(modpath.."/taurus.lua")
end
if assault_rifles == true then
	dofile(modpath.."/m16.lua")
	dofile(modpath.."/g36.lua")
	dofile(modpath.."/ak47.lua")
	dofile(modpath.."/scar.lua")
end

if explosives == true then
	dofile(modpath.."/explosives.lua")
	dofile(modpath.."/m79.lua")
	dofile(modpath.."/milkor.lua")
	dofile(modpath.."/rpg.lua")
	dofile(modpath.."/hand_grenade.lua")
end

if door_breaking == true then
	dofile(modpath.."/door_breaking.lua")
end

if glass_breaking == true then
	dofile(modpath.."/glass_breaking.lua")
end
if glass_breaking == false then
core.register_abm({
	nodenames = {"rangedweapons:broken_glass"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		if core.get_node(pos).name == "rangedweapons:broken_glass" then
			node.name = "air"
			core.set_node(pos, node)
		end
	end
})
end

local rangedweapons_empty_shell = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=0.3, y=0.3},
textures = {"rangedweapons:shelldrop"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_empty_shell.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.y ~= nil then
		if core.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-0.75, z=vel.z*-0.3})
			core.sound_play("rangedweapons_shellhit", {pos = self.lastpos, gain = 0.8})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end
	end
	if self.timer > 1.69 then
			core.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:empty_shell", rangedweapons_empty_shell )



local rangedweapons_empty_shell_shotgun = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=0.35, y=0.35},
textures = {"rangedweapons:shell_shotgundrop"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_empty_shell_shotgun.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.y ~= nil then
		if core.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-0.75, z=vel.z*-0.3})
			core.sound_play("rangedweapons_shellhit", {pos = self.lastpos, gain = 0.8})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end
	end
	if self.timer > 1.69 then
			core.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:empty_shell_shotgun", rangedweapons_empty_shell_shotgun )



local rangedweapons_empty_shell_white = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.3, y=.3},
textures = {"rangedweapons:shell_whitedrop"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_empty_shell_white.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.y ~= nil then
		if core.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-0.75, z=vel.z*-0.3})
			core.sound_play("rangedweapons_shellhit", {pos = self.lastpos, gain = 0.8})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end
	end
	if self.timer > 1.69 then
			core.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:empty_shell_white", rangedweapons_empty_shell_white )



local rangedweapons_empty_shell_grenade = {
	initial_properties = {
physical = false,
visual = "wielditem",
visual_size = {x=.3, y=.3},
textures = {"rangedweapons:shell_grenadedrop"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
rangedweapons_empty_shell_grenade.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	if self.lastpos.y ~= nil then
		if core.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-0.75, z=vel.z*-0.3})
			core.sound_play("rangedweapons_shellhit", {pos = self.lastpos, gain = 0.8})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end
	end
	if self.timer > 1.69 then
			core.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("rangedweapons:empty_shell_grenade", rangedweapons_empty_shell_grenade )


core.register_abm({
	nodenames = {"doors:hidden"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		pos.y = pos.y-1
		if core.get_node(pos).name == "air" then
			pos.y = pos.y+1
			core.set_node(pos, {name = "air"})
		end
	end
})



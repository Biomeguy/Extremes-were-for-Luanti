
-- License dwtfywt jordan4ibanez

-- give a new player the xn string
core.register_on_newplayer(function(player)
	player:get_meta():set_int("_extra_energy", 0)
end)
-- drop player's xn if they die
local extra_energy = nil
core.register_on_dieplayer(function(player)
	if player:get_meta():get_int("_extra_energy") ~= nil then
		local pos = player:get_pos()
		pos.y = pos.y+2
		extra_energy = tonumber(player:get_meta():get_int("_extra_energy"))
		local obj = core.add_entity(pos, "extra_energy:orb")
	if extra_energy > 1 then
		obj:get_luaentity().value = extra_energy
		if extra_energy < 100 then
	obj:set_properties({visual_size = {x=.5, y=.5}})
		else
	obj:set_properties({visual_size = {x=1,y=1}, collisionbox = {-.2,-.25,-.2,.2,.2,.2}})
		end
	end
		obj:set_velocity({x = math.random(-3, 3), y = 3, z = math.random(-3, 3)})
	end
	player:get_meta():set_int("_extra_energy", 0)
end)
local xn_hud = nil
-- hudbar by D00Med
core.after(.1, function()
core.register_on_joinplayer(function(player)
	if player:get_meta():get_int("_extra_energy") == nil then
		player:get_meta():set_int("_extra_energy", 0)
	return end
	extra_energy = tonumber(player:get_meta():get_int("_extra_energy"))
	if player:get_meta():get_string("_infinite_energy") == "true" then
		extra_energy = 1000
	end
	xn_hud = player:hud_add({
		type = "statbar",
		position = {x= .5, y= 1},
		name = "extra_energy_statbar",
		text = "extra_energy_hud.png",
		text2 = "extra_energy_hud_bg.png",
		number = extra_energy/20,
		item = 50,
		direction = 0,
		size = {x=20, y=3},
		offset = {x= -251, y= -67},
	})
end)
end)

core.register_globalstep(function(dtime)
	for _,player in ipairs(core.get_connected_players()) do
extra_energy = tonumber(player:get_meta():get_int("_extra_energy"))
if extra_energy <= 1000 then
	local number = extra_energy/20
	player:hud_change(xn_hud, "number", number)
end
	end
end)

core.register_entity("extra_energy:orb", {
	initial_properties = {
		physical = true,
		visual = "sprite",
		textures = {"extra_energy_orb.png"},
		visual_size = {x=.3, y=.3},
		collisionbox = {-.1,-.1,-.1, .1,.1,.1},
		pointable = false,
		collide_with_objects = false,
		glow = 14,
	},
	age = 0,
	value = 1,
	collect = true,
	physical_state = true,
	get_staticdata = function(self)
		return core.serialize({value = self.value, age = self.age})
	end,
	on_activate = function(self, staticdata, dtime_s)
		self.object:set_armor_groups({immortal=1})
		self.object:set_velocity({x=0, y=1, z=0})
		self.object:set_acceleration({x=0, y=-9.5, z=0})
	if not staticdata or staticdata == "" then return end
	local data = core.deserialize(staticdata)
	if not data.value then return end
		self.age = (data.age or 0) + dtime_s

		if data.value > 1 then
	self.value = data.value
	if data.value < 100 then
self.object:set_properties({visual_size = {x=.5, y=.5}})
	else
self.object:set_properties({visual_size = {x=1, y=1}, collisionbox = {-.2,-.25,-.2,.2,.2,.2}})
	end
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age + dtime
		if self.age > 9000 then
			self.object:remove() return end
		local pos = self.object:get_pos()	if not pos then return end
if core.get_node(pos).name == "ecology:sumbrellia" then
	local meta = core.get_meta(pos)
	local xn = meta:get_int("exen")
if xn <= 19 then
	self.collect = false
	self.object:set_velocity({x=0,y=0,z=0})
	meta:set_int("exen", xn+1)
	self.value = self.value-1
--	core.chat_send_all("Extra energy values old:".. xn .." new:".. meta:get_int("exen") .." from:".. self.value+1)
	if self.value == 0 then
self.object:remove()
	end
	core.sound_play("orb", {pos = pos, max_hear_distance = 8}) return end
end
		local player
		for _,obj in ipairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_hp() > 0 then
		player = obj
		self.collect = false
	end
		end
		if self.collect then
		for _,obj in ipairs(core.get_objects_inside_radius(pos, 3)) do
	if obj:is_player() and obj:get_hp() > 0 then
		player = obj
	end
		end end
		if player then
	self.physical_state = false
	self.object:set_properties({physical = false})
	local pp = player:get_pos()
	pp.y = pp.y+.5
if not self.collect then
	self.object:set_velocity({x=0,y=0,z=0})
	extra_energy = tonumber(player:get_meta():get_int("_extra_energy"))
	if extra_energy ~= 1000 then
local new_xn = 1000
if player:get_meta():get_string("_infinite_energy") ~= "true" then
	if extra_energy ~= nil then
		new_xn = extra_energy+self.value
	end
end
	if new_xn <= 1000 then
local pname = player:get_player_name()
player:get_meta():set_int("_extra_energy", new_xn)
if new_xn == 100 or new_xn == 200 or new_xn == 300 or new_xn == 400 or new_xn == 500
or new_xn == 600 or new_xn == 700 or new_xn == 800 or new_xn == 900 or new_xn == 1000 then
	core.sound_play("level_up", {to_player = pname})
end
core.sound_play("orb", {to_player = pname})
self.object:remove()
return
	end
	end
end
	local vec = {x=pp.x-pos.x, y=pp.y-pos.y, z=pp.z-pos.z}
	vec.x = vec.x*3  vec.y = vec.y*3  vec.z = vec.z*3
	self.object:set_velocity(vec)
	self.object:set_acceleration({x=0, y=0, z=0})
	self.age = 0
	return
		end
		self.collect = true
		local nn = core.get_node({x=pos.x,y=pos.y-.3,z=pos.z}).name
		if not core.registered_nodes[nn] or core.registered_nodes[nn].walkable or nn == "ignore" then
			if self.physical_state then
				self.physical_state = false
				self.object:set_properties({physical = false})
				self.object:set_velocity({x=0, y=0, z=0})
				self.object:set_acceleration({x=0, y=0, z=0})
			end
		else
			if not self.physical_state then
				self.physical_state = true
				self.object:set_properties({physical = true})
				self.object:set_velocity({x=0,y=0,z=0})
				self.object:set_acceleration({x=0, y=-9.5, z=0})
			end
		end
	end,
})

core.register_craftitem("extra_energy:globe", {
	description = "Energy Globe",
	inventory_image = "extra_energy_globe.png",
	light_source = default.LIGHT_MAX,
})

core.register_craftitem("extra_energy:great_globe", {
	description = "Great Energy Globe",
	inventory_image = "extra_energy_great_globe.png",
	light_source = default.LIGHT_MAX,
})

core.register_craftitem("extra_energy:superior_globe", {
	description = "Superior Energy Globe",
	inventory_image = "extra_energy_superior_globe.png",
	light_source = default.LIGHT_MAX,
})

register_nine("extra_energy:great_globe", "extra_energy:globe")
register_nine("extra_energy:superior_globe", "extra_energy:great_globe")

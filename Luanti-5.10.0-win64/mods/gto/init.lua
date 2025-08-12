
--[[	Great Teleport Orb

	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
	Code licensed under GNU GPLv2
		http://www.gnu.org/licenses/gpl-2.0.html
	Content licensed under CC BY-SA 3.0
		http://creativecommons.org/licenses/by-sa/3.0/
	edited by Biomeguy
]]

local function throw_orb(item, user)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x = pos.x, y = pos.y + 1.5, z = pos.z}, "gto:gto_ent")
	obj:get_luaentity().launcher = user:get_player_name()
	obj:set_velocity({x = dir.x * 27, y = dir.y * 27, z = dir.z * 27})
	obj:set_acceleration({x = dir.x * -3, y = -9, z = dir.z * -3})
	item:take_item()
	return item
end

local function teleport_room(self, pos)
	local node_above = core.get_node_or_nil({x = pos.x, y = pos.y + 1, z = pos.z})
	local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_above or not node_under then
		return false
	end
	local node_name = core.get_node(pos).name
	local def_pos = core.registered_nodes[node_name]
	local def_above = core.registered_nodes[node_above.name]
	local def_under = core.registered_nodes[node_under.name]
	if def_pos.climbable and (not def_above.walkable and def_above.damage_per_second <= 0 or def_above.climbable) then
		return true
	elseif (def_under.walkable and def_under.damage_per_second <= 0 or def_under.climbable) and
		(not def_pos.walkable and def_pos.damage_per_second <= 0 or def_pos.climbable) and
		(not def_above.walkable and def_above.damage_per_second <= 0 or def_above.climbable) then
		return true
	end
	return false
end

local function orb_return(self, player, pos)
if not player then
	if pos == nil then	pos = self.object:get_pos() end
	core.chat_send_all("GTO launcher is nil, dropping at ".. core.pos_to_string(pos))
	core.add_item(pos, "gto:teleport_orb")
else
	local inv = player:get_inventory()
	if inv:room_for_item("main", "gto:teleport_orb") then
		inv:add_item("main", "gto:teleport_orb")
	else
		core.add_item(player:get_pos(), "gto:teleport_orb")
	end
end
	self.object:remove()--	maybe check if item was added
end

local function teleport_here(self, pos)
	local player = core.get_player_by_name(self.launcher)
	local oldpos = player:get_pos()
	if pos == nil then
core.chat_send_player(self.launcher, "No room near location")
	else
core.add_particlespawner({
	amount = 25,
	time = .15,
	minpos = vector.subtract(oldpos,{x=.5,y=0,z=.5}),
	maxpos = vector.add(oldpos,{x=.5,y=1.3,z=.5}),
	minvel = {x=-1, y=-2, z=-1},
	maxvel = {x=1,  y=1,  z=1},
	exptime = {min = .1, max = .3},
	minsize = 1,
	maxsize = 2,
	collisiondetection = true,
	texture = "orb_particle.png",
	glow = 11
})
core.add_particlespawner({-- steam
	amount = 20,
	time = .2,
	minpos = {x=oldpos.x-.2, y=oldpos.y+.3, z=oldpos.z-.2},
	maxpos = {x=oldpos.x+.2, y=oldpos.y+1.3, z=oldpos.z+.2},
	minvel = {x=-5, y=0, z=-5},
	maxvel = {x=5, y=5, z=5},
	minacc = {x=0, y=2, z=0},
	maxacc = {x=0, y=math.random(3,5), z=0},
	exptime = {min = .5, max = .7},
	minsize = 5,
	maxsize = 8,
	collisiondetection = true,
	texture = "default_item_smoke.png^[colorize:white:120",
})
player:add_velocity(vector.multiply(player:get_velocity(), -1))
player:set_pos(pos)
core.add_particlespawner({
	amount = 25,
	time = 1,
	minpos = vector.subtract(pos,{x=.5,y=0,z=.5}),
	maxpos = vector.add(pos,{x=.5,y=1.3,z=.5}),
	minvel = {x=-1, y=-2, z=-1},
	maxvel = {x=1,  y=1,  z=1},
	exptime = {min = .5, max = 1},
	minsize = 1,
	maxsize = 2,
	collisiondetection = true,
	texture = "orb_particle.png",
	glow = 11
})
	end
	orb_return(self, player, pos)
end

-- Register
core.register_entity("gto:gto_ent", {
	initial_properties = {
physical = false,
visual = "sprite",
textures = {"great_teleport_orb.png"},
collisionbox = {0,0,0,0,0,0},
glow = 9
	},
	launcher = "",
	age = 0,
get_staticdata = function(self) return core.serialize({launcher = self.launcher}) end,
on_activate = function(self, staticdata)
	self.object:set_armor_groups({immortal = 1})
	if not staticdata or staticdata == "" then return end
	local data = core.deserialize(staticdata)
	if not data then return end

	self.launcher = data.launcher
end,
on_step = function(self, dtime)
	self.age = self.age+dtime
	local pos = self.object:get_pos()
	pos = vector.round(pos)
if self.age > 19 then
core.chat_send_player(self.launcher, "Out of time at ".. core.pos_to_string(pos))
local player = core.get_player_by_name(self.launcher)
orb_return(self, player, pos) return end

for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
		local entity = obj:get_luaentity() and obj:get_luaentity().name or ""
	if entity == "boats:boat" then
		local boat_pos = obj:get_pos()
		boat_pos.y = boat_pos.y + 1
		pos = boat_pos
		teleport_here(self, pos)
	end
	if entity == "ufos:ufo" then
		local ufo_pos = obj:get_pos()
		ufo_pos.y = ufo_pos.y + 3
		pos = ufo_pos
		teleport_here(self, pos)
	end
end

	local nn = core.get_node(pos).name
	if nn ~= "air" and core.get_item_group(nn, "water") == 0 and nn ~= "doors:hidden" and
	(core.registered_nodes[nn].walkable or core.registered_nodes[nn].climbable) then
		if teleport_room(self, pos) then
	pos.y = pos.y - .2
		elseif teleport_room(self, {x=pos.x, y=pos.y+1, z=pos.z}) then
	pos.y = pos.y + .6
		elseif teleport_room(self, {x=pos.x+1, y=pos.y, z=pos.z}) then
	pos = {x=pos.x+1, y=pos.y, z=pos.z}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y, z=pos.z}) then
	pos = {x=pos.x-1, y=pos.y, z=pos.z}
		elseif teleport_room(self, {x=pos.x, y=pos.y, z=pos.z+1}) then
	pos = {x=pos.x, y=pos.y, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x, y=pos.y, z=pos.z-1}) then
	pos = {x=pos.x, y=pos.y, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y, z=pos.z+1}) then
	pos = {x=pos.x+1, y=pos.y, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y, z=pos.z-1}) then
	pos = {x=pos.x+1, y=pos.y, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y, z=pos.z+1}) then
	pos = {x=pos.x-1, y=pos.y, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y, z=pos.z-1}) then
	pos = {x=pos.x-1, y=pos.y, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y+1, z=pos.z}) then
	pos = {x=pos.x+1, y=pos.y+1, z=pos.z}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y+1, z=pos.z}) then
	pos = {x=pos.x-1, y=pos.y+1, z=pos.z}
		elseif teleport_room(self, {x=pos.x, y=pos.y+1, z=pos.z+1}) then
	pos = {x=pos.x, y=pos.y+1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x, y=pos.y+1, z=pos.z-1}) then
	pos = {x=pos.x, y=pos.y+1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y+1, z=pos.z+1}) then
	pos = {x=pos.x+1, y=pos.y+1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y+1, z=pos.z-1}) then
	pos = {x=pos.x+1, y=pos.y+1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y+1, z=pos.z+1}) then
	pos = {x=pos.x-1, y=pos.y+1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y+1, z=pos.z-1}) then
	pos = {x=pos.x-1, y=pos.y+1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x, y=pos.y-1, z=pos.z}) then
	pos = {x=pos.x, y=pos.y-1.2, z=pos.z}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-1, z=pos.z}) then
	pos = {x=pos.x+1, y=pos.y-1, z=pos.z}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-1, z=pos.z}) then
	pos = {x=pos.x-1, y=pos.y-1, z=pos.z}
		elseif teleport_room(self, {x=pos.x, y=pos.y-1, z=pos.z+1}) then
	pos = {x=pos.x, y=pos.y-1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x, y=pos.y-1, z=pos.z-1}) then
	pos = {x=pos.x, y=pos.y-1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-1, z=pos.z+1}) then
	pos = {x=pos.x+1, y=pos.y-1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-1, z=pos.z-1}) then
	pos = {x=pos.x+1, y=pos.y-1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-1, z=pos.z+1}) then
	pos = {x=pos.x-1, y=pos.y-1, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-1, z=pos.z-1}) then
	pos = {x=pos.x-1, y=pos.y-1, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x, y=pos.y-2, z=pos.z}) then
	pos = {x=pos.x, y=pos.y-2, z=pos.z}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-2, z=pos.z}) then
	pos = {x=pos.x+1, y=pos.y-2, z=pos.z}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-2, z=pos.z}) then
	pos = {x=pos.x-1, y=pos.y-2, z=pos.z}
		elseif teleport_room(self, {x=pos.x, y=pos.y-2, z=pos.z+1}) then
	pos = {x=pos.x, y=pos.y-2, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x, y=pos.y-2, z=pos.z-1}) then
	pos = {x=pos.x, y=pos.y-2, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-2, z=pos.z+1}) then
	pos = {x=pos.x+1, y=pos.y-2, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x+1, y=pos.y-2, z=pos.z-1}) then
	pos = {x=pos.x+1, y=pos.y-2, z=pos.z-1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-2, z=pos.z+1}) then
	pos = {x=pos.x-1, y=pos.y-2, z=pos.z+1}
		elseif teleport_room(self, {x=pos.x-1, y=pos.y-2, z=pos.z-1}) then
	pos = {x=pos.x-1, y=pos.y-2, z=pos.z-1}
		else
	pos = nil
		end
		teleport_here(self, pos)
	end
end
})

core.register_craftitem("gto:teleport_orb", {
	description	= "Great Teleport Orb",
	inventory_image	= "great_teleport_orb.png",
	light_source = 12,
	stack_max = 8,
	on_use = throw_orb
})

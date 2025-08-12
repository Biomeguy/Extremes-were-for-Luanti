
local function throw_pearl(item, user)
	local pname = user:get_player_name()
	if not core.is_creative_enabled(pname) then
		item:take_item()
	end
	if hell.teleport_player(user) then
		return item
	end
	local userpos = user:get_pos()
	userpos.y = userpos.y+1.625
	local obj = core.add_entity(userpos, "hell:pearl_entity")
	local dir = user:get_look_dir()
	obj:set_velocity(vector.multiply(dir, 30))
	obj:set_acceleration({x=dir.x*-3, y=-16, z=dir.z*-3})
	obj:get_luaentity().player = pname
	return item
end

local function get_node(pos)
	local name = core.get_node(pos).name
	if name ~= "ignore" then
		return name
	end
	core.get_voxel_manip():read_from_map(pos, pos)
	name = core.get_node_or_nil(pos)
	if not name then
		return
	end
	return name.name
end

local softs = {}
local function is_soft(pos)
	local name = get_node(pos)
	if not name then
		return false
	end
	local is_soft = softs[name]
	if is_soft ~= nil then
		return is_soft
	end
	if not core.registered_nodes[name] then
		softs[name] = false
		return false
	end
	is_soft = core.registered_nodes[name].walkable == false
	softs[name] = is_soft
	return is_soft
end

-- teleports the player there if there's free space
local function teleport_player(pos, player)
	if not is_soft(pos) then
		return false
	end
	if not is_soft({x=pos.x, y=pos.y+1, z=pos.z})
	and not is_soft({x=pos.x, y=pos.y-1, z=pos.z}) then
		return false
	end
	pos.y = pos.y+0.05
	player:set_pos(pos)
	return true
end

core.register_entity("hell:pearl_entity", {
	initial_properties = {
physical = false,
visual = "sprite",
textures = {"hell_pearl.png"},
collisionbox = {0,0,0,0,0,0},
visual_size = {x=.4, y=.4}
	},
	on_activate = function(self, staticdata)
		if not staticdata or staticdata == "" then
			return
		end
		local tmp = core.deserialize(staticdata)
		if not tmp then
			core.log("error", "[hell] pearl: invalid staticdata ")
			return
		end
		self.player = tmp.player
	end,
	get_staticdata = function(self)
		--forceload(vector.round(self.object:get_pos()))
		return core.serialize({
			player = self.player,
		})
	end,
	timer = 0,
	on_step = function(self, dtime)
		self.timer = self.timer+dtime

	--[[
		local delay = self.delay
		if delay < 0.1 then
			self.delay = delay+dtime
			return
		end
		self.delay = 0--]]

		if self.timer > 20 then
			self.object:remove()
			return
		end

		local pos = self.object:get_pos()
		local rpos = vector.round(pos)
		local lastpos = self.lastpos
		if not lastpos then
			self.lastpos = vector.new(rpos)
			return
		end
		if lastpos.x
		and vector.equals(vector.round(lastpos), rpos) then
			return
		end

		local player = self.player
		if not player then
			core.log("error", "[hell] pearl: missing playername")
			self.object:remove()
			return
		end
		player = core.get_player_by_name(player)
		if not player then
			core.log("error", "[hell] pearl: missing player")
			self.object:remove()
			return
		end

		if not get_node(rpos) then
			core.log("error", "[hell] pearl: missing node")
			self.object:remove()
			return
		end

		self.lastpos = vector.new(pos)

		local free, p = core.line_of_sight(lastpos, pos)
		if free then
			return
		end
		if is_soft(p) then
			return
		end
		self.object:remove()
		core.after(0, function(p) --core.after is used that the sound is played after the teleportation
			core.sound_play("hell_pearl", {pos=p, max_hear_distance=10})
		end, p)
		p.y = p.y+1
		if teleport_player(vector.new(p), player) then
			return
		end
		p.y = p.y-2
		for i = -1,1,2 do
			for _,j in pairs({{i, 0}, {0, i}}) do
				if teleport_player({x=p.x+j[1], y=p.y, z=p.z+j[2]}, player) then
					return
				end
			end
		end
		for i = -1,1,2 do
			for j = -1,1,2 do
				if teleport_player({x=p.x+j, y=p.y, z=p.z+i}, player) then
					return
				end
			end
		end
	end
})

-- Hell Pearl
core.register_craftitem("hell:pearl", {
	description = "Hell Pearl",
	inventory_image = "hell_pearl.png",
	on_use = throw_pearl
})

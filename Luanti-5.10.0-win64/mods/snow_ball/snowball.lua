--============
--Snowballs
--============

-- Snowballs were destroying nodes if the snowballs landed just right.
-- Quite a bit of trial-and-error learning here and it boiled down to a
-- small handful of code lines making the difference. ~ LazyJ

local creative_mode = core.settings:get_bool"creative_mode"


local snowball_velocity, entity_attack_delay
local function update_snowball_vel(v)
	snowball_velocity = v
	local walkspeed = tonumber(core.settings:get"movement_speed_walk") or 4
	entity_attack_delay = (walkspeed+1)/v
end
update_snowball_vel(snow.snowball_velocity)

local snowball_gravity = snow.snowball_gravity
snow.register_on_configuring(function(name, v)
	if name == "snowball_velocity" then
		update_snowball_vel(v)
	elseif name == "snowball_gravity" then
		snowball_gravity = v
	end
end)

local function get_gravity()
	local grav = tonumber(core.settings:get"movement_gravity") or 9.81
	return grav*snowball_gravity
end

local someone_throwing, just_acitvated

--Shoot snowball
function snow.shoot_snowball(item, player)
	local addp = {y = 1.625} -- + (math.random()-0.5)/5}
	local dir = player:get_look_dir()
	local dif = 2*math.sqrt(dir.z*dir.z+dir.x*dir.x)
	addp.x = dir.z/dif -- + (math.random()-0.5)/5
	addp.z = -dir.x/dif -- + (math.random()-0.5)/5
	local pos = vector.add(player:get_pos(), addp)
	local obj = core.add_entity(pos, "snow_ball:snowball_entity")
	obj:set_velocity(vector.multiply(dir, snowball_velocity))
	obj:set_acceleration({x=dir.x*-3, y=-get_gravity(), z=dir.z*-3})
	obj:get_luaentity().thrower = player:get_player_name()
	if creative_mode then
		if not someone_throwing then
			someone_throwing = true
			just_acitvated = true
		end
		return
	end
	item:take_item()
	return item
end

if creative_mode then
	local function update_step()
		local active
		for _,player in pairs(core.get_connected_players()) do
			if player:get_player_control().LMB then
				local item = player:get_wielded_item()
				local itemname = item:get_name()
				if itemname == "snow_ball:item" then
					snow.shoot_snowball(nil, player)
					active = true
					break
				end
			end
		end

		-- disable the function if none currently throws them
		if not active then
			someone_throwing = false
		end
	end

	-- do automatic throwing using core.after
	local function do_step()
		local timer
		-- only if one holds left click
		if someone_throwing
		and not just_acitvated then
			update_step()
			timer = 0.006
		else
			timer = 0.5
			just_acitvated = false
		end
		core.after(timer, do_step)
	end
	core.after(3, do_step)
end

--The snowball Entity
local snow_snowball_ENTITY = {
	initial_properties = {
physical = false,
collisionbox = {-5/16,-5/16,-5/16, 5/16,5/16,5/16},
	},
	timer = 0,
}

function snow_snowball_ENTITY.on_activate(self)
	self.object:set_properties({textures = {"default_snowball.png^[transform"..math.random(0,7)}})
	self.object:set_acceleration({x=0, y=-get_gravity(), z=0})
	self.lastpos = self.object:get_pos()
	core.after(0.1, function(obj)
		if not obj then
			return
		end
		local vel = obj:get_velocity()
		if vel
		and vel.y ~= 0 then
			return
		end
		core.after(0, function(obj)
			if not obj then
				return
			end
			local vel = obj:get_velocity()
			if not vel
			or vel.y == 0 then
				obj:remove()
			end
		end, obj)
	end, self.object)
end

--Snowball_entity.on_step()--> called when snowball is moving.
function snow_snowball_ENTITY.on_step(self, dtime)
	self.timer = self.timer+dtime
	if self.timer > 600 then
		-- 10 minutes are too long for a snowball to fly somewhere
		self.object:remove()
		return
	end

	if self.physical then
		local fell = self.object:get_velocity().y == 0
		if not fell then
			return
		end
		local pos = vector.round(self.object:get_pos())
		if core.get_node(pos).name == "air" then
			pos.y = pos.y-1
			if core.get_node(pos).name == "air" then
				return
			end
		end
		snow.place(pos)
		self.object:remove()
		return
	end

	local pos = vector.round(self.object:get_pos())
	if vector.equals(pos, self.lastpos) then
		return
	end
	if core.get_node(pos).name ~= "air" then
		self.object:set_acceleration({x=0, y=-get_gravity(), z=0})
		--self.object:setvelocity({x=0, y=0, z=0})
		pos = self.lastpos
		self.object:set_pos(pos)
		core.sound_play("default_snow_footstep", {pos=pos, gain=vector.length(self.object:get_velocity())/30})
		self.object:set_properties({physical = true})
		self.physical = true
		return
	end
	self.lastpos = vector.new(pos)

	if self.timer < entity_attack_delay then
		return
	end
	for _,v in pairs(core.get_objects_inside_radius(pos, 1.73)) do
		if v ~= self.object then
			local entity_name = v:get_luaentity() and v:get_luaentity().name or ""
			if v:is_player()
			or (entity_name ~= "snow_ball:snowball_entity"
			and entity_name ~= "__builtin:item"
			and entity_name ~= "gauges:hp_bar") then
				local vvel = v:get_velocity() or v:get_player_velocity()
				local veldif = self.object:get_velocity()
				if vvel then
					veldif = vector.subtract(veldif, vvel)
				end
				local gain = vector.length(veldif)/20
				v:punch(
					(self.thrower and core.get_player_by_name(self.thrower))
						or self.object,
					1,
					{full_punch_interval=1, damage_groups = {fleshy=math.ceil(gain)}}
				)
				core.sound_play("default_snow_footstep", {pos=pos, gain=gain})
	local obj = core.add_entity(pos, "__builtin:falling_node")
	obj:get_luaentity():set_node( {name = "default:snow"})
				self.object:remove()
				return
			end
		end
	end
end

core.register_entity("snow_ball:snowball_entity", snow_snowball_ENTITY)


core.register_craftitem("snow_ball:item", {
	description = "Frosted Snowball",
	inventory_image = "default_snowball.png^[colorize:#2aa0e7:40",
	on_use = snow.shoot_snowball
})

core.register_craft({
	type = "shapeless",
	output = "snow_ball:item 2",
	recipe = {"default:snow", "default:snow", "default:crystal_ingot"},
	replacements = {{"default:crystal_ingot", "default:crystal_ingot"}}
})
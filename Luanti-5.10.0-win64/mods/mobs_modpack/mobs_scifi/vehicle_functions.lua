--vehicles/mounts api by, based on lib_mount(see below)

--License of lib_mount:
-- Luanti mod: lib_mount
-- =======================
-- by blert2112

-- Based on the Boats mod by PilzAdam.


-- Minetest Game mod: boats
-- ========================
-- by PilzAdam

-- License of source code:
-- -----------------------
-- WTFPL


--from lib_mount (required by new functions)


local mobs_redo = false
if mobs.mod and mobs.mod == "redo" then
	mobs_redo = true
end

local function is_group(pos, group)
	local nn = core.get_node(pos).name
	return core.get_item_group(nn, group) ~= 0
end

local function force_detach(player)
	local attached_to = player:get_attach()
	if attached_to and attached_to:get_luaentity() then
		local entity = attached_to:get_luaentity()
		if entity.driver then
		if entity ~= nil then 
			entity.driver = nil
		end
		end
		player:set_detach()
	end
	player_api.player_attached[player:get_player_name()] = false
	player:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
end

function object_attach(entity, player, attach_at, eye_offset)
	eye_offset = eye_offset or {x=0, y=0, z=0}
	force_detach(player)
	entity.driver = player
	entity.loaded = true
	player:set_attach(entity.object, "", attach_at, {x=0, y=0, z=0})
	
	player:set_properties({visual_size = {x=1, y=1}})
	
	player:set_eye_offset(eye_offset, {x=0, y=2, z=-40})
	player_api.player_attached[player:get_player_name()] = true
	core.after(0.2, function()
		player_api.set_animation(player, "sit" , 30)
	end)
	entity.object:set_yaw(player:get_look_horizontal() - math.pi / 2)
end

function object_detach(entity, player, offset)
	entity.driver = nil
	entity.object:set_velocity({x=0, y=0, z=0})
	player:set_detach()
	player_api.player_attached[player:get_player_name()] = false
	player_api.set_animation(player, "stand" , 30)
	player:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
	local pos = player:get_pos()
	pos = {x = pos.x + offset.x, y = pos.y + 0.2 + offset.y, z = pos.z + offset.z}
	core.after(0.1, function()
		player:set_pos(pos)
	end)
end
-------------------------------------------------------------------------------


core.register_on_leaveplayer(function(player)
	force_detach(player)
end)

core.register_on_shutdown(function()
    local players = core.get_connected_players()
	for i = 1,#players do
		force_detach(players[i])
	end
end)

core.register_on_dieplayer(function(player)
	force_detach(player)
	return true
end)

-------------------------------------------------------------------------------

--mixed code(from this mod and lib_mount)

function object_drive(entity, dtime, speed, decell, shoots, arrow, moving_anim, stand_anim, jumps)
	local ctrl = entity.driver:get_player_control()
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	local dir = entity.driver:get_look_dir();
	local vec_forward = {x=dir.x*speed,y=velo.y+1*-2,z=dir.z*speed}
	local vec_backward = {x=-dir.x*speed,y=velo.y+1*-2,z=-dir.z*speed}
	local vec_stop = {x=velo.x*decell,y=velo.y+1*-2,z=velo.z*decell}
	local yaw = entity.driver:get_look_horizontal();
	if ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_forward)
	elseif ctrl.down then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_backward)
	elseif not ctrl.down or ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_stop)
	end
	if ctrl.sneak and shoots and entity.loaded then
		entity.loaded = false
		local pos = entity.object:get_pos()
		local obj = core.env:add_entity({x=pos.x+0+dir.x*2,y=pos.y+1.5+dir.y,z=pos.z+0+dir.z*2}, arrow)
		local vec = {x=dir.x*9,y=dir.y*9,z=dir.z*9}
		local yaw = entity.driver:get_look_horizontal();
		obj:set_yaw(yaw+math.pi/2)
		obj:set_velocity(vec)
		core.after(1, function()
		entity.loaded = true
		end)
	end
	--lib_mount animation
	if velo.x == 0 and velo.y == 0 and velo.z == 0 then
		if stand_anim and stand_anim ~= nil and mobs_redo == true then
			entity.object:set_animation({x=1, y=9}, 19)
		end
		return
	end
	if moving_anim and moving_anim ~= nil then
		entity.object:set_animation({x=1, y=9}, 19)
	end
	--jumping not working
	-- local jumps = jumps or false
	-- if jumps == true and ctrl.jump then
		-- local xvel = entity.object:get_velocity().x
		-- local zvel = entity.object:get_velocity().z
		-- local yvel = entity.object:get_velocity().y
		-- local vel = {x=xvel,y=10,z=zvel}
		-- entity.object:set_velocity(vel)
		-- core.after(1.5, function()
		-- local xvel = entity.object:get_velocity().x
		-- local zvel = entity.object:get_velocity().z
		-- local yvel = entity.object:get_velocity().y
		-- local vel = {x=xvel,y=-10,z=zvel}
		-- entity.object:set_velocity(vel)
		-- end)
	-- end
end

function object_drive_simple(entity, dtime, speed, decell)
	local ctrl = entity.driver:get_player_control()
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	local dir = entity.driver:get_look_dir();
	local vec_forward = {x=dir.x*speed,y=velo.y+1*-2,z=dir.z*speed}
	local vec_backward = {x=-dir.x*speed,y=velo.y+1*-2,z=-dir.z*speed}
	local vec_stop = {x=velo.x*decell,y=velo.y+1*-2,z=velo.z*decell}
	local yaw = entity.driver:get_look_horizontal();
	if ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_forward)
	elseif ctrl.down then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_backward)
	elseif not ctrl.down or ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_stop)
	end
end

function object_turret(entity, dtime, arrow, attack_anim, stand_anim)
	local ctrl = entity.driver:get_player_control()
	local pos = entity.driver:get_pos();
	local yaw = entity.driver:get_look_horizontal();
	entity.object:set_pos(pos)
	entity.object:set_yaw(yaw+math.pi+math.pi/2)
	if ctrl.sneak and entity.loaded then
		entity.loaded = false
		local pos = entity.object:get_pos()
		local obj = core.env:add_entity({x=pos.x+0+dir.x*2,y=pos.y+1.5+dir.y,z=pos.z+0+dir.z*2}, arrow)
		local yaw = entity.driver:get_look_horizontal();
		local vec = {x=dir.x*9, y=dir.y*9, z=dir.z*9}
		obj:set_yaw(yaw+math.pi/2)
		entity.object:set_animation({x=1, y=9}, 19)
		core.after(1, function()
		entity.loaded = true
		end)
	else
		entity.object:set_animation({x=1, y=9}, 19)
	end
end

function object_fly(entity, dtime, speed, accel, decell, shoots, arrow, moving_anim, stand_anim)
	local ctrl = entity.driver:get_player_control()
	local dir = entity.driver:get_look_dir();
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	local vec_forward = {x=dir.x*speed,y=dir.y*speed+3,z=dir.z*speed}
	local acc_forward = {x=dir.x*accel/2,y=dir.y*accel/2+3,z=dir.z*accel/2}
	local vec_backward = {x=-dir.x*speed,y=dir.y*speed+3,z=-dir.z*speed}
	local acc_backward = {x=dir.x*accel/2,y=dir.y*accel/2+3,z=dir.z*accel/2}
	local vec_stop = {x=velo.x*decell, y=velo.y, z=velo.z*decell}
	local yaw = entity.driver:get_look_horizontal();
	if ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_forward)
		entity.object:set_acceleration(acc_forward)
	elseif ctrl.down then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_backward)
		entity.object:set_acceleration(acc_backward)
	elseif not ctrl.down or ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_stop)
		entity.object:set_acceleration({x=0, y=-4.5, z=0})
	end
	if ctrl.sneak and shoots and entity.loaded then
		entity.loaded = false
		local pos = entity.object:get_pos()
		local obj = core.env:add_entity({x=pos.x+0+dir.x*2,y=pos.y+1.5+dir.y,z=pos.z+0+dir.z*2}, arrow)
		local vec = {x=dir.x*9,y=dir.y*9,z=dir.z*9}
		obj:set_yaw(yaw+math.pi/2)
		obj:set_velocity(vec)
		core.after(1, function()
		entity.loaded = true
		end)
	end
	--lib_mount animation
	if velo.x == 0 and velo.y == 0 and velo.z == 0 then
		if stand_anim and stand_anim ~= nilthen then
			entity.object:set_animation({x=1, y=9}, 19)
		end
		return
	end
	if moving_anim and moving_anim ~= nil then
		entity.object:set_animation({x=1, y=9}, 19)
	end
end

function object_fly_2(entity, dtime, speed, accel, decell, shoots, arrow, moving_anim, stand_anim)
	local ctrl = entity.driver:get_player_control()
	local dir = entity.driver:get_look_dir();
	local yvel = entity.object:get_velocity().y
	local vec_forward = {x=dir.x*speed,y=yvel,z=dir.z*speed}
	local acc_forward = {x=dir.x*accel/2,y=yvel,z=dir.z*accel/2}
	local vec_backward = {x=-dir.x*speed,y=yvel,z=-dir.z*speed}
	local acc_backward = {x=dir.x*accel/2,y=yvel,z=dir.z*accel/2}
	local vec_stop = {x=entity.object:get_velocity().x*decell, y=entity.object:get_velocity().y, z=entity.object:get_velocity().z*decell}
	local vec_rise = {x=entity.object:get_velocity().x, y=speed*accel, z=entity.object:get_velocity().z}
	local yaw = entity.driver:get_look_horizontal();
	if ctrl.up then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_forward)
		entity.object:set_acceleration(acc_forward)
	elseif ctrl.down then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_backward)
		entity.object:set_acceleration(acc_backward)
	elseif ctrl.jump then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_rise)
	elseif not ctrl.down or ctrl.up or ctrl.jump then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_stop)
		entity.object:set_acceleration({x=0, y=-4.5, z=0})
	end
	if ctrl.sneak and shoots and entity.loaded then
		entity.loaded = false
		local pos = entity.object:get_pos()
		local obj = core.env:add_entity({x=pos.x+0+dir.x*2,y=pos.y+1.5+dir.y,z=pos.z+0+dir.z*2}, arrow)
		local vec = {x=dir.x*9,y=dir.y*9,z=dir.z*9}
		local yaw = entity.driver:get_look_horizontal();
		obj:set_yaw(yaw+math.pi/2)
		obj:set_velocity(vec)
		core.after(1, function()
		entity.loaded = true
		end)
	end
	--lib_mount animation
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	if velo.x == 0 and velo.y == 0 and velo.z == 0 then
		if stand_anim and stand_anim ~= nilthen then
			entity.object:set_animation({x=1, y=9}, 19)
		end
		entity.object:set_pos(entity.object:get_pos())
		return
	end
	if moving_anim and moving_anim ~= nil then
		entity.object:set_animation({x=1, y=9}, 19)
	end
end

function object_glide(entity, dtime, speed, decell, gravity, moving_anim, stand_anim)
	local ctrl = entity.driver:get_player_control()
	local dir = entity.driver:get_look_dir();
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	local vec_glide = {x=dir.x*speed*decell, y=velo.y, z=dir.z*speed*decell}
	local yaw = entity.driver:get_look_horizontal();
	if not ctrl.sneak then
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec_glide)
		entity.object:set_acceleration({x=0, y=gravity, z=0})
	end
	if ctrl.sneak then
		local vec = {x=0,y=gravity*15,z=0}
		local yaw = entity.driver:get_look_horizontal();
		entity.object:set_yaw(yaw+math.pi+math.pi/2)
		entity.object:set_velocity(vec)
	end
	if velo.y == 0 then
		local pos = entity.object:get_pos()
		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y-1, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = core.env:get_node(p).name
					if n ~= "massdestruct:parachute" and n ~= "air" then
						local pos = entity.object:get_pos()
						entity.object:remove()
						return
					end
				end
			end
		end
	end
	--lib_mount animation
	if velo.x == 0 and velo.y == 0 and velo.z == 0 then
		if stand_anim and stand_anim ~= nilthen then
			entity.object:set_animation({x=1, y=9}, 19)
		end
		return
	end
	if moving_anim and moving_anim ~= nil then
		entity.object:set_animation({x=1, y=9}, 19)
	end
end

--lib_mount (not required by new functions)


local function is_group(pos, group)
	local nn = core.get_node(pos).name
	return core.get_item_group(nn, group) ~= 0
end

local function get_sign(i)
	i = i or 0
	if i == 0 then
		return 0
	else
		return i / math.abs(i)
	end
end

local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

local function get_v(v)
	return math.sqrt(v.x ^ 2 + v.z ^ 2)
end

lib_mount = {}

function lib_mount.attach(entity, player, attach_at, eye_offset)
	eye_offset = eye_offset or {x=0, y=0, z=0}
	force_detach(player)
	entity.driver = player
	player:set_attach(entity.object, "", attach_at, {x=0, y=0, z=0})
	
	player:set_properties({visual_size = {x=1, y=1}})
	
	player:set_eye_offset(eye_offset, {x=0, y=0, z=0})
	player_api.player_attached[player:get_player_name()] = true
	core.after(0.2, function()
		player_api.set_animation(player, "sit" , 30)
	end)
	entity.object:set_yaw(player:get_look_horizontal() - math.pi / 2)
end

function lib_mount.detach(entity, player, offset)
	if entity ~= nil then entity.driver = nil end
	player:set_detach()
	player_api.player_attached[player:get_player_name()] = false
	player_api.set_animation(player, "stand" , 30)
	player:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
	local pos = player:get_pos()
	pos = {x = pos.x + offset.x, y = pos.y + 0.2 + offset.y, z = pos.z + offset.z}
	core.after(0.1, function()
		player:set_pos(pos)
	end)
end

function lib_mount.drive(entity, dtime, moving_anim, stand_anim, can_fly)
	entity.v = get_v(entity.object:get_velocity()) * get_sign(entity.v)
	
	local ctrl = entity.driver:get_player_control()
	local yaw = entity.object:get_yaw()
	if ctrl.up then
		entity.v = entity.v + 0.1
	elseif ctrl.down then
		entity.v = entity.v - 0.1
	end
	if ctrl.left then
		if entity.v < 0 then
			entity.object:set_yaw(yaw - (1 + dtime) * 0.03)
		else
			entity.object:set_yaw(yaw + (1 + dtime) * 0.03)
		end
	elseif ctrl.right then
		if entity.v < 0 then
			entity.object:set_yaw(yaw + (1 + dtime) * 0.03)
		else
			entity.object:set_yaw(yaw - (1 + dtime) * 0.03)
		end
	end
	
	local velo = entity.object:get_velocity() or entity.driver:get_velocity()
	if entity.v == 0 and velo.x == 0 and velo.y == 0 and velo.z == 0 then
		if stand_anim and stand_anim ~= nil and mobs_redo == true then
			entity.object:set_animation({x=1, y=9}, 19)
		end
		entity.object:set_pos(entity.object:get_pos())
		return
	end
	if moving_anim and moving_anim ~= nil and mobs_redo == true then
		entity.object:set_animation({x=1, y=9}, 19)
	end
	local s = get_sign(entity.v)
	entity.v = entity.v - 0.02 * s
	if s ~= get_sign(entity.v) then
		entity.object:set_velocity({x = 0, y = 0, z = 0})
		entity.v = 0
		return
	end
	if math.abs(entity.v) > 5 then
		entity.v = 5 * get_sign(entity.v)
	end

	local p = entity.object:get_pos()
	p.y = p.y - 0.5
	local new_velo = {x = 0, y = 0, z = 0}
	local new_acce = {x = 0, y = 0, z = 0}
	if not is_group(p, "crumbly") then
		local nodedef = core.registered_nodes[core.get_node(p).name]
		if (not nodedef) or nodedef.walkable then
			entity.v = 0
			new_acce = {x = 0, y = 1, z = 0}
		else
			new_acce = {x = 0, y = -9.8, z = 0}
		end
		new_velo = get_velocity(entity.v, entity.object:get_yaw(),
			entity.object:get_velocity().y)
		entity.object:set_pos(entity.object:get_pos())
	else
		p.y = p.y + 1
		if is_group(p, "crumbly") then
			local y = entity.object:get_velocity().y
			if y >= 5 then
				y = 5
			elseif y < 0 then
				new_acce = {x = 0, y = 20, z = 0}
			else
				new_acce = {x = 0, y = 5, z = 0}
			end
			new_velo = get_velocity(entity.v, entity.object:get_yaw(), y)
			entity.object:set_pos(entity.object:get_pos())
		else
			new_acce = {x = 0, y = 0, z = 0}
			if math.abs(entity.object:get_velocity().y) < 1 then
				local pos = entity.object:get_pos()
				pos.y = math.floor(pos.y) + 0.5
				entity.object:set_pos(pos)
				new_velo = get_velocity(entity.v, entity.object:get_yaw(), 0)
			else
				new_velo = get_velocity(entity.v, entity.object:get_yaw(),
					entity.object:get_velocity().y)
				entity.object:set_pos(entity.object:get_pos())
			end
		end
	end
	if can_fly and can_fly == true and ctrl.jump then 
		new_velo.y = new_velo.y + 0.75
	end
	entity.object:set_velocity(new_velo)
	entity.object:set_acceleration(new_acce)
end

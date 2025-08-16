
local path = core.get_modpath("xtraores")

dofile(path.. "/ores.lua")
dofile(path.. "/items.lua")
dofile(path.. "/tools.lua")
dofile(path.. "/armor.lua")
dofile(path.. "/oreblocks.lua")
dofile(path.. "/special_weapons.lua")
dofile(path.. "/awards.lua")

core.register_globalstep(function(dtime, player, pos)

	for _, player in pairs(core.get_connected_players()) do
local meta = player:get_meta()
local xo_weapon_cool_down = meta:get_int("xo_weapon_cooldown") or 0
if xo_weapon_cool_down < 10000 then
meta:set_int("xo_weapon_cooldown", xo_weapon_cool_down + 1)
end 

	local controls = player:get_player_control()
	if controls.LMB then
local w_item = player:get_wielded_item()
if w_item:get_definition().projectile_attack ~= nil then

	meta = player:get_meta()
 	xo_wpn_c_down = meta:get_int("xo_weapon_cooldown") or 0
local xo_proj_c_down = w_item:get_definition().projectile_cooldown or 20
	if xo_wpn_c_down > xo_proj_c_down then
	shooter = player
		meta:set_int("xo_weapon_cooldown",0) 
		local inv = player:get_inventory()

local needed_ammo = w_item:get_definition().needed_ammo or ""

		if not inv:contains_item("main", needed_ammo) then
			core.sound_play("xtraores_empty", {object=player})
		end

if  inv:contains_item("main", needed_ammo) then
		inv:remove_item("main", needed_ammo)	

		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
local proj_itself = w_item:get_definition().projectile_attack or "xtraores:gunsmoke"

local obj = core.add_entity(pos, proj_itself)
			if obj then

local pr_sound = w_item:get_definition().projectile_sound or ""
				core.sound_play(pr_sound, {object=obj})

local p_vel = w_item:get_definition().projectile_velocity or 20
local p_grav = w_item:get_definition().projectile_gravity or 10
local p_spr = w_item:get_definition().projectile_spread / 10  or 10

obj:set_velocity({x=dir.x * p_vel, y=dir.y * p_vel, z=dir.z * p_vel})
obj:set_acceleration({x=dir.x * math.random(0,p_spr), y=math.random(0,p_spr) - p_grav, z=dir.z * math.random(0,p_spr)})
obj:set_yaw(yaw + math.pi)

				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or player
	end end end end end end end end
 end)

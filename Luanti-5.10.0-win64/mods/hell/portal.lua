--code copied from Pilzadam's nether mod and edited

-- kills the player if he uses PilzAdam portal
local portal_target = hell.buildings+1
local damage_enabled = core.settings:get_bool("enable_damage")
local mclike_portal = false

local save_path = core.get_worldpath() .. "/hell_players"
local players_in_hell = {}

-- Load the list of players which are trapped in hell
-- (or would be trapped if hell.trap_players was true)
do
	local file = io.open(save_path, "r")
	if file then
		local contents = file:read"*all"
		io.close(file)
		if contents then
			local playernames = string.split(contents, " ")
			for i = 1,#playernames do
				players_in_hell[playernames[i]] = true
			end
		end
	end
end

local function save_hell_players()
	local playernames,n = {},1
	for name in pairs(players_in_hell) do
		playernames[n] = name
		n = n+1
	end
	local f = io.open(save_path, "w")
	assert(f, "Could not open hell_players file for writing.")
	f:write(table.concat(playernames, " "))
	io.close(f)
end

local update_background
if hell.trap_players then
	function update_background(player, down)
		if down then
			player:set_sky({r=15, g=0, b=0}, "plain")
		else
			player:set_sky(nil, "regular")
		end
	end
else
	function update_background()end
end

-- returns nodename if area is generated, else calls generation function
local function generated_or_generate(pos)
	local node = core.get_node_or_nil(pos)
	if node then
		return node.name
	end
	core.get_voxel_manip():read_from_map(pos, pos)
	node = core.get_node_or_nil(pos)
	if not node then
		core.emerge_area(vector.subtract(pos, 80), vector.add(pos, 80))
		return false
	end
	return node.name
end

-- where the player appears after dying
local function get_player_died_target(player)
	local target = vector.add(player:get_pos(),
		{x=math.random(-100,100), y=0, z=math.random(-100,100)})
	target.y = portal_target + math.random(4)
	return target
end

-- used for hell_frame portal
local function hell_frame_teleport(player, pname, target)
	core.chat_send_player(pname, "For any reason you arrived here. Type " ..
		"/hell_help to find out things like craft recipes.")
	players_in_hell[pname] = true
	save_hell_players()
	update_background(player, true)
	if target then
		player:set_pos(target)
	else
		player:set_hp(0)
	end
end

-- teleports players to hell or helps it
local function player_to_hell(player, pos)
	local pname = player:get_player_name()
	players_in_hell[pname] = true
	save_hell_players()
	update_background(player, true)
	if pos then
		player:set_pos(pos)
		return
	end
	core.chat_send_player(pname, "For any reason you arrived here. " ..
		"Type /hell_help to find out things like craft recipes.")
	if hell.trap_players then
		player:set_hp(0)
	end
	if not damage_enabled or not hell.trap_players then
		player:set_pos(get_player_died_target(player))
	end
end

local function player_from_hell(player, pos)
	local pname = player:get_player_name()
	if players_in_hell[pname] then
		players_in_hell[pname] = nil
		save_hell_players()
	end
	update_background(player, false)
	player:set_pos(pos)
end


local function player_exists(name)
	local players = core.get_connected_players()
	for i = 1,#players do
		if players[i]:get_player_name() == name then
			return true
		end
	end
	return false
end

-- Chatcommands (edited) written by sss
core.register_chatcommand("to_hell", {
	params = "[<player_name>]",
	description = "Send someone to hell",
	func = function(name, pname)
		if not core.check_player_privs(name, {hell=true}) then
			return false,
				"You need the hell privilege to execute this chatcommand."
		end
		if not player_exists(pname) then
			pname = name
		end
		local player = core.get_player_by_name(pname)
		if not player then
			return false, "Something went wrong."
		end
		core.chat_send_player(pname, "Go to hell !!!")
		player_to_hell(player)
		return true, pname.." is now in hell."
	end
})

core.register_chatcommand("from_hell", {
	params = "[<player_name>]",
	description = "Extract from hell",
	func = function(name, pname)
		if not core.check_player_privs(name, {hell=true}) then
			return false,
				"You need the hell priv to execute this chatcommand."
		end
		if not player_exists(pname) then
			pname = name
		end
		local player = core.get_player_by_name(pname)
		if not player then
			return false, "Something went wrong."
		end
		core.chat_send_player(pname, "You are free now")
		local pos = player:get_pos()
		player_from_hell(player, {x=pos.x, y=10, z=pos.z})
		return true, pname.." is now out of hell."
	end
})


-- Disallow teleportation and change spawn positions if hell traps players
if hell.trap_players then
	-- randomly set player position when he/she dies in hell
	core.register_on_respawnplayer(function(player)
		local pname = player:get_player_name()
		if not players_in_hell[pname] then
			return
		end
		local target = get_player_died_target(player)
		player:set_pos(target)
		core.after(0, function(pname, target)
			-- fixes respawn bug
			local player = core.get_player_by_name(pname)
			if player then
				player:move_to(target)
			end
		end, pname, target)
		return true
	end)

	-- override set_pos etc. to disallow player teleportion by e.g. travelnet
	local function can_teleport(player, pos)
		if not player:is_player() then
			-- the same metatable is used for entities
			return true
		end
		local pname = player:get_player_name()
		local in_hell = players_in_hell[pname] == true

		-- test if the target is valid
		if pos.y < hell.start then
			if in_hell then
				return true
			end
		elseif not in_hell then
			return true
		end

		-- test if the current position is valid
		local current_pos = player:get_pos()
		local now_in_hell = current_pos.y < hell.start
		if now_in_hell ~= in_hell then
			if in_hell then
				core.log("action", "Player \"" .. pname ..
					"\" has to be in hell, teleporting it!")
				update_background(player, true)
				current_pos.y = portal_target
				player:set_pos(current_pos)
			else
				core.log("action", "Player \"" .. pname ..
					"\" must not be in hell, teleporting it!")
				update_background(player, false)
				current_pos.y = 20
				player:set_pos(current_pos)
			end
			return false
		end

		core.chat_send_player(pname,
			"You can not simply teleport to or from hell!")
		core.log("action", "Player \"" .. pname ..
			"\" attempted to teleport from or to hell, ignoring.")
		return false
	end
	local methods = {"set_pos", "move_to", "setpos", "moveto"}
	local metatable_overridden
	core.register_on_joinplayer(function(player)
		-- set the background when the player joins
		if player:get_pos().y < hell.start then
			update_background(player, true)
		end

		-- overide set_pos etc. if not yet done
		if metatable_overridden then
			return
		end
		metatable_overridden = true
		local mt = getmetatable(player)
		for i = 1,#methods do
			local methodname = methods[i]
			local origfunc = mt[methodname]
			mt[methodname] = function(...)
				if can_teleport(...) then
					origfunc(...)
				end
			end
		end
	end)
end

-- removes the violet stuff from the hell_frame portal
local function remove_portal_essence(pos)
	for y = -1,1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		if core.get_node(p).name == "hell:portal" then
			core.remove_node(p)
		end
	end
end

-- teleports player to hell (hell_frame portal)
local function hell_frame_teleport_player(player, pos, target)
	local pname = player:get_player_name()
	if players_in_hell[pname] then
		return
	end

	local objpos = player:get_pos()
	objpos.y = objpos.y+.1 -- Fix some glitches at -8000
	if core.get_node(vector.round(objpos)).name ~= "hell:portal" then
		return
	end

	local has_teleported
	if damage_enabled then
		hell_frame_teleport(player, pname)
		has_teleported = true
	else
		local target = vector.round(get_player_died_target(player))
		if generated_or_generate(target) then
			hell_frame_teleport(player, pname, target)
			has_teleported = true
		end
	end

	if not has_teleported then
		-- e.g. ungenerated area
		return
	end

	remove_portal_essence(pos)

	core.sound_play("hell_portal_usual", {to_player=pname, gain=1})
end

-- change parts of the definition instead of recreating it every time
local particledef = {
	amount = 32,
	time = 4,
	minvel = {x=0, y=1, z=0},
	maxvel = {x=0, y=2, z=0},
	minacc = {x=-.5,y=-3,z=-.3},
	maxacc = {x=.5,y=-.4,z=.3},
	exptime = 1,
	minsize = .4,
	maxsize = 3,
	collisiondetection = true,
}

local blnk = "blank.png"
core.register_node("hell:portal", {
	description = "Hell Portal Essence",
	tiles = {blnk, blnk, blnk, blnk, "hell_portal_stuff.png"},
	inventory_image = "hell_portal_stuff.png",
	wield_image = "hell_portal_stuff.png",
	light_source = 12,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	walkable = false,
	pointable = false,
	drop = "",
	diggable = false,
	is_ground_content = false,
	on_blast = function() end,
	groups = {timer_check=1, not_in_creative_inventory=1},
	post_effect_color = {a=200, r=50, g=0, b=60},
	drawtype = "nodebox",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.1, .5, .5, .1}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(0)
	end,
	on_timer = function(pos, elapsed)-- particles of the hell_frame portal essence and for teleporting
		particledef.minpos = {x=pos.x-.25, y=pos.y-.5, z=pos.z-.25}
		particledef.maxpos = {x=pos.x+.25, y=pos.y+.34, z=pos.z+.25}
		particledef.texture = "hell_portal_particle.png^[transform" ..math.random(0, 7)
		core.add_particlespawner(particledef)
		for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() then
		local meta = core.get_meta(pos)
		local target = core.string_to_pos(meta:get_string("target"))
		if target then
			core.after(3, hell_frame_teleport_player, obj, pos, target)
		end
	end
		end
		core.get_node_timer(pos):start(2)
	end,
})

local function move_check(p1, max, dir)
	local p = {x=p1.x, y=p1.y, z=p1.z}
	local d = math.abs(max-p1[dir]) / (max-p1[dir])
	while p[dir] ~= max do
		p[dir] = p[dir] + d
		if core.get_node(p).name ~= "hell:frame" then
			return false
		end
	end
	return true
end

local function check_portal(p1, p2)
	if p1.x ~= p2.x then
		if not move_check(p1, p2.x, "x") then
			return false
		end
		if not move_check(p2, p1.x, "x") then
			return false
		end
	elseif p1.z ~= p2.z then
		if not move_check(p1, p2.z, "z") then
			return false
		end
		if not move_check(p2, p1.z, "z") then
			return false
		end
	else
		return false
	end

	if not move_check(p1, p2.y, "y") then
		return false
	end
	if not move_check(p2, p1.y, "y") then
		return false
	end

	return true
end

-- tests if it's a hell_frame portal
local function is_portal(pos)
	for d=-2,2 do
		for y=-3,3 do
			local px = {x=pos.x+d, y=pos.y+y, z=pos.z}
			local pz = {x=pos.x, y=pos.y+y, z=pos.z+d}
			if check_portal(px, {x=px.x+2, y=px.y+3, z=px.z}) then
				return px, {x=px.x+2, y=px.y+3, z=px.z}
			end
			if check_portal(pz, {x=pz.x, y=pz.y+3, z=pz.z+2}) then
				return pz, {x=pz.x, y=pz.y+3, z=pz.z+2}
			end
		end
	end
end

-- adds the violet portal essence
local function make_portal(pos)
	local p1, p2 = is_portal(pos)
	if not p1
	or not p2 then
		print("[hell] something failed.")
		return false
	end

	local in_hell = p1.y < hell.start

	if in_hell then
		print("[hell] aborted, hell_frame portals can't be used to get out")
		return
	end

	for d=1,1 do
	for y=p1.y+1,p2.y-1 do
		local p
		if p1.z == p2.z then
			p = {x=p1.x+d, y=y, z=p1.z}
		else
			p = {x=p1.x, y=y, z=p1.z+d}
		end
		if core.get_node(p).name ~= "air" then
			return false
		end
	end
	end

	local param2
	if p1.z == p2.z then
		param2 = 0
	else
		param2 = 1
	end

	local target = {x=p1.x, y=p1.y, z=p1.z}
	target.x = target.x + 1
	target.y = portal_target + math.random(4)

	if not generated_or_generate(target)
	and mclike_portal then
		return false
	end

	for d=0,2 do
	for y=p1.y,p2.y do
		local p
		if param2 == 0 then
			p = {x=p1.x+d, y=y, z=p1.z}
		else
			p = {x=p1.x, y=y, z=p1.z+d}
		end
		if core.get_node(p).name == "air" then
			core.set_node(p, {name="hell:portal", param2=param2})
		end
		local meta = core.get_meta(p)
		meta:set_string("p1", core.pos_to_string(p1))
		meta:set_string("p2", core.pos_to_string(p2))
		meta:set_string("target", core.pos_to_string(target))
	end
	end
	print("[hell] construction accepted.")
	return true
end

core.register_node("hell:frame", {
	description = "Hell Portal Frame",
	tiles = {"hell_frame.png"},
	is_ground_content = false,
	on_blast = function() end,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
	damage_per_second = 5,
	groups = {cracky = 1, level = 2, poison = 1},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		local meta = core.get_meta(pos)
		local p1 = core.string_to_pos(meta:get_string("p1"))
		local p2 = core.string_to_pos(meta:get_string("p2"))
		local target = core.string_to_pos(meta:get_string("target"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = core.get_node({x=x,y=y,z=z}).name
			if nn == "hell:frame" or nn == "hell:portal" then
				if nn == "hell:portal" then
					core.remove_node({x=x,y=y,z=z})
				end
				local m = core.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
		meta = core.get_meta(target)
		if not meta then
			return
		end
		p1 = core.string_to_pos(meta:get_string("p1"))
		p2 = core.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = core.get_node({x=x,y=y,z=z}).name
			if nn == "hell:frame" or nn == "hell:portal" then
				if nn == "hell:portal" then
					core.remove_node({x=x,y=y,z=z})
				end
				local m = core.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
	end
})

-- override iron lump for making a hell_frame portal
core.override_item("default:iron_lump", {
	on_place = function(stack, player, pt)
		if pt.under and core.get_node(pt.under).name == "hell:frame" then
			local done = make_portal(pt.under)
			if done then
				local pname = player:get_player_name()
				core.chat_send_player(pname,
	"Warning: If you are in hell you may not be able to find the way out!")
				if not core.is_creative_enabled(pname) then
					stack:take_item()
				end
			end
		end
		return stack
	end
})

core.register_craft({
	type = "cooking",
	output = "hell:frame",
	recipe = "bones:bones",
	cooktime = 61.6,
	replacements = {{"bones:bones", "bonemeal:bone 9"}},
})


-- a not filled square
local function vector_square(r)
	local tab, n = {}, 1
	for i = -r+1, r do
		for j = -1, 1, 2 do
			local a, b = r*j, i*j
			tab[n] = {a, b}
			tab[n+1] = {b, a}
			n=n+2
		end
	end
	return tab
end

local function is_hellportal(pos)
	local x, y, z = pos.x, pos.y, pos.z
	for _,i in pairs({-1, 3}) do
		if core.get_node({x=x, y=y+i, z=z}).name ~= "hell:ivory" then
			return
		end
	end
	for _,sn in pairs(vector_square(1)) do
		if core.get_node({x=x+sn[1], y=y-1, z=z+sn[2]}).name ~= "hell:rack"
		or core.get_node({x=x+sn[1], y=y+3, z=z+sn[2]}).name ~= "hell:blood_wood_cooked" then
			return
		end
	end
	for _,sn in pairs(vector_square(2)) do
		if core.get_node({x=x+sn[1], y=y-1, z=z+sn[2]}).name ~= "hell:rack_black"
		or core.get_node({x=x+sn[1], y=y+3, z=z+sn[2]}).name ~= "hell:blood_wood_empty" then
			return
		end
	end
	for i = -1,1,2 do
		for j = -1,1,2 do
			if core.get_node({x=x+i, y=y+2, z=z+j}).name ~= "hell:gills" then
				return
			end
		end
	end
	for i = -2,2,4 do
		for j = 0,2 do
			for k = -2,2,4 do
				if core.get_node({x=x+i, y=y+j, z=z+k}).name ~= "hell:rack_brick_blue" then
					return
				end
			end
		end
	end
	for i = -1,1 do
		for j = -1,1 do
			if core.get_node({x=x+i, y=y+4, z=z+j}).name ~= "hell:blood_wood_empty" then
				return
			end
		end
	end
	return true
end

-- cache known portals
local known_portals_d = {}
local known_portals_u = {}
local function get_portal(t, z,x)
	return t[z] and t[z][x]
end
local function set_portal(t, z,x, y)
	t[z] = t[z] or {}
	t[z][x] = y
end

local function get_player_nodepos(player)
	local pos = player:get_pos()
	pos.y = pos.y + player:get_properties().collisionbox[2] + .5
	return vector.round(pos)
end

-- used when a player uses a pearl in a portal
function hell.teleport_player(player)
	if not player then
		core.log("error", "[hell] Missing player.")
		return
	end
	local pos = get_player_nodepos(player)
	if not is_hellportal(pos) then
		return
	end
	core.sound_play("hell_teleporter", {pos=pos})
	local meta = core.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
	if pos.y < hell.start then
		set_portal(known_portals_d, pos.z,pos.x, pos.y)

		local my = tonumber(meta:get_string("y"))
		local y = get_portal(known_portals_u, pos.z,pos.x)
		if y then
			if y ~= my then
				meta:set_string("y", y)
			end
		else
			y = my or 10
		end
		pos.y = y - .3

		player_from_hell(player, pos)
	else
		set_portal(known_portals_u, pos.z,pos.x, pos.y)

		local my = tonumber(meta:get_string("y"))
		local y = get_portal(known_portals_d, pos.z,pos.x)
		if y then
			if y ~= my then
				meta:set_string("y", y)
			end
		else
			y = my or portal_target+math.random(4)
		end
		pos.y = y - .3

		player_to_hell(player, pos)
	end
	core.sound_play("hell_teleporter", {pos=pos})
	return true
end

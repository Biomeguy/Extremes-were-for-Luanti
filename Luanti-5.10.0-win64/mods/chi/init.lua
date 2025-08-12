--[[
Chi
This mod adds chi to players, a special attribute

License: MIT License
]]

--[===[
	Initialization
]===]

local S = core.get_translator("chi")

chi = {}
chi.playerlist = {}

chi.settings = {}
chi.settings.default_max = 200
chi.settings.default_regen = 1
chi.settings.regen_timer = 0.2

do
	local default_max = tonumber(core.settings:get("chi_default_max"))
	if default_max ~= nil then
		chi.settings.default_max = default_max
	end

	local default_regen = tonumber(core.settings:get("chi_default_regen"))
	if default_regen ~= nil then
		chi.settings.default_regen = default_regen
	end

	local regen_timer = tonumber(core.settings:get("chi_regen_timer"))
	if regen_timer ~= nil then
		chi.settings.regen_timer = regen_timer
	end
end


--[===[
	API functions
]===]

function chi.set(pname, value) 
	if value < 0 then
		core.log("info", "[chi] Warning: chi.set was called with negative value!")
		value = 0
	end
	value = chi.round(value)
	if value > chi.playerlist[pname].maxchi then
		value = chi.playerlist[pname].maxchi
	end
	if chi.playerlist[pname].chi ~= value then
		chi.playerlist[pname].chi = value
		chi.hud_update(pname)
	end
end

function chi.setmax(pname, value)
	if value < 0 then
		value = 0
		core.log("info", "[chi] Warning: chi.setmax was called with negative value!")
	end
	value = chi.round(value)
	if chi.playerlist[pname].maxchi ~= value then
		chi.playerlist[pname].maxchi = value
		if(chi.playerlist[pname].chi > value) then
			chi.playerlist[pname].chi = value
		end
		chi.hud_update(pname)
	end
end

function chi.setregen(pname, value)
	chi.playerlist[pname].regen = value
end

function chi.get(pname)
	return chi.playerlist[pname].chi
end

function chi.getmax(pname)
	return chi.playerlist[pname].maxchi
end

function chi.getregen(pname)
	return chi.playerlist[pname].regen
end

function chi.add_up_to(pname, value)
	local t = chi.playerlist[pname]
	value = chi.round(value)
	if(t ~= nil and value >= 0) then
		local excess
		if((t.chi + value) > t.maxchi) then
			excess = (t.chi + value) - t.maxchi
			t.chi = t.maxchi
		else
			excess = 0
			t.chi = t.chi + value
		end
		chi.hud_update(pname)
		return true, excess
	else
		return false
	end
end

function chi.add(pname, value)
	local t = chi.playerlist[pname]
	value = chi.round(value)
	if(t ~= nil and ((t.chi + value) <= t.maxchi) and value >= 0) then
		t.chi = t.chi + value 
		chi.hud_update(pname)
		return true
	else
		return false
	end
end

function chi.subtract(pname, value)
	local t = chi.playerlist[pname]
	value = chi.round(value)
	if(t ~= nil and t.chi >= value and value >= 0) then
		t.chi = t.chi -value 
		chi.hud_update(pname)
		return true
	else
		return false
	end
end

function chi.subtract_up_to(pname, value)
	local t = chi.playerlist[pname]
	value = chi.round(value)
	if(t ~= nil and value >= 0) then
		local missing
		if((t.chi - value) < 0) then
			missing = math.abs(t.chi - value)
			t.chi = 0
		else
			missing = 0
			t.chi = t.chi - value
		end
		chi.hud_update(pname)
		return true, missing
	else
		return false
	end
end





--[===[
	File handling, loading data, saving data, setting up stuff for players.
]===]


-- Load the playerlist from a previous session, if available.
do
	local filepath = core.get_worldpath().."/chi.mt"
	local file = io.open(filepath, "r")
	if file then
		core.log("action", "[chi] chi.mt opened.")
		local string = file:read()
		io.close(file)
		if(string ~= nil) then
			local savetable = core.deserialize(string)
			chi.playerlist = savetable.playerlist
			core.debug("[chi] chi.mt successfully read.")
		end
	end
end

function chi.save_to_file()
	local savetable = {}
	savetable.playerlist = chi.playerlist

	local savestring = core.serialize(savetable)

	local filepath = core.get_worldpath().."/chi.mt"
	local file = io.open(filepath, "w")
	if file then
		file:write(savestring)
		io.close(file)
		core.log("action", "[chi] Wrote chi data into "..filepath..".")
	else
		core.log("error", "[chi] Failed to write chi data into "..filepath..".")
	end
end


core.register_on_respawnplayer(function(player)
	local pname = player:get_player_name()
	chi.set(pname, 0)
	chi.hud_update(pname)
end)


core.register_on_leaveplayer(function(player)
	local pname = player:get_player_name()
	if not core.get_modpath("hudbars") ~= nil then
		chi.hud_remove(pname)
	end
	chi.save_to_file()
end)

core.register_on_shutdown(function()
	core.log("action", "[chi] Server shuts down. Rescuing data into chi.mt")
	chi.save_to_file()
end)

core.register_on_joinplayer(function(player)
	local pname = player:get_player_name()
	
	if chi.playerlist[pname] == nil then
		chi.playerlist[pname] = {}
		chi.playerlist[pname].chi = 0
		chi.playerlist[pname].maxchi = chi.settings.default_max
		chi.playerlist[pname].regen = chi.settings.default_regen
		chi.playerlist[pname].remainder = 0
	end

	if core.get_modpath("hudbars") ~= nil then
		hb.init_hudbar(player, "chi", chi.get(pname), chi.getmax(pname))
	else
		chi.hud_add(pname)
	end
end)


--[===[
	Chi regeneration
]===]

chi.regen_timer = 0

core.register_globalstep(function(dtime)
	chi.regen_timer = chi.regen_timer + dtime
	if chi.regen_timer >= chi.settings.regen_timer then
		local factor = math.floor(chi.regen_timer / chi.settings.regen_timer)
		local players = core.get_connected_players()
		for i=1, #players do
			local name = players[i]:get_player_name()
			if chi.playerlist[name] ~= nil then
				if players[i]:get_hp() > 0 then
					local plus = chi.playerlist[name].regen * factor
					-- Compability check for version <= 1.0.2 which did not have the remainder field
					if chi.playerlist[name].remainder ~= nil then
						plus = plus + chi.playerlist[name].remainder
					end
					local plus_now = math.floor(plus)
					local floor = plus - plus_now
					if plus_now > 0 then
						chi.add_up_to(name, plus_now)
					else
						chi.subtract_up_to(name, math.abs(plus_now))
					end
					chi.playerlist[name].remainder = floor
				end
			end
		end
		chi.regen_timer = chi.regen_timer % chi.settings.regen_timer
	end
end)

--[===[
	HUD functions
]===]

if core.get_modpath("hudbars") ~= nil then
	hb.register_hudbar("chi", 0xFFFFFF, S("Chi"), { bar = "chi_bar.png", icon = "chi_icon.png", bgicon = "chi_bgicon.png" }, 0, chi.settings.default_max, false)

	function chi.hud_update(pname)
		local player = core.get_player_by_name(pname)
		if player ~= nil then
			hb.change_hudbar(player, "chi", chi.get(pname), chi.getmax(pname))
		end
	end

	function chi.hud_remove(pname)
	end

else
	function chi.chistring(pname)
		return S("Chi: @1/@2", chi.get(pname), chi.getmax(pname))
	end
	
	function chi.hud_add(pname)
		local player = core.get_player_by_name(pname)
		local id = player:hud_add({
			type = "text",
			position = { x = 0.5, y=1 },
			text = chi.chistring(pname),
			scale = { x = 0, y = 0 },
			alignment = { x = 1, y = 0},
			direction = 1,
			number = 0xFFFFFF,
			offset = { x = -262, y = -103}
		})
		chi.playerlist[pname].hudid = id
		return id
	end
	
	function chi.hud_update(pname)
		local player = core.get_player_by_name(pname)
		player:hud_change(chi.playerlist[pname].hudid, "text", chi.chistring(pname))
	end
	
	function chi.hud_remove(pname)
		local player = core.get_player_by_name(pname)
		player:hud_remove(chi.playerlist[pname].hudid)
	end
end

--[===[
	Helper functions
]===]
chi.round = function(x)
	return math.ceil(math.floor(x+0.5))
end

--[[if core.get_current_modname() ~= "pooper" then
   error("mod directory must be named 'pooper'");
end]]

dofile(core.get_modpath("pooper") .. "/keybind.lua")

core.register_node("pooper:poop_pile", {
	description = "Pile of Feces",
	tiles = {"poop_pile.png"},
	groups = {crumbly = 3, soil = 1, falling_node = 1},
	drop = "pooper:poop_turd 4",
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("pooper:poop_compost_pile", {
	description = "Fece Compost Pile",
	tiles = {"default_compost_pile.png^[colorize:#70280045"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(270, 1500))
	end,
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 1, "group:water") or not core.find_node_near(pos, 1, {"air", "trunks:moss_fungus"})
		or default.h_h_h(pos, nil, -10, 19) and default.h_h_h(pos, nil, 110) then
			core.set_node(pos, {name = "default:dirt"})
		else
			core.set_node(pos, {name = "default:compost"})
		end
	end,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_craftitem("pooper:poop_turd", {
	description = "Feces",
	inventory_image = "poop_turd.png",
	on_use = core.item_eat(1)
})

core.register_craftitem("pooper:digestive_agent", {
	description = "Raw Digestive Agent",
	inventory_image = "raw_digestive_agent.png",
	stack_max = 1,
	on_use = core.item_eat(0, "vessels:glass_bottle")
})

core.register_craft({
	output = "pooper:poop_pile",
	recipe = {
		{"", "pooper:poop_turd", ""},
		{"pooper:poop_turd", "pooper:poop_turd", "pooper:poop_turd"}
	}
})

core.register_craft({
	output = "pooper:digestive_agent",
	recipe = {
		{"flowers:waterlily"},
		{"flowers:mushroom_red"},
		{"vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "pooper:laxative",
	recipe = "pooper:digestive_agent"
})

core.register_craft({
	type = "shapeless",
	output = "pooper:poop_compost_pile 3",
	recipe = {"pooper:poop_pile", "default:torch", "default:compost_pile", "default:compost_pile"},
	replacements = {{"default:torch", "default:torch_spent"}}
})

MIN_TIME_BETWEEN_PLAYER_POOP = 3600
FOOD_FILLS_BOWELS_BY = 600

-- Spawn stool at player location
local defecate = function(amount, pname)
	if amount <= MIN_TIME_BETWEEN_PLAYER_POOP then
		core.chat_send_player(pname, "Your bowels are empty!")
	else
		core.sound_play("poop_defecate", {pos=core.get_player_by_name(pname):get_pos(), gain = 1.0, max_hear_distance = 10,})
		core.add_item(core.get_player_by_name(pname):get_pos(), "pooper:poop_turd")
	end
end

local player_bowels = {}
local bowel_variance = {}

core.register_globalstep(function(dtime)
	for _, user in pairs(core.get_connected_players()) do
		local pname = user:get_player_name()
		-- Sets initial bowel level when first iterating over this loop
		if player_bowels[pname] == nil then
			player_bowels[pname] = math.random(1, MIN_TIME_BETWEEN_PLAYER_POOP - 1)
		end
		if bowel_variance[pname] == nil then
			bowel_variance[pname] = math.random(800, 2000)
		end
		player_bowels[pname] = player_bowels[pname] + 1 --dtime
		-- Defecate at least every X seconds
		if player_bowels[pname] >= MIN_TIME_BETWEEN_PLAYER_POOP + bowel_variance[pname] then
			defecate(player_bowels[pname], pname)
			player_bowels[pname] = 0
			bowel_variance[pname] = math.random(800, 2000)
		end
		-- Gut growls to notify player of readiness to defecate
		if player_bowels[pname] == MIN_TIME_BETWEEN_PLAYER_POOP then
			core.sound_play("poop_rumble", {pos=core.get_player_by_name(pname):get_pos(), gain = 1.0, max_hear_distance = 10,})
		end
	end
end)

-- Empty bowels when manual defecate is called
get_bowel_level = function(who)
	local pname = who
	local snapshot = player_bowels[pname]
	-- Check whether bowels have filled sufficiently or not
	if player_bowels[pname] > MIN_TIME_BETWEEN_PLAYER_POOP then
		player_bowels[pname] = 0
	end
	return snapshot
end

-- Manually defecate when sneak key is pressed
core.register_on_key_press(function(player, key)
	local pooper = player:get_player_name()
	if key == "aux1" then
		defecate(get_bowel_level(pooper), pooper)
	end
end)

-- Eating food item increases bowel level
core.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointd)
	core.after(5, function()
		local pname = user:get_player_name()
		player_bowels[pname] = player_bowels[pname] + FOOD_FILLS_BOWELS_BY
	end)
end)

core.register_abm(
	{nodenames = {"pooper:poop_pile"},
	interval = 2.0,
	chance = 1,
	-- Suffocate players within a 5 node radius of "poop_pile"
	action = function(pos)
	local objects = core.get_objects_inside_radius(pos, 5)
	-- Poll players for names to pass to set_breath()
	for i, obj in ipairs(objects) do
		if (obj:is_player()) then
			local depletion = core.get_player_by_name(obj:get_player_name()):get_breath() - 1
			if core.get_player_by_name(obj:get_player_name()):get_breath() > 1 then
				core.get_player_by_name(obj:get_player_name()):set_breath(depletion)
			else
				local health_initial = core.get_player_by_name(obj:get_player_name()):get_hp()
				local health_drain = health_initial - 0.5
				if health_drain > 2 then
					core.get_player_by_name(obj:get_player_name()):set_hp(health_drain)
				end
			end
		end
	end
end,
})

-- Clear player bowels on death
core.register_on_dieplayer(function(player)
	-- Such a low number to minimize likelihood of idle dead players pooping
	player_bowels[player:get_player_name()] = -90000
end)

-- Clear player bowels on respawn
core.register_on_respawnplayer(function(player)
	player_bowels[player:get_player_name()] = 0
end)

core.register_craftitem("pooper:laxative", {
	description = "Laxative",
	inventory_image = "laxative.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointd)
		--replace_with_item = "vessels:glass_bottle"
		core.do_item_eat(0, "vessels:glass_bottle", itemstack, user, pointd)
		core.chat_send_player(user:get_player_name(), "You suddenly do not feel well...")
		core.sound_play("poop_rumble")
		for q = 1, 5 do
			core.after(math.random(4,8), function()
				defecate(999999, user:get_player_name())
			end)
		end
		itemstack:take_item()
		return "vessels:glass_bottle"
	end
})

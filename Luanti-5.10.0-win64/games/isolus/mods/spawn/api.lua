spawn = {}

-- provide empty default implementations

function spawn.get_default_pos()
	return nil
end

function spawn.add_suitable_biome(biome)
end

-- Callback registration

spawn.registered_on_spawn = {}

function spawn.register_on_spawn(func)
	table.insert(spawn.registered_on_spawn, func)
end

-- Logic run on spawn

local use_engine_spawn = core.settings:get("static_spawnpoint") or
		core.settings:get_bool("engine_spawn")

local function on_spawn(player, is_new)
	-- Ask all callbacks first
	for _, cb in ipairs(spawn.registered_on_spawn) do
		if cb(player, is_new) then
			return true
		end
	end
	-- Fall back to default spawn
	if not use_engine_spawn then
		local pos = spawn.get_default_pos()
		if pos then
			player:set_pos(pos)
			return true
		end
	end
	return false
end

core.register_on_newplayer(function(player)
	on_spawn(player, true)
end)

core.register_on_respawnplayer(function(player)
	return on_spawn(player, false)
end)


if core.get_modpath("chi") and core.get_modpath("extra_energy") then
core.register_tool("spawn:mirror", {
	description = "Magic Mirror (To Cave Realms and places steel ladders from your inv)",
	inventory_image = "mtools_mirror.png",
	on_use = function(item, user)
		local name = user:get_player_name()
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 100 then
		user:get_meta():set_int("_extra_energy", extra_energy - 100)
	elseif chi.subtract(name, 100) then
	else
		user:set_hp(0)
	end
		end
	local pos = user:get_pos()
	if pos.y <= -1501 then
		on_spawn(user, false)
		return
	end
	local desti = core.string_to_pos(item:get_meta():get_string("desti"))
	local vert = -2000
	local posi = {x=pos.x, y=vert, z=pos.z}
if desti ~= nil then
	posi = desti
else
	core.emerge_area(vector.subtract(posi, 4), vector.add(posi, 4))
	item:get_meta():set_string("desti", core.pos_to_string(posi))
end
	core.after(.5, function(user, posi, vert)
	user:set_pos(posi)
	local inv = user:get_inventory()
	if core.get_node(posi).name ~= "default:ladder_steel" and core.get_node(posi).name ~= "ignore" then
	core.dig_node(posi)
	if inv:contains_item("main", "default:ladder_steel") then
inv:remove_item("main", "default:ladder_steel")
core.set_node(posi, {name="default:ladder_steel", param2 = 2})
	end
	end
	if core.get_node({x=posi.x, y=vert+1, z=posi.z}).name ~= "default:ladder_steel" and
		core.get_node({x=posi.x, y=vert+1, z=posi.z}).name ~= "ignore" then
	core.dig_node({x=posi.x, y=vert+1, z=posi.z})
	if inv:contains_item("main", "default:ladder_steel") then
inv:remove_item("main", "default:ladder_steel")
core.set_node({x=posi.x, y=vert+1, z=posi.z}, {name="default:ladder_steel", param2 = 2})
	end end end, user, posi, vert)
		return item
	end,
	on_secondary_use = function(item, user)
		if user:get_player_control().sneak then
	item:get_meta():set_string("desti", "")
		end
		return item
	end,
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user,
					item, pointd)
			end
		end

		if user:get_player_control().sneak then
	item:get_meta():set_string("desti", "")
		end
		return item
	end
})
end

-- Anak, saves its owner from death
local hud_anak = {}
core.register_on_leaveplayer(function(player)
	hud_anak[player:get_player_name()] = nil
end)

core.register_on_player_hpchange(function(player, hp_change)
	local hp = player:get_hp()
	-- Fatal damage?
	if hp + hp_change <= 0 then
		if player:get_wielded_item():get_name() == "spawn:anak" or player:get_meta():get_int("_placed_anak") > 0 then
			local ppos = player:get_pos()
			-- Reset breath as well
			if player:get_breath() < 11 then
				player:set_breath(10)
			end
			-- Effects
			core.sound_play("xtraores_swosh", {pos= ppos, gain=1, max_hear_distance=16}, true)

			-- Big anak overlay
			if not hud_anak[player:get_player_name()] then
				hud_anak[player:get_player_name()] = player:hud_add({
					type = "image",
					text = "xtraores_anak.png",
					position = { x=.5, y=1 },
					scale = { x=17, y=17 },
					offset = { x=0, y=-178 },
					z_index = 100,
				})
				core.after(3, function(name)
					local player = core.get_player_by_name(name)
					if player and player:is_player() then
						if hud_anak[name] then
							player:hud_remove(hud_anak[name])
							hud_anak[name] = nil
						end
					end
				end, player:get_player_name())
			end
			poisoned[player:get_player_name()] = nil

			on_spawn(player, false)
			return -hp + 10
		end
	end
	return hp_change
end, true)

core.register_node("spawn:anak", {
	description = "Anak (ancient symbol of immortality)",
	drawtype = "plantlike",
	tiles = {"xtraores_anak.png"},
	inventory_image = "xtraores_anak.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .4, .2}
	},
	groups = {oddly_breakable_by_hand=3},
	after_place_node = function(pos, placer)
		placer:get_meta():set_int("_placed_anak", placer:get_meta():get_int("_placed_anak")+1)
		core.get_meta(pos):set_string("owner", placer:get_player_name() or "")
	end,
	on_destruct = function(pos)
		local name = core.get_meta(pos):get_string("owner")
		if name ~= "" then
	local player = core.get_player_by_name(name)
	player:get_meta():set_int("_placed_anak", player:get_meta():get_int("_placed_anak")-1)
		end
	end,
})

-- Register anak as dungeon loot
if core.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "spawn:anak", chance = .3, types = {"sandstone", "desert"}},
	})
end

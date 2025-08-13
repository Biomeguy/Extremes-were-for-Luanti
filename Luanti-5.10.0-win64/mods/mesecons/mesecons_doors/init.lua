-- Modified, from minetest_game/mods/doors/init.lua
local function on_rightclick(pos, dir, check_name, replace, replace_dir, params)
	pos.y = pos.y + dir
	if not core.get_node(pos).name == check_name then
		return
	end
	local p2 = core.get_node(pos).param2
	p2 = params[p2 + 1]

	core.swap_node(pos, {name = replace_dir, param2 = p2})

	pos.y = pos.y - dir
	core.swap_node(pos, {name = replace, param2 = p2})

	if (core.get_meta(pos):get_int("right") ~= 0) == (params[1] ~= 3) then
		core.sound_play("doors_door_close", {pos = pos, gain = 0.3, max_hear_distance = 10})
	else
		core.sound_play("doors_door_open", {pos = pos, gain = 0.3, max_hear_distance = 10})
	end
end

local function meseconify_door(name)
	if core.registered_items[name .. "_b_1"] then
		-- old style double-node doors
		local function toggle_state1 (pos, node)
			on_rightclick(pos, 1, name.."_t_1", name.."_b_2", name.."_t_2", {1,2,3,0})
		end

		local function toggle_state2 (pos, node)
			on_rightclick(pos, 1, name.."_t_2", name.."_b_1", name.."_t_1", {3,0,1,2})
		end

		core.override_item(name.."_b_1", {
			mesecons = {effector = {
				action_on = toggle_state1,
				action_off = toggle_state1,
				rules = mesecon.rules.pplate
			}}
		})

		core.override_item(name.."_b_2", {
			mesecons = {effector = {
				action_on = toggle_state2,
				action_off = toggle_state2,
				rules = mesecon.rules.pplate
			}}
		})
	elseif core.registered_items[name .. "_a"] then
		-- new style mesh node based doors
		local override = {
			mesecons = {effector = {
				action_on = function(pos, node)
					local door = doors.get(pos)
					if door then
						door:open()
					end
				end,
				action_off = function(pos, node)
					local door = doors.get(pos)
					if door then
						door:close()
					end
				end,
				rules = mesecon.rules.pplate
			}}
		}
		core.override_item(name .. "_a", override)
		core.override_item(name .. "_b", override)
	end
end

meseconify_door("doors:door_wood")
meseconify_door("doors:door_steel")
meseconify_door("doors:door_glass")
meseconify_door("doors:door_obsidian_glass")

-- Trapdoor
local function trapdoor_switch(pos, node)
	local state = core.get_meta(pos):get_int("state")

	if state == 1 then
		core.sound_play("doors_door_close", {pos = pos, gain = 0.3, max_hear_distance = 10})
		core.set_node(pos, {name="doors:trapdoor", param2 = node.param2})
	else
		core.sound_play("doors_door_open", {pos = pos, gain = 0.3, max_hear_distance = 10})
		core.set_node(pos, {name="doors:trapdoor_open", param2 = node.param2})
	end

	core.get_meta(pos):set_int("state", state == 1 and 0 or 1)
end

if doors and doors.get then
	local override = {
		mesecons = {effector = {
			action_on = function(pos, node)
				local door = doors.get(pos)
				if door then
					door:open()
				end
			end,
			action_off = function(pos, node)
				local door = doors.get(pos)
				if door then
					door:close()
				end
			end,
		}},
	}
	core.override_item("doors:trapdoor", override)
	core.override_item("doors:trapdoor_open", override)
	core.override_item("doors:trapdoor_steel", override)
	core.override_item("doors:trapdoor_steel_open", override)
else
	if core.registered_nodes["doors:trapdoor"] then
		core.override_item("doors:trapdoor", {
			mesecons = {effector = {
				action_on = trapdoor_switch,
				action_off = trapdoor_switch
			}},
		})

		core.override_item("doors:trapdoor_open", {
			mesecons = {effector = {
				action_on = trapdoor_switch,
				action_off = trapdoor_switch
			}},
		})
	end
end

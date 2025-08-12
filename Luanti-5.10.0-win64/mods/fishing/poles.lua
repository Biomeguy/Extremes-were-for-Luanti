
-- Fishing Pole

local S = fishing_setting.func.S

local function rod_wear(item, user, pointd, uses)
	item:add_wear(65535/(uses-1))
	return item
end

fishing_setting.poles = {}
fishing_setting.poles.wood = {["name"] = "wood", ["max_use"] = 30, ["desc"] = S("Fishing Pole"),["bobber_max"] = 2 }
fishing_setting.poles.perfect = {["name"] = "perfect", ["max_use"] = 1500, ["desc"] = S("Perfect Fishing Pole"),["bobber_max"] = 5}


for _,pole in pairs(fishing_setting.poles) do
	local bobbermax = pole["bobber_max"]
	core.register_tool("fishing:pole_".. pole.name, {
		description = pole.desc,
		groups = {},
		inventory_image = "fishing_pole_".. pole.name ..".png",
		wield_image = "fishing_pole_".. pole.name ..".png",
		stack_max = 1,
		liquids_pointable = true,

		on_use = function (item, user, pointd)
			if pointd and pointd.under then
				local pt = pointd
				local node = core.get_node(pt.under)
				if not node or string.find(node.name, "water_source") == nil then return nil end
				local pname = user:get_player_name()
				local inv = user:get_inventory()
				local bait = inv:get_stack("main", user:get_wield_index()+1 ):get_name()
				if fishing_setting.baits[bait] == nil then return nil end

				local objs = core.get_objects_inside_radius(pt.under, 1)
				for m, obj in pairs(objs) do
					if obj:get_luaentity() ~= nil and string.find(obj:get_luaentity().name, "fishing:bobber") then
						if fishing_setting.settings["message"] == true then
							core.chat_send_player(pname, S("Sorry, there is another bobber!"))
						end
						return nil
					end
				end

				--if contest then player must have only 2 boober
				local bobber_nb = 0
				local bobber_max
				if fishing_setting.contest["contest"] ~= nil and fishing_setting.contest["contest"] == true then
					bobber_max = fishing_setting.contest["bobber_nb"]
				else
					bobber_max = bobbermax
				end
				--player has others bobbers?
				for m, obj in pairs(core.get_objects_inside_radius(pt.under, 20)) do
					if obj:get_luaentity() ~= nil and string.find(obj:get_luaentity().name, "fishing:bobber") ~= nil then
						if obj:get_luaentity().owner == pname then
							bobber_nb = bobber_nb + 1
						end
					end
				end
				if bobber_nb >= bobber_max then
					if fishing_setting.settings["message"] == true then
						core.chat_send_player(pname, S("You don't have mores %s bobbers!"):format(bobber_max))
					end
					return nil
				end

				local nodes = 1
				for _,k in  pairs({ {1, 0}, {-1,0}, {0,1}, {0,-1} }) do
					local node_name = core.get_node({x=pt.under.x+k[1], y=pt.under.y, z=pt.under.z+k[2]}).name
					if node_name and string.find(node_name, "water_source") ~= nil
					and core.get_node({x=pt.under.x+k[1], y=pt.under.y+1, z=pt.under.z+k[2]}).name == "air" then
						nodes = nodes + 1
					end
				end
				--if water == -3 nodes
				if nodes < 2 then
					if fishing_setting.settings["message"] == true then core.chat_send_player(pname, S("You don't fishing in a bottle!")) end
					return nil
				end
				local new_pos = {x=pt.under.x, y=pt.under.y+(45/64), z=pt.under.z}
				local ent = core.add_entity({interval = 1,x=new_pos.x, y=new_pos.y, z=new_pos.z}, fishing_setting.baits[bait].bobber)
				if not ent then return nil end
				local luaentity = ent:get_luaentity()
				local node = core.get_node_or_nil(pt.under)
				if node and node.name == "default:fresh_water_source" then
					luaentity.water_type = "rivers"
				else
					luaentity.water_type = "sea"
				end				
				luaentity.owner = pname
				luaentity.bait = bait
				luaentity.old_pos = new_pos
				luaentity.old_pos2 = true
				if not fishing_setting.is_creative_mode then
					inv:remove_item("main", bait)
				end
				core.sound_play("fishing_bobber2", {pos = new_pos, gain = 0.5})
				if fishing_setting.settings["wear_out"] == true and not fishing_setting.is_creative_mode then
					return rod_wear(item, user, pointd, pole.max_use)
				else
					return {name="fishing:pole_".. pole.name, count=1, wear=0, metadata=""}
				end
			end
			return nil
		end,

		on_place = function(item, placer, pointd)
			if fishing_setting.settings["simple_deco_fishing_pole"] == false then return end
			local pt = pointd
			local pt_under_name = core.get_node(pt.under).name
			if string.find(pt_under_name, "water_") == nil then
				local wear = item:get_wear()
				local direction = core.dir_to_facedir(placer:get_look_dir())
				local dir = core.facedir_to_dir(direction)
				local p = vector.add(pt.above, dir)
				local n2 = core.get_node_or_nil(p)
				local def = n2 and core.registered_items[n2.name]
				if not def or not def.buildable_to then
					return nil
				end
				core.set_node(pt.above, {name="fishing:pole_".. pole.name .."_deco", param2=direction})
				local meta = core.get_meta(pt.above)
				meta:set_int("wear", wear)
				if not fishing_setting.is_creative_mode then
					item:take_item()
				end
			end
			return item
		end,
	})

	core.register_node("fishing:pole_".. pole.name .."_deco", {
		description = pole.desc,
		inventory_image = "fishing_pole_".. pole.name ..".png",
		wield_image = "fishing_pole.png^[transformFXR270",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = {
			"fishing_pole_".. pole.name .."_simple.png",
			"fishing_pole_".. pole.name .."_simple.png",
			"fishing_pole_".. pole.name .."_simple.png",
			"fishing_pole_".. pole.name .."_simple.png^[transformFX",
		},
		groups = { snappy=3, flammable=2, not_in_creative_inventory=1 },
		node_box = {
			type = "fixed",
			fixed = {0, -.5,  0, 0, .5,  1}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/16, -.5, 0, 1/16, .5, 1}
		},
		sounds = default.node_sound_wood_defaults(),
		on_dig = function(pos, node, digger)
			if digger:is_player() and digger:get_inventory() then
				local meta = core.get_meta(pos)
				local wear_out = meta:get_int("wear")
				digger:get_inventory():add_item("main", {name="fishing:pole_".. pole.name, count=1, wear=wear_out, metadata=""})
			end
			core.remove_node(pos)
		end,
	})
end

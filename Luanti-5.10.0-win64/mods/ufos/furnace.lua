
ufos.charger_formspec = "size[8,5.5]"..
	"list[current_name;fuel;3.5,0;1,1;]"..
	"list[current_player;main;0,1.5;8,4;]"..
	"label[4.5,0;Fuel: Obsidian Shard or Obsidian]"..
	"label[0,1;Press (E) inside your UFO.]"..
	"label[4,1;You need to park it next to this.]"

core.register_node("ufos:furnace", {
	description = "UFO charging device",
	tiles = {"default_steel_block.png", "default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png", "default_steel_block.png", "default_steel_block.png^ufos_furnace_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("formspec", ufos.charger_formspec)
		meta:set_string("infotext", "UFO charging device")
		inv:set_size("fuel", 1)
		core.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local gchar = meta:get_int("charge")
		local inv = meta:get_inventory()
		local stack = inv:get_stack("fuel",1)
		if stack:get_name() == "default:obsidian_shard" then
			inv:remove_item("fuel",ItemStack("default:obsidian_shard"))
			meta:set_int("charge", gchar+10)
			meta:set_string("formspec", ufos.charger_formspec.. "label[0,0;Charge: "..gchar)
			meta:set_int("obsidian_delay",0)
		elseif stack:get_name() == "default:obsidian" then
			if meta:get_int("obsidian_delay") < 7 then
				meta:set_int("obsidian_delay", meta:get_int("obsidian_delay")+1)
			else
				inv:remove_item("fuel",ItemStack("default:obsidian"))
				meta:set_int("charge", gchar+90)
				meta:set_string("formspec", ufos.charger_formspec.. "label[0,0;Charge: "..gchar)
				meta:set_int("obsidian_delay",0)
			end
		end
		meta:set_string("infotext", "UFO charging device at: "..gchar)
		core.get_node_timer(pos):start(.25)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("fuel")
	end,
})

core.register_node("ufos:furnace_active", {
	description = "UFO charging device",
	tiles = {"default_steel_block.png", "default_steel_block.png", "default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png", "default_steel_block.png^ufos_furnace_front.png^ufos_furnace_front_active.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "ufos:furnace",
	groups = {cracky=2, not_in_creative_inventory=0},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "ufos:furnace",
	recipe = {
		{"default:steel_ingot", "default:obsidian", "default:steel_ingot"},
		{"default:obsidian", "default:furnace", "default:obsidian"},
		{"default:steel_ingot", "default:obsidian", "default:steel_ingot"}
	}
})



local S = core.get_translator("mtools")

--Define the Magic Armor
armor:register_armor("mtools:magic_helmet", {
	description = S("Magic Helmet"),
	inventory_image = "brewing_magic_helmet_inv.png",
	texture = "brewing_magic_helmet.png",
	preview = "brewing_magic_helmet_preview.png",
	groups = {armor_head=1, armor_use=500, flammable=0},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:get_pos()
		if pos then
			core.sound_play({
				name = "brewing_break_armor_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

armor:register_armor("mtools:magic_chestplate", {
	description = S("Magic Chestplate"),
	inventory_image = "brewing_magic_chestplate_inv.png",
	texture = "brewing_magic_chestplate.png",
	preview = "brewing_magic_chestplate_preview.png",
	groups = {armor_torso=1, armor_use=500, flammable=0},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:get_pos()
		if pos then
			core.sound_play({
				name = "brewing_break_armor_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

armor:register_armor("mtools:magic_leggins", {
	description = S("Magic Leggins"),
	inventory_image = "brewing_magic_leggins_inv.png",
	texture = "brewing_magic_leggins.png",
	preview = "brewing_magic_leggins_preview.png",
	groups = {armor_legs=1, armor_use=500, flammable=0},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:get_pos()
		if pos then
			core.sound_play({
				name = "brewing_break_armor_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

armor:register_armor("mtools:magic_boots", {
	description = S("Magic Boots"),
	inventory_image = "brewing_magic_boots_inv.png",
	texture = "brewing_magic_boots.png",
	preview = "brewing_magic_boots_preview.png",
	groups = {armor_feet=1, armor_use=500, flammable=0},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:get_pos()
		if pos then
			core.sound_play({
				name = "brewing_break_armor_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

--Define Magic Armor crafting recipe
core.register_craft({
	output = "mtools:magic_helmet",
	recipe = {
		{"mtools:magic_crystal", "mtools:magic_crystal", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
		{"", "", ""},
	},
})
core.register_craft({
	output = "mtools:magic_chestplate",
	recipe = {
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "mtools:magic_crystal", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "mtools:magic_crystal", "mtools:magic_crystal"},
	},
})
core.register_craft({
	output = "mtools:magic_leggins",
	recipe = {
		{"mtools:magic_crystal", "mtools:magic_crystal", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
	},
})
core.register_craft({
	output = "mtools:magic_boots",
	recipe = {
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
		{"mtools:magic_crystal", "", "mtools:magic_crystal"},
	},
})

if core.global_exists("armor") and armor.elements then
	table.insert(armor.elements, "amulet")
end

--[[Heart Amulet

armor:register_armor("mtools:magic_heart_amulet", {
	description = S("Magic Heart Amulet"),
	inventory_image = "brewing_magic_heart_amulet_inv.png",
	preview = "brewing_magic_heart_amulet_preview.png",
	texture = "brewing_magic_heart_amulet.png",
	groups = {armor_amulet=1, armor_use=500},
	on_equip = function(player, index, stack)
		local current_hp_max = player:get_properties().hp_max
		local with_amulet_hp_max = current_hp_max + brewing.settings.heart_amulet_hp_inc_by
		player:set_properties({hp_max = with_amulet_hp_max})
		local pname = player:get_player_name()
		core.chat_send_player(pname, S("Your max health is increased by").." "..tostring(brewing.settings.heart_amulet_hp_inc_by)..".")
	end,
	on_unequip = function(player, index, stack)
		local current_hp_max = player:get_properties().hp_max
		local with_amulet_hp_max = current_hp_max - brewing.settings.heart_amulet_hp_inc_by
		player:set_properties({hp_max = with_amulet_hp_max})
		local pname = player:get_player_name()
		core.chat_send_player(pname, S("Your max health is decreased by").." "..tostring(brewing.settings.heart_amulet_hp_inc_by)..".")
	end,
})

core.register_craft({
	output = "mtools:magic_heart_amulet",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "mtools:magic_heart", ""},
	}
})

--Health Amulet

armor:register_armor("mtools:magic_health_amulet", {
	description = S("Magic Health Amulet"),
	inventory_image = "brewing_magic_health_amulet_inv.png",
	preview = "brewing_magic_health_amulet_preview.png",
	texture = "brewing_magic_health_amulet.png",
	groups = {armor_amulet=1, armor_use=500},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	on_equip = function(player, index, stack)
		local meta = stack:get_meta()
		local power_level = meta:get_int("health_amulet_power_level")
		if power_level == 0 then
			power_level = brewing.settings.health_amulet_power_level
			meta:set_int("health_amulet_power_level", power_level)
		end
		--Get the 3D Armor inventory
		local inv_name = player:get_player_name().."_armor"
		local inv = core.get_inventory({ type="detached", name= inv_name })
		--if inv:contains_item("armor", stack) then
			--core.chat_send_player("singleplayer", "the item is in list!!!")
		--end
		inv:set_stack("armor", index, stack)
		--core.chat_send_player("singleplayer", "the meta is: "..meta:get_int("health_amulet_power_level"))
		return stack
	end,
	on_damage = function(player, index, stack)
		local player_hp = player:get_hp()
		--core.chat_send_player("singleplayer", S("hurt".. player_hp))
		if player_hp > 0 then
			local meta = stack:get_meta()
			local power_level = meta:get_int("health_amulet_power_level")
			--core.chat_send_player("singleplayer", "going to heal: "..power_level.." "..brewing.settings.health_amulet_heal_points)
			-- Increase the player's hp
			local new_hp = player_hp + brewing.settings.health_amulet_heal_points
			player:set_hp(new_hp)
			--core.chat_send_player("singleplayer", S("You have been healed!"))
			-- Decrease the amulet power
			power_level = power_level - brewing.settings.health_amulet_heal_points
			if power_level > 0 then
				meta:set_int("health_amulet_power_level", power_level) --update the meta data of power level
			else
				--Destroy the amulet!!!
				--Get the 3D Armor inventory
				stack:set_count(0)
				local pname = player:get_player_name()
				core.chat_send_player(pname, S("Your health amulet lost its power, so is destroyed!"))
			end
			local inv_name = player:get_player_name().."_armor"
			local inv = core.get_inventory({ type="detached", name= inv_name })
			inv:set_stack("armor", index, stack) --Important: The stack (that is a copy) has to be updated to inventory
		end
	end,
})

core.register_craft({
	output = "mtools:magic_health_amulet",
	recipe = {
		{"", "default:diamond", ""},
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "mtools:health_add3", ""},
	}
})
]]
--Cross Amulet
if core.get_modpath("invisibility") then
armor:register_armor("mtools:magic_cross_amulet", {
	description = S("Magic Cross Amulet"),
	inventory_image = "brewing_magic_cross_amulet_inv.png",
	preview = "brewing_magic_cross_amulet_preview.png",
	texture = "brewing_magic_cross_amulet.png",
	groups = {armor_amulet=1, armor_use=500},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	on_equip = function(player, index, stack)
		invisibility.invisible(player, true)
	end,
	on_unequip = function(player, index, stack)
		invisibility.invisible(player, nil)
	end,
})

core.register_craft({
	output = "mtools:magic_cross_amulet",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "mtools:magic_cross", ""},
	}
})
end

-- Blue Star Amulet
armor:register_armor("mtools:magic_blue_star_amulet", {
	description = S("Magic Blue Star Amulet"),
	inventory_image = "brewing_magic_blue_star_amulet_inv.png",
	preview = "brewing_magic_blue_star_amulet_preview.png",
	texture = "brewing_magic_blue_star_amulet.png",
	groups = {armor_amulet=1, armor_use=500, physics_speed=brewing.settings.star_blue_amulet_speedup},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
})

core.register_craft({
	output = "mtools:magic_blue_star_amulet",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "mtools:magic_blue_star", ""},
	}
})

-- Load support for MT game translation.
local S = core.get_translator("dark_matter")

core.register_node("dark_matter:divider_electromagnet", {
	description = S("Dark Matter Divider Electromagnet"),
	tiles = {"dark_matter_divider_magnet.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
	on_place = core.rotate_node
})

core.register_node("dark_matter:divider_electromagnet_active", {
	tiles = {"dark_matter_divider_magnet_active.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 5,
	is_ground_content = false,
	drop = "dark_matter:divider_electromagnet",
	on_timer = function(pos, elapsed)
		local xm = {x=pos.x-1, y=pos.y, z=pos.z}
		local xp = {x=pos.x+1, y=pos.y, z=pos.z}
		local ym = {x=pos.x, y=pos.y-1, z=pos.z}
		local yp = {x=pos.x, y=pos.y+1, z=pos.z}
		local zm = {x=pos.x, y=pos.y, z=pos.z-1}
		local zp = {x=pos.x, y=pos.y, z=pos.z+1}
		local p2 = core.get_node(pos).param2
		local mag = "dark_matter:divider_electromagnet"
		local mag_act = "dark_matter:divider_electromagnet_active"
		if search_faces(pos, mag) then
		if p2 == 7 then
			if core.get_node(zp).name == mag then
			swap_preserved(zp, mag_act)
			core.get_node_timer(zp):start(.125) end
		elseif p2 == 9 then
			if core.get_node(zm).name == mag then
			swap_preserved(zm, mag_act)
			core.get_node_timer(zm):start(.125) end
		elseif p2 == 12 then
			if core.get_node(xp).name == mag then
			swap_preserved(xp, mag_act)
			core.get_node_timer(xp):start(.125) end
		elseif p2 == 18 then
			if core.get_node(xm).name == mag then
			swap_preserved(xm, mag_act)
			core.get_node_timer(xm):start(.125) end
		elseif p2 == 0 or p2 == 1 or p2 == 2 or p2 == 3 then
			if core.get_node(yp).name == mag then
			swap_preserved(yp, mag_act)
			core.get_node_timer(yp):start(.125) end
		elseif p2 == 20 or p2 == 21 or p2 == 22 or p2 == 23 then
			if core.get_node(ym).name == mag then
			swap_preserved(ym, mag_act)
			core.get_node_timer(ym):start(.125) end
		end
		end
		swap_preserved(pos, mag)
	end,
	groups = {cracky = 1, level = 2, timer_check = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_metal_defaults(),
	on_place = core.rotate_node
})

dark_matter_divider_formspec = "size[8,7.5]"..
	"list[context;material;2,1;1,1;]"..
	"list[context;created;4,0.5;2,2;]"..
	"list[current_player;main;0,3.25;8,1;]"..
	"list[current_player;main;0,4.5;8,3;8]"..
	"listring[context;created]"..
	"listring[current_player;main]"..
	"listring[context;material]"..
	"listring[current_player;main]"..
	"label[4,0;Created item(s)]"..
	default.get_hotbar_bg(0, 3.25)

core.register_node("dark_matter:divider", {
	description = S("Dark Matter Divider"),
	drawtype = "glasslike",
	tiles = {"dark_matter_divider.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 2,
	sunlight_propagates = true,
	is_ground_content = false,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", S("Dark Matter divider inactive"))
		meta:set_string("formspec", dark_matter_divider_formspec)
		inv:set_size("material", 1)
		inv:set_size("created", 4)
		core.get_node_timer(pos):start(2.)
	end,
	on_timer = function(pos, elapsed)
		local xm = {x=pos.x-2, y=pos.y, z=pos.z}
		local xp = {x=pos.x+2, y=pos.y, z=pos.z}
		local zm = {x=pos.x, y=pos.y, z=pos.z-2}
		local zp = {x=pos.x, y=pos.y, z=pos.z+2}
		local meta = core.get_meta(pos)
		local gcycle = meta:get_int("cycle")
		local inv = meta:get_inventory()
		local stack = inv:get_stack("material",1)
		local mag_act = "dark_matter:divider_electromagnet_active"
		local mag = "dark_matter:divider_electromagnet"
		local infmessage = "Dark Matter divider active: Creation progress "..gcycle
		local message = "label[0,0;Creation progress: "..gcycle
		if core.get_node({x=pos.x-2, y=pos.y+1, z=pos.z}).name == mag_act and
		core.get_node({x=pos.x+2, y=pos.y+1, z=pos.z}).name == mag_act and
		core.get_node({x=pos.x, y=pos.y+1, z=pos.z-2}).name == mag_act and
		core.get_node({x=pos.x, y=pos.y+1, z=pos.z+2}).name == mag_act and
		core.get_node({x=pos.x-2, y=pos.y+1, z=pos.z}).param2 > 3 and
		core.get_node({x=pos.x+2, y=pos.y+1, z=pos.z}).param2 > 3 and
		core.get_node({x=pos.x, y=pos.y+1, z=pos.z-2}).param2 > 3 and
		core.get_node({x=pos.x, y=pos.y+1, z=pos.z+2}).param2 > 3 then
			if stack:get_name() == "" then
				meta:set_int("cycle", 0)
				infmessage = "Dark Matter divider active: Empty"
			elseif gcycle < 100 then
				meta:set_int("cycle", gcycle+1)
				core.sound_play("dmd_working", {pos = pos, gain = 1.}, true)
			else
				inv:add_item("created", ItemStack(stack:get_name()) )
				meta:set_int("cycle", 0)
			end
		elseif core.get_node(xm).name == mag and
		core.get_node(xp).name == mag and
		core.get_node(zm).name == mag and
		core.get_node(zp).name == mag and
		core.get_node(xm).param2 == 18 and
		core.get_node(xp).param2 == 12 and
		core.get_node(zm).param2 == 9 and
		core.get_node(zp).param2 == 7 and
		core.get_node({x=pos.x-2, y=pos.y-1, z=pos.z}).name ~= mag and
		core.get_node({x=pos.x+2, y=pos.y-1, z=pos.z}).name ~= mag and
		core.get_node({x=pos.x, y=pos.y-1, z=pos.z-2}).name ~= mag and
		core.get_node({x=pos.x, y=pos.y-1, z=pos.z+2}).name ~= mag then
			swap_preserved(xm, mag_act)
			core.get_node_timer(xm):start(.125)
			swap_preserved(xp, mag_act)
			core.get_node_timer(xp):start(.125)
			swap_preserved(zm, mag_act)
			core.get_node_timer(zm):start(.125)
			swap_preserved(zp, mag_act)
			core.get_node_timer(zp):start(.125)
		core.sound_play("dmd_powering", {pos = pos, gain = 1., max_hear_distance = 10}, true)
			infmessage = S("Dark Matter divider powering")
			message = "label[0,0;Powering]"
		else
			infmessage = S("Dark Matter divider incomplete: Eminate electromagnets from one space on each side turning back to the first from above")
			message = "label[0,0;Incomplete: See instructions]"
		end
		meta:set_string("infotext", infmessage)
		meta:set_string("formspec", dark_matter_divider_formspec..message)
		core.get_node_timer(pos):start(.25)
	end,
	groups = {cracky = 1, level = 3, timer_check = 1},
	sounds = default.node_sound_glass_defaults(),
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("material") and inv:is_empty("created")
	end
})

core.register_craftitem("dark_matter:magnet_ingot", {
	description = S("Magnet Ingot"),
	inventory_image = "dark_matter_magnet_ingot.png",
})

core.register_craftitem("dark_matter:magnetite_lump", {
	description = S("Magnetite Lump"),
	inventory_image = "dark_matter_magnetite_lump.png",
})

core.register_node("dark_matter:stone_with_magnetite", {
	description = S("Magnetite Ore"),
	tiles = {"default_stone.png^dark_matter_magnetite_ore.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"dark_matter:magnetite_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"dark_matter:magnetite_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"dark_matter:magnetite_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"dark_matter:magnetite_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "dark_matter:stone_with_magnetite",
	wherein        = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 37 * 37 * 37,
	clust_num_ores = 16,
	clust_size     = 4,
	y_max          = 30,
	y_min          = -30748,
	noise_params	= {
		offset = .5,
		scale = 1,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0
	},
})


-- Crafting

core.register_craft({
	output = "dark_matter:divider",
	recipe = {
		{"default:blue_diamond", "default:ocealite", "default:blue_diamond"},
		{"", "gems:quartz_crystal", ""}
	}
})

core.register_craft({
	output = "dark_matter:divider_electromagnet",
	recipe = {
		{"dark_matter:magnet_ingot", "dark_matter:magnet_ingot", "dark_matter:magnet_ingot"},
		{"dark_matter:magnet_ingot", "dark_matter:magnet_ingot", "dark_matter:magnet_ingot"},
		{"dark_matter:magnet_ingot", "dark_matter:magnet_ingot", "dark_matter:magnet_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "dark_matter:magnet_ingot 3",
	recipe = {"default:steel_ingot", "default:mithril_ingot", "default:steel_ingot"}
})

core.register_craft({
	type = "cooking",
	output = "dark_matter:magnet_ingot",
	recipe = "dark_matter:magnetite_lump",
})

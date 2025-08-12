
core.register_node("frozen_chests:celestial_connector", {
	description = "Celestial Connector -If broken will drop 4 mese crystals & 4 brass ingots",
	_doc_items_longdesc = "Celestial connectors grant you access to a single personal interdimensional inventory. This inventory is the same no matter from which celestial connector you access it from. If you put one item into one celestial connector, you will find it in all other celestial connectors worldwide. Each player will only see their own items, never the items of other players.",
	_doc_items_usagehelp = "Rightclick the celestial connector to access your personal interdimensional inventory.",
	tiles = {"basic_materials_chain_brass.png"},
	selection_box = {
		type = "fixed",
		fixed = {-.49, -.49, -.49, .49, .49, .49}
	},
	groups = {cracky= 1, level= 2},
	is_ground_content = false,
	paramtype = "light",
	light_source = 7,
	paramtype2 = "facedir",
	sounds = default.node_sound_stone_defaults(),
	drop = {
		items = {
			{items = {"default:mese_crystal 4", "default:brass_ingot 4"}}
		}
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", 
			"size[12,11]"..
			"background[-4,-1;20,13.4;celestial_bg.jpg]"..
			"list[current_player;celest_inv;0,.3;12,6;]"..
			"list[current_player;main;2,6.85;8,1;]"..
			"list[current_player;main;2,8.08;8,3;8]"..
			"listring[current_player;celest_inv]"..
			"listring[current_player;main]"..
			default.get_hotbar_bg(2,6.85))
		core.get_node_timer(pos):start(math.random(3, 5))
	end,
	on_timer = function(pos, elapsed)
core.add_particlespawner({
	amount = 20,
	time = 5,
	pos = pos,
	radius = .45,
	attract = {
kind = "point",
strength = {min = -.53, max = -.7},
origin = pos },
	exptime = {min = 1.5, max = 3},
	minsize = 1,
	maxsize = 2,
	texture = "default_mese_crystal.png",
	glow = 5 })
		core.get_node_timer(pos):start(math.random(3, 5))
	end,
})

core.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("celest_inv", 12*6)
end)

core.register_craft({
	output = "frozen_chests:celestial_connector",
	recipe = {
		{"default:mese_crystal", "default:brass_ingot", "default:mese_crystal"},
		{"default:brass_ingot", "default:ocealite_crystal_fragment", "default:brass_ingot"},
		{"default:mese_crystal", "default:brass_ingot", "default:mese_crystal"}
	}
})

-- Chest colors
local C_colors = {
	white = "White Frozen Chest",
	grey = "Light Grey Frozen Chest",
	orange = "Orange Frozen Chest",
	cyan = "Cyan Frozen Chest",
	magenta = "Magenta Frozen Chest",
	violet = "Purple Frozen Chest",
	light_blue = "Light Blue Frozen Chest",
	blue = "Blue Frozen Chest",
	yellow = "Yellow Frozen Chest",
	brown = "Brown Frozen Chest",
	green = "Lime Frozen Chest",
	dark_green = "Green Frozen Chest",
	pink = "Pink Frozen Chest",
	red = "Red Frozen Chest",
	dark_grey = "Grey Frozen Chest",
	black = "Black Frozen Chest",
}

for color, desc in pairs(C_colors) do

core.register_node("frozen_chests:"..color.."_chest", {
	description = desc,
	_doc_items_longdesc = "A frozen chest is a portable container which provides 32 inventory slots for any item except frozen chests. Frozen chests keep their inventory when broken, so frozen chests as well as their contents can be taken as a single item.",
	_doc_items_usagehelp = "To access the inventory of a frozen chest, place and right-click it. To take a frozen chest and its contents with you, just break and collect it, the items will not fall out. Place the frozen chest again to be able to retrieve its contents.",
	tiles = {"frozen_chests_".. color .."_chest.png"},
	groups = {choppy= 2, oddly_breakable_by_hand= 2, frozen_chest= 1},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	stack_max = 1,
	drop = "",
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"background[-.5,-.5;8.95,10.2;frosted_frame.png]"..
			"list[current_name;main;0,.3;8,4;]"..
			"list[current_player;main;0,4.85;8,1;]"..
			"list[current_player;main;0,6.08;8,3;8]"..
			"listring[current_name;main]"..
			"listring[current_player;main]"..
			default.get_hotbar_bg(0,4.85))
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	after_place_node = function(pos, placer, itemstack, pointd)
		local nmeta = core.get_meta(pos)
		local ninv = nmeta:get_inventory()
		local imeta = itemstack:get_meta():get_string("")
		local iinv_main = core.deserialize(imeta)
		ninv:set_list("main", iinv_main)
		ninv:set_size("main", 8*4)
		local pname = placer and placer:get_player_name() or ""

		if core.is_creative_enabled(pname) then
			if not ninv:is_empty("main") then--		duplication problem P1
				return nil
			else
				return itemstack
			end
		else
			return nil
		end
	end,
	on_destruct = function(pos)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		local items = {}
		for i=1, inv:get_size("main") do
			local stack = inv:get_stack("main", i)
			items[i] = stack:to_string()
		end
		local data = core.serialize(items)
		local citem = ItemStack("frozen_chests:".. color .."_chest")
		citem:get_meta():set_string("", data)

		if core.settings:get_bool("creative_mode") then--	duplication problem P2
			if not inv:is_empty("main") then
				core.add_item(pos, citem)
			end
		else
			core.add_item(pos, citem)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		-- Do not allow frozen chests in frozen chests
		if core.get_item_group(stack:get_name(), "frozen_chest") >= 1 then
			return 0
		end
		return stack:get_count()
	end,
})

	core.register_craft({
		type = "shapeless",
		output = "frozen_chests:".. color .."_chest",
		recipe = {"group:frozen_chest", "dye:".. color }
	})
end

core.register_craft({
	output = "frozen_chests:light_blue_chest",
	recipe = {
		{"default:crystal_spike"},
		{"default:chest"}
	}
})

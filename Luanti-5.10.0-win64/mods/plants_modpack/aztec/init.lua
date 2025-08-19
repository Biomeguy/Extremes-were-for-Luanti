
-- support for MT game translation.
local S = default.get_translator

core.register_craftitem("aztec:knowledge", {
	description = S("Amerasian Knowledge"),
	inventory_image = "aztec_knowledge.png",
})

core.register_craft({
	output = "aztec:knowledge 62",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "", "default:gold_ingot"}
	}
})

core.register_craftitem("aztec:saucepan", {
	description = S("Saucepan"),
	inventory_image = "aztec_saucepan.png",
	groups = {saucepan = 1, flammable = 2},
})

core.register_craft({
	output = "aztec:saucepan",
	recipe = {
		{"group:stick", ""},
		{"", "default:birch_bark"}
	}
})

core.register_craftitem("aztec:pot", {
	description = S("Cooking Pot"),
	inventory_image = "aztec_pot.png",
	groups = {pot = 1, flammable = 2},
})

core.register_craft({
	output = "aztec:pot",
	recipe = {
		{"group:stick", "default:birch_bark"},
		{"", "default:birch_bark"}
	}
})

core.register_craftitem("aztec:baking_tray", {
	description = S("Baking Tray"),
	inventory_image = "aztec_baking_tray.png",
	groups = {baking_tray = 1, flammable = 2},
})

core.register_craft({
	output = "aztec:baking_tray",
	recipe = {{"default:birch_bark"}}
})

core.register_craftitem("aztec:skillet", {
	description = S("Skillet"),
	inventory_image = "aztec_skillet.png",
	groups = {skillet = 1, flammable = 2},
})

core.register_craft({
	output = "aztec:skillet",
	recipe = {
		{"", "group:stick"},
		{"default:birch_bark", ""}
	}
})

vessels.register_cup("aztec:socolatl_hot", "Socolatl (t is silent)", "aztec_socolatl_hot", core.item_eat(20, "vessels:ceramic_cup"), nil)

core.register_craft({
	output = "aztec:socolatl_hot",
	recipe = {
		{"farming:chili_pepper", "farming:chili_pepper", "farming:chili_pepper"},
		{"farming:almond", "farming:dark_chocolate", "mobs:honey"},
		{"group:boiling_water", "vessels:ceramic_cup", "group:milk"}
	},
	replacements = {{"group:boiling_water", "bucket:bucket_empty 2"}}
})

local esc = core.formspec_escape
local formspec_size = "size[8,8]"

local function formspec_core(tab)
	if tab == nil then tab = 1 else tab = tostring(tab) end
	return "tabheader[0,0;khipu_header;" ..
		esc(S("Write")) .. "," ..
		esc(S("Read")) .. ";" ..
		tab  ..  ";false;false]"
end

local function formspec_write(title, text)
	return "field[0.5,1;7.5,0;title;" .. esc(S("Title:")) .. ";" ..
			esc(title) .. "]" ..
		"textarea[0.5,1.5;7.5,7;text;" .. esc(S("Contents:")) .. ";" ..
			esc(text) .. "]" ..
		"button_exit[2.5,7.5;3,1;save;" .. esc(S("Save")) .. "]"
end

local function formspec_read(owner, title, string, text, page, page_max)
	return "label[0.5,0.5;" .. esc(S("by @1", owner)) .. "]" ..
		"tablecolumns[color;text]" ..
		"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
		"table[0.4,0;7,0.5;title;#FFFF00," .. esc(title) .. "]" ..
		"textarea[0.5,1.5;7.5,7;;" ..
			esc(string ~= "" and string or text) .. ";]" ..
		"button[2.4,7.6;0.8,0.8;khipu_prev;<]" ..
		"label[3.2,7.7;" .. esc(S("Page @1 of @2", page, page_max)) .. "]" ..
		"button[4.9,7.6;0.8,0.8;khipu_next;>]"
end

local function formspec_string(lpp, page, lines, string)
	for i = ((lpp * page) - lpp) + 1, lpp * page do
		if not lines[i] then break end
		string = string .. lines[i] .. "\n"
	end
	return string
end

local book_writers = {}

core.register_on_leaveplayer(function(player)
	book_writers[player:get_player_name()] = nil
end)

local tab_number
local lpp = 14 -- Lines per khipu's string
local function khipu_on_use(itemstack, user)
	local pname = user:get_player_name()
	local meta = itemstack:get_meta()
	local title, text, owner = "", "", pname
	local page, page_max, lines, string = 1, 1, {}, ""

	-- Backwards compatibility
	local old_data = core.deserialize(itemstack:get_meta():get_string(""))
	if old_data then
		meta:from_table({ fields = old_data })
	end

	local data = meta:to_table().fields

	if data.owner then
		title = data.title or ""
		text = data.text or ""
		owner = data.owner

		for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
			lines[#lines+1] = str
		end

		if data.page then
			page = data.page
			page_max = data.page_max
			string = formspec_string(lpp, page, lines, string)
		end
	end

	local formspec
	if title == "" and text == "" then
		formspec = formspec_write(title, text)
	elseif owner == pname then
		local tab = tab_number or 1
		if tab == 2 then
			formspec = formspec_core(tab) ..
				formspec_read(owner, title, string, text, page, page_max)
		else
			formspec = formspec_core(tab) .. formspec_write(title, text)
		end
	else
		formspec = formspec_read(owner, title, string, text, page, page_max)
	end

	core.show_formspec(pname, "aztec:khipu", formspec_size .. formspec)
	-- Store the wield index in case the user accidentally switches before the formspec is shown
	book_writers[pname] = {wield_index = user:get_wield_index()}
	return itemstack
end

local max_text_size = 10000
local max_title_size = 80
local short_title_size = 35
core.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "aztec:khipu" then	return end
	local pname = player:get_player_name()
	local inv = player:get_inventory()
	if not book_writers[pname] then
		return
	end
	local wield_index = book_writers[pname].wield_index
	local wield_list = player:get_wield_list()
	local stack = inv:get_stack(wield_list, wield_index)
	local knotted = stack:get_name() == "aztec:khipu_knotted"
	if stack:get_name() ~= "aztec:khipu" and not knotted then
		-- No khipu in the wield slot, abort & inform the player
		core.chat_send_player(pname, S("The khipu you were knotting to mysteriously disappeared."))
		return
	end
	local data = stack:get_meta():to_table().fields

	local title = data.title or ""
	local text = data.text or ""

	if fields.khipu_header ~= nil and data.owner == pname then
		local contents
		local tab = tonumber(fields.khipu_header)
		if tab == 1 then
			contents = formspec_core(tab) ..
				formspec_write(title, text)
		elseif tab == 2 then
			local lines, string = {}, ""
			for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
				lines[#lines+1] = str
			end
			string = formspec_string(lpp, data.page, lines, string)
			contents = formspec_read(pname, title, string,
				text, data.page, data.page_max)
		else
			return -- malicious data
		end
		tab_number = tab
		local formspec = formspec_size .. formspec_core(tab) .. contents
		core.show_formspec(pname, "aztec:khipu", formspec)
		return
	end

	if fields.quit then
		book_writers[pname] = nil
	end

	if fields.save and fields.title and fields.text then
		local new_stack
		if not knotted then
			local count = stack:get_count()
			if count == 1 then
				stack:set_name("aztec:khipu_knotted")
			else
				stack:set_count(count - 1)
				new_stack = ItemStack("aztec:khipu_knotted")
			end
		end

		if data.owner ~= pname and title ~= "" and text ~= "" then
			return
		end

		if not data then data = {} end
		data.title = fields.title:sub(1, max_title_size)
		data.owner = player:get_player_name()
		local short_title = data.title
		-- Don't bother triming the title if the trailing dots would make it longer
		if #short_title > short_title_size + 3 then
			short_title = short_title:sub(1, short_title_size) .. "..."
		end
		data.description = S("\"@1\" by @2", short_title, data.owner)
		data.text = fields.text:sub(1, max_text_size)
		data.text = data.text:gsub("\r\n", "\n"):gsub("\r", "\n")
		data.text = data.text:gsub("[%z\1-\8\11-\31\127]", "") -- strip naughty control characters (keeps \t and \n)
		data.page = 1
		data.page_max = math.ceil((#data.text:gsub("[^\n]", "") + 1) / lpp)

		if new_stack then
			new_stack:get_meta():from_table({ fields = data })
			if inv:room_for_item("main", new_stack) then
				inv:add_item("main", new_stack)
			else
				core.add_item(player:get_pos(), new_stack)
			end
		else
			stack:get_meta():from_table({ fields = data })
		end

	elseif fields.khipu_next or fields.khipu_prev then
		if not data.page then
			return
		end

		data.page = tonumber(data.page)
		data.page_max = tonumber(data.page_max)

		if fields.khipu_next then
			data.page = data.page + 1
			if data.page > data.page_max then
				data.page = 1
			end
		else
			data.page = data.page - 1
			if data.page == 0 then
				data.page = data.page_max
			end
		end

		stack:get_meta():from_table({fields = data})
		stack = khipu_on_use(stack, player)
	end

	-- Update stack
	inv:set_stack(wield_list, wield_index, stack)
end)

core.register_craftitem("aztec:khipu", {
	description = "Khipu",
	inventory_image = "aztec_khipu.png",
	groups = {khipu = 1, flammable = 3},
	on_use = khipu_on_use,
})

core.register_craftitem("aztec:khipu_knotted", {
	description = "Khipu with Knots",
	inventory_image = "aztec_khipu_knotted.png",
	groups = {khipu = 1, not_in_creative_inventory = 1, flammable = 3},
	stack_max = 1,
	on_use = khipu_on_use,
})

core.register_craft({
	type = "fuel",
	recipe = "aztec:khipu",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "aztec:khipu_knotted",
	burntime = 3,
})

local aztec_colours = {
--   name			description		item colour											plant colour
	{"red",			"Red",			"red:200",											"red:200^[colorize:black:40"},
	{"orange",		"Orange",		"#e67300",											"#e67300"},
	{"yellow",		"Yellow",		"#e6cd00",											"#e6cd00"},
	{"green",		"Green",		"#30ac00",            						        "#30ac00"},
	{"cyan",		"Cyan",			"cyan:200^[colorize:black:80",						"cyan:200^[colorize:black:80"},
	{"light_blue",	"Light Blue",	"#2035cF",											"#2035cF"},
	{"blue",		"Blue",			"#0000ac",											"#0000ac"},
	{"violet",		"Violet",		"blue:182^[colorize:red:67",						"blue:182^[colorize:red:60"},
	{"magenta",		"Magenta",		"magenta:200^[colorize:black:60",					"magenta:200^[colorize:red:90^[colorize:black:30"},
	{"pink",		"Pink",			"pink:255^[colorize:red:60",						"pink:255^[colorize:red:60"},
	{"dark_green",	"Dark Green",	"green:200^[colorize:yellow:10^[colorize:black:90",	"green:200^[colorize:yellow:10^[colorize:black:90"},
	{"brown",		"Brown",		"brown:200^[colorize:yellow:50^[colorize:red:20^[colorize:black:130",	"brown:200^[colorize:yellow:50^[colorize:red:20^[colorize:black:130"},
	{"black",		"Black",		"black:216",										"black:216"}
}

for _, col in ipairs(aztec_colours) do
core.register_node("aztec:seed_cotton_".. col[1], {
	description = (col[2].." Cotton Seed"),
	tiles = {"aztec_cotton_seed_color.png^[colorize:".. col[3].. "^farming_cotton_seed.png"},
	inventory_image = "aztec_cotton_seed_color.png^[colorize:".. col[3] .."^farming_cotton_seed.png",
	wield_image = "aztec_cotton_seed_color.png^[colorize:".. col[3] .."^farming_cotton_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	sounds = default.node_sound_dirt_defaults({
		dig = {name = "", gain = 0},
		dug = {name = "default_grass_footstep", gain = .2},
		place = {name = "", gain = 0},
	}),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and
				not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		return farming.place_seed(itemstack, placer, pointd, "aztec:seed_cotton_".. col[1])
	end,
	next_plant = "aztec:cotton_".. col[1] .."_S1",
	on_timer = farming.grow_plant,
})

core.register_craftitem("aztec:cotton_".. col[1], {
	description = (col[2].." Cotton"),
	inventory_image = "aztec_cotton.png^[colorize:".. col[3] .."^aztec_cotton_overlay.png",
	groups = {flammable = 4},
})

core.register_craftitem("aztec:string_".. col[1], {
	description = (col[2] .." String"),
	inventory_image = "fabric_string.png^[colorize:".. col[3],
	groups = {flammable = 2},
})

core.register_craft({
	output = "aztec:string_".. col[1] .." 2",
	recipe = {
		{"aztec:cotton_".. col[1]},
		{"aztec:cotton_".. col[1]},
		{"fabric:spinning_wheel"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})

register_nine("fabric:sheet_".. col[1], "aztec:string_".. col[1])

core.register_craft({
	type = "fuel",
	recipe = "aztec:cotton_".. col[1],
	burntime = 1,
})

core.register_craft({
	type = "fuel",
	recipe = "aztec:string_".. col[1],
	burntime = 1,
})

local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_cotton_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 4, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "aztec:cotton_".. col[1] .."_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("aztec:cotton_".. col[1] .."_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_cotton_2.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S3"
core.register_node("aztec:cotton_".. col[1] .."_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_cotton_3.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S4"
core.register_node("aztec:cotton_".. col[1] .."_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_cotton_4.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S5"
core.register_node("aztec:cotton_".. col[1] .."_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_cotton_5.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S6"
core.register_node("aztec:cotton_".. col[1] .."_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_cotton_6.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S7"
core.register_node("aztec:cotton_".. col[1] .."_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_cotton_7.png"}
def.next_plant = "aztec:cotton_".. col[1] .."_S8"
core.register_node("aztec:cotton_".. col[1] .."_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"aztec_cotton_8.png^[colorize:".. col[4] .."^aztec_cotton_plant.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"aztec:cotton_".. col[1] }},
		{items = {"aztec:cotton_".. col[1] .." 2"}, rarity = 2},
		{items = {"aztec:cotton_".. col[1] .." 4"}, rarity = 3},
		{items = {"aztec:seed_cotton_".. col[1] .." 3"}},
		{items = {"aztec:seed_cotton_".. col[1] .." 4"}, rarity = 2},
	}
}
def.after_dig_node = function(pos)
	if math.random(10) == 1 then
	else
		core.add_node(pos, {name="aztec:cotton_".. col[1] .."_S6"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("aztec:cotton_".. col[1] .."_S8", table.copy(def))
end

core.register_craft({
	output = "aztec:seed_cotton_red",
	recipe = {
		{"", "", ""},
		{"", "farming:seed_cotton", ""},
		{"", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_orange",
	recipe = {
		{"", "", ""},
		{"", "farming:seed_cotton", ""},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_yellow",
	recipe = {
		{"", "", ""},
		{"aztec:knowledge", "farming:seed_cotton", ""},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_green",
	recipe = {
		{"aztec:knowledge", "", ""},
		{"aztec:knowledge", "farming:seed_cotton", ""},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_cyan",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", ""},
		{"aztec:knowledge", "farming:seed_cotton", ""},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_light_blue",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"aztec:knowledge", "farming:seed_cotton", ""},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_blue",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"aztec:knowledge", "farming:seed_cotton", "aztec:knowledge"},
		{"aztec:knowledge", "aztec:knowledge", ""}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_violet",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"aztec:knowledge", "farming:seed_cotton", "aztec:knowledge"},
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_magenta",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"aztec:knowledge", "farming:seed_cotton", "aztec:knowledge"},
		{"aztec:knowledge", "", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_pink",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"aztec:knowledge", "farming:seed_cotton", "aztec:knowledge"},
		{"", "", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_dark_green",
	recipe = {
		{"aztec:knowledge", "aztec:knowledge", "aztec:knowledge"},
		{"", "farming:seed_cotton", "aztec:knowledge"},
		{"", "", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_brown",
	recipe = {
		{"", "aztec:knowledge", "aztec:knowledge"},
		{"", "farming:seed_cotton", "aztec:knowledge"},
		{"", "", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:seed_cotton_black",
	recipe = {
		{"", "", "aztec:knowledge"},
		{"", "farming:seed_cotton", "aztec:knowledge"},
		{"", "", "aztec:knowledge"}
	}
})

core.register_craft({
	output = "aztec:khipu",
	recipe = {
		{"aztec:string_pink", "aztec:knowledge", "aztec:string_magenta"},
		{"aztec:string_red", "aztec:string_orange", "aztec:string_yellow"},
		{"aztec:string_green", "aztec:string_light_blue", "aztec:string_violet"}
	}
})

core.register_craft({
	output = "aztec:khipu",
	recipe = {
		{"aztec:string_pink", "aztec:knowledge", "aztec:string_magenta"},
		{"aztec:string_red", "aztec:string_orange", "aztec:string_yellow"},
		{"aztec:string_dark_green", "aztec:string_blue", "aztec:string_violet"}
	}
})

core.register_craft({
	output = "aztec:khipu",
	recipe = {
		{"aztec:string_pink", "aztec:knowledge", "aztec:string_magenta"},
		{"aztec:string_red", "aztec:string_orange", "aztec:string_yellow"},
		{"aztec:string_dark_green", "aztec:string_light_blue", "aztec:string_violet"}
	}
})

core.register_craft({
	output = "aztec:khipu",
	recipe = {
		{"aztec:string_pink", "aztec:knowledge", "aztec:string_magenta"},
		{"aztec:string_red", "aztec:string_orange", "aztec:string_yellow"},
		{"aztec:string_green", "aztec:string_blue", "aztec:string_violet"}
	}
})

-- Register cottons as dungeon loot
if core.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "aztec:seed_cotton_red", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_orange", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_yellow", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_green", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_cyan", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_light_blue", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_blue", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_violet", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_magenta", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_pink", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_dark_green", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_brown", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
		{name = "aztec:seed_cotton_black", chance = .15, count = {1, 14}, y = {-64, 32768}, types = {"normal"}},
	})
end
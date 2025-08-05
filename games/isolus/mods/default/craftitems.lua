-- mods/default/craftitems.lua

-- support for MT game translation.
local S = default.get_translator

local esc = core.formspec_escape
local formspec_size = "size[8,8]"

local function formspec_core(tab)
	if tab == nil then tab = 1 else tab = tostring(tab) end
	return "tabheader[0,0;book_header;" ..
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
		"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
		"label[3.2,7.7;" .. esc(S("Page @1 of @2", page, page_max)) .. "]" ..
		"button[4.9,7.6;0.8,0.8;book_next;>]"
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
local lpp = 14 -- Lines per book's page
local function book_on_use(itemstack, user)
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

	core.show_formspec(pname, "default:book", formspec_size .. formspec)
	-- Store the wield index in case the user accidentally switches before the formspec is shown
	book_writers[pname] = {wield_index = user:get_wield_index()}
	return itemstack
end

local max_text_size = 10000
local max_title_size = 80
local short_title_size = 35
core.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "default:book" then	return end
	local pname = player:get_player_name()
	local inv = player:get_inventory()
	if not book_writers[pname] then
		return
	end
	local wield_index = book_writers[pname].wield_index
	local wield_list = player:get_wield_list()
	local stack = inv:get_stack(wield_list, wield_index)
	local written = stack:get_name() == "default:book_written"
	if stack:get_name() ~= "default:book" and not written then
		-- No book in the wield slot, abort & inform the player
		core.chat_send_player(pname, S("The book you were writing to mysteriously disappeared."))
		return
	end
	local data = stack:get_meta():to_table().fields

	local title = data.title or ""
	local text = data.text or ""

	if fields.book_header ~= nil and data.owner == pname then
		local contents
		local tab = tonumber(fields.book_header)
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
		core.show_formspec(pname, "default:book", formspec)
		return
	end

	if fields.quit then
		book_writers[pname] = nil
	end

	if fields.save and fields.title and fields.text then
		local new_stack
		if not written then
			local count = stack:get_count()
			if count == 1 then
				stack:set_name("default:book_written")
			else
				stack:set_count(count - 1)
				new_stack = ItemStack("default:book_written")
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

	elseif fields.book_next or fields.book_prev then
		if not data.page then
			return
		end

		data.page = tonumber(data.page)
		data.page_max = tonumber(data.page_max)

		if fields.book_next then
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
		stack = book_on_use(stack, player)
	end

	-- Update stack
	inv:set_stack(wield_list, wield_index, stack)
end)


--
-- Craftitem registry
--

core.register_craftitem("default:birch_bark", {
	description = S("Birch Bark"),
	inventory_image = "default_birch_bark.png",
	groups = {flammable = 3},
})

core.register_craftitem("default:blue_diamond", {
	description = S("Blue Diamond"),
	inventory_image = "default_blue_diamond.png",
})

core.register_craftitem("default:blueberries", {
	description = S("Blueberries"),
	inventory_image = "default_blueberries.png",
	on_use = core.item_eat(2),
	groups = {blueberries = 1, berry = 1, flammable = 1},
})

core.register_craftitem("default:book", {
	description = S("Book"),
	inventory_image = "default_book.png",
	groups = {book = 1, flammable = 3},
	on_use = book_on_use,
})

core.register_craftitem("default:book_written", {
	description = S("Book with Text"),
	inventory_image = "default_book_written.png",
	groups = {book = 1, not_in_creative_inventory = 1, flammable = 3},
	stack_max = 1,
	on_use = book_on_use,
})

if core.get_modpath("bonemeal") then
core.register_alias("default:bone", "bonemeal:bone")
else
core.register_craftitem("default:bone", {
	description = S("Bone (Placeholder for Bonemeal)"),
	inventory_image = "bonemeal_bone.png",
	groups = {bone = 1}
})

core.register_alias("bonemeal:bone", "default:bone")
end

core.register_craftitem("default:brass_ingot", {
	description = S("Brass Ingot"),
	inventory_image = "default_brass_ingot.png",
})

core.register_craftitem("default:bronze_ingot", {
	description = S("Bronze Ingot"),
	inventory_image = "default_bronze_ingot.png"
})

core.register_craftitem("default:bush_berry", {
	description = S("Bush Berry"),
	inventory_image = "default_bush_berry.png",
	on_use = core.item_eat(1),
	groups = {flammable = 1},
})

core.register_craftitem("default:cactus_fruit", {
	description = S("Saguaro Cactus Fruit"),
	inventory_image = "default_cactus_fruit.png",
	on_use = core.item_eat(4),
	sound = {eat = "eat_soft"}
})

core.register_craftitem("default:cast_iron_ingot", {
	description = S("Cast Iron Ingot"),
	inventory_image = "default_cast_iron_ingot.png",
})

core.register_craftitem("default:chromium_ingot", {
	description = S("Chromium Ingot"),
	inventory_image = "default_chromium_ingot.png",
})

core.register_craftitem("default:chromium_lump", {
	description = S("Chromium Lump"),
	inventory_image = "default_chromium_lump.png",
})

core.register_craftitem("default:clay_brick", {
	description = S("Clay Brick"),
	inventory_image = "default_clay_brick.png",
	groups = {grinder = 1},
})

core.register_craftitem("default:clay_brick_mix", {
	description = S("Brick Mix"),
	inventory_image = "default_clay_brick_mix.png",
})

core.register_craftitem("default:clay_lump", {
	description = S("Clay Lump"),
	inventory_image = "default_clay_lump.png",
})

core.register_craftitem("default:coal_lump", {
	description = S("Coal Lump"),
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

core.register_craftitem("default:coconut", {
	description = S("Coconut"),
	inventory_image = "default_coconut.png",
	groups = {flammable = 1},
	on_place = function(item, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local node = core.get_node(pointd.under).name
		if core.get_item_group(node, "cracky") > 0 then
	core.sound_play("default_tool_breaks", {pos = pointd.above, gain = .2, max_hear_distance = 10})
	item:take_item()
	core.add_item(pointd.above, "default:coconut_flesh 4")
		end
		return item
	end,
})

core.register_craftitem("default:coconut_flesh", {
	description = S("Coconut Flesh"),
	inventory_image = "default_coconut_flesh.png",
	on_use = core.item_eat(4),
	groups = {flammable = 1},
	sound = {eat = "eat_crunchy_juicy"}
})

core.register_craftitem("default:coconut_milk", {
	description = S("Coconut Milk"),
	inventory_image = "default_coconut_milk.png",
	on_use = core.item_eat(2, "vessels:drinking_glass"),
})

core.register_craftitem("default:coir", {
	description = S("Coir"),
	inventory_image = "default_coir.png",
	groups = {fibre = 1, flammable = 3},
})

core.register_craftitem("default:coconut_young", {
	description = "Young Coconut",
	inventory_image = "default_coconut_young.png",
	groups = {flammable = 1},
	on_place = function(item, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local node = core.get_node(pointd.under).name
		if core.get_item_group(node, "cracky") > 0 then
	core.sound_play("default_tool_breaks", {pos = pointd.above, gain = .2, max_hear_distance = 10})
	item:take_item()
	core.add_item(pointd.above, "default:coconut_young_open 2")
		end
		return item
	end,
})

core.register_craftitem("default:coconut_young_open", {
	description = "Opened Young Coconut",
	inventory_image = "default_coconut_young_open.png",
	on_use = core.item_eat(2),
	groups = {flammable = 1},
	sound = {eat = "eat_crunchy_juicy"}
})

core.register_craftitem("default:cooked_bulrush", {
	description = S("Cooked Bulrush"),
	inventory_image = "default_cooked_bulrush.png",
	on_use = core.item_eat(2),
	groups = {flammable = 1},
	sound = {eat = "hbhunger_eat_generic"}
})

core.register_craftitem("default:copper_ingot", {
	description = S("Copper Ingot"),
	inventory_image = "default_copper_ingot.png"
})

core.register_craftitem("default:copper_lump", {
	description = S("Copper Lump"),
	inventory_image = "default_copper_lump.png"
})

core.register_craftitem("default:crystal_ingot", {
	description = S("Frost Crystal Ingot"),
	inventory_image = "crystal_ingot.png",
	light_source = 7,
})

core.register_craftitem("default:diamite_dust", {
	description = S("Diamite Dust"),
	inventory_image = "default_diamite_dust.png",
})

core.register_craftitem("default:diamond", {
	description = S("Diamond"),
	inventory_image = "default_diamond.png",
})

core.register_craftitem("default:flint", {
	description = S("Flint"),
	inventory_image = "default_flint.png"
})

core.register_craftitem("default:glue", {
    description = S("Glue"),
	inventory_image = "jeija_glue.png",
	groups = {flammable = 1},
})

core.register_craftitem("default:gold_ingot", {
	description = S("Gold Ingot"),
	inventory_image = "default_gold_ingot.png"
})

core.register_craftitem("default:gold_lump", {
	description = S("Gold Lump"),
	inventory_image = "default_gold_lump.png"
})

core.register_craftitem("default:iron_lump", {
	description = S("Iron Lump"),
	inventory_image = "default_iron_lump.png"
})

core.register_craftitem("default:mese_crystal", {
	description = S("Mese Crystal"),
	inventory_image = "default_mese_crystal.png",
	light_source = 3,
})

core.register_craftitem("default:mese_crystal_fragment", {
	description = S("Mese Crystal Fragment"),
	inventory_image = "default_mese_crystal_fragment.png",
	light_source = 3,
})

core.register_craftitem("default:mithril_ingot", {
	description = S("Mithril Ingot"),
	inventory_image = "default_mithril_ingot.png",
})

core.register_craftitem("default:mithril_lump", {
	description = S("Mithril Lump"),
	inventory_image = "default_mithril_lump.png",
})

core.register_craftitem("default:obsidian_shard", {
	description = S("Obsidian Shard"),
	inventory_image = "default_obsidian_shard.png",
})

core.register_craftitem("default:ocealite_crystal", {
	description = S("Ocealite Crystal"),
	inventory_image = "default_ocealite_crystal.png",
	light_source = 3,
	groups = {mineral_life = 1},
	on_place = function(item, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return item
		end

		if pointd.above.y ~= pos.y+1 then
			return item
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "default:sand_with_ocealite_1"})
				core.get_node_timer(pos):start(math.random(332, 572))
	core.sound_play("default_sand_footstep", {pos = pos, gain = .03})
				if not core.is_creative_enabled(pname) then
					item:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return item
	end
})

core.register_craftitem("default:ocealite_crystal_fragment", {
	description = S("Ocealite Crystal Fragment"),
	inventory_image = "default_ocealite_crystal_fragment.png",
	light_source = 3,
})

core.register_craftitem("default:oil_extract", {
	description = S("Oil extract"),
	inventory_image = "basic_materials_oil_extract.png",
})

core.register_craftitem("default:orange", {
	description = S("Orange"),
	inventory_image = "default_orange.png",
	on_use = core.item_eat(4),
	groups = {flammable = 2},
	sound = {eat = "eat_soft"}
})

core.register_craftitem("default:orichalc_ingot", {
	description = S("Orichalc Ingot"),
	inventory_image = "default_orichalc_ingot.png",
})

core.register_craftitem("default:padlock", {
	description = S("Padlock"),
	inventory_image = "basic_materials_padlock.png"
})

core.register_craftitem("default:paper", {
	description = S("Paper"),
	inventory_image = "default_paper.png",
	groups = {flammable = 3},
})

core.register_craftitem("default:pine_nuts", {
	description = S("Pine Nuts"),
	inventory_image = "default_pine_nuts.png",
	on_use = core.item_eat(1),
	groups = {flammable = 2},
})

core.register_craftitem("default:sea_salad", {
	description = S("Sea Salad"),
	inventory_image = "default_sea_salad.png",
	on_use = core.item_eat(7, "vessels:wood_bowl"),
	sound = {eat = "eat_soft"}
})

core.register_craftitem("default:silt_lump", {
	description = S("Silt Lump"),
	inventory_image = "default_silt_lump.png",
})

core.register_craftitem("default:silver_ingot", {
	description = S("Silver Ingot"),
	inventory_image = "default_silver_ingot.png",
})

core.register_craftitem("default:silver_lump", {
	description = S("Silver Lump"),
	inventory_image = "default_silver_lump.png",
})

core.register_craftitem("default:stainless_steel_ingot", {
	description = S("Stainless Steel Ingot"),
	inventory_image = "default_stainless_steel_ingot.png",
})
-- was carbon steel
core.register_craftitem("default:steel_ingot", {
	description = S("Steel Ingot"),
	inventory_image = "default_steel_ingot.png"
})

core.register_craftitem("default:steel_bar", {
	description = S("Steel Bar"),
	inventory_image = "basic_materials_steel_bar.png",
})

core.register_craftitem("default:stick", {
	description = S("Stick"),
	inventory_image = "default_stick.png",
	groups = {stick = 1, flammable = 2},
})

core.register_craftitem("default:sulfur", {
	description = S("Sulfur Lump"),
	inventory_image = "default_sulfur.png",
})

core.register_craftitem("default:terracotta_lump", {
	description = S("Unfired Terracotta Lump"),
	inventory_image = "basic_materials_terracotta_lump.png",
})

core.register_craftitem("default:tin_ingot", {
	description = S("Tin Ingot"),
	inventory_image = "default_tin_ingot.png"
})

core.register_craftitem("default:tin_lump", {
	description = S("Tin Lump"),
	inventory_image = "default_tin_lump.png"
})

core.register_craftitem("default:wet_cement", {
	description = S("Wet Cement"),
	inventory_image = "basic_materials_wet_cement.png",
})

core.register_craftitem("default:wrought_iron_ingot", {
	description = S("Wrought Iron Ingot"),
	inventory_image = "default_wrought_iron_ingot.png",
})

core.register_craftitem("default:zinc_ingot", {
	description = S("Zinc Ingot"),
	inventory_image = "default_zinc_ingot.png",
})

core.register_craftitem("default:zinc_lump", {
	description = S("Zinc Lump"),
	inventory_image = "default_zinc_lump.png",
})

--
-- Crafting recipes
--

core.register_craft({
	output = "default:book",
	recipe = {
		{"default:paper"},
		{"default:paper"},
		{"default:paper"}
	}
})

default.register_craft_metadata_copy("default:book", "default:book_written")

if not core.get_modpath("technic") then
core.register_craft({
	type = "shapeless",
	output = "default:brass_ingot 3",
	recipe = {"default:copper_ingot", "default:zinc_ingot", "default:copper_ingot"}
})

core.register_craft({
	type = "shapeless",
	output = "default:bronze_ingot 4",
	recipe = {"default:copper_ingot", "default:tin_ingot", "default:copper_ingot", "default:copper_ingot"}
})

core.register_craft({
	type = "shapeless",
	output = "default:steel_ingot 3",
	recipe = {"default:wrought_iron_ingot", "default:wrought_iron_ingot", "default:wrought_iron_ingot", "default:coal_lump"}
})

core.register_craft({
	type = "shapeless",
	output = "default:cast_iron_ingot 3",
	recipe = {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", "default:coal_lump"}
})

core.register_craft({
	type = "shapeless",
	output = "default:stainless_steel_ingot 4",
	recipe = {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", "default:chromium_ingot"}
})
end

core.register_craft({
	output = "default:clay_brick 4",
	recipe = {{"default:brick"}}
})

core.register_craft({
	type = "shapeless",
	output = "default:clay_brick_mix 2",
	recipe = {"default:clay_lump", "farming:straw_pile"}
})

core.register_craft({
	output = "default:silt_lump 4",
	recipe = {{"default:silt"}}
})

core.register_craft({
	output = "default:clay_lump 4",
	recipe = {{"default:clay"}}
})

core.register_craft({
	output = "default:terracotta_lump 4",
	recipe = {{"default:terracotta"}}
})

core.register_craft({
	output = "default:coconut_flesh 4",
	recipe = {{"default:coconut"}}
})

core.register_craft({
	output = "default:diamite_dust 4",
	recipe = {{"default:diamite"}}
})

core.register_craft({
	output = "default:orichalc_ingot 9",
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:tin_ingot", "default:steel_ingot", "default:tin_ingot"},
		{"default:zinc_ingot", "default:zinc_ingot", "default:zinc_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:crystal_ingot 2",
	recipe = {"default:mese_crystal", "default:crystal_spike",
		"default:crystal_spike", "default:mese_crystal", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "default:paper 4",
	recipe = {{"default:reed", "default:reed", "default:reed"},
		{"group:grinder", "group:water_bucket", "fabric:sheet_white"}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"fabric:sheet_white", "fabric:sheet_white"}
	}
})

core.register_craft({
	output = "default:paper 4",
	recipe = {{"default:bulrush_2", "default:bulrush_2", "default:bulrush_2"},
		{"group:grinder", "group:water_bucket", "fabric:sheet_white"}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"fabric:sheet_white", "fabric:sheet_white"}
	}
})

core.register_craft({
	output = "default:paper 9",
	recipe = {{"default:papyrus", "default:papyrus", "default:papyrus"},
		{"farming:cutting_board", "group:grinder", "group:water_bucket"},
		{"fabric:sheet_white", "stairs:slab_stone_block", "stairs:slab_stone_block"}
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"fabric:sheet_white", "fabric:sheet_white"},
		{"default:papyrus", "farming:spent_biomasse"},
		{"default:papyrus", "farming:spent_biomasse"},
		{"default:papyrus", "farming:spent_biomasse"},
		{"stairs:slab_stone_block", "stairs:slab_stone_block"},
		{"stairs:slab_stone_block", "stairs:slab_stone_block"}
	}
})

core.register_craft({
	output = "default:steel_bar 6",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", ""}
	}
})

core.register_craft({
	output = "default:stick 4",
	recipe = {{"group:wood"}}
})

core.register_craft({
	output = "default:stick 6",
	recipe = {
		{"default:cactus"},
		{"default:cactus"}
	}
})

core.register_craft({
	output = "default:stick",
	recipe = {{"default:dry_shrub"}}
})

core.register_craft({
	output = "default:stick",
	recipe = {{"group:sapling"}}
})

core.register_craft({
	type = "shapeless",
	output = "default:stick",
	recipe = {"default:spent_torch", "default:spent_torch", "default:spent_torch", "default:spent_torch"}
})

core.register_craft({
	output = "default:padlock 2",
	recipe = {
		{"default:steel_bar"},
		{"default:steel_ingot"},
		{"default:steel_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:terracotta_lump 8",
	recipe = {"bucket:bucket_water", "default:clay_lump", "default:dirt"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "default:wet_cement 4",
	recipe = {
		{"group:sand", "default:gravel", "group:sand"},
		{"default:gravel", "farming:rhubarb", "default:gravel"},
		{"farming:rhubarb", "group:water_bucket", "farming:rhubarb"}
	},
	replacements = {
		{"farming:rhubarb", "farming:spent_biomasse"},
		{"farming:rhubarb", "farming:spent_biomasse"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"farming:rhubarb", "farming:spent_biomasse"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:oil_extract 2",
	recipe = {"group:leaves", "group:leaves", "group:leaves", "group:leaves", "group:leaves",
		"group:leaves", "vessels:glass_bottle", "vessels:glass_bottle", "farming:mortar_pestle"},
	replacements = {
		{"group:leaves", "farming:spent_biomasse"},
		{"group:leaves", "farming:spent_biomasse"},
		{"group:leaves", "farming:spent_biomasse"},
		{"group:leaves", "farming:spent_biomasse"},
		{"group:leaves", "farming:spent_biomasse"},
		{"group:leaves", "farming:spent_biomasse"},
		{"farming:mortar_pestle", "farming:mortar_pestle"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:sea_salad",
	recipe = {"default:kelp_green", "default:seagrass_red", "default:alga", "default:seagrass_green", "default:kelp_dark_green", "vessels:wood_bowl"}
})

core.register_craft({
	type = "shapeless",
	output = "default:sea_salad",
	recipe = {"default:kelp_green", "default:seagrass_red", "default:alga", "default:seagrass_green", "default:kelp_brown", "vessels:wood_bowl"}
})

core.register_craft({
	type = "shapeless",
	output = "default:sea_salad",
	recipe = {"default:kelp_green", "default:seagrass_red", "default:alga", "default:seagrass", "default:kelp_dark_green", "vessels:wood_bowl"}
})

core.register_craft({
	type = "shapeless",
	output = "default:sea_salad",
	recipe = {"default:kelp_green", "default:seagrass_red", "default:kelp_yellow", "default:seagrass_green", "default:seaweed", "vessels:wood_bowl"}
})

core.register_craft({
	type = "shapeless",
	output = "default:sea_salad",
	recipe = {"default:kelp_green", "default:seagrass_red", "default:seagrass", "default:kelp_yellow", "default:seaweed", "vessels:wood_bowl"}
})

--
-- Cooking recipes
--

core.register_craft({
	type = "cooking",
	output = "default:clay_brick",
	recipe = "default:clay_brick_mix",
})

core.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "default:copper_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:wrought_iron_ingot",
	recipe = "default:iron_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:wrought_iron_ingot",
	recipe = "default:steel_ingot",
	cooktime = 2,
})

core.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "default:cast_iron_ingot",
	cooktime = 2,
})

core.register_craft({
	type = "cooking",
	output = "default:chromium_ingot",
	recipe = "default:chromium_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:zinc_ingot",
	recipe = "default:zinc_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:silver_ingot",
	recipe = "default:silver_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:mithril_ingot",
	recipe = "default:mithril_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:tin_ingot",
	recipe = "default:tin_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:glue",
	recipe = "group:sapling",
	cooktime = 2
})

core.register_craft({
	type = "cooking",
	output = "default:glue 2",
	recipe = "group:resinous",
	cooktime = 2
})

core.register_craft({
	type = "cooking",
	output = "default:cooked_bulrush",
	recipe = "default:bulrush_1",
})

core.register_craft({
	type = "cooking",
	output = "default:cooked_bulrush",
	recipe = "default:bulrush_2",
})

--
-- Fuels
--

core.register_craft({
	type = "fuel",
	recipe = "default:birch_bark",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:book",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:book_written",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 40,
})

core.register_craft({
	type = "fuel",
	recipe = "default:coir",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:oil_extract",
	burntime = 30,
	replacements = {{"default:oil_extract", "vessels:glass_bottle"}}
})

core.register_craft({
	type = "fuel",
	recipe = "default:paper",
	burntime = 1,
})

core.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})

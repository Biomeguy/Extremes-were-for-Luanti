screwdriver = screwdriver or {}
local S = core.get_translator("xdecor")
local FS = function(...) return core.formspec_escape(S(...)) end
local ceil, abs, random = math.ceil, math.abs, math.random
local reg_tools = core.registered_tools

-- Cost in Mese crystal(s) for enchanting.
local mese_cost = 1

-- Force of the enchantments.
local enchanting = {
	uses     = 1.2,  -- Durability
	times    = .1,  -- Efficiency
	damages  = 1,    -- Sharpness
}

local function cap(str) return
	str:gsub("^%l", string.upper)
end

local function to_percent(orig_value, final_value)
	return abs(ceil(((final_value - orig_value) / orig_value) * 100))
end

function enchanting:get_tooltip(enchant, orig_caps, fleshy)
	local bonus = {durable = 0, efficiency = 0, damages = 0}

	if orig_caps then
		bonus.durable = to_percent(orig_caps.uses, orig_caps.uses * enchanting.uses)
		local sum_caps_times = 0
		for i=1, #orig_caps.times do
			sum_caps_times = sum_caps_times + orig_caps.times[i]
		end
		local average_caps_time = sum_caps_times / #orig_caps.times
		bonus.efficiency = to_percent(average_caps_time, average_caps_time - enchanting.times)
	end

	if fleshy then
		bonus.damages = to_percent(fleshy, fleshy + enchanting.damages)
	end

	local specs = {
		delicate = {"#f5f", ""},
		durable = {"#00baff", " (+" .. bonus.durable .. "%)"},
		durable_2 = {"#00baff", " (+" .. bonus.durable*2 .. "%)"},
		durable_3 = {"#00baff", " (+" .. bonus.durable*3 .. "%)"},
		fast    = {"#74ff49", " (+" .. bonus.efficiency .. "%)"},
		fast_2    = {"#74ff49", " (+" .. bonus.efficiency*2 .. "%)"},
		fast_3    = {"#74ff49", " (+" .. bonus.efficiency*3 .. "%)"},
		furnace = {"#ffaa00", ""},
		luck = {"#00bb39", ""},
		sharp   = {"#ffff00", " (+" .. bonus.damages .. "%)"},
		sharp_2    = {"#ffff00", " (+" .. bonus.damages*2 .. "%)"},
		sharp_3    = {"#ffff00", " (+" .. bonus.damages*3 .. "%)"},
	}

	local enchant_loc = {
		delicate = S("Delicate"),
		durable = S("Durability"),
		durable_2 = S("Durability 2"),
		durable_3 = S("Durability 3"),
		fast = S("Efficiency"),
		fast_2 = S("Efficiency 2"),
		fast_3 = S("Efficiency 3"),
		furnace = S("Furnace"),
		luck = S("Luck"),
		sharp = S("Sharpness"),
		sharp_2 = S("Sharpness 2"),
		sharp_3 = S("Sharpness 3"),
	}

	return core.colorize and core.colorize(specs[enchant][1],
			enchant_loc[enchant] .. specs[enchant][2]) or
			enchant_loc[enchant] .. specs[enchant][2]
end

local Last_3 = "image_button[3.54,1.88;4.84,.75;bg_btn.png;delicate;"..FS("Delicate").."]" ..
	"image_button[3.54,2.5;4.84,.75;bg_btn.png;furnace;"..FS("Furnace").."]" ..
	"image_button[3.54,3.12;4.84,.75;bg_btn.png;luck;"..FS("Luck").."]"

local enchant_buttons = {
	"image_button[3.54,.64;4.84,.75;bg_btn.png;fast;"..FS("Efficiency").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable;"..FS("Durability").."]" ..
	Last_3,
	"image_button[3.54,.64;4.84,.75;bg_btn.png;sharp;"..FS("Sharpness").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable;"..FS("Durability").."]" ..
	Last_3,
}

local enchant_buttons2 = {
	"image_button[3.54,.64;4.84,.75;bg_btn.png;fast_2;"..FS("Efficiency 2").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable_2;"..FS("Durability 2").."]" ..
	Last_3,
	"image_button[3.54,.64;4.84,.75;bg_btn.png;sharp_2;"..FS("Sharpness 2").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable_2;"..FS("Durability 2").."]" ..
	Last_3,
}

local enchant_buttons3 = {
	"image_button[3.54,.64;4.84,.75;bg_btn.png;fast_3;"..FS("Efficiency 3").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable_3;"..FS("Durability 3").."]" ..
	Last_3,
	"image_button[3.54,.64;4.84,.75;bg_btn.png;sharp_3;"..FS("Sharpness 3").."]" ..
	"image_button[3.54,1.26;4.84,.75;bg_btn.png;durable_3;"..FS("Durability 3").."]" ..
	Last_3,
}

function enchanting.formspec(pos, num)
	local meta = core.get_meta(pos)
	local formspec = [[ size[9,8.6;]
		no_prepend[]
		bgcolor[#080808BB;true]
		listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]
		background9[0,0;9,9;ench_ui.png;6]
		list[context;tool;.9,2.9;1,1;]
		list[context;mese;2,2.9;1,1;]
		list[current_player;main;.55,4.5;8,4;]
		listring[current_player;main]
		listring[context;tool]
		listring[current_player;main]
		listring[context;mese]
		image[2,2.9;1,1;mese_layout.png]	]]
		.."tooltip[sharp;"..FS("Your weapon inflicts more damages").."]"
		.."tooltip[sharp_2;"..FS("Your weapon inflicts more damages (level 2)").."]"
		.."tooltip[sharp_3;"..FS("Your weapon inflicts more damages (level 3)").."]"
		.."tooltip[durable;"..FS("Your tool lasts longer").."]"
		.."tooltip[durable_2;"..FS("Your tool lasts longer (level 2)").."]"
		.."tooltip[durable_3;"..FS("Your tool lasts longer (level 3)").."]"
		.."tooltip[fast;"..FS("Your tool digs faster").."]"
		.."tooltip[fast_2;"..FS("Your tool digs faster (level 2)").."]"
		.."tooltip[fast_3;"..FS("Your tool digs faster (level 3)").."]"
		.."tooltip[luck;"..FS("Your tool increases the chances of drops").."]"
		.."tooltip[furnace;"..FS("Your tool digs and cooks simultaneously").."]"
		.."tooltip[delicate;"..FS("Your tool gives your dig intact").."]"
		..default.gui_slots .. default.get_hotbar_bg(.55, 4.5)

	if meta:get_int("sumb_char") == 160 then
		formspec = formspec .. (enchant_buttons3[num] or "")
	elseif meta:get_int("sumb_char") == 80 then
		formspec = formspec .. (enchant_buttons2[num] or "")
	else
		formspec = formspec .. (enchant_buttons[num] or "")
	end
	meta:set_string("formspec", formspec)
end

function enchanting.on_put(pos, listname, _, stack)
	if listname == "tool" then
		local stackname = stack:get_name()
		local tool_groups = {"axe, pick, shovel",	"sword"}

		for idx, tools in ipairs(tool_groups) do
			if tools:find(stackname:match(":(%w+)")) then
				enchanting.formspec(pos, idx)
			end
		end
	end
end

function enchanting.fields(pos, _, fields, sender)
	if not next(fields) or fields.quit then return end
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	local tool = inv:get_stack("tool", 1)
	local mese = inv:get_stack("mese", 1)
	local orig_wear = tool:get_wear()
	local mod, name = tool:get_name():match("(.*):(.*)")
	local enchanted_tool = (mod or "") .. ":enchanted_" .. (name or "") .. "_" .. next(fields)

	if mese:get_count() >= mese_cost and reg_tools[enchanted_tool] then
		core.sound_play("xdecor_enchanting", {
			to_player = sender:get_player_name(),
			gain = .8
		})

		tool:replace(enchanted_tool)
		tool:add_wear(orig_wear)
		mese:take_item(mese_cost)
		inv:set_stack("mese", 1, mese)
		inv:set_stack("tool", 1, tool)
	if (string.match(enchanted_tool, "_2") and meta:get_int("sumb_char") == 80) or
		(string.match(enchanted_tool, "_3") and meta:get_int("sumb_char") == 160) then
		for i=-1,1 do
		for k=-1,1 do
			local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
			local n = core.get_node(p)
			if n.name == "ecology:sumbrellia_full" then
				core.set_node(p, {name="ecology:sumbrellia"})
				core.get_node_timer(p):start(math.random(4, 8))
local x = pos.x - p.x	local y = p.y - pos.y	local z = pos.z - p.z
	core.add_particle({
		pos = p,
		velocity = {x = x*4, y = 10 - y*4, z = z*4},
		acceleration = {x = 0, y = -50, z = 0},
		expirationtime = .21,
		size = 7,
		glow = 14,
		texture = "extra_energy_globe.png"
	})
			end
		end
		end
		meta:set_int("sumb_char", 0)
	end
	end
end

function enchanting.dig(pos)
	local inv = core.get_meta(pos):get_inventory()
	return inv:is_empty("tool") and inv:is_empty("mese")
end

function enchanting.blast(pos)
	local drops = xdecor.get_inventory_drops(pos, {"tool", "mese"})
	core.remove_node(pos)
	return drops
end

local function allowed(tool)
	if not tool then return end

	for item in pairs(reg_tools) do
		if item:find("enchanted_" .. tool) then
			return true
		end
	end
end

function enchanting.put(_, listname, _, stack)
	local stackname = stack:get_name()
	if listname == "mese" and (stackname == "default:mese_crystal" or
			stackname == "imese:industrial_mese_crystal") then
		return stack:get_count()
	elseif listname == "tool" and allowed(stackname:match("[^:]+$")) then
		return 1
	end

	return 0
end

function enchanting.on_take(pos, listname)
	if listname == "tool" then
		enchanting.formspec(pos)
	end
end

function enchanting.construct(pos)
	local meta = core.get_meta(pos)
	meta:set_string("infotext", S("Enchantment Table"))
	enchanting.formspec(pos)

	local inv = meta:get_inventory()
	inv:set_size("tool", 1)
	inv:set_size("mese", 1)

	core.add_entity({x = pos.x, y = pos.y + .85, z = pos.z}, "xdecor:book_open")
	core.get_node_timer(pos):start(.5)
end

function enchanting.destruct(pos)
	for _, obj in pairs(core.get_objects_inside_radius(pos, .9)) do
		if obj and obj:get_luaentity() and obj:get_luaentity().name == "xdecor:book_open" then
			obj:remove()
			break
		end
	end
end

function enchanting.timer(pos)
	local minp = {x = pos.x - 1, y = pos.y, z = pos.z - 1}
	local maxp = {x = pos.x + 1, y = pos.y, z = pos.z + 1}

	local meta = core.get_meta(pos)
	local sumful = core.find_nodes_in_area(minp, maxp, "ecology:sumbrellia_full")
	if #sumful == 4 or #sumful == 8 then
		meta:set_int("sumb_char", #sumful*20)
	else
		meta:set_int("sumb_char", 0)
	end
	--meta:set_string("infotext", "Sumbrellia charge at: "..meta:get_int("sumb_char"))

	minp = {x = pos.x - 2, y = pos.y, z = pos.z - 2}
	maxp = {x = pos.x + 2, y = pos.y + 1, z = pos.z + 2}

	local bookshelves = core.find_nodes_in_area(minp, maxp, "default:bookshelf")
	if #bookshelves == 0 then
		return true
	end

	local bookshelf_pos = bookshelves[random(1, #bookshelves)]
	local x = pos.x - bookshelf_pos.x
	local y = bookshelf_pos.y - pos.y
	local z = pos.z - bookshelf_pos.z

	if tostring(x .. z):find(2) then
		core.add_particle({
			pos = bookshelf_pos,
			velocity = {x = x, y = 2 - y, z = z},
			acceleration = {x = 0, y = -2.2, z = 0},
			expirationtime = 1,
			size = 1.5,
			glow = 5,
			texture = "xdecor_glyph" .. random(1,18) .. ".png"
		})
	end

	return true
end

xdecor.register("enchantment_table", {
	description = S("Enchantment Table"),
	_tt_help = S("Enchant your tools with mese crystals"),
	tiles = {"xdecor_enchantment_top.png", "xdecor_enchantment_bottom.png", "xdecor_enchantment_side.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.49, -.5, .5, .5, .5},
			{-.5, -.5, .25, -.25, -.49, .5},
			{.25, -.5, .25, .5, -.49, .5},
			{-.5, -.5, -.5, -.25, -.49, -.25},
			{.25, -.5, -.5, .5, -.49, -.25}
		}
	},
	groups = {cracky = 1, level = 1, timer_check = 1},
	is_ground_content = false,
	light_source = 6,
	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	can_dig = enchanting.dig,
	on_blast = enchanting.blast,
	on_timer = enchanting.timer,
	on_construct = enchanting.construct,
	on_destruct = enchanting.destruct,
	on_receive_fields = enchanting.fields,
	on_metadata_inventory_put = enchanting.on_put,
	on_metadata_inventory_take = enchanting.on_take,
	allow_metadata_inventory_put = enchanting.put,
	allow_metadata_inventory_move = function()
		return 0
	end,
})

core.register_entity("xdecor:book_open", {
	initial_properties = {
		visual = "sprite",
		visual_size = {x= .75, y= .75},
		collisionbox = {0,0,0,0,0,0},
		pointable = false,
		physical = false,
		textures = {"xdecor_book_open.png"},
		static_save = false,
	},
	on_activate = function(self)
		local pos = self.object:get_pos()
		local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}

		if core.get_node(pos_under).name ~= "xdecor:enchantment_table" then
			self.object:remove()
		end
	end
})

core.register_lbm({
	label = "recreate book entity",
	name = "xdecor:create_book_entity",
	nodenames = {"xdecor:enchantment_table"},
	run_at_every_load = true,
	action = function(pos, node)
		local objs = core.get_objects_inside_radius(pos, .9)

		for _, obj in ipairs(objs) do
			local e = obj:get_luaentity()
			if e and e.name == "xdecor:book_open" then
				return
			end
		end

		core.add_entity({x = pos.x, y = pos.y + .85, z = pos.z}, "xdecor:book_open")
	end,
})

function enchanting:register_tools(mod, def)	-- Could not redo using x_enchanting and on_craft in hell\crafting.lua
	for tool in pairs(def.tools) do
	for material in def.materials:gmatch("[%w_]+") do
	for enchant in def.tools[tool].enchants:gmatch("[%w_]+") do
if tool == "pick" and material == "crystal" and enchant == "luck" then break end
if tool == "shovel" and material == "crystal" and enchant == "delicate" then break end
		local original_tool = reg_tools[mod .. ":" .. tool .. "_" .. material]
		if not original_tool then break end
		local original_toolcaps = original_tool.tool_capabilities

		if original_toolcaps then
			local original_damage_groups = original_toolcaps.damage_groups
			local original_groupcaps = original_toolcaps.groupcaps
			local groupcaps = table.copy(original_groupcaps)
			local fleshy = original_damage_groups.fleshy
			local full_punch_interval = original_toolcaps.full_punch_interval
			local max_drop_level = original_toolcaps.max_drop_level
			local group = next(original_groupcaps)

	local luck
	local cook
	local soft
	local groups = {not_in_creative_inventory = 1}

	if enchant == "durable" then
		groupcaps[group].uses = ceil(original_groupcaps[group].uses * enchanting.uses)
	elseif enchant == "durable_2" then
		groupcaps[group].uses = ceil(original_groupcaps[group].uses * (enchanting.uses*2))
	elseif enchant == "durable_3" then
		groupcaps[group].uses = ceil(original_groupcaps[group].uses * (enchanting.uses*3))
	elseif enchant == "fast" then
		for i, time in pairs(original_groupcaps[group].times) do
			groupcaps[group].times[i] = time - enchanting.times
		end
	elseif enchant == "fast_2" then
		for i, time in pairs(original_groupcaps[group].times) do
			groupcaps[group].times[i] = time - (enchanting.times*2)
		end
	elseif enchant == "fast_3" then
		for i, time in pairs(original_groupcaps[group].times) do
			groupcaps[group].times[i] = time - (enchanting.times*3)
		end
	elseif enchant == "sharp" then
		fleshy = fleshy + enchanting.damages
	elseif enchant == "sharp_2" then
		fleshy = fleshy + (enchanting.damages*2)
	elseif enchant == "sharp_3" then
		fleshy = fleshy + (enchanting.damages*3)
	elseif enchant == "luck" then
		luck=true
		groups["luck"] = 1
	elseif enchant == "furnace" then
		cook=true
		groups["furnace"] = 1
	elseif enchant == "delicate" then
		soft=true
		groups["delicate"] = 1
	end

	if tool == "pick" and material == "crystal" and enchant ~= "delicate" then
		luck=true
		groups["luck"] = 1
	end

	if tool == "shovel" and material == "crystal" and enchant ~= "furnace" then
		soft=true
		groups["delicate"] = 1
	end

	local wiim
	if original_tool.wield_image ~= "" then
		wiim = original_tool.wield_image .. "^[colorize:violet:50"
	end

	local arg1 = def.material_desc[material] or cap(material)
	local arg2 = def.tools[tool].desc or cap(tool)
	local arg3 = self:get_tooltip(enchant, original_groupcaps[group], fleshy)
	core.register_tool(":" .. mod .. ":enchanted_" .. tool .. "_" .. material .. "_" .. enchant, {
		description = S("Enchanted @1 @2\n@3", arg1, arg2, arg3),
		short_description = S("Enchanted @1 @2", arg1, arg2),
		inventory_image = original_tool.inventory_image .. "^[colorize:violet:50",
		wield_image = wiim,
		tool_capabilities = {
			groupcaps = groupcaps,	damage_groups = {fleshy = fleshy},
			full_punch_interval = full_punch_interval,
			max_drop_level = max_drop_level,
			give_dig = soft,
			luck_drops = luck,
			cook_dug = cook,
		},
		groups = groups,
		sound = {breaks = "default_tool_breaks"}
	})
		end
	end
	end
	end
end

enchanting:register_tools("default", {
	materials = "bronze, steel, silver, mese, mithril, diamond, orichalc, blue_diamond, crystal",
	material_desc = {bronze = S("Bronze"), steel = S("Steel"), silver = S("Silver"), mese = S("Mese"),
		mithril = S("Mithril"), diamond = S("Diamond"), orichalc = S("Orichalc"), blue_diamond = S("Blue Diamond"),
		crystal = S("Frost Crystal")},
	tools = {
		axe    = {enchants = "durable, durable_2, durable_3, fast, fast_2, fast_3, luck, furnace, delicate", desc = S("Axe")},
		pick   = {enchants = "durable, durable_2, durable_3, fast, fast_2, fast_3, luck, furnace, delicate", desc = S("Pickaxe")},
		shovel = {enchants = "durable, durable_2, durable_3, fast, fast_2, fast_3, luck, furnace, delicate", desc = S("Shovel")},
		sword  = {enchants = "durable, durable_2, durable_3, sharp, sharp_2, sharp_3, luck, furnace, delicate", desc = S("Sword")}
	}
})

-- Recipe

core.register_craft({
	output = "xdecor:enchantment_table",
	recipe = {
		{"fabric:sheet_red", "default:gold_lump", "default:book"},
		{"default:diamond", "default:obsidian", "default:diamond"}
	}
})

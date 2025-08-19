
local S = technic.getter

core.register_craft({
	output = 'technic:wind_mill_frame 5',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', '', 'default:steel_ingot'}
	}
})

core.register_craft({
	output = 'technic:wind_mill',
	recipe = {
		{'', 'basic_materials:motor', ''},
		{'default:steel_ingot', 'default:steel_block', 'default:steel_ingot'},
		{'', 'technic:mv_cable', ''}
	}
})

core.register_node("technic:wind_mill_frame", {
	description = S("Wind Mill Frame"),
	drawtype = "glasslike_framed",
	tiles = {"default_steel_block.png", "default_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

local function check_wind_mill(pos)
	if pos.y < 30 then
		return false
	end
	pos = {x=pos.x, y=pos.y, z=pos.z}
	for i = 1, 20 do
		pos.y = pos.y - 1
		local node = core.get_node_or_nil(pos)
		if not node then
			-- we reached CONTENT_IGNORE, we can assume, that nothing changed
			-- as the user will have to load the block to change it
			return
		end
		if node.name ~= "technic:wind_mill_frame" then
			return false
		end
	end
	return true
end

local run = function(pos, node)
	local meta = core.get_meta(pos)
	local machine_name = S("Wind %s Generator"):format("MV")

	local check = check_wind_mill(pos)
	if check == false then
		meta:set_int("MV_EU_supply", 0)
		meta:set_string("infotext", S("%s Improperly Placed"):format(machine_name))
	elseif check == true then
		local power = math.min(pos.y * 100, 5000)
		meta:set_int("MV_EU_supply", power)
		meta:set_string("infotext", S("@1 (@2)", machine_name,
			technic.EU_string(power)))
	end
	-- check == nil: assume nothing has changed
end

core.register_node("technic:wind_mill", {
	description = S("Wind %s Generator"):format("MV"),
	tiles = {"default_steel_block.png"},
	paramtype2 = "facedir",
	groups = {cracky=1, technic_machine=1, technic_mv=1},
	connect_sides = {"top", "bottom", "back", "left", "right"},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- Main box
			{-0.1, -0.1, -0.5,  0.1, 0.1, -0.6}, -- Shaft
			{-0.1, -1,   -0.6,  0.1, 1,   -0.7}, -- Vertical blades
			{-1,   -0.1, -0.6,  1,   0.1, -0.7}, -- Horizontal blades
		}
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", S("Wind %s Generator"):format("MV"))
		meta:set_int("MV_EU_supply", 0)
	end,
	technic_run = run,
})

technic.register_machine("MV", "technic:wind_mill", technic.producer)

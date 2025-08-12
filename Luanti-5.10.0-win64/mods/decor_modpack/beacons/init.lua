-- Maximum number of light nodes above beacon (or 0 for no max)
local beacon_height = tonumber(core.settings:get("beacon_height")) or 0

local function get_node_under_light(pos)
    pos = table.copy(pos)
    local node = core.get_node(pos)
    local y_dist = 0
    while core.get_item_group(node.name, "beacon_light") ~= 0 and (beacon_height == 0 or y_dist <= beacon_height) do
        node = core.get_node(vector.subtract(pos, {x = 0, y = y_dist, z = 0}))
        y_dist = y_dist + 1
    end
    return node
end

local function beacon_on_construct(pos, color)
    local above = vector.add(pos, {x = 0, y = 1, z = 0})
    if get_node_under_light(pos).name == ("beacons:base_" .. color) and core.get_node(above).name == "air" then
        core.set_node(above, {name = "beacons:light_" .. color})
    end
end

local function beacon_on_destruct(pos, color)
    local above = vector.add(pos, {x = 0, y = 1, z = 0})
    if core.get_node(above).name == ("beacons:light_" .. color) then
        core.remove_node(above)
    end
end

local function beacon_on_timer(pos, color)
    beacon_on_construct(pos, color)
    if get_node_under_light(pos).name ~= ("beacons:base_" .. color) then
        core.remove_node(pos)
    end
    return true
end

local function make_on_construct(color)
    return function(pos)
        core.get_node_timer(pos):start(1)
        return beacon_on_construct(pos, color)
    end
end

local function make_on_destruct(color)
    return function(pos) 
        return beacon_on_destruct(pos, color)
    end
end

local function make_on_timer(color)
    return function(pos) 
        return beacon_on_timer(pos, color)
    end
end

local color_descs = {
	white = "White",
	red = "Red",
	yellow = "Yellow",
	green = "Green",
	cyan = "Cyan",
	blue = "Blue",
	magenta = "Magenta",
	orange = "Orange",
	violet = "Violet",
}

for color, color_desc in pairs(color_descs) do
	core.register_node("beacons:base_" .. color, {
		description = color_desc .. " Beacon",
		tiles = {"beacons_base_top.png", "beacons_base_bottom.png", "beacons_base_side.png"},
		color = color:gsub("_", ""),
		groups = {beacon_base = 1, cracky = 2},
		is_ground_content = false,
		paramtype = "light",
		on_rotate = function() end,

		on_construct = make_on_construct(color),
		on_destruct = make_on_destruct(color),
		on_timer = make_on_timer(color),
	})

	core.register_craft({
		output = "beacons:base_" .. color,
		recipe = {
			{"default:steel_ingot", "group:dye,color_" .. color, "default:steel_ingot"},
			{"default:steel_ingot", "default:meselamp", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
		}
	})

	core.register_craft({
		type = "shapeless",
		output = "beacons:base_" .. color,
		recipe = {"group:beacon_base", "group:dye,color_" .. color},
	})

	core.register_node("beacons:light_" .. color, {
		description = color_desc .. " Beacon Light",
		drawtype = "plantlike",
		tiles = {"beacons_light.png"},
		color = color:gsub("_", ""),
		paramtype = "light",
		sunlight_propagates = true,
		light_source = default.LIGHT_MAX,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		floodable = false,
		drop = "",
		groups = {beacon_light = 1, not_in_creative_inventory = 1},
		damage_per_second = 1,
		post_effect_color = color,
		on_blast = function() end,

		on_construct = make_on_construct(color),
		on_destruct = make_on_destruct(color),
		on_timer = make_on_timer(color),
	})
end
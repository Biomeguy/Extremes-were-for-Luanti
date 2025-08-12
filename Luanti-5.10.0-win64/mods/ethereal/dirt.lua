
local S = ethereal.intllib

local dirts = {"Grove"}

for n = 1, #dirts do
	local desc = dirts[n]
	local name = desc:lower()

core.register_node("ethereal:"..name.."_dirt", {
	description = S(desc.." Dirt"),
	tiles = {"ethereal_"..name.."_grass_top.png", "default_dirt.png",
		{name = "default_dirt.png^ethereal_"..name.."_grass_side.png",
			tileable_vertical = false}},
	is_ground_content = ethereal.cavedirt,
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:soil"},
})
end

core.register_node("ethereal:dry_dirt_with_fiery_grass", {
	description = S("Fiery Dry Dirt"),
	tiles = {"ethereal_fiery_grass_top.png", "default_dry_dirt.png",
		{name = "default_dry_dirt.png^ethereal_fiery_grass_side.png", tileable_vertical = false}},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(4, 6))
	end,
	on_timer = function(pos)
		local meta = core.get_meta(pos)
		if meta:get_int("cycle_delay") < 54 then
			meta:set_int("cycle_delay", meta:get_int("cycle_delay")+math.random(1, 2))
		else
			for i=-1,1 do
			for j=-1,1 do
			for k=-1,1 do
				local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
				local n = core.get_node(p)
				if n and n.name == "default:dry_dirt" then
					if default.h_h_h(pos, -31000, -10) then
						if default.h_h_h(pos, -10, 110, 69, 96, 9, 31) then
							core.set_node(pos, {name = "default:dry_dirt"})
							return
						end
					end
					local above = {x=p.x, y=p.y+1, z=p.z}
					if (core.get_node_light(above) or 0) > 13 then
						core.set_node(p, {name = "ethereal:dry_dirt_with_fiery_grass"})
						core.get_node_timer(p):start(math.random(4, 6))
					end
				end
			end
			end
			end
			meta:set_int("cycle_delay",0)
		end
		default.hydrate_dry_dirt(pos)
	end,
	groups = {crumbly = 3, fiery = 1, can_bonemeal = 1, timer_check = 1},
	drop = "default:dry_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
})

-- Quicksand
core.register_node("ethereal:quicksand", {
	description = S("Quicksand"),
	drawtype = "glasslike",
	tiles = {"default_sand.png^[colorize:#00004F10"},
	liquid_viscosity = 14,
	liquidtype = "source",
	liquid_alternative_flowing = "ethereal:quicksand",
	liquid_alternative_source = "ethereal:quicksand",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 1,
	walkable = false,
	drop = "default:sand",
	post_effect_color = {a = 255, r = 100, g = 90, b = 70},
	groups = {crumbly = 3, sand = 1, liquid = 3, disable_jump = 1},
	sounds = default.node_sound_sand_defaults(),
})

-- craft quicksand
core.register_craft({
	output = "ethereal:quicksand 8",
	recipe = {
		{"group:sand", "group:sand", "group:sand"},
		{"group:sand", "group:water_bucket", "group:sand"},
		{"group:sand", "group:sand", "group:sand"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

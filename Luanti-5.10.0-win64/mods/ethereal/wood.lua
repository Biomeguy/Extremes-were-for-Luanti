
local S = ethereal.intllib

-- sakura trunk, wood
core.register_node("ethereal:sakura_trunk", {
	description = S("Sakura Trunk"),
	tiles = {"ethereal_sakura_trunk_top.png", "ethereal_sakura_trunk_top.png", "ethereal_sakura_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:sakura_wood", {
	description = S("Sakura Wood"),
	tiles = {"ethereal_sakura_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:sakura_wood 4",
	recipe = {{"ethereal:sakura_trunk"}}
})

-- willow trunk, wood
core.register_node("ethereal:willow_trunk", {
	description = S("Willow Trunk"),
	tiles = {"willow_trunk_top.png", "willow_trunk_top.png", "willow_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:willow_wood", {
	description = S("Willow Wood"),
	tiles = {"willow_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:willow_wood 4",
	recipe = {{"ethereal:willow_trunk"}}
})

-- redwood trunk, wood
core.register_node("ethereal:redwood_trunk", {
	description = S("Redwood Trunk"),
	tiles = {"redwood_trunk_top.png", "redwood_trunk_top.png", "redwood_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:redwood_wood", {
	description = S("Redwood Wood"),
	tiles = {"redwood_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:redwood_wood 4",
	recipe = {{"ethereal:redwood_trunk"}}
})

-- frost trunk, wood
core.register_node("ethereal:frost_trunk", {
	description = S("Frost Tree Trunk"),
	tiles = {"ethereal_frost_trunk_top.png", "ethereal_frost_trunk_top.png", "ethereal_frost_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:frost_wood", {
	description = S("Frost Wood"),
	tiles = {"frost_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:frost_wood 4",
	recipe = {{"ethereal:frost_trunk"}}
})

-- healing trunk, wood
core.register_node("ethereal:yellow_trunk", {
	description = S("Healing Tree Trunk"),
	tiles = {"yellow_trunk_top.png", "yellow_trunk_top.png", "yellow_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local f = core.find_node_near(pos, 1, "ethereal:golden_apple_mark")
		if not f then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(f) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(f, {name = "ethereal:golden_apple"})
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {choppy = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:yellow_wood", {
	description = S("Healing Tree Wood"),
	tiles = {"yellow_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:yellow_wood 4",
	recipe = {{"ethereal:yellow_trunk"}}
})

-- banana corm, wood
core.register_node("ethereal:banana_corm", {
	description = S("Banana Corm"),
	tiles = {"banana_corm_top.png", "banana_corm_top.png", "banana_corm.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local f = core.find_node_near(pos, 1,
		{"ethereal:banana_mark", "ethereal:banana_cluster_1", "ethereal:banana_cluster_2"})
		if not f then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(f) < 11 then
			core.get_node_timer(pos):start(200)
		else
			pos.y = pos.y+1
			if core.get_node(pos).name == "ethereal:bananaleaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				if core.get_node(f).name == "ethereal:banana_mark" then
					core.set_node(f, {name = "ethereal:banana_cluster_1"})
					core.get_node_timer(pos):start(200)
				else
					if core.get_node(f).name == "ethereal:banana_cluster_1" then
						core.set_node(f, {name = "ethereal:banana_cluster_2"})
						core.get_node_timer(pos):start(math.random(200, 300))
					else
						if core.get_node(f).name == "ethereal:banana_cluster_2" then
							core.set_node(f, {name = "ethereal:banana_cluster_3"})
							core.get_node_timer(pos):start(math.random(200, 300))
						end
					end
				end
			end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_node("ethereal:banana_wood", {
	description = S("Banana Wood"),
	tiles = {"banana_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	output = "ethereal:banana_wood 4",
	recipe = {{"ethereal:banana_corm"}}
})

-- scorched trunk
core.register_node("ethereal:scorched_trunk", {
	description = S("Scorched Trunk"),
	tiles = {"scorched_trunk_top.png", "scorched_trunk_top.png", "scorched_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})
core.register_craft({
	output = "ethereal:scorched_trunk 8",
	recipe = {
		{"group:trunk", "group:trunk", "group:trunk"},
		{"group:trunk", "default:torch", "group:trunk"},
		{"group:trunk", "group:trunk", "group:trunk"}
	}
})

local function bamboo_resprout(pos)
	local node = core.get_node({x=pos.x, y=pos.y -1, z=pos.z})
	if core.get_item_group(node.name, "soil") > 0 and core.get_node(pos).name == "air" then
		core.set_node(pos, {name = "ethereal:bamboo_sprout_1"})
		core.get_node_timer(pos):start(math.random(240, 300))
	end
end

-- bamboo
core.register_node("ethereal:bamboo", {
	description = S("Bamboo"),
	drawtype = "nodebox",
	tiles = {"bamboo_top.png", "bamboo_top.png", "bamboo.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -.5, -3/16, 3/16, .5, 3/16},
			{-4/16, -.5, -1/8, 4/16, .5, 1/8},
			{-1/8, -.5, -4/16, 1/8, .5, 4/16}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, .5, 3/16}
	},
	is_ground_content = false,
	after_place_node = function(pos, placer, itemstack)
		core.set_node(pos, {name = "ethereal:bamboo", param2 = 1})
	end,
	after_dig_node = function(pos, oldnode)
		local node = core.get_node({x=pos.x, y=pos.y -1, z=pos.z})
		if oldnode.param2 == 0 and core.get_item_group(node.name, "soil") > 0 then
			core.after(math.random(240, 300), bamboo_resprout, pos)
		end
	end,
	groups = {choppy = 1, attached_node = 1, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
})
core.register_craft({
	type = "fuel",
	recipe = "ethereal:bamboo",
	burntime = 3
})

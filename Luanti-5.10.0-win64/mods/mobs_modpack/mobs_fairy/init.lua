
mobs:register_mob("mobs_fairy:fairy", {
	type = "animal",
	passive = true,
	damage = -1,
	reach = 1,
	attack_type = "dogfight",
	hp_min = 7,
	hp_max = 12,
	armor = 130,
	collisionbox = {-.1,-.1,-.1, .1,.1,.1},
	visual = "mesh",
	mesh = "fairy.b3d",
	textures = {
		{"fairy.png"},
		{"fairy_1.png"},
		{"fairy_2.png"},
		{"fairy_3.png"},
		{"fairy_4.png"},
	},
	visual_size = {x=1.5, y=1.5},
	walk_velocity = 2,
	run_velocity = 3,
	fall_speed = 0,
	stepheight = 10,
	do_custom = function(self)
		local pos = self.object:get_pos()	if not pos then return end
		for _, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() and obj:get_hp() <= 10 then
				obj:set_hp(obj:get_hp()+10)
				self.object:remove()
			end
		end
if core.get_modpath("gems") then
		core.add_particle({
			pos = {x=pos.x+math.random(-1,1)/10, y=pos.y+math.random(-1,1)/10, z=pos.z+math.random(-1,1)/10},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=math.random(-2,2)/10, y=math.random(-2,-5)/10, z=math.random(-2,2)/10},
			expirationtime = math.random(5,10)/10,
			size = math.random(3,6)/10,
			texture = "fairy_spark.png",
			glow = 9 }) end
		if self.child or math.random(1, 250) > 1 then
			return
		end
		local under = core.get_node_or_nil({x=pos.x, y=pos.y-1, z=pos.z})
		if under and under.name == "default:dirt" and core.get_node(pos).name == "air" then
			core.set_node(pos, {name = "mobs_fairy:light"})
		end
	end,
	sounds = {
		random = "fairy",
	},
	fly = true,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	suffocation = 0,
	view_range = 5,
	glow = 10,
	animation = {
		speed_normal = 40,	speed_run = 60,
		stand_start = 1,	stand_end = 10,
		walk_start = 1,		walk_end = 10,
		run_start = 1,		run_end = 10,
		punch_start = 1,	punch_end = 10
	},
	on_spawn = function(self)
		self.object:set_properties({
			collisionbox = {-.1,-.1,-.1, .1,.1,.1}
		})
		return true
	end,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "vessels:glass_jar" and math.random(1,3) == 3 then
			item:take_item()
			clicker:set_wielded_item(item)
			local pos = self.object:get_pos()
			core.add_item(pos, "mobs_fairy:fairy")
			self.object:remove()
		end
	end
})

local mushrooms = {"flowers:mushroom_brown", "flowers:mushroom_red", "flowers:mushroom_white"}

core.register_node("mobs_fairy:light", {
	description = "Fairy Light (Spawned when a fairy flys/walks over dirt)",
	drawtype = "plantlike",
	visual_scale = .75,
	tiles = {"fairy_light.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	walkable = false,
	diggable = false,
	pointable = false,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(3, 30))
	end,
	on_timer = function(pos, elapsed)
		local node_down = core.get_node_or_nil({x=pos.x, y=pos.y-1, z=pos.z})
		if node_down and node_down.name == "default:dirt" then
			local n = mushrooms[math.random(#mushrooms)]
			core.set_node(pos, {name = n})
		else
			core.remove_node(pos)
		end
	end,
})

core.register_craftitem("mobs_fairy:fairy", {
	description = "Fairy",
	inventory_image = "fairy_inv.png",
	groups = {spawn_egg = 1},
	on_place = function(item, placer, pointd)
		local pos = pointd.above

		-- does existing on_rightclick function exist?
		local under = core.get_node(pointd.under)
		local def = core.registered_nodes[under.name]

		if def and def.on_rightclick then
			return def.on_rightclick(pointd.under, under, placer, item)
		end

		if pos and not core.is_protected(pos, placer:get_player_name()) then

			if not core.registered_entities["mobs_fairy:fairy"] then
				return
			end

			pos.y = pos.y + 1

			core.add_entity(pos, "mobs_fairy:fairy")

			-- if not in creative then replace item
			if not mobs.is_creative(placer:get_player_name()) then
	local inv = placer:get_inventory()

	if inv:room_for_item("main", {name = "vessels:glass_jar"}) then
		inv:add_item("main", {name = "vessels:glass_jar"})
	else
		core.add_item(pos, "vessels:glass_jar")
	end
	item:take_item()
			end
		end

		return item
	end,
})

mobs:spawn_specific("mobs_fairy:fairy", {"air"}, {"default:beech_trunk"}, 20, 10, 300, 15000, 2, -100, 11000, true)
mobs:spawn("mobs_fairy:fairy",	{"air"},
{"default:dirt_with_grass", "default:dirt_with_swamp_grass", "default:dirt_with_rainforest_litter"}, 20, 10, 30, 15000, 2, -100, 11000, true)
mobs:spawn("mobs_fairy:fairy",	{"air"}, {"gems:healwater_source"}, 20, 10, 30, 1500, 2, -100, 11000, true)

dofile(core.get_modpath("mobs_fairy").."/decor_fly.lua")


-- get node but use fallback for nil or unknown
local function node_ok(pos, fallback)
	fallback = fallback or "default:dirt"

	local node = core.get_node_or_nil(pos)
	if not node then
		return core.registered_nodes[fallback]
	end

	if core.registered_nodes[node.name] then
		return node
	end
	return core.registered_nodes[fallback]
end

local function hit(pos, self)
	local node = node_ok(pos).name

	self.hit_node(self, pos, node)
	self.object:remove()
	return
end

--on_step function able to follow the mobs
local function search_on_step(self, dtime,
	max_time,	--after this amount of time the entity is removed
	radius,		--radius in which look for entities to follow
	vel)		--velocity of the projectile

	local pos = self.object:get_pos()

	--Disappear after a certain time
	if self.life_time == 0 then
		self.life_time = os.time()
	end
	if os.time() - self.life_time > max_time then
		self.object:remove()
		return
	end

	--Look for an entity to follow
	local objects = core.get_objects_inside_radius(pos, radius)
	local min_dist = 100
	local obj_min = nil
	local obj_p = nil
	local vec_min = nil

	for _,obj in ipairs(objects) do
		if (obj:is_player()) then
		elseif (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item" and
		obj:get_luaentity().name ~= self.object:get_luaentity().name) then

			obj_p = obj:get_pos()

			local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
			local dist = (vec.x^ 2+ vec.y^ 2+ vec.z^ 2)^ .5

			if (dist < min_dist) then
				min_dist = dist
				obj_min = obj
				vec_min = vec
			end
		end
	end

	--Found an entity to follow:
	if obj_min ~= nil then
		local new_vel = {x=0, y=0, z=0}

		local dir = 0
		local max_diff = 0

		if max_diff< math.abs(vec_min.x) then
			dir = 1
			max_diff = math.abs(vec_min.x)
		end
		if max_diff< math.abs(vec_min.y) then
			dir = 2
			max_diff = math.abs(vec_min.y)
		end
		if max_diff< math.abs(vec_min.z) then
			dir = 3
			max_diff = math.abs(vec_min.z)
		end

		vec_min.x = (vec_min.x / max_diff)* vel
		vec_min.y = (vec_min.y / max_diff)* vel
		vec_min.z = (vec_min.z / max_diff)* vel

		obj_p = obj_min:get_pos()

		if min_dist < 1 then
			hit(pos, self)
		else
			self.object:set_velocity(vec_min)
		end
	end
	local n = core.get_node(pos).name
	if n ~= "air" and n ~= "default:water_source" and n ~= "default:water_flowing" then
		hit(pos, self)
	end
end


--[[Function to register new weapons: parameters:
	- name of the weapon
	- on_step function (written by you or taken from the standard one above)
	- hit_node function
	- description of the weapon
	- one material to be used in the recipe		]]
local function nssm_register_weapon(name, def)

	core.register_entity("nssm:".. name, {
	initial_properties = {
		visual = "sprite",
		textures = {name ..".png"},
		physical = false,
		glow = def.glow or 0,
	},
		life_time = 0,
		on_step = function(self, dtime)
			def.on_step(self, dtime)
		end,
		hit_node = function(self, pos, node)
			def.hit_node(self, pos, node)
		end,
	})

	core.register_craftitem("nssm:".. name .."_hand", {
		description = def.description,
		inventory_image = name .."_hand.png",
		on_use = function(item, user, pointd)
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, "nssm:".. name)
			obj:set_velocity({x=dir.x*25,y=dir.y*25,z=dir.z*25})
			item:take_item()
			return item
		end
	})

	core.register_craft({
		output = "nssm:".. name .."_hand 23",
		recipe = {
			{"extra_energy:great_globe", "extra_energy:great_globe", "extra_energy:great_globe"},
			{"extra_energy:great_globe", def.material, "extra_energy:great_globe"},
			{"extra_energy:great_globe", "extra_energy:great_globe", "extra_energy:great_globe"}
		}
	})
end

--Registered weapons:
nssm_register_weapon("kamehameha", {
	on_step = function(self, dtime)
		local pos = self.object:get_pos()
		core.add_particlespawner({
			amount = 2,
			time = .01,
			pos = pos,
			minvel = {x=-3, y=-3, z=-3},
			maxvel = {x=3, y=3, z=3},
			exptime = {min = .5, max = .6},
			minsize = 3,
			maxsize = 4,
			texture = "kamehameha_tail.png",
			glow = 14 })
		search_on_step(self, dtime, 35, 30, 25)
	end,
	hit_node = function(self, pos, node)
		for k, obj in pairs(core.get_objects_inside_radius(pos, 3)) do
			if obj:get_luaentity() ~= nil then
				local ent = obj:get_luaentity()
				if ent.type == "monster" then
					obj:punch(obj, .5, {
						full_punch_interval=.5,
						damage_groups={fleshy=10},
					}, nil)
				end
			end
			obj:set_hp(obj:get_hp()+10)
		end
	end,
	glow = 14,
	material = "default:diamond_block",
	description = "Kamehameha",
})

nssm_register_weapon("spirit_ball", {
	on_step = function(self, dtime)
		search_on_step(self, dtime, 35, 30, 25)
	end,
	hit_node = function(self, pos, node)
		for k, obj in pairs(core.get_objects_inside_radius(pos, 5)) do
			if obj:get_luaentity() ~= nil then
				local ent = obj:get_luaentity()
				if ent.type == "monster" then
					obj:punch(obj, .5, {
						full_punch_interval=.5,
						damage_groups={fleshy=20},
					}, nil)
				end
			end
			obj:set_hp(obj:get_hp()+20)
		end
	end,
	glow = 14,
	material = "default:gold_block",
	description = "Spirit Ball",
})

local function nssm_register_throwitem(name, descr, def)

	core.register_craftitem("nssm:".. name .."_bomb", {
		description = descr,
		inventory_image = name .."_bomb.png",
		on_use = function(item, user, pointd)
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, "nssm:"..name.."_bomb_flying")
			obj:set_velocity({x=dir.x*15,y=dir.y*15,z=dir.z*15})
			obj:set_acceleration({x=0, y=-9.8, z=0})
			item:take_item()
			return item
		end
	})

	core.register_entity("nssm:".. name .."_bomb_flying", {
	initial_properties = {
		visual = "sprite",
		textures = {name .."_bomb.png"},
		physical = true,
		hp_max = 20,
		collisionbox = {-.1,-.1,-.1, .1,.1,.1},
	},
		on_step = function(self, dtime)
			local pos = self.object:get_pos()
			local n = core.get_node(pos).name

			if n ~= "air" then
				def.hit_node(self, pos, n)
				self.object:remove()
			end
		end
	})
end

nssm_register_throwitem("cobweb", "Cobweb Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = -1,1 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.dig_node(pos1)
				core.set_node(pos1, {name="nssm:web"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:cobweb_bomb 8",
	recipe = {
		{"nssm:silk_gland", "nssm:black_powder", "nssm:silk_gland"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:silk_gland", "nssm:black_powder", "nssm:silk_gland"}
	}
})

nssm_register_throwitem("ice", "Ice Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = 1,3 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			local pos2 = {x = pos.x, y=pos.y+1, z=pos.z}
			local pos3 = {x = pos.x, y=pos.y+2, z=pos.z}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="default:ice"})
				core.dig_node(pos2)
				core.dig_node(pos3)
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:ice_bomb 8",
	recipe = {
		{"group:water_bucket", "nssm:black_powder", "group:water_bucket"},
		{"nssm:black_powder", "default:crystal_spike", "nssm:black_powder"},
		{"group:water_bucket", "nssm:black_powder", "group:water_bucket"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

nssm_register_throwitem("mantis", "Mantis Clay Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = 1,3 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			local pos2 = {x = pos.x, y=pos.y+1, z=pos.z}
			local pos3 = {x = pos.x, y=pos.y+2, z=pos.z}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.dig_node(pos1)
				core.set_node(pos1, {name="nssm:hardened_mantis_clay"})
				core.dig_node(pos2)
				core.dig_node(pos3)
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:mantis_bomb 8",
	recipe = {
		{"nssm:mantis_meat", "nssm:black_powder", "nssm:mantis_meat"},
		{"nssm:black_powder", "nssm:hardened_mantis_clay", "nssm:black_powder"},
		{"nssm:mantis_meat", "nssm:black_powder", "nssm:mantis_meat"}
	}
})

nssm_register_throwitem("lava", "Lava Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = -1,0 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="default:lava_source"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:lava_bomb 12",
	recipe = {
		{"bucket:bucket_lava", "nssm:black_powder", "bucket:bucket_lava"},
		{"nssm:black_powder", "nssm:lava_titan_eye", "nssm:black_powder"},
		{"bucket:bucket_lava", "nssm:black_powder", "bucket:bucket_lava"}
	}
})

nssm_register_throwitem("water", "Water Bomb", {
	hit_node = function(self, pos)
		for dx = -2,2 do
		for dy = -1,0 do
		for dz = -2,2 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="default:water_source"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:water_bomb 10",
	recipe = {
		{"group:salt_water_bucket", "nssm:black_powder", "group:salt_water_bucket"},
		{"nssm:black_powder", "nssm:tentacle_curly", "nssm:black_powder"},
		{"group:salt_water_bucket", "nssm:black_powder", "group:salt_water_bucket"}
	},
	replacements = {
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

nssm_register_throwitem("fire", "Fire Bomb", {
	hit_node = function(self, pos)
core.sound_play("scrausics", {pos = pos, gain = 1., max_hear_distance = 15}, true)
		for dx = -1,1 do
		for dy = 1,1 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="fire:basic_flame"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:fire_bomb 6",
	recipe = {
		{"fire:flint_and_steel", "nssm:black_powder", "fire:flint_and_steel"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"fire:flint_and_steel", "nssm:black_powder", "fire:flint_and_steel"}
	}
})

nssm_register_throwitem("mornar", "Mornar Bomb", {
	hit_node = function(self, pos)
core.sound_play("night_master", {pos = pos, gain = 1., max_hear_distance = 15}, true)
		for dx = -1,1 do
		for dy = 1,1 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="nssm:mornar"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:mornar_bomb 6",
	recipe = {
		{"nssm:wrathful_soul_fragment", "nssm:black_powder", "nssm:wrathful_soul_fragment"},
		{"nssm:black_powder", "nssm:wrathful_soul_fragment", "nssm:black_powder"},
		{"nssm:wrathful_soul_fragment", "nssm:black_powder", "nssm:wrathful_soul_fragment"}
	}
})

nssm_register_throwitem("hole", "Hole Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = -10,1 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.dig_node(pos1)
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:hole_bomb 10",
	recipe = {
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:digested_sand", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"}
	}
})

nssm_register_throwitem("phoenix_fire", "Phoenix Fire Bomb", {
	hit_node = function(self, pos)
core.sound_play("phoenix", {pos = pos, gain = 1., max_hear_distance = 15}, true)
core.add_particlespawner({
	amount = 39,
	time = .1,
	minpos = vector.subtract(pos, .3),
	maxpos = vector.add(pos, .3),
	minvel = {x=-5, y=0, z=-5},
	maxvel = {x=5, y=.3, z=5},
	minacc = {x=0,y=2,z=0},
	maxacc = {x=0,y=5,z=0},
	exptime = {min = .8, max = 1},
	minsize = 5,
	maxsize = 8,
	texture = "phoenix_fire.png",
	glow = 14 })
		for dx = -2,2 do
		for dy = 0,1 do
		for dz = -2,2 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="nssm:phoenix_fire"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:phoenix_fire_bomb 10",
	recipe = {
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:sun_feather", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"}
	}
})

nssm_register_throwitem("kaboom", "Explosive Bomb", {
	hit_node = function(self, pos)
		if not core.is_protected(pos, "") or not core.get_item_group(core.get_node(pos).name, "unbreakable") == 1 then
			tnt.boom(pos, {damage_radius=3,radius=2,ignore_protection=false})
		end
	end
})

core.register_craft({
	output = "nssm:kaboom_bomb 3",
	recipe = {
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"}
	}
})

nssm_register_throwitem("boom", "Boom Bomb", {
	hit_node = function(self, pos)
		if not core.is_protected(pos, "") or not core.get_item_group(core.get_node(pos).name, "unbreakable") == 1 then
			tnt.boom(pos, {damage_radius=4,radius=3,ignore_protection=false})
		end
	end
})

core.register_craft({
	output = "nssm:boom_bomb 10",
	recipe = {
		{"nssm:greedy_soul_fragment", "nssm:black_powder", "nssm:greedy_soul_fragment"},
		{"nssm:black_powder", "nssm:greedy_soul_fragment", "nssm:black_powder"},
		{"nssm:greedy_soul_fragment", "nssm:black_powder", "nssm:greedy_soul_fragment"}
	}
})

nssm_register_throwitem("smoke", "Smoke Bomb", {
	hit_node = function(self, pos)
core.add_particlespawner({
	amount = 4500,
	time = 20,
	minpos = {x=pos.x-3, y=pos.y+.5, z=pos.z-3},
	maxpos = {x=pos.x+3, y=pos.y+.5, z=pos.z+3},
	minvel = {x=-.4, y=.2, z=-.4},
	maxvel = {x=.4, y=.8, z=.4},
	minacc = {x=-.2,y=0,z=-.2},
	maxacc = {x=.2,y=.1,z=.2},
	exptime = {min = 6, max = 8},
	minsize = 10,
	maxsize = 12,
	texture = "tnt_smoke.png"})
	end
})

core.register_craft({
	output = "nssm:smoke_bomb 6",
	recipe = {
		{"nssm:proud_soul_fragment", "nssm:black_powder", "nssm:proud_soul_fragment"},
		{"nssm:black_powder", "nssm:proud_soul_fragment", "nssm:black_powder"},
		{"nssm:proud_soul_fragment", "nssm:black_powder", "nssm:proud_soul_fragment"}
	}
})

nssm_register_throwitem("thick_web", "Thick Web Bomb", {
	hit_node = function(self, pos)
		local pos1 = {x = pos.x, y=pos.y+1, z=pos.z}
		local pos2 = {x = pos.x, y=pos.y+2, z=pos.z}
		if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
			core.dig_node(pos1)
			core.dig_node(pos2)
			core.set_node(pos1, {name="nssm:thick_web"})
			core.set_node(pos2, {name="nssm:thick_web"})
		end
	end
})

core.register_craft({
	output = "nssm:thick_web_bomb 12",
	recipe = {
		{"nssm:super_silk_gland", "nssm:black_powder", "nssm:super_silk_gland"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:super_silk_gland", "nssm:black_powder", "nssm:super_silk_gland"}
	}
})

nssm_register_throwitem("poison", "Poison Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = 1,3 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="nssm:venomous_gas"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:poison_bomb 10",
	recipe = {
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:snake_scute", "nssm:black_powder"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"}
	}
})

nssm_register_throwitem("stone", "Cobblestone Bomb", {
	hit_node = function(self, pos)
		for dx = -1,1 do
		for dy = 1,3 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.dig_node(pos1)
				core.set_node(pos1, {name="default:cobble"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:stone_bomb 6",
	recipe = {
		{"default:stone", "nssm:black_powder", "default:stone"},
		{"nssm:black_powder", "nssm:black_powder", "nssm:black_powder"},
		{"default:stone", "nssm:black_powder", "default:stone"}
	}
})

nssm_register_throwitem("fire_ring", "Fire Ring Bomb", {
	hit_node = function(self, pos)
		for dx = -2,2 do
		for dy = 1,2 do
		for dz = -2,2 do
	local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
	if core.get_node(pos1).name == "air" and
	not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
		core.set_node(pos1, {name="fire:basic_flame"})
		for dx = -1,1 do
		for dy = 1,2 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			core.dig_node(pos1)
		end
		end
		end
	end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:fire_ring_bomb 3",
	recipe = {
		{"fire:flint_and_steel", "fire:flint_and_steel", "fire:flint_and_steel"},
		{"fire:flint_and_steel", "nssm:black_powder", "fire:flint_and_steel"},
		{"fire:flint_and_steel", "fire:flint_and_steel", "fire:flint_and_steel"}
	}
})

nssm_register_throwitem("cage", "Cage Bomb", {
	hit_node = function(self, pos)
		for dx = -2,2 do
		for dy = 0,3 do
		for dz = -2,2 do
	local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
	if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
		core.dig_node(pos1)
		core.set_node(pos1, {name="nssm:morentir"})
		for dx = -1,1 do
		for dy = 1,2 do
		for dz = -1,1 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			core.dig_node(pos1)
		end
		end
		end
	end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:cage_bomb 10",
	recipe = {
		{"nssm:lustful_soul_fragment", "nssm:black_powder", "nssm:lustful_soul_fragment"},
		{"nssm:black_powder", "nssm:lustful_soul_fragment", "nssm:black_powder"},
		{"nssm:lustful_soul_fragment", "nssm:black_powder", "nssm:lustful_soul_fragment"}
	}
})

nssm_register_throwitem("water_column", "Water Column Bomb", {
	hit_node = function(self, pos)
		for dx = 0,0 do
		for dy = 1,10 do
		for dz = 0,0 do
			local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if core.get_node(pos1).name == "air" and
			not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
				core.set_node(pos1, {name="default:water_source"})
			end
		end
		end
		end
	end
})

core.register_craft({
	output = "nssm:water_column_bomb 6",
	recipe = {
		{"group:salt_water_bucket", "nssm:black_powder", "group:salt_water_bucket"},
		{"group:salt_water_bucket", "nssm:black_powder", "group:salt_water_bucket"},
		{"group:salt_water_bucket", "nssm:black_powder", "group:salt_water_bucket"}
	},
	replacements = {
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "nssm:empty_evocation_bomb 10",
	recipe = {
		{"nssm:envious_soul_fragment", "nssm:black_powder", "nssm:envious_soul_fragment"},
		{"nssm:black_powder", "nssm:envious_soul_fragment", "nssm:black_powder"},
		{"nssm:envious_soul_fragment", "nssm:black_powder", "nssm:envious_soul_fragment"}
	}
})

local function nssm_register_throwegg(name, descr, def)

	core.register_craftitem("nssm:".. name .."_bomb", {
		description = descr,
		inventory_image = "evocation_bomb.png^".. name .."_egg.png",
		on_use = function(item, user, pointd)
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, "nssm:".. name .."_bomb_flying")
			obj:set_velocity({x=dir.x*15,y=dir.y*15,z=dir.z*15})
			obj:set_acceleration({x=0, y=-9.8, z=0})
			item:take_item()
			return item
		end
	})

	core.register_entity("nssm:".. name .."_bomb_flying", {
	initial_properties = {
		visual = "sprite",
		textures = {"evocation_bomb.png^".. name .."_egg.png"},
		physical = false,
	},
		on_step = function(self, dtime)
			local pos = self.object:get_pos()
			local n = core.get_node(pos).name

			if n ~= "air" then
				def.hit_node(self, pos, n)
				self.object:remove()
			end
		end
	})
end

local function nssm_register_evocation(evomob, evodescr, numbe)

nssm_register_throwegg(evomob, evodescr .." Bomb", {
	hit_node = function(self,pos)
		local pos1 = {x= pos.x, y= pos.y+ 1, z= pos.z}
		if not core.is_protected(pos1, "") or not core.get_item_group(core.get_node(pos1).name, "unbreakable") == 1 then
	for n= 1, numbe do
		core.add_entity(pos1, "nssm:".. evomob)
	end
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "nssm:".. evomob .."_bomb",
	recipe = {"nssm:empty_evocation_bomb", "nssm:".. evomob}
})
end

nssm_register_evocation("ant_worker", "Ant Worker Evocation", 4)

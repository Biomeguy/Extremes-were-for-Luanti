--Molotov Cocktail_[rev002]
--base code is from throwing enhanced and potions mods

local function nimbus(pos, radius)
	for dx=-radius,radius do
	for dy=radius,-radius,-1 do
	for dz=-radius,radius do
		local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
		local pa = {x=p.x, y=p.y+1, z=p.z}
		local n = core.get_node(p).name
		local na = core.get_node(pa).name
		if n ~= "air" and na == "air" then
			core.sound_play("more_fire_ignite", {pos = pos})
			core.set_node(pa, {name="fire:basic_flame"})
		end
	end
	end
	end
end

local function throw_cocktail(item, player)
	local pos = player:get_pos()
	local dir = player:get_look_dir()
	local obj = core.add_entity({x=pos.x, y=pos.y+1.625, z=pos.z}, "decor:molotov_entity")
	obj:set_velocity({x=dir.x*30, y=dir.y*30, z=dir.z*30})
	obj:set_acceleration({x=dir.x*-3, y=-dir.y^8*80-10, z=dir.z*-3})
	if not core.settings:get_bool("creative_mode") then
		item:take_item()
	end
	return item
end

local function napalm(pos)
	core.sound_play("more_fire_ignite", {pos= pos, gain=1.})
	core.set_node(pos, {name="fire:basic_flame"})

core.add_particlespawner({
	amount = 10,
	time = .2,
	minpos = vector.subtract(pos, 2.6),
	maxpos = vector.add(pos, 2.6),
	minvel = {x=-2, y=-2, z=-2},
	maxvel = {x=2, y=-4, z=2},
	minacc = {x=0, y=-4, z=0},
	exptime = {min = 1, max = 1.5},
	minsize = 1,
	maxsize = 2,
	texture = "more_fire_spark.png",
	glow = 14 })
core.add_particlespawner({
	amount = 10,
	time = .2,
	minpos = vector.subtract(pos, 2.6),
	maxpos = vector.add(pos, 2.6),
	minvel = {x=-1.25, y=-4, z=-1.25},
	maxvel = {x=1.25, y=-1.25, z=1.25},
	minacc = {x=1.25, y=-1.25, z=1.25},
	exptime = {min = 1, max = 1.5},
	minsize = 1,
	maxsize = 2,
	texture = "more_fire_spark.png",
	glow = 14 })
end

local function molotov_entity_on_step(self, dtime)
	local pos = self.object:get_pos()
	core.add_particlespawner({
		amount = 10,
		time = .5,
		minpos = vector.subtract(pos, .1),
		maxpos = vector.add(pos, .1),
		minvel = {x=-.2, y=0, z=-.2},
		maxvel = {x=.2, y=.4, z=.2},
		exptime = {min = .5, max = 1},
		minsize = .3,
		maxsize = .5,
		texture = "default_item_smoke.png"})
	core.add_particlespawner({
		amount = 99,
		time = .25,
		minpos = vector.subtract(pos, .1),
		maxpos = vector.add(pos, .1),
		minvel = {x=-.3, y=0, z=-.3},
		maxvel = {x=.3, y=.3, z=.3},
		minacc = {x=-.5, y=.2, z=-.5},
		maxacc = {x=.5, y=.5, z=.5},
		exptime = {min = .25, max = .5},
		minsize = .5,
		maxsize = .8,
		texture = "more_fire_spark.png",
		glow = 14 })
	self.timer = self.timer + dtime
	local node = core.get_node(pos)
	if self.timer> .2 then
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "decor:molotov_entity" and obj:get_luaentity().name ~= "__builtin:item" then
					if self.node ~= "" then
						core.sound_play("default_break_glass", {pos= pos, gain = 1., max_hear_distance = 20})
						nimbus(pos, 3)
					end
					self.object:remove()
				end
			else
				if self.node ~= "" then
					core.sound_play("default_break_glass", {pos= pos, gain = 1., max_hear_distance = 20})
					nimbus(pos, 2)
				end
				self.object:remove()
			end
		end
	end

	if self.lastpos.x~=nil then
		if node.name ~= "air" then
			if self.node ~= "" then
				core.sound_play("default_break_glass", {pos= pos, gain = 1., max_hear_distance = 20})
				nimbus(pos, 1)
			end
			self.object:remove()
			napalm(self.lastpos)
		end
	end
	self.lastpos={x=pos.x, y=pos.y, z=pos.z}
end

core.register_entity("decor:molotov_entity", {
initial_properties = {
	visual = "sprite",
	physical = false,
	textures = {"more_fire_molotov_cocktail.png"},
	collisionbox = {0,0,0,0,0,0},
},
	timer=0,
	lastpos={},
	on_step = molotov_entity_on_step,
})

core.register_craftitem("decor:molotov_cocktail", {
	description = "Molotov Cocktail",
	inventory_image = "more_fire_molotov_cocktail.png",
	on_place = throw_cocktail,
	on_use = throw_cocktail,
})

core.register_craft({
	output = "decor:molotov_cocktail 2",
	recipe = {
		{"farming:cotton"},
		{"default:oil_extract"},
		{"vessels:glass_bottle"}
	}
})

-- fuel recipes
core.register_craft({
	type = "fuel",
	recipe = "decor:molotov_cocktail",
	burntime = 5,
})


core.register_globalstep(function()
	for _,player in ipairs(core.get_connected_players()) do
		if player:get_wielded_item():get_name() == "mtools:climbing_gloves" then
	local pos = player:get_pos()
	local climbable = core.find_node_near(pos, 1, {"group:stone", "default:cave_ice", "default:ice"})
	if climbable and (core.get_node(pos).name == "air" or core.get_node(pos).name == "mtools:climbable") then
if not core.is_creative_enabled(player:get_player_name()) then
		local item = player:get_wielded_item()
		item:add_wear(5)
		player:set_wielded_item(item)
end
		core.set_node(pos, {name="mtools:climbable"})
		core.get_node_timer(pos):start(.3)
	end
	for i=1,2 do
		local oldcli = core.find_node_near(pos, 1, {"mtools:climbable"}, false)
		if oldcli then
			core.remove_node(oldcli)
		end
	end
		elseif player:get_wielded_item():get_name() == "mtools:lantern" and player:get_wielded_item():get_wear() < 65524 then
	local pos = player:get_pos()
	pos.y = pos.y+1
	if core.get_node(pos).name == "air" or core.get_node(pos).name == "mtools:light" then
if not core.is_creative_enabled(player:get_player_name()) then
		local item = player:get_wielded_item()
		item:add_wear(10)
		player:set_wielded_item(item)
end
		core.set_node(pos, {name="mtools:light"})
		core.get_node_timer(pos):start(.3)
	end
	for i=1,2 do
		local oldlight = core.find_node_near(pos, 1, {"mtools:light"}, false)
		if oldlight then
			core.remove_node(oldlight)
		end
	end
		end
	end
	--core.chat_send_all("blah")
end)

--player effects

playereffects.register_effect_type("pegasus_speed", "High speed 3", nil, {"speed"}, 
	function(player)
		player:set_physics_override({speed = 3})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end,
	false
)

playereffects.register_effect_type("roc_levitation", "Roc Light weight", nil, {"gravity"}, 
	function(player)
		player:set_physics_override({gravity = .1})
	end,
	
	function(effect, player)
		player:set_physics_override({gravity = 1})
	end,
	false
)


local lp = core.settings:get_bool("limit_particles")

core.register_entity("mtools:block_dummy", {
	initial_properties = {
visual = "mesh",
mesh = "node.b3d",
textures = {"mapgen_magnblock.png"},
physical = true,
collisionbox = {-.5, -.5, -.5, .5, .5, .5},
visual_size = {x=3.5, y=3.5}
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
		if self.ttl == nil then self.ttl = 1 end
		if self.node == nil then self.node = "air" end
	if self.age > self.ttl then
	local pos = self.object:get_pos()
	if core.get_node(pos).name == "air" then
		core.set_node(pos, {name=self.node})
	else
		core.add_item(pos, self.node)
	end
	self.object:remove() return end

		if self.particles and lp ~= true then
	local pos = self.object:get_pos()
	local vec = self.object:get_velocity()
	core.add_particlespawner({
		amount = 5,
		time = 1,
		minpos = {x=pos.x-.1, y=pos.y+.3, z=pos.z-.1},
		maxpos = {x=pos.x+.1, y=pos.y+.4, z=pos.z+.1},
		maxacc = {x=-vec.x,y=0,z=-vec.z},
		exptime = {min = .5, max = 1},
		minsize = 5,
		maxsize = 9,
		collisiondetection = true,
		texture = self.particletex
	})
		end
	end,
	on_punch = function(self, hitter)
if hitter:is_player() then
	local pos = self.object:get_pos()
	core.add_item(pos, self.node)
	self.object:remove()
end
	end
})

core.register_tool("mtools:magglv_n", {
	description = "Magnetic Glove (N)",
	inventory_image = "mtools_magglv_n.png",
	on_use = function(item, user, pointd)
		local ctrl = user:get_player_control()
		if ctrl.sneak then
		item:replace("mtools:magglv_s")
		else
	if pointd.type == "node" then
		local pos = pointd.under
		local dir = user:get_look_dir()
		if core.get_item_group(core.get_node(pos).name, "magnetic") ~= 0 and core.get_node_or_nil(pos) ~= nil then
	local node = core.get_node(pos).name
	core.remove_node(pos)
	local obj =  core.add_entity(pos, "mtools:block_dummy")
	obj:set_velocity({x=-dir.x*8, y=-dir.y*8, z=-dir.z*8})
	obj:set_acceleration({x=dir.x*2, y=dir.y*2, z=dir.z*2})
	--obj:set_velocity({x=-dir.x*8, y=-4, z=-dir.z*8})
	--obj:set_acceleration({x=dir.x*2, y=-5, z=dir.z*2})
	local block = obj:get_luaentity()
	block.ttl = .5
	block.node = node
		end
	end
		end
		return item
	end,
})

core.register_tool("mtools:magglv_s", {
	description = "Magnetic Glove (S)",
	inventory_image = "mtools_magglv_s.png",
	on_use = function(item, user, pointd)
		local ctrl = user:get_player_control()
		if ctrl.sneak then
		item:replace("mtools:magglv_n")
		else
	if pointd.type == "node" then
		local pos = pointd.under
		local dir = user:get_look_dir()
		if core.get_item_group(core.get_node(pos).name, "magnetic") ~= 0 and core.get_node_or_nil(pos) ~= nil then
	local node = core.get_node(pos).name
	core.remove_node(pos)
	local obj =  core.add_entity(pos, "mtools:block_dummy")
	obj:set_velocity({x=dir.x*8, y=dir.y*8, z=dir.z*8})
	obj:set_acceleration({x=-dir.x*2, y=-dir.y*2, z=-dir.z*2})
	--obj:set_velocity({x=dir.x*8, y=-4, z=dir.z*8})
	--obj:set_acceleration({x=-dir.x*2, y=-5, z=-dir.z*2})
	local block = obj:get_luaentity()
	block.ttl = .5
	block.node = node
		end
	end
		end
		return item
	end,
})

core.register_craftitem("mtools:heart", {
	description = "Health Heart",
	inventory_image = "mtools_heart.png",
	on_use = core.item_eat(5),
	groups = {flammable = 1},
	dropped_step = function(self, pos, dtime)
		local objs = core.get_objects_inside_radius(pos, .5)
		if not objs or #objs ~= 2 then return end

		for _, obj in pairs(objs) do
	if obj:is_player() and obj:get_hp() < 20 then
		obj:set_hp(obj:get_hp()+5)

		local own_stack = ItemStack(self.itemstring)
		if own_stack:get_count() == 1 then
			self.object:remove()
			return false
		else
			self.age = 0 -- Handle as new entity
			own_stack:set_count(own_stack:get_count()-1)
			self:set_item(own_stack)
		end
	end
		end
	end
})

core.register_craftitem("mtools:heart_energized", {
	description = "Energized Health Heart",
	inventory_image = "mtools_heart_ener.png",
	on_use = core.item_eat(20),
	groups = {flammable = 1},
	light_source = 14,
	dropped_step = function(self, pos, dtime)
		local objs = core.get_objects_inside_radius(pos, .5)
		if not objs or #objs ~= 2 then return end

		for _, obj in pairs(objs) do
	if obj:is_player() and obj:get_hp() < 20 then
		obj:set_hp(obj:get_hp()+20)

		local own_stack = ItemStack(self.itemstring)
		if own_stack:get_count() == 1 then
			self.object:remove()
			return false
		else
			self.age = 0 -- Handle as new entity
			own_stack:set_count(own_stack:get_count()-1)
			self:set_item(own_stack)
		end
	end
		end
	end
})

core.register_craftitem("mtools:magic_petals", {
	description = "Magic Petals",
	inventory_image = "magic_petals.png",
	groups = {flammable = 1}
})

core.register_craft({
	output = "mtools:magic_petals",
	recipe = {{"mapgen:magic_leaves"}},
	replacements = {{"mapgen:magic_leaves", "farming:spent_biomasse"}}
})

core.register_craftitem("mtools:magic_powder", {
	description = "Magic Powder",
	inventory_image = "mtools_powder.png",
	groups = {flammable = 1},
	on_use = function(item, user, pointd)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 5,
		time = .1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=2,z=-.5},
		maxacc = {x=.5,y=2,z=.5},
		exptime = {min = .5, max = 1},
		minsize = 8,
		maxsize = 10,
		texture = "mtools_powder4.png",
		glow = 9 })
		if user then
	return core.do_item_eat(0, "fabric:sheet_orange", item, user, pointd, true)
		end
	end,
})

core.register_craft({
	output = "mtools:magic_powder",
	recipe = {
		{"mtools:magic_petals", "mapgen:ice_shard", "mtools:magic_petals"},
		{"mtools:magic_petals", "mtools:magic_petals", "mtools:magic_petals"},
		{"", "fabric:sheet_orange",  ""}
	}
})

core.register_craftitem("mtools:triforce", {
	description = "Triforce",
	inventory_image = "mtools_triforce.png",
	light_source = 7,
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 6,
		time = .1,
		minpos = {x=pos.x-1, y=pos.y+.5, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y+1, z=pos.z+1},
		minacc = {x=-.5,y=2,z=-.5},
		maxacc = {x=.5,y=2,z=.5},
		exptime = {min = .5, max = 1},
		minsize = 1,
		maxsize = 2,
		texture = "brewing_magic_particle.png",
		glow = 9 })
		core.add_entity(pos, "extra_energy:orb"):get_luaentity().value = 5
	end
})

core.register_craftitem("mtools:triforce_shard", {
	description = "Triforce Shard",
	inventory_image = "mtools_triforce_shard.png",
	light_source = 7
})

core.register_craft({
	output = "mtools:triforce",
	recipe = {
		{"", "mtools:triforce_shard", ""},
		{"", "", ""},
		{"mtools:triforce_shard", "",  "mtools:triforce_shard"}
	}
})

core.register_craft({
	output = "mtools:triforce_shard",
	recipe = {
		{"", "default:mese", ""},
		{"", "", ""},
		{"default:mese", "",  "default:mese"}
	}
})

local function notes(pos)
core.add_particlespawner({
	amount = 5,
	time = .1,
	minpos = {x=pos.x-1, y=pos.y+1, z=pos.z-1},
	maxpos = {x=pos.x+1, y=pos.y+1, z=pos.z+1},
	minacc = {x=-.5,y=4,z=-.5},
	maxacc = {x=.5,y=4,z=.5},
	exptime = {min = .5, max = 1},
	minsize = 1,
	maxsize = 2,
	texture = "mtools_note.png"})
end

core.register_craftitem("mtools:ocarina", {
	description = "Ocarina",
	inventory_image = "mtools_ocarina.png",
	on_use = function(item, user)
		local pos = user:get_pos()
		core.sound_play("mtools_tune", {pos = pos, gain = .5, max_hear_distance = 15})
		notes(pos)
	end
})

core.register_craft({
	output = "mtools:ocarina",
	recipe = {
		{"", "dye:blue", ""},
		{"", "default:clay_lump", ""},
		{"default:clay_lump", "default:clay_lump",  "default:clay_lump"}
	}
})

core.register_craftitem("mtools:ocarina2", {
	description = "Red Ocarina",
	inventory_image = "mtools_ocarina_red.png",
	on_use = function(item, user)
if core.get_modpath("regional_weather") then
	climate_mod.forced_weather["regional_weather:rain"] = true
end
		local pos = user:get_pos()
		core.sound_play("mtools_trumpet", {pos = pos, gain = 2, max_hear_distance = 15})
		notes(pos)
	end
})

core.register_craft({
	output = "mtools:ocarina2",
	recipe = {
		{"", "", ""},
		{"", "dye:red", ""},
		{"", "mtools:ocarina",  ""}
	}
})

if core.get_modpath("mob_horse") then
core.register_craftitem("mtools:ocarina3", {
	description = "Yellow Ocarina",
	inventory_image = "mtools_ocarina_yellow.png",
	on_use = function(item, user)
		local pos = user:get_pos()
		core.sound_play("mtools_epona", {pos = pos, gain = .5, max_hear_distance = 15})
		notes(pos)
		local dir = user:get_look_dir()
		core.add_entity({x=pos.x+dir.x+2,y=pos.y+dir.y+1,z=pos.z+dir.z+2}, "mob_horse:horse")
	end
})

core.register_craft({
	output = "mtools:ocarina3",
	recipe = {
		{"", "", ""},
		{"", "dye:yellow", ""},
		{"", "mtools:ocarina",  ""}
	}
})
end

if core.get_modpath("mobs_loz") then
core.register_craftitem("mtools:ocarina4", {
	description = "Green Ocarina",
	inventory_image = "mtools_ocarina_green.png",
	on_use = function(item, user)
		local pos = user:get_pos()
		core.sound_play("mtools_forest", {pos = pos, gain = .5, max_hear_distance = 15})
		notes(pos)
		local dir = user:get_look_dir()
		core.add_entity({x=pos.x+dir.x+2,y=pos.y+dir.y+1,z=pos.z+dir.z+2}, "mobs_loz:business_scrub_passive")
	end
})

core.register_craft({
	output = "mtools:ocarina4",
	recipe = {
		{"", "", ""},
		{"", "dye:green", ""},
		{"", "mtools:ocarina",  ""}
	}
})
end

core.register_tool("mtools:lantern", {
	description = "Lantern",
	inventory_image = "mtools_lantern.png",
	light_source = 10,
	groups = {disable_repair = 1, not_repaired_by_anvil = 1},
	on_use = function(item, user, pointd)
		local name = user:get_player_name()
		if not core.is_protected(pointd.above, name) then
if item:get_wear() < 65434 then
	if pointd.type == "node" and core.get_node(pointd.above).name == "air" then
		core.set_node(pointd.above, {name="fire:basic_flame"})

		if not core.is_creative_enabled(name) then
			item:add_wear(100)
			return item
		end
	end
end
		else
			core.chat_send_player(name, "This area is protected.")
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "mtools:lantern",
	recipe = {"mtools:lantern", "default:oil_extract"},
	replacements = {{"default:oil_extract", "vessels:glass_bottle"}}
})

core.register_node("mtools:light", {
	drawtype = "airlike",
	light_source = 10,
	paramtype = "light",
	walkable = false,
	diggable = false,
	pointable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_blast = function() end,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_timer = function(pos)
		for i, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_wielded_item():get_name() == "mtools:lantern" then
		return true
	end
		end
		core.remove_node(pos)
	end,
})

core.register_tool("mtools:climbing_gloves", {
	description = "Climbing Gloves",
	inventory_image = "mtools_climbing_gloves.png"
})

core.register_craft({
	output = "mtools:climbing_gloves",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"mobs:leather", "",  "mobs:leather"}
	}
})

core.register_node("mtools:climbable", {
	drawtype = "airlike",
	paramtype = "light",
	walkable = false,
	diggable = false,
	climbable = true,
	pointable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_blast = function() end,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_timer = function(pos)
		for i, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_wielded_item():get_name() == "mtools:climbable" then
		return true
	end
		end
		core.remove_node(pos)
	end,
})

core.register_entity("mtools:spark", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_swdbeam.png"},
physical = false,
collisionbox = {0,0,0,0,0,0},
use_texture_alpha = true,
glow = 14
	},
	age = 0,
	on_step = function(self, dtime)
		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
			if obj:get_luaentity() ~= nil then
		local ent = obj:get_luaentity()
		if ent.type == "monster" then
			obj:punch(self.object, 1., {
				full_punch_interval=1.,
				damage_groups={fleshy=12},
			}, nil)
			self.object:remove()
			return
		end
			end
		end
		for k, obj in pairs(core.get_objects_inside_radius(pos, 15)) do
			if obj:get_luaentity() ~= nil then
		local ent = obj:get_luaentity()
		if ent.type == "monster" then
			local pos2 = obj:get_pos()
			local vec = {x=pos2.x-pos.x, y=pos2.y-pos.y, z=pos2.z-pos.z}
			vec.x = vec.x*2  vec.y = vec.y*2  vec.z = vec.z*2
			self.object:set_velocity(vec)
			self.age = 0
			return
		end
			end
		end
		self.age = self.age+dtime
		if self.age > 5 then
			self.object:remove()
		end
	end,
})

core.register_tool("mtools:medallion_ether", {
	description = "Ether Medallion",
	inventory_image = "mtools_medallion_ether.png",
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 100 then
		user:get_meta():set_int("_extra_energy", extra_energy - 100)
	elseif chi.subtract(name, 100) then
	else
		user:set_hp(0)
	end
		end
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 5,
		time = .5,
		pos = {x=pos.x, y=pos.y+3.8, z=pos.z},
		minvel = {x=0,y=-4,z=0},
		maxvel = {x=0,y=-4,z=0},
		minacc = {x=0,y=1,z=0},
		maxacc = {x=0,y=1,z=0},
		exptime = .5,
		size = 30,
		vertical = true,
		texture = "mtools_lightning.png^[transformFX^mtools_lightning.png",
		glow = 12 })

		--objects
		core.after(1, function()
		core.sound_play("thunder", {pos = pos, gain = .4, max_hear_distance = 2*64})
		local obj = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local vec = {x=6,y=0,z=6}
		local vec2 = {x=6,y=0,z=-6}
		local vec3 = {x=-6,y=0,z=6}
		obj:set_velocity(vec)
		obj2:set_velocity(vec2)
		obj3:set_velocity(vec3)

		local obj = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local vec4 = {x=-6,y=0,z=-6}
		obj:set_velocity(vec4)
		obj2:set_velocity(vec2)
		obj3:set_velocity(vec3)

		local obj = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		obj:set_velocity(vec2)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec4)

		local obj = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		obj:set_velocity(vec3)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec4)

		local obj = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local vec = {x=-6,y=0,z=0}
		obj:set_velocity(vec)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec)

		local obj = core.add_entity({x=pos.x,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local vec = {x=0,y=0,z=6}
		obj:set_velocity(vec)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec)

		local obj = core.add_entity({x=pos.x,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x-1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local vec = {x=0,y=0,z=-6}
		obj:set_velocity(vec)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec)

		local obj = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z}, "mtools:spark")
		local obj2 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z+1}, "mtools:spark")
		local obj3 = core.add_entity({x=pos.x+1,y=pos.y+1,z=pos.z-1}, "mtools:spark")
		local vec = {x=6,y=0,z=0}
		obj:set_velocity(vec)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec)
		end)
	end,
})

core.register_craft({
	output = "mtools:medallion_ether",
	recipe = {
		{"", "default:copper_ingot", ""},
		{"default:copper_ingot", "mtools:magic_powder", "default:copper_ingot"},
		{"", "default:copper_ingot", ""}
	},
	replacements = {{"mtools:magic_powder", "fabric:sheet_orange"}}
})


core.register_entity("mtools:stone", {
	initial_properties = {
visual = "cube",
textures = {"default_stone.png", "default_stone.png^[colorize:black:50", "default_stone.png^[colorize:black:10", "default_stone.png^[colorize:black:10", "default_stone.png^[colorize:black:20", "default_stone.png^[colorize:black:20"},
physical = true
	},
	on_activate = function(self)
		core.after(5, function()
			local pos = self.object:get_pos()
			if pos ~= nil then
		if core.get_node(pos).name == "air" or core.get_item_group(core.get_node(pos).name, "water") > 0 then
			core.set_node(pos, {name="default:stone"})
		else
			core.add_item(pos, "default:stone")
		end
			end
			self.object:remove()
		end)
	end,
	on_step = function(self, dtime)
		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:stone" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
					obj:punch(self.object, 1., {
						full_punch_interval=1.,
						damage_groups={fleshy=12},
					}, nil)
				self.object:remove()
end
			end
		end
	end,
})

core.register_tool("mtools:medallion_quake", {
	description = "Quake Medallion",
	inventory_image = "mtools_medallion_quake.png",
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 100 then
		user:get_meta():set_int("_extra_energy", extra_energy - 100)
	elseif chi.subtract(name, 100) then
	else
		user:set_hp(0)
	end
		end
		local pos = user:get_pos()
		core.sound_play("earthquake", {pos = pos, gain = .5, max_hear_distance = 32})
	core.add_particlespawner({
		amount = 24,
		time = 2.4,
		minpos = {x=pos.x-4, y=pos.y+.8, z=pos.z-4},
		maxpos = {x=pos.x+4, y=pos.y+1, z=pos.z+4},
		minvel = {x=-1,y=1,z=-1},
		maxvel = {x=1,y=4,z=1},
		minacc = {x=0,y=1,z=0},
		maxacc = {x=0,y=1,z=0},
		exptime = {min = .5, max = .7},
		minsize = 9,
		maxsize = 12,
		texture = "mtools_lightning2.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .2},
		glow = 9
	})
	core.add_particlespawner({
		amount = 24,
		time = 2.4,
		minpos = {x=pos.x-4, y=pos.y+.8, z=pos.z-4},
		maxpos = {x=pos.x+4, y=pos.y+1, z=pos.z+4},
		minvel = {x=-1,y=1,z=-1},
		maxvel = {x=1,y=4,z=1},
		minacc = {x=0,y=1,z=0},
		maxacc = {x=0,y=1,z=0},
		exptime = {min = .5, max = .7},
		minsize = 9,
		maxsize = 12,
		texture = "mtools_lightning2.png^[transformFX",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .2},
		glow = 9
	})

		for i=1,20 do
	core.after(i*.5, function()
	local obj = core.add_entity({x=pos.x+math.random(-5,5),y=pos.y+5,z=pos.z+math.random(-5,5)}, "mtools:stone")
	local vec = {x=0,y=-13,z=0}
	obj:set_velocity(vec)
	local obj = core.add_entity({x=pos.x+math.random(-5,5),y=pos.y+6,z=pos.z+math.random(-5,5)}, "mtools:stone")
	obj:set_velocity(vec)
	local obj = core.add_entity({x=pos.x+math.random(-5,5),y=pos.y+7,z=pos.z+math.random(-5,5)}, "mtools:stone")
	obj:set_velocity(vec)
	end)
		end
	end,
})

core.register_craft({
	output = "mtools:medallion_quake",
	recipe = {
		{"", "default:lava_source", ""},
		{"default:lava_source", "mtools:magic_powder", "default:lava_source"},
		{"", "default:lava_source", ""}
	},
	replacements = {{"mtools:magic_powder", "fabric:sheet_orange"}}
})

core.register_entity("mtools:swdspark", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_swdbeam.png"},
physical = false,
collisionbox = {0,0,0,0,0,0},
glow = 14
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		local vel = self.object:get_velocity()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:swdspark" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:remove()
end
			end
		end
		if lp ~= true then
		core.add_particle({
			pos = pos,
			velocity = {x=-vel.x/2, y=-vel.y/2, z=-vel.z/2},
			acceleration = {x=0, y=0, z=0},
			expirationtime = .1,
			size = 8,
			texture = "mtools_swdbeam.png",
			glow = 9 })
		end
	end,
})

core.register_tool("mtools:sword", {
	description = "Master Sword",
	inventory_image = "mtools_mastersword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:swdspark")
		obj:set_velocity({x=dir.x*7,y=dir.y*7,z=dir.z*7})
	end,
})

core.register_craftitem("mtools:crest", {
	description = "Hylian Crest",
	inventory_image = "mtools_hylian_crest.png",
})

core.register_entity("mtools:swdspark_light", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_swdbeam_light.png"},
physical = false,
collisionbox = {0,0,0,0,0,0},
glow = 14
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		local vel = self.object:get_velocity()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:swdspark_light" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=6},
						}, nil)
					self.object:remove()
end
			end
		end
		if lp ~= true then
		core.add_particle({
			pos = pos,
			velocity = {x=-vel.x/2, y=-vel.y/2, z=-vel.z/2},
			acceleration = {x=0, y=0, z=0},
			expirationtime = .1,
			size = 8,
			texture = "mtools_swdbeam_light.png",
			glow = 9 })
		end
	end,
})

core.register_tool("mtools:sword_mese", {
	description = "Master Sword Mese",
	inventory_image = "mtools_mastersword_mese.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 8 then
		user:get_meta():set_int("_extra_energy", extra_energy - 8)
	elseif chi.subtract(name, 8) then
	else
		user:set_hp(user:get_hp()-2)
	end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:swdspark_light")
		obj:set_velocity({x=dir.x*6,y=dir.y*6,z=dir.z*6})
	end,
})

core.register_craft({
	output = "mtools:sword",
	recipe = {
		{"", "mtools:crest", ""},
		{"mapgen:earthstone", "default:sword_steel", "mapgen:firestone"},
		{"", "mapgen:waterstone", ""}
	}
})

core.register_craft({
	output = "mtools:sword_mese",
	recipe = {
		{"", "mtools:crest", ""},
		{"mapgen:earthstone", "default:sword_mese", "mapgen:firestone"},
		{"", "mapgen:waterstone", ""}
	}
})

core.register_tool("mtools:flame_rod", {
	description = "Flame Rod",
	inventory_image = "mtools_flamerod.png",
	light_source = 14,
	liquids_pointable = true,
	groups = {disable_repair = 1, not_repaired_by_anvil = 1},
	on_use = function(item, user)
		local wear = math.ceil(65535 / 300)
		local max_wear = 299 * wear
	if item:get_wear() < max_wear then
	local name = user:get_player_name()
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 36 then
		user:get_meta():set_int("_extra_energy", extra_energy - 36)
	elseif chi.subtract(name, 36) then
	else
		user:set_hp(user:get_hp()-8)
	end
		end
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:fireball")
	local obj2 = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:fireball")
	local obj3 = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:fireball")
	local obj4 = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:fireball")
	obj:set_velocity({x=dir.x*9,y=dir.y*9.5,z=dir.z*9})
	obj2:set_velocity({x=dir.x*9.5,y=dir.y*9,z=dir.z*9.5})
	obj3:set_velocity({x=dir.x*8.5,y=dir.y*9,z=dir.z*8.5})
	obj4:set_velocity({x=dir.x*9,y=dir.y*8.5,z=dir.z*9})
	core.sound_play("flamearrow", {pos=pos, gain=.7, max_hear_distance=15})
		if not core.is_creative_enabled(name) then
			item:add_wear(wear)
		end
	end
		return item
	end,
	on_place = function(item, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, item, pointd) or item
		end

	if node.name == "default:lava_source" and item:get_wear() > 41111 then
		item:replace("mtools:flame_rod")
	end
		return item
	end,
})

core.register_craftitem("mtools:seed_satchel", {
	description = "Seed Bag (empty)",
	inventory_image = "hyruletools_seedbag.png",
	groups = {flammable = 1}
})

core.register_craft({
	output = "mtools:seed_satchel",
	recipe = {
		{"", "default:paper", ""},
		{"default:paper", "", "default:paper"},
		{"", "default:paper", ""},
	}
})

core.register_craftitem("mtools:seed_fire", {
	description = "Seed Bag (Ember)",
	inventory_image = "hyruletools_seedbag_red.png",
	groups = {flammable = 1},
	on_use = function(item, user, pointd)
		local pos = pointd.above
		local name = user:get_player_name()
		if pointd.type == "node" and core.get_node(pos).name == "air" then
			if not core.is_protected(pos, name) then
	core.set_node(pos, {name="fire:basic_flame"})
	local pos2 = user:get_pos()
	local dir = user:get_look_dir()
core.add_particle({
	pos = {x=pos2.x, y=pos2.y+1.5, z=pos2.z},
	velocity = {x=dir.x*9, y=dir.y*9, z=dir.z*9},
	acceleration = {x=0, y=-6, z=0},
	size = 6,
	collisiondetection = true,
	collision_removal = true,
	texture = "embers.png",
	glow = 9 })

	item:take_item()	return item
			else
				core.chat_send_player(name, "This area is protected.")
			end
		end
	end
})

core.register_craftitem("mtools:seed_mystery", {
	description = "Seed Bag (Mystery)",
	inventory_image = "hyruletools_seedbag_green.png",
	groups = {flammable = 1},
	on_use = function(item, user, pointd)
		local name = user:get_player_name()
		if pointd.type == "node" and core.get_node(pointd.above).name == "air" then
			if not core.is_protected(pointd.above, name) then
		if math.random(1, 3) == 1 then
			core.set_node(pointd.above, {name="default:stone"})
		else
			if math.random(1, 3) == 2 then
				core.set_node(pointd.above, {name="default:ice"})
			else
				if math.random(1, 3) == 1 then
					core.set_node(pointd.above, {name="fire:basic_flame"})
				end
			end
		end
			else
				core.chat_send_player(name, "This area is protected.")
			end
		end

		item:take_item()
	return item
	end
})

core.register_craftitem("mtools:seed_gasha", {
	description = "Seed Bag (Gasha)",
	inventory_image = "hyruletools_seedbag_blue.png",
	groups = {flammable = 1},
	on_use = function(item, user, pointd)
		local name = user:get_player_name()
		if pointd.type == "node" and core.get_node(pointd.above).name == "air" then
			if not core.is_protected(pointd.above, name) then
				core.set_node(pointd.above, {name="default:sapling"})
			else
				core.chat_send_player(name, "This area is protected.")
			end
		end

		item:take_item()
	return item
	end
})

core.register_craftitem("mtools:seed_scent", {
	description = "Seed Bag (Scent)",
	inventory_image = "hyruletools_seedbag_orange.png",
	groups = {flammable = 1},
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		core.add_entity({x=pos.x+3+dir.x,y=pos.y+3+dir.y,z=pos.z+3+dir.z}, "mobs_loz:deku_baba")
		item:take_item()
		return item
	end
})

core.register_craftitem("mtools:seed_pegasus", {
	description = "Seed Bag (Pegasus)",
	inventory_image = "hyruletools_seedbag_green2.png",
	groups = {flammable = 1},
	on_use = function(item, user)
		playereffects.apply_effect_type("pegasus_speed", 5, user)
		item:take_item()
		return item
	end
})

core.register_craftitem("mtools:rocfeather", {
	description = "Roc's feather",
	inventory_image = "mtools_feather.png",
	groups = {flammable = 1},
	on_use = function(item, user)
		playereffects.apply_effect_type("roc_levitation", 20, user)
		item:take_item()
		return item
	end
})

core.register_craftitem("mtools:seed_gale", {
	description = "Seed Bag (Gale) (Particle tester, rightclick for next one)",
	inventory_image = "hyruletools_seedbag_cyan.png",
	groups = {flammable = 1},
	on_use = function(item, user)
		local pos = user:get_pos()	pos.z=pos.z+2
		local partype = item:get_meta():get_int("particle_type")
		local title = "Yellow star burst"
	if partype == 0 then
core.add_particlespawner({
	amount = 99,
	time = 5,
	minpos = {x=pos.x-.2, y=pos.y+.1, z=pos.z-.2},
	maxpos = {x=pos.x+.2, y=pos.y+.5, z=pos.z+.2},
	minvel = {x=-1, y=2, z=-1},
	maxvel = {x=1, y=4, z=1},
	minacc = {x=0, y=-7, z=0},
	maxacc = {x=0, y=-7, z=0},
	exptime = {min = 1, max = 2},
	minsize = 1,
	maxsize = 2,
	texture = "mtools_yellowstar.png",
	glow = 11
})
	elseif partype == 1 then	title = "Rising fire embers (Useless because fire burns completely & over shines these)"
core.add_particlespawner({
	amount = 11,
	time = 9,
	minpos = {x=pos.x-.3, y=pos.y+.5, z=pos.z-.3},
	maxpos = {x=pos.x+.3, y=pos.y+.5, z=pos.z+.3},
	minvel = {x=0, y=.3, z=0},
	maxvel = {x=0, y=.7, z=0},
	minacc = {x=0, y=.1, z=0},
	maxacc = {x=0, y=.2, z=0},
	minexptime = 1,
	maxexptime = 2,
	minsize = .1,
	maxsize = .5,
	collisiondetection = true,
	texture = "lava_particle.png^[colorize:red:".. math.random(1,100),
	glow = 11
})
	elseif partype == 2 then	title = "Smoke"
core.add_particlespawner({
	amount = 99,
	time = 9,
	minpos = {x=pos.x-.2, y=pos.y+.3, z=pos.z-.2},
	maxpos = {x=pos.x+.2, y=pos.y+1.3, z=pos.z+.2},
	minacc = {x=-.5,y=.6,z=-.5},
	maxacc = {x=.5,y=.8,z=.5},
	exptime = {min = 1, max = 1.5},
	minsize = 3,
	maxsize = 4,
	collisiondetection = true,
	texture = "mtools_smoke_particle.png"})
	elseif partype == 3 then	title = "Bomb fizz"
core.add_particlespawner({
	amount = 191,
	time = 9,
	minpos = {x=pos.x, y=pos.y+.4, z=pos.z},
	maxpos = {x=pos.x, y=pos.y+.5, z=pos.z},
	minvel = {x=-1, y=-.5, z=-1},
	maxvel = {x=1, y=1, z=1},
	exptime = {min = .5, max = 1},
	minsize = 1,
	maxsize = 2,
	collisiondetection = true,
	texture = "mtools_yellowstar.png",
	glow = 11
})
	elseif partype == 4 then	title = "Ball explosion"
core.add_particlespawner({
	amount = 30,
	time =.05,
	pos = pos,
	minvel = {x=-5, y=0, z=-5},
	maxvel = {x=5, y=5, z=5},
	minacc = {x=0, y=-8, z=0},
	maxacc = {x=0, y=-10, z=0},
	bounce = {min = .3, max = 1},
	exptime = {min = 1, max = 2},
	minsize = 2,
	maxsize = 4,
	collisiondetection = true,
	texture = "hot_orb.png",
	glow = 12
})
	elseif partype == 5 then	title = "Up and down"
core.add_particlespawner({
	amount = 99,
	time = 9,
	minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
	maxpos = {x=pos.x+1, y=pos.y+3, z=pos.z+1},
	minvel = {x=0, y=-1, z=0},
	maxvel = {x=0, y=1, z=0},
	minacc = {x=0, y=-1, z=0},
	maxacc = {x=0, y=1, z=0},
	exptime = 1,
	minsize = .5,
	maxsize = 1,
	texture = "gold_orb.png",
	glow = 12
})
	elseif partype == 6 then	title = "Slime spluch"
core.add_particlespawner({
	amount = 15,
	time =.1,
	pos = pos,
	minvel = {x=-2, y=-2, z=-2},
	maxvel = {x=2, y=2, z=2},
	minacc = {x=0, y=-8, z=0},
	maxacc = {x=0, y=-10, z=0},
	exptime = {min = 1, max = 2},
	minsize = .1,
	maxsize = 3,
	texture =  "default_dirt.png^[colorize:#00aa00aa",
	collisiondetection = true,
})
	elseif partype == 7 then	title = "Big flakes"
core.add_particlespawner({
	amount = 99,
	time = 9,
	minpos = {x=pos.x-.3, y=pos.y-.1, z=pos.z-.3},
	maxpos = {x=pos.x+.3, y=pos.y+.1, z=pos.z+.3},
	minvel = {x=-.1, y=-.4, z=-.1},
	maxvel = {x=.1, y=-.4, z=.1},
	minacc = {x=-.1, y=-.5, z=-.1},
	maxacc = {x=.1, y=-.5, z=.1},
	exptime = {min = 3, max = 7},
	minsize = .5,
	maxsize = 1,
	collisiondetection = true,
	texture = "big_flake_1.png",
})
core.add_particlespawner({
	amount = 99,
	time = 9,
	minpos = {x=pos.x-.3, y=pos.y-.1, z=pos.z-.3},
	maxpos = {x=pos.x+.3, y=pos.y+.1, z=pos.z+.3},
	minvel = {x=-.1, y=-.4, z=-.1},
	maxvel = {x=.1, y=-.4, z=.1},
	minacc = {x=-.1, y=-.5, z=-.1},
	maxacc = {x=.1, y=-.5, z=.1},
	exptime = {min = 3, max = 7},
	minsize = .5,
	maxsize = 1,
	collisiondetection = true,
	texture = "big_flake_2.png",
})
	elseif partype == 8 then	title = "Blue glow"
core.add_particle({
	pos = {x=pos.x, y=pos.y+.1, z=pos.z},
	expirationtime = 9,
	size = 30,
	texture = "glowing_blue.png",
	animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = .7},
	glow = 14
})
	elseif partype == 9 then	title = "Red glow"
core.add_particle({
	pos = {x=pos.x, y=pos.y+.1, z=pos.z},
	expirationtime = 9,
	size = 30,
	texture = "glowing_red.png",
	animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = .7},
	glow = 14
})
	end
	core.chat_send_player(user:get_player_name(), "Spawning "..title)
--		item:take_item()
		return item
	end,
	on_secondary_use = function(item, user)
		local name = user:get_player_name()
		local partype = item:get_meta():get_int("particle_type")
		if partype < 9 then
	item:get_meta():set_int("particle_type", partype+1)
	core.chat_send_player(name, "Particle tester is set to "..partype+1)
		else
	item:get_meta():set_int("particle_type", 0)
	core.chat_send_player(name, "Particle tester is set to 0")
		end
		return item
	end,
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user, item, pointd)
			end
		end

		local name = user:get_player_name()
		local partype = item:get_meta():get_int("particle_type")
		if partype < 9 then
	item:get_meta():set_int("particle_type", partype+1)
	core.chat_send_player(name, "Particle tester is set to "..partype+1)
		else
	item:get_meta():set_int("particle_type", 0)
	core.chat_send_player(name, "Particle tester is set to 0")
		end
		return item
	end
})

core.register_craft({
	output = "mtools:seed_mystery",
	recipe = {
		{"", "", ""},
		{"", "flowers:waterlily", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_craft({
	output = "mtools:seed_fire",
	recipe = {
		{"", "", ""},
		{"", "flowers:flame_lily", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_craft({
	output = "mtools:seed_gasha",
	recipe = {
		{"", "", ""},
		{"", "flowers:geranium", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_craft({
	output = "mtools:seed_gale",
	recipe = {
		{"", "", ""},
		{"", "flowers:tulip", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_craft({
	output = "mtools:seed_pegasus",
	recipe = {
		{"", "", ""},
		{"", "flowers:viola", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_craft({
	output = "mtools:seed_scent",
	recipe = {
		{"", "", ""},
		{"", "flowers:dandelion", ""},
		{"", "mtools:seed_satchel", ""}
	}
})

core.register_entity("mtools:boomer", {
	initial_properties = {
visual = "mesh",
mesh = "boomerang.b3d",
physical = false,
textures = {"mtools_boomerang_tex.png"},
collisionbox = {0,0,0,0,0,0}
	},
	age = 0,
	on_activate = function(self)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		core.after(1.5, function()
			if self.thrower ~= nil then
			local pos2 = self.object:get_pos()
			local pos1 = self.thrower:get_pos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:set_velocity(vec)
			end
			end
		end)
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:boomer" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=1},
					}, nil)
					self.object:remove()
end
			end
		end
	end,
})

core.register_tool("mtools:boomerang", {
	description = "Boomerang",
	inventory_image = "mtools_boomer.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		core.after(3, function()
	local pos = user:get_pos()
	core.add_item(pos, "mtools:boomerang")
		end)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:boomer")
		local vec = {x=dir.x*8,y=dir.y*8,z=dir.z*8}
		obj:set_velocity(vec)
		--obj:set_acceleration({x=dir.x*-6,y=dir.y*-6,z=dir.z*-6})
		obj:get_luaentity().thrower = user
	core.sound_play("throw", {pos = pos, max_hear_distance = 9})
		item:take_item()
		return item
	end,
})

core.register_entity("mtools:sboomer", {
	initial_properties = {
visual = "mesh",
mesh = "boomerang.b3d",
physical = false,
textures = {"mtools_boomerang_tex2.png"},
collisionbox = {0,0,0,0,0,0}
	},
	age = 0,
	on_activate = function(self)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		core.after(2.6, function()
			if self.thrower ~= nil then
			self.returning = true
			local pos2 = self.object:get_pos()
			local pos1 = self.thrower:get_pos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:set_velocity(vec)
			end
			end
		end)
if lp ~= true then
	core.add_particlespawner({
		amount = 32,
		time = 0,
		pos = 0,
		minacc = {x=0,y=-.7,z=0},
		maxacc = {x=0,y=.7,z=0},
		attached = self.object,
		exptime = {min = .5, max = 1},
		minsize = .5,
		maxsize = 1,
		texture = "mtools_star.png",
		glow = 9 }) end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 4 then self.object:remove() return end

		if self.thrower ~= nil and not self.returning then
		local dir = self.thrower:get_look_dir()
		local vec = {x=dir.x*5,y=dir.y*5,z=dir.z*5}
		local yaw = self.thrower:get_look_horizontal()
		self.object:set_yaw(yaw+math.pi/2)
		self.object:set_velocity(vec)
		end
		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:sboomer" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=2},
					}, nil)
					self.object:remove()
end
			end
		end
	end,
})

core.register_tool("mtools:boomerang_steel", {
	description = "Magic Boomerang",
	inventory_image = "mtools_boomer_steel.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		core.after(4, function()
	local pos = user:get_pos()
	core.add_item(pos, "mtools:boomerang_steel")
		end)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:sboomer")
		local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
		obj:set_velocity(vec)
		--obj:set_acceleration({x=dir.x*-6,y=dir.y*-6,z=dir.z*-6})
		obj:get_luaentity().thrower = user
	core.sound_play("throw", {pos = pos, max_hear_distance = 9})
		item:take_item()
		return item
	end,
})

core.register_entity("mtools:gboomer", {
	initial_properties = {
visual = "mesh",
mesh = "boomerang.b3d",
physical = false,
textures = {"mtools_boomerang_tex3.png"},
collisionbox = {0,0,0,0,0,0}
	},
	on_activate = function(self)		
		core.after(3, function() 
		self.object:remove()
		if self.thrower ~= nil then
		local pos3 = self.thrower:get_pos()
		local obj2 = core.add_entity(pos3, "__builtin:item")
			obj2:get_luaentity():set_item(self.item)
		end
		end)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		core.after(1.5, function()
			if self.thrower ~= nil then
			local pos2 = self.object:get_pos()
			local pos1 = self.thrower:get_pos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:set_velocity(vec)
			end
			end
		end)
if lp ~= true then
	core.add_particlespawner({
		amount = 22,
		time = 0,
		pos = {min = {x=-.1, y=-.1, z=-.1}, max = {x=.1, y=.1, z=.1}},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		attached = self.object,
		exptime = {min = .2, max = .5},
		minsize = .5,
		maxsize = 1,
		texture = "mtools_wind.png"}) end
	end,
	on_step = function(self, dtime)
		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
				if obj:get_luaentity().name ~= "mtools:gboomer" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=1},
					}, nil)
					self.object:remove()
				elseif obj:get_luaentity().name == "__builtin:item" then
					self.item = obj:get_luaentity().itemstring
					obj:remove()
					self.object:remove()
				end
			end
		end
	end,
})

core.register_tool("mtools:gboomerang", {
	description = "Gale Boomerang",
	inventory_image = "mtools_boomer_gale.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 15 then
		user:get_meta():set_int("_extra_energy", extra_energy - 15)
	elseif chi.subtract(name, 15) then
	else
		user:set_hp(user:get_hp()-3)
	end
		end
		core.after(3, function()
	local pos = user:get_pos()
	core.add_item(pos, "mtools:gboomerang")
		end)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:gboomer")
		local vec = {x=dir.x*8,y=dir.y*8,z=dir.z*8}
		obj:set_velocity(vec)
		--obj:set_acceleration({x=dir.x*-6,y=dir.y*-6,z=dir.z*-6})
		obj:get_luaentity().thrower = user
	core.sound_play("throw", {pos = pos, max_hear_distance = 9})
		item:take_item()
		return item
	end,
})

core.register_craft({
	output = "mtools:boomerang",
	recipe = {
		{"", "", "default:diamond"},
		{"", "default:diamond", "default:diamond"}
	}
})

core.register_craft({
	output = "mtools:boomerang_steel",
	recipe = {
		{"", "mtools:magic_powder", "default:steel_ingot"},
		{"", "default:steel_ingot", "default:steel_ingot"}
	},
	replacements = {{"mtools:magic_powder", "fabric:sheet_orange"}}
})

core.register_tool("mtools:frost_wand", {
	description = "Frost Wand",
	inventory_image = "mtools_frost_wand.png",
	on_use = function(item, user, pointd)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 10 then
		user:get_meta():set_int("_extra_energy", extra_energy - 10)
	elseif chi.subtract(name, 10) then
	else
		user:set_hp(user:get_hp()-2)
	end
		end
		-- Freeze Effects
		if pointd.type == "object" and not pointd.ref:is_player() and pointd.ref:get_hp() > 2 then
			local to_freeze = pointd.ref
			local pos = to_freeze:get_pos()
			freeze_entity = core.add_entity(pos, "mtools:freeze_entity")
			brewing.magic_aura(user, user:get_pos(), "player", "freeze")
			to_freeze:set_attach(freeze_entity, "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
			local dest = ""
			if user:is_player() then
				dest = "to_player"
			else
				dest = "entity"
			end
			brewing.magic_sound(dest, pointd, "brewing_freeze")
			core.after(brewing.settings.freeze_time, function() --Unfreeze after x seconds
				freeze_entity:remove()
				brewing.magic_sound(dest, pointd, "brewing_locksbreak")
				if to_freeze then
					to_freeze:set_detach()
					local entity_hp = to_freeze:get_hp()
					local new_hp = entity_hp - brewing.settings.freeze_hit_points
					to_freeze:set_hp(new_hp)
				end
			end)
			return
		elseif pointd.type == "node" then
			local node_above = core.get_node(pointd.above)			
			local node_above_name = node_above.name		
			local pos_above = core.get_pointed_thing_position(pointd, node_above)
			if core.registered_nodes[node_above_name].groups.water then
				core.set_node(pos_above, {name = "default:ice"})
				brewing.magic_sound(dest, pointd, "brewing_freeze")
				return
			end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x, y=pos.y+dir.y+1.5, z=pos.z+dir.z}, "mtools:block_dummy")
		obj:set_velocity({x=dir.x*8, y=dir.y*8, z=dir.z*8})
		obj:set_properties({textures = {"default_snow.png"}, pointable = false})
		obj:set_acceleration({x=-dir.x*2, y=-8, z=-dir.z*2})
		local block = obj:get_luaentity()
		block.node = "default:snow_block"
	if lp ~= true then
		block.particles = true
		block.particletex = "mtools_frost_effect.png" end
	end
})

core.register_craft({
	output = "mtools:frost_wand",
	recipe = {
		{"default:crystal_ingot"},
		{"mapgen:ice_shard"},
		{"mapgen:ice_shard"}
	}
})

core.register_entity("mtools:goddess_cloud", {
	initial_properties = {
visual = "sprite",
textures = {"blank.png"},
physical = false,
visual_size = {x= 0, y= 0},
collisionbox = {0,0,0,0,0,0}
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
		local pos = self.object:get_pos()
	if self.age > 11 then
		local poslist = core.find_nodes_in_area({x= pos.x+ 5, y= pos.y+ 1, z= pos.z+ 5}, {x= pos.x- 5, y= pos.y- 12, z= pos.z- 5},
	{"nssm:dead_dirt", "default:dry_shrub", "nssm:dead_leaves", "default:dirt_with_short_grass", "default:dry_dirt", "default:dry_clay_dirt", "group:trunk"})
for _,H in pairs(poslist) do
	local meta = core.get_meta(H)
	local resu = meta:get_string("death_of")
	local node = core.get_node(H).name
	if core.registered_nodes[resu] then
		node = resu
	elseif node == "default:dirt_with_short_grass" then
		node = "default:dirt_with_grass"
	elseif node == "default:dry_dirt" then
		node = "default:dirt"
	elseif node == "default:dry_clay_dirt" or node == "nssm:dead_dirt" then
		node = "default:clay_dirt"
	end
	swap_preserved(H, node)
	core.get_node_timer(H):start(10)
end
self.object:remove()	return end
	if self.age > 8 then
		local posfire = core.find_nodes_in_area({x= pos.x+ 5, y= pos.y+ 1, z= pos.z+ 5}, {x= pos.x- 5, y= pos.y- 12, z= pos.z- 5},
	{"fire:basic_flame", "fire:permanent_flame", "fire:firemite_flame"})
for _,F in pairs(posfire) do
	core.remove_node(F)
end end
	if self.age > 6 then
core.add_particlespawner({
	amount = 19,
	time = 7,
	minpos = {x=pos.x-5.5, y=pos.y-.1, z=pos.z-5.5},
	maxpos = {x=pos.x+5.5, y=pos.y+.1, z=pos.z+5.5},
	minvel = {x=-.1, y=-3, z=-.1},
	maxvel = {x=.1, y=-4, z=.1},
	exptime = {min = 3, max = 3.5},
	minsize = .7,
	maxsize = 1,
	vertical = true,
	texture = "goddess_rain.png"}) end
	if self.age > 2 then
core.add_particlespawner({
	amount = 9,
	time = .1,
	minpos = vector.subtract(pos, .2),
	maxpos = vector.add(pos, .2),
	minvel = {x=-1, y=-.1, z=-1},
	maxvel = {x=1, y=.3, z=1},
	exptime = {min = 5, max = 9},
	minsize = 9,
	maxsize = 11,
	collisiondetection = true,
	texture = "goddess_cloud.png"}) end
	end,
})

core.register_tool("mtools:watering_can", {
	description = "Goddess Watering Can",
	inventory_image = "mtools_watering_can.png",
	range = 5,
	liquids_pointable = true,
	groups = {disable_repair = 1, not_repaired_by_anvil = 1},
	on_use = function(item, user, pointd)
	if pointd.type ~= "node" or not user then return end
		local wear = math.ceil(65535 / 64)
		local max_wear = 63 * wear
	if item:get_wear() < max_wear then
		local pos = pointd.under
		local pname = user:get_player_name()
 if not core.is_protected(pos, pname) then
	local pos2 = user:get_pos()
	local dir = user:get_look_dir()
	core.add_particle({
		pos = {x=pos2.x, y=pos2.y+1.5, z=pos2.z},
		velocity = {x=dir.x*9, y=dir.y*9, z=dir.z*9},
		acceleration = {x=0, y=-7, z=0},
		size = 7,
		collisiondetection = true,
		collision_removal = true,
		texture = "mtools_water_splash.png"})

	local node = core.get_node(pos)
	local meta = core.get_meta(pos)
	local above = {x= pos.x, y= pos.y +1, z= pos.z}
	local below = {x= pos.x, y= pos.y -1, z= pos.z}
	local plant = 0
	if core.get_item_group(node.name, "flora") > 0 then
		meta:set_int("light_level", 4)
		core.after(9, function() flowers.flower_spread(pos, node) end) plant = 2
	elseif core.get_item_group(node.name, "sapling") > 0 or
	core.get_item_group(node.name, "sapling2") > 0 or core.get_item_group(node.name, "water_flora") > 0 then
		meta:set_int("light_level", 4)
		core.get_node_timer(pos):start(9) plant = 2
	elseif (core.get_item_group(node.name, "plant") > 0 and core.registered_nodes[node.name].next_plant) or
	core.get_item_group(node.name, "seed") > 0 or node.name == "default:poison_ivy_1" or node.name == "default:poison_ivy_2" then
		meta:set_int("light_level", 4)
		meta:set_int("soil_need", 1)
		core.get_node_timer(pos):start(9) plant = 2
	elseif node.name == "default:dry_dirt" or node.name == "ethereal:dry_dirt_with_fiery_grass" then
		core.set_node(pos, {name="default:dirt"})
		pos = above plant = 1
	elseif node.name == "default:dry_clay_dirt" then
		core.set_node(pos, {name="default:clay_dirt"})
		pos = above plant = 1
	elseif node.name == "default:dirt_with_short_grass" then
		meta:set_int("light_level", 4)
		core.get_node_timer(pos):start(9)
		pos = above plant = 2
	elseif core.get_item_group(node.name, "igniter") > 0 then
		core.add_entity({x= pos.x, y= pos.y+ 6, z= pos.z}, "mtools:goddess_cloud")	wear = max_wear
core.add_particlespawner({
	amount = 15,
	time = .1,
	minpos = {x=pos.x-.4, y=pos.y-.4, z=pos.z-.4},
	maxpos = {x=pos.x+.4, y=pos.y+.5, z=pos.z+.4},
	minvel = {x=-.2, y=2.6, z=-.2},
	maxvel = {x=.2, y=2.8, z=.2},
	exptime = {min = 2, max = 2.5},
	minsize = 7,
	maxsize = 9,
	collisiondetection = true,
	texture = "goddess_cloud.png"})
	end
	local nbelow = core.get_node(below)
	if nbelow.name == "default:dry_dirt" or nbelow.name == "ethereal:dry_dirt_with_fiery_grass" then
		core.set_node(below, {name="default:dirt"}) plant = 1
	elseif nbelow.name == "default:dry_clay_dirt" then
		core.set_node(below, {name="default:clay_dirt"}) plant = 1
	elseif nbelow.name == "default:dirt_with_short_grass" then
		core.get_meta(below):set_int("light_level", 4)
		core.get_node_timer(below):start(9) plant = 2
	end

if lp ~= true then
	if plant > 0 then
core.after(1, function()
	core.add_particlespawner({
		amount = 96,
		time = 8,
		minpos = {x=pos.x-.5, y=pos.y-.5, z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y-.4, z=pos.z+.5},
		minvel = {x=-.1, y=.5, z=-.1},
		maxvel = {x=.1, y=1, z=.1},
		exptime = {min = .5, max = .7},
		minsize = .2,
		maxsize = .5,
		texture = "mtools_goddess_magic_effect.png",
		glow = 13 })
	end) end
	if plant == 2 then
core.after(5, function()
	core.add_particlespawner({
		amount = 85,
		time = 5,
		minpos = {x=pos.x-.5, y=pos.y-.5, z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y-.4, z=pos.z+.5},
		minvel = {x=-.1, y=.5, z=-.1},
		maxvel = {x=.1, y=1, z=.1},
		exptime = {min = .5, max = .7},
		minsize = .2,
		maxsize = .5,
		texture = "mtools_goddess_magic_effect.png",
		glow = 13 })
	end) end end
	if not core.is_creative_enabled(pname) then
		item:add_wear(wear)
	end
 else
	core.chat_send_player(pname, "This area is protected")
	core.record_protection_violation(pos, pname)
 end
	end
	return item
	end,
	on_place = function(item, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, item, pointd) or item
		end

	local inv = placer:get_inventory()
	local essen = inv:get_stack("main", placer:get_wield_index()+1)
	if node.name == "default:water_source" and item:get_wear() > 41111 and essen:get_name() == "mtools:goddess_essence" then
	local name = placer:get_player_name()
if not core.is_creative_enabled(name) then
	inv:set_stack("main", placer:get_wield_index()+1, essen:get_name().." "..essen:get_count()-1)
	core.remove_node(under)
end
		item:replace("mtools:watering_can")
	end
		return item
	end,
})

core.register_craft({
	output = "mtools:watering_can",
	recipe = {
		{"default:brass_ingot", "group:salt_water_bucket", "mtools:goddess_essence"},
		{"", "default:tin_ingot", "default:brass_ingot"},
		{"", "default:tin_ingot", ""}
	},
	replacements = {
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

core.register_entity("mtools:thrown_sword", {
	initial_properties = {
physical = false,
visual = "wielditem",
textures = {""},
collisionbox = {0,0,0,0,0,0},
visual_size = {x = .4, y = .4},
glow = 13
	},
	sword = "",
	thrower = "",
	age = 0,
	drop = false,
get_staticdata = function(self) return core.serialize({sword = self.sword, thrower = self.thrower}) end,
on_activate = function(self, staticdata)
	self.object:set_armor_groups({immortal = 1})
	if not staticdata or staticdata == "" then return end
	local data = core.deserialize(staticdata)
	if not data then return end

	self.sword = data.sword
	self.thrower = data.thrower
	self.object:set_properties({
		textures = {ItemStack(self.sword):get_name()},
		wield_item = ItemStack(self.sword):to_string(),
	})
end,
drop_sword = function(self, pos)
	local swodro = core.add_item(pos, self.sword)
	if swodro then
	swodro:get_luaentity().dropped_by = self.thrower
	self.object:remove() end
end,
on_step = function(self, dtime)
	self.age = self.age+dtime
	local pos = self.object:get_pos()
	pos = vector.round(pos)
if self.age > 2 then
core.chat_send_player(self.thrower, "Sword dropping at ".. core.pos_to_string(pos))
self:drop_sword(pos) return end

for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_hp() > 0 and obj:get_player_name() ~= self.thrower then
		local vel = self.object:get_velocity()
		obj:punch(self.object, .6, {
			full_punch_interval=.6,
			damage_groups={fleshy=math.random(6,10), choppy=math.random(4,6)},
		}, {x=vel.x/99, y=vel.y/99, z=vel.z/99})  self.drop = true
	elseif obj:get_luaentity() ~= nil then
		local ent = obj:get_luaentity()
		if ent.type == "monster" or ent.name == "tsm_pyramids:mummy" then
			local vel = self.object:get_velocity()
			obj:punch(self.object, .6, {
				full_punch_interval=.6,
				damage_groups={fleshy=math.random(6,10), choppy=math.random(4,6)},
			}, {x=vel.x/99, y=vel.y/99, z=vel.z/99})  self.drop = true
		elseif ent.name == "es:bullet" or ent.name == "mobs:bonebullet" or ent.name == "es:lasershot" or
			ent.name == "mobs_monster:mese_arrow" or ent.name == "awesome_monsters:star" or
			ent.name == "mobs_monster:fireball" or ent.name == "mobs_monster:obsidian_arrow" or ent.name == "mobs_loz:fire" then
			obj:remove()
		end
	end
end

	local nn = core.get_node(pos).name
	if nn ~= "air" and core.get_item_group(nn, "water") == 0 and
	nn ~= "doors:hidden" and core.registered_nodes[nn].walkable then
		if nn == "ignore" then
	pos = core.find_node_near(pos, 5, {"air", "group:water"})
		end
		self.drop = true
	end

	if self.drop then
		self:drop_sword(pos)
	end
end
})

core.register_tool("mtools:sword_goddess1", {
	description = "Goddess Sword 1",
	inventory_image = "mtools_goddess_sword.png",
	tool_capabilities = {
		full_punch_interval = .8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[2]=.5, [3]=.1}, uses=125, maxlevel=1},
		},
		damage_groups = {fleshy=6, choppy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	light_source = 11,
	groups = {sword = 1},
	dropped_step = function(self, pos, dtime)
		if self.dropped_by and self.dropped_by ~= "" and self.itemstring ~= "" then
	-- Return to dropper or follow
	local player = core.get_player_by_name(self.dropped_by)
for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_hp() > 0 and obj:get_player_name() == self.dropped_by then
local inv = player:get_inventory()
if inv:room_for_item("main", self.itemstring) then
	inv:add_item("main", self.itemstring)
	self.itemstring = ""
	self.object:remove()
	return false
end
	end
end
	local p = player:get_pos()
	local horp = player:get_look_horizontal()-1.5

	p.y = p.y + .5
	p.x = p.x-math.cos(horp)/2.5
	p.z = p.z-math.sin(horp)/2.5
	local m = 7

	self.age = 0
	self:disable_physics()
	self.object:set_velocity({x=-(pos.x-p.x)*m, y=-(pos.y-p.y)*m, z=-(pos.z-p.z)*m})
if lp ~= true then
	core.add_particlespawner({
		amount = 2,
		time = .3,
		pos = {min = {x=-.15, y=-.2, z=-.15}, max = {x=.15, y=.1, z=.15}},
		attached = self.object,
		exptime = {min = .1, max = .3},
		minsize = 2,
		maxsize = 4,
		texture = "mtools_goddess_aura.png",
		glow = 9 }) end
		else
			self.object:remove()
		end
	end,
	on_secondary_use = function(item, user)-- or on_drop
		local pos = user:get_pos()
		local yaw = user:get_look_horizontal()
		local pitch = user:get_look_vertical()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x= pos.x, y= pos.y+ 1.5, z= pos.z}, "mtools:thrown_sword")
	obj:set_velocity({x= dir.x *32, y= dir.y *32, z= dir.z *32})
	local thrown = obj:get_luaentity()
	if not core.is_creative_enabled(user:get_player_name()) then
		item:add_wear(99) end
	local stack = ItemStack(item)
	thrown.sword = stack:to_string()
	thrown.thrower = user:get_player_name()
	obj:set_rotation({x= -1.5708-pitch, y= yaw, z= -.7854})
	obj:set_properties({
		textures = {stack:get_name()},
		wield_item = stack:to_string(),
	})
		item:take_item()
		return item
	end
})

core.register_craft({
	output = "mtools:sword_goddess1",
	recipe = {
		{"mapgen:waterstone", "mtools:goddess_essence"},
		{"default:sword_silver", ""}
	}
})

core.register_tool("mtools:sword_goddess2", {
	description = "Goddess Sword 2",
	inventory_image = "mtools_goddess_sword2.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=2,
		groupcaps={
			snappy={times={[2]=.3, [3]=.09}, uses=150, maxlevel=2},
		},
		damage_groups = {fleshy=8, choppy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	light_source = 14,
	groups = {sword = 1},
	dropped_step = function(self, pos, dtime)
		if self.dropped_by and self.dropped_by ~= "" and self.itemstring ~= "" then
	-- Return to dropper or follow
	local player = core.get_player_by_name(self.dropped_by)
for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_hp() > 0 and obj:get_player_name() == self.dropped_by then
local inv = player:get_inventory()
if inv:room_for_item("main", self.itemstring) then
	inv:add_item("main", self.itemstring)
	self.itemstring = ""
	self.object:remove()
	return false
end
	end
end
	local p = player:get_pos()
	local horp = player:get_look_horizontal()-1.5

	p.y = p.y + .5
	p.x = p.x-math.cos(horp)/2.5
	p.z = p.z-math.sin(horp)/2.5
	local m = 7

	self.age = 0
	self:disable_physics()
	self.object:set_velocity({x=-(pos.x-p.x)*m, y=-(pos.y-p.y)*m, z=-(pos.z-p.z)*m})
if lp ~= true then
	core.add_particlespawner({
		amount = 2,
		time = .3,
		pos = {min = {x=-.15, y=-.2, z=-.15}, max = {x=.15, y=.1, z=.15}},
		attached = self.object,
		exptime = {min = .1, max = .3},
		minsize = 2,
		maxsize = 4,
		texture = "mtools_goddess_aura.png",
		glow = 9 }) end
		else
			self.object:remove()
		end
	end,
	on_secondary_use = function(item, user)
		local pos = user:get_pos()
		local yaw = user:get_look_horizontal()
		local pitch = user:get_look_vertical()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x= pos.x, y= pos.y+ 1.5, z= pos.z}, "mtools:thrown_sword")
	obj:set_velocity({x= dir.x *32, y= dir.y *32, z= dir.z *32})
	local thrown = obj:get_luaentity()
	if not core.is_creative_enabled(user:get_player_name()) then
		item:add_wear(99) end
	local stack = ItemStack(item)
	thrown.sword = stack:to_string()
	thrown.thrower = user:get_player_name()
	obj:set_rotation({x= -1.5708-pitch, y= yaw, z= -.7854})
	obj:set_properties({
		textures = {stack:get_name()},
		wield_item = stack:to_string(),
	})
		item:take_item()
		return item
	end
})

core.register_craft({
	output = "mtools:sword_goddess2",
	recipe = {
		{"mtools:goddess_essence"},
		{"mtools:sword_goddess1"}
	}
})

core.register_tool("mtools:sword_goddess3", {
	description = "Goddess Sword 3",
	inventory_image = "mtools_goddess_sword3.png",
	tool_capabilities = {
		full_punch_interval = .4,
		max_drop_level=3,
		groupcaps={
			snappy={times={[2]=.1, [3]=.07}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=10, choppy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	light_source = 9,
	groups = {sword = 1},
	dropped_step = function(self, pos, dtime)
		if self.dropped_by and self.dropped_by ~= "" and self.itemstring ~= "" then
	-- Return to dropper or follow
	local player = core.get_player_by_name(self.dropped_by)
for _,obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() and obj:get_hp() > 0 and obj:get_player_name() == self.dropped_by then
local inv = player:get_inventory()
if inv:room_for_item("main", self.itemstring) then
	inv:add_item("main", self.itemstring)
	self.itemstring = ""
	self.object:remove()
	return false
end
	end
end
	local p = player:get_pos()
	local horp = player:get_look_horizontal()-1.5

	p.y = p.y + .5
	p.x = p.x-math.cos(horp)/2.5
	p.z = p.z-math.sin(horp)/2.5
	local m = 7

	self.age = 0
	self:disable_physics()
	self.object:set_velocity({x=-(pos.x-p.x)*m, y=-(pos.y-p.y)*m, z=-(pos.z-p.z)*m})
if lp ~= true then
	core.add_particlespawner({
		amount = 2,
		time = .3,
		pos = {min = {x=-.15, y=-.2, z=-.15}, max = {x=.15, y=.1, z=.15}},
		attached = self.object,
		exptime = {min = .1, max = .3},
		minsize = 2,
		maxsize = 4,
		texture = "mtools_goddess_aura.png",
		glow = 9 }) end
		else
			self.object:remove()
		end
	end,
	on_secondary_use = function(item, user)
		local pos = user:get_pos()
		local yaw = user:get_look_horizontal()
		local pitch = user:get_look_vertical()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x= pos.x, y= pos.y+ 1.5, z= pos.z}, "mtools:thrown_sword")
	obj:set_velocity({x= dir.x *32, y= dir.y *32, z= dir.z *32})
	local thrown = obj:get_luaentity()
	if not core.is_creative_enabled(user:get_player_name()) then
		item:add_wear(99) end
	local stack = ItemStack(item)
	thrown.sword = stack:to_string()
	thrown.thrower = user:get_player_name()
	obj:set_rotation({x= -1.5708-pitch, y= yaw, z= -.7854})
	obj:set_properties({
		textures = {stack:get_name()},
		wield_item = stack:to_string(),
	})
		item:take_item()
		return item
	end
})

core.register_craft({
	output = "mtools:sword_goddess3",
	recipe = {
		{"mtools:crest"},
		{"mtools:sword_goddess2"}
	}
})

core.register_craftitem("mtools:goddess_essence", {
	description = "Goddess Essence",
	inventory_image = "mtools_goddess_essence.png",
	light_source = 14,
	dropped_step = function(self, pos, dtime)
		local objs = core.get_objects_inside_radius(pos, .8)
		if not objs or #objs >= 4 then return end

		local ent = nil
		for _, obj in pairs(objs) do
	ent = obj:get_luaentity()
	if ent and ent.name == "__builtin:item" then
		local ent_stack = ItemStack(ent.itemstring)
		if ent_stack:get_name() == "mtools:heart" then
	core.add_item(obj:get_pos(), "mtools:heart_energized")
	if ent_stack:get_count() == 1 then
		obj:remove()
	else
		ent.age = 0 -- Handle as new entity
		ent_stack:set_count(ent_stack:get_count()-1)
		ent:set_item(ent_stack)
	end

	local own_stack = ItemStack(self.itemstring)
	if own_stack:get_count() == 1 then
		self.object:remove()
		return false
	else
		self.age = 0 -- Handle as new entity
		own_stack:set_count(own_stack:get_count()-1)
		self:set_item(own_stack)
	end
		end
	end
		end
	end
})

core.override_item("default:papyrus", {on_punch = function(pos, node, puncher)
	if puncher:get_wielded_item():get_name() == "default:ocealite_crystal" then
		core.add_item(pos, "mtools:goddess_essence")
	end
end})

core.register_tool("mtools:sword_diamite_crystal", {
	description = "Diamite Crystal Sword",
	inventory_image = "mtools_sword_diamite_crystal.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = .7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2., [2]=1., [3]=.3}, uses=37, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_break_glass"},
	light_source = 11,
	groups = {sword = 1}
})

core.register_craft({
	output = "mtools:sword_diamite_crystal",
	recipe = {
		{"", "", "default:glass"},
		{"", "default:diamite_dust", ""},
		{"default:steel_ingot", "", ""}
	}
})

core.register_entity("mtools:swedgespark", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_goddess_dust.png"},
physical = false,
visual_size = {x= .5, y= .5},
collisionbox = {0,0,0,0,0,0},
glow = 14
	},
	age = 0,
	on_activate = function(self)
if lp ~= true then
	core.add_particlespawner({
		amount = 77,
		time = 0,
		pos = {min = {x=-.2, y=-.2, z=-.2}, max = {x=.2, y=.2, z=.2}},
		minvel = {x=-.5, y=-.5, z=-.5},
		maxvel = {x=.5, y=.5, z=.5},
		attached = self.object,
		exptime = {min = .1, max = .5},
		minsize = 2,
		maxsize = 3,
		collisiondetection = true,
		texture = "mtools_goddess_dust.png",
		glow = 11 }) end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
if obj:get_luaentity().name ~= "mtools:swedgespark" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= "extra_energy:orb" then
						obj:punch(self.object, .1, {
							full_punch_interval=.1,
							damage_groups={fleshy=7},
						}, nil)
					self.object:remove()
end
			end
		end
	end,
})

core.register_tool("mtools:sword_swedge_diamite_crystal", {
	description = "Sweeping Edge Diamite Crystal Sword",
	inventory_image = "mtools_sword_swedge_diamite_crystal.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	light_source = 14,
	on_use = function(item, user)
		for i=1,5 do
	core.after(i*.1, function(user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:swedgespark")
		obj:set_velocity({x=dir.x*5,y=dir.y*5,z=dir.z*5})
	end, user)
		end
		if not core.is_creative_enabled(user:get_player_name()) then
			item:add_wear(50)
	if item:get_count() == 0 then
core.sound_play("default_break_glass", {pos=pos, gain=.5}, true) end
		end
		return item
	end
})

core.register_craft({
	output = "mtools:sword_swedge_diamite_crystal",
	recipe = {
		{"mtools:goddess_essence"},
		{"mtools:sword_diamite_crystal"}
	}
})

core.register_tool("mtools:lava_dagger", {
	description = "Lava Dagger",
	inventory_image = "lava_dagger.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=1,
		groupcaps={
			fleshy = {times={[2]=.7, [3]=.3}, uses=90, maxlevel=3},
			snappy = {times={[2]=.7, [3]=.3}, uses=90, maxlevel=3},
		},
		damage_groups = {fleshy=8, fire = 1, ice = 1},
		cook_dug = true,
	},
	groups = {dagger = 1},
	light_source = 14
})

core.register_craft({
	output = "mtools:lava_dagger",
	recipe = {
		{"mobs:lava_orb"},
		{"default:sword_stone"}
	}
})

core.register_tool("mtools:snatcher", {
	description = "Snatcher",
	inventory_image = "tutorial_snatcher.png",
	wield_image = "tutorial_snatcher.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	range = 10,
	tool_capabilities = {},
})

core.register_craft({
	output = "mtools:snatcher",
	recipe = {
		{"", "", "group:stick"},
		{"", "default:wood", "fabric:string"},
		{"default:wood", "fabric:string", ""}
	}
})

if lp ~= true then
core.register_abm({
	label = "Twinkly cold",
	nodenames = {"default:crystal_spike", "ecology:arctic_carrot"},
	neighbors = {"default:ice_block", "default:silver_sand", "gems:quarloy_pot"},
	interval = 16,
	chance = 5,
	action = function(pos, node)
		local under = {x= pos.x, y= pos.y- 1, z= pos.z}
		local chek_under = core.get_node_or_nil(under)
	if not chek_under then
		return
	end
local top = .4
if node.name == "default:crystal_spike" and chek_under.name == "default:ice_block" or
	node.name == "ecology:arctic_carrot" and chek_under.name == "default:silver_sand" or chek_under.name == "gems:quarloy_pot" then
if node.name == "ecology:arctic_carrot" then top = .2 end
core.add_particlespawner({
	amount = math.random(9,19),
	time = 17,
	minpos = {x=pos.x-.3, y=pos.y-.4, z=pos.z-.3},
	maxpos = {x=pos.x+.3, y=pos.y+top, z=pos.z+.3},
	exptime = {min = .5, max = .7},
	minsize = .8,
	maxsize = 3,
	texture = "twinkle_ice.png",
	animation = {type = "vertical_frames", aspect_w = 17, aspect_h = 17, length = -1},
	glow = 13 })
end
	end
})
end

-- I don"t know about these \\\
core.register_tool("mtools:big_iron_battleaxe", {
	description = "Big Iron Battleaxe",
	inventory_image = "tools_big_iron_battleaxe.png",
	wield_scale = {x=2, y=2, z=1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=5, choppy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:big_iron_battleaxe",
	recipe = {
		{"", "", "default:wrought_iron_block"},
		{"", "group:stick", ""},
		{"group:stick", "", ""}
	}
})

core.register_tool("mtools:mace_iron", {
	description = "Iron Mace",
	inventory_image = "tools_mace_iron.png",
	wield_scale = {x=2, y=2, z=2},
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:mace_iron",
	recipe = {{"mtools:big_iron_battleaxe"}}
})

core.register_tool("mtools:mace_steel", {
	description = "Steel Mace",
	inventory_image = "tools_mace_steel.png",
	wield_scale = {x=2, y=2, z=2},
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:mace_steel",
	recipe = {{"mtools:mace_iron"}}
})

core.register_tool("mtools:staff_steel", {
	description = "Steel Staff",
	inventory_image = "tools_staff_steel.png",
	wield_scale = {x=2, y=2, z=1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:staff_steel",
	recipe = {{"mtools:mace_steel"}}
})

core.register_tool("mtools:spear_diamond", {
	description = "Diamond Spear",
	inventory_image = "tools_diamondspear.png",
	wield_scale = {x=2, y=2, z=1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=5, choppy=1},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	output = "mtools:spear_diamond",
	recipe = {{"mtools:staff_steel"}}
})

core.register_tool("mtools:sword_big_obsidian", {
	description = "Big Obsidian Sword",
	inventory_image = "tools_sword_obsidian.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=6, choppy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	type = "shapeless",
	output = "mtools:sword_big_obsidian",
	recipe = {"mtools:sword_diamite_crystal", "mtools:potion_ggreen"},
	replacements = {{"mtools:potion_ggreen", "vessels:glass_bottle"}}
})

core.register_tool("mtools:sword_big_obsidian_complete", {
	description = "Big Obsidian Sword Complete",
	inventory_image = "tools_sword_obsidian_complete.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=.4}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=7, choppy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_craft({
	type = "shapeless",
	output = "mtools:sword_big_obsidian_complete",
	recipe = {"mtools:sword_big_obsidian", "mtools:potion_redbrown"},
	replacements = {{"mtools:potion_redbrown", "vessels:glass_bottle"}}
})

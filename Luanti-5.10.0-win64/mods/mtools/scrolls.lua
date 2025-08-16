
-- Scrolls
core.register_craftitem("mtools:scroll_day", {
	description = "Scroll of day",
	inventory_image = "mtools_scroll.png^mtools_sun_over.png",
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 150 then
		user:get_meta():set_int("_extra_energy", extra_energy - 150)
	elseif chi.subtract(name, 150) then
	else
		user:set_hp(0)
	end
		end
		core.set_timeofday(.23)
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_night "..item:get_count())
		return item
	end
})

core.register_craftitem("mtools:scroll_night", {
	description = "Scroll of night",
	inventory_image = "mtools_scroll.png^mtools_moon_over.png",
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 150 then
		user:get_meta():set_int("_extra_energy", extra_energy - 150)
	elseif chi.subtract(name, 150) then
	else
		user:set_hp(0)
	end
		end
		core.set_timeofday(.81)
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_darkness "..item:get_count())
		return item
	end
})

core.register_craftitem("mtools:scroll_darkness", {
	description = "Scroll of darkness",
	inventory_image = "mtools_scroll.png^mtools_dark_over.png",
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
		local pos = user:get_pos()
		core.add_particlespawner({
			amount = 2000,
			time = 1,
			minpos = {x=pos.x-20, y=pos.y-3, z=pos.z-20},
			maxpos = {x=pos.x+20, y=pos.y+3, z=pos.z+20},
			minacc = {x=-.1,y=0,z=-.1},
			maxacc = {x=.1,y=0,z=.1},
			exptime = {min = 5, max = 10},
			minsize = 10,
			maxsize = 20,
			texture = "witchcraft_pot_bottom.png^[colorize:black:200"
		})
		local mtime = core.get_timeofday()
		if mtime >= .25 and mtime <= .75 then
			user:override_day_night_ratio(0)
			core.after(10, function()
			user:override_day_night_ratio(nil)
			end)
		end
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_fireball "..item:get_count())
		return item
	end
})

core.register_craftitem("mtools:scroll_fireball", {
	description = "Scroll of fireball",
	inventory_image = "mtools_scroll.png^mtools_fire_over.png",
	on_use = function(item, user)
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
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:fireball")
		obj:set_velocity({x=dir.x*7,y=dir.y*7,z=dir.z*7})
	end,
	on_secondary_use = function(item)
if core.get_modpath("lightning") then
	item:replace("mtools:scroll_lightning "..item:get_count())
else
	item:replace("mtools:scroll_icicle "..item:get_count())
end
		return item
	end
})

if core.get_modpath("lightning") then
core.register_craftitem("mtools:scroll_lightning", {
	description = "Scroll of lightning",
	inventory_image = "mtools_scroll.png^mtools_thunder_over.png",
	on_use = function(item, user)
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
		local pos = user:get_pos()
		local dir = user:get_look_dir()
	core.add_particlespawner({
		amount = 6,
		time = .3,
		minpos = {x=pos.x-.3, y=pos.y, z=pos.z-.3},
		maxpos = {x=pos.x+.3, y=pos.y+2, z=pos.z+.3},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		exptime = {min = 1, max = 2},
		minsize = 2,
		maxsize = 3,
		texture = "mtools_zap.png",
		glow = 7
	})
		lightning.strike({x=pos.x+dir.x*2,y=pos.y+dir.y,z=pos.z+dir.z*2}, true)
		lightning.strike({x=pos.x+math.random(-6,6), y=pos.y, z=pos.z+math.random(-6,6)}, true)
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_icicle "..item:get_count())
		return item
	end
})
end

core.register_craftitem("mtools:scroll_icicle", {
	description = "Scroll of icicle",
	inventory_image = "mtools_scroll.png^mtools_ice_over.png",
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 30 then
		user:get_meta():set_int("_extra_energy", extra_energy - 30)
	elseif chi.subtract(name, 30) then
	else
		user:set_hp(user:get_hp()-6)
	end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local vec = {x=dir.x*7,y=dir.y*7,z=dir.z*7}
		local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+dir.z*1.5}, "mtools:ice")
		local obj2 = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+1+dir.z*1.5}, "mtools:ice")
		local obj3 = core.add_entity({x=pos.x+1+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+dir.z*1.5}, "mtools:ice")
		obj:set_velocity(vec)
		obj2:set_velocity(vec)
		obj3:set_velocity(vec)
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_nature "..item:get_count())
		return item
	end
})

core.register_craftitem("mtools:scroll_nature", {
	description = "Scroll of nature",
	inventory_image = "mtools_scroll.png^mtools_leaf_over.png",
	on_use = function(item, user)
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
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:nature")
		obj:set_velocity({x=dir.x*6,y=dir.y*6,z=dir.z*6})
	end,
	on_secondary_use = function(item)
		item:replace("mtools:scroll_day "..item:get_count())
		return item
	end
})

core.register_craftitem("mtools:scroll", {
	description = "Scroll",
	inventory_image = "mtools_scroll.png",
})

core.register_chatcommand("mtools_write_your_spells", {
	description = "Writes all available spells to your scroll using black dye to the right if any.",
	privs = {interact=true},
	func = function(name)
		local wielder = core.get_player_by_name(name)

		local scroll = wielder:get_wielded_item()
		if scroll:get_name() ~= "mtools:scroll" or scroll:get_count() > 1 then
			return false, "You must be holding a scroll."
		end

		local rightitem = wielder:get_inventory():get_stack("main", wielder:get_wield_index()+1)
		if rightitem:get_name() ~= "dye:black" then
			return false, "There must be a black dye to the right."
		end

	if not core.is_creative_enabled(name) then
		wielder:get_inventory():set_stack("main", wielder:get_wield_index()+1, rightitem:get_name().." "..rightitem:get_count()-1)
	end
		wielder:set_wielded_item("mtools:scroll_day")

		return true
	end
})

core.register_craftitem("mtools:scroll_recipes", {
	description = "Scroll of potion recipes",
	inventory_image = "mtools_scroll.png^mtools_writing_over.png",
	on_use = function(_, user)
		core.show_formspec(user:get_player_name(), "mtools:potion_recipes", "size[11,11]background[-2,-2.4;14.96,15.96;mtools_scroll.png]"..
"label[1,.65;"..core.colorize("#000", "Source mod by color ")..core.colorize("#006c08", "ecology ")..core.colorize("#ff00ff", "mtools ")..
	core.colorize("#0000ff", "default ")..core.colorize("#ff0000", "flowers ")..core.colorize("#a51", "mapgen").."]"..
"label[1,1.2;"..core.colorize("#006c08", "mandragora  ")..core.colorize("#ff0000", "waterlily  ")..core.colorize("#0000ff", "bulrush_2 ")..core.colorize("#000", "= Watery Potion").."]"..
"label[1,1.6;"..core.colorize("#006c08", "mandragora  gliophorus_viridis  laurel ")..core.colorize("#000", "= Superliser Potion").."]"..
"label[1,2;"..core.colorize("#0000ff", "aspen_sapling  ")..core.colorize("#006c08", "mushroom_shiitake  ")..core.colorize("#0000ff", "copper_ingot ")..core.colorize("#000", "= Volatile Potion").."]"..
"label[1,2.4;"..core.colorize("#006c08", "mandragora  grass  yellow_weed ")..core.colorize("#000", "= Shiny Potion").."]"..
"label[1,2.8;"..core.colorize("#006c08", "creeper  long_grass_dark  bush ")..core.colorize("#000", "= Darkness Potion").."]"..
"label[1,3.2;"..core.colorize("#a51", "crystal_shard  ")..core.colorize("#006c08", "lucky_club  pale_green_berries ")..core.colorize("#000", "= Light Potion").."]"..
"label[1,3.6;"..core.colorize("#0000ff", "ocealite_crystal  ")..core.colorize("#006c08", "sproutling_grass  ")..core.colorize("#0000ff", "seagrass_green ")..core.colorize("#000", "= Air Potion").."]"..
"label[1,4;"..core.colorize("#006c08", "mandragora  curlyfruit  ")..core.colorize("#ff00ff", "herb ")..core.colorize("#000", "= Dragon Potion").."]"..
"label[1,4.4;"..core.colorize("#006c08", "mandragora  ")..core.colorize("#000", "tnt:gunpowder  ")..core.colorize("#ff00ff", "herb ")..core.colorize("#000", "= Dodgy Potion").."]"..
"label[1,4.8;"..core.colorize("#006c08", "mandragora  bigmush  golden_grass_S5 ")..core.colorize("#000", "= Alchemy Potion").."]"..
"label[1,5.2;"..core.colorize("#006c08", "groundfung  ")..core.colorize("#ff0000", "mushroom_red  ")..core.colorize("#ff00ff", "jar_slime ")..core.colorize("#000", "= Murky Potion").."]"..
"label[1,5.6;"..core.colorize("#006c08", "anemone  ")..core.colorize("#a51", "ice_shard  ")..core.colorize("#ff00ff", "jar_eyes ")..core.colorize("#000", "= Thick Potion").."]"..
"label[1,6;"..core.colorize("#006c08", "mushroom_red  ")..core.colorize("#ff00ff", "mud_bottle  tooth_bottle ")..core.colorize("#000", "= Hunger Potion").."]"..
"label[1,6.4;"..core.colorize("#0000ff", "cactus_fruit  apple  iron_lump ")..core.colorize("#000", "= Tasty Potion").."]"..
"label[1,6.8;"..core.colorize("#ff00ff", "magic_powder  ")..core.colorize("#006c08", "wildberry  aloe_vera ")..core.colorize("#000", "= Fast Potion").."]"..
"label[1,7.2;"..core.colorize("#ff00ff", "magic_powder  saffron  ")..core.colorize("#006c08", "winter_lavender ")..core.colorize("#000", "= Filling Potion").."]"..
"label[1,7.6;"..core.colorize("#ff00ff", "magic_powder  slime_bottle  ")..core.colorize("#ff0000", "purple_allium ")..core.colorize("#000", "= Smokey Potion").."]"..
"label[1,8;"..core.colorize("#ff00ff", "magic_powder  ")..core.colorize("#ff0000", "mushroom_brown  ")..core.colorize("#ff00ff", "potion_red ")..core.colorize("#000", "= Regen Potion").."]"..
"label[1,8.4;"..core.colorize("#006c08", "mandragora  arctic_carrot_root  ")..core.colorize("#ff00ff", "potion_cyan ")..core.colorize("#000", "= Cold Potion").."]"..
"label[1,8.8;"..core.colorize("#006c08", "mandragora  ")..core.colorize("#ff00ff", "black_pearl  jar_eyes ")..core.colorize("#000", "= Evil Potion").."]"..
"label[1,9.2;"..core.colorize("#006c08", "swamp_weed  aqua_mush  ")..core.colorize("#ff00ff", "triforce ")..core.colorize("#000", "= Complex Potion").."]"..
"label[1,9.6;"..core.colorize("#000", "Except (Filling, Hunger, Blue, Superliser, Air, Darkness) Potions\nadding a ")..core.colorize("#0000ff", "mese_crystal")..core.colorize("#000", " will make it level 2").."]")
	end
})

core.register_tool("mtools:white_wand", {
	description = "White Wand",
	inventory_image = "mtools_white_wand.png",
	light_source = 9,
	on_use = function(item, user)
		if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local name = user:get_player_name()
	local extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	if extra_energy >= 1 then
		user:get_meta():set_int("_extra_energy", extra_energy - 1)
	elseif chi.subtract(name, 1) then
	else
		user:set_hp(user:get_hp()-1)
	end
		end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "mtools:bwhite")
		obj:set_velocity({x=dir.x*19,y=dir.y*19,z=dir.z*19})
	end
})

core.register_craft({
	output = 'mtools:scroll',
	recipe = {
		{'default:reed', 'default:reed', 'default:stick'},
		{'default:reed', 'group:grinder', 'group:water_bucket'},
		{'default:reed', '', ''}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = 'mtools:scroll_recipes',
	recipe = {
		{'dye:black', 'default:glue'},
		{'mtools:scroll', ''}
	}
})

local lp = core.settings:get_bool("limit_particles")

-- Scroll spell powers
core.register_entity("mtools:fireball", {
	initial_properties = {
visual = "sprite",
textures = {"tnt_boom.png"},
physical = false,
collisionbox = {0,0,0,0,0,0},
glow = 14,
	},
	age = 0,
	on_activate = function(self)
		if lp ~= true then
	core.add_particlespawner({
		amount = 360,
		time = 0,
		pos = {min = {x=-.3, y=-.3, z=-.3}, max = {x=.3, y=.3, z=.3}},
		minvel = {x=-1,y=-1,z=-1},
		maxvel = {x=1,y=1,z=1},
		attached = self.object,
		exptime = {min = .1, max = .3},
		minsize = 1,
		maxsize = 2,
		collisiondetection = true,
		texture = "mtools_flame.png",
		glow = 13 })
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 4 then self.object:remove() return end

		local pos = self.object:get_pos()
	local vel = self.object:get_velocity()
	if vel == nil then vel = {x=1,y=1,z=1} end
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
	if obj:get_luaentity().name ~= "mtools:fireball" and obj:get_luaentity().name ~= "__builtin:item" then
local damage
	if self.damage ~= nil then
		damage = self.damage
	else
		local spd = vector.round(vel)
	local spd_x, spd_y, spd_z = spd.x, spd.y, spd.z
while spd_x < 0 do
	spd.x = spd.x +2
	spd_x = spd_x +1
end
while spd_y < 0 do
	spd.y = spd.y +2
	spd_y = spd_y +1
end
while spd_z < 0 do
	spd.z = spd.z +2
	spd_z = spd_z +1
end
		damage = spd.x+spd.y+spd.z
	end
		obj:punch(self.object, 1., {
			full_punch_interval=1.,
			damage_groups={fleshy=damage*5},
		}, nil)
--core.chat_send_all("Velocity "..damage.." = Damage "..damage*5)
		self.object:remove()
	end
			end
		end
		local n = core.get_node(pos)
		if not n then
			return-- Nodes not yet loaded, try later
		end
		if n.name ~= "air" or core.get_item_group(n.name, "water") > 0 then
			local def = core.registered_nodes[n.name]
			if def.on_burn then
				def.on_burn(pos)
			elseif def.on_ignite then
				def.on_ignite(pos)
			elseif def.groups.flammable then
				core.set_node(pos, {name="fire:basic_flame"})
			elseif core.get_item_group(n.name, "soil") > 0 or n.name == "default:compost_pile" or n.name == "default:mud" then
				if n.name == "default:clay_dirt"
				or n.name == "default:clay_dirt_with_savanna_grass"
				or n.name == "farming:clay_soil"
				or n.name == "farming:clay_soil_wet"
				or n.name == "es:clay_dirt_with_aiden_grass" then
					core.set_node(pos, {name = "default:dry_clay_dirt"})
				else
					core.set_node(pos, {name = "default:dry_dirt"})
				end
				core.get_node_timer(pos):start(math.random(3, 5))
			else
	n.name = default.moss_death_correspondences[n.name]
	if n.name then
		core.set_node(pos, n)
	end
			end
			self.object:remove()
			return
		end
	end
})

core.register_entity("mtools:nature", {
	initial_properties = {
visual = "sprite",
textures = {"blank.png"},
physical = false,
visual_size = {x= 0, y= 0},
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_activate = function(self)
	core.add_particlespawner({
		amount = 206,
		time = 0,
		pos = {min = {x=-.3, y=-.3, z=-.3}, max = {x=.3, y=.3, z=.3}},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		attached = self.object,
		exptime = {min = .2, max = .3},
		minsize = 1,
		maxsize = 2,
		texture = "twinkle_lgreen.png",
		animation = {type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = -1},
		glow = 14 })
		if lp ~= true then
	core.add_particlespawner({
		amount = 206,
		time = 0,
		pos = {min = {x=-.3, y=-.3, z=-.3}, max = {x=.3, y=.3, z=.3}},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		attached = self.object,
		exptime = {min = .3, max = .6},
		minsize = .1,
		maxsize = .3,
		texture = "glisten_green.png",
		animation = {type = "vertical_frames", aspect_w = 3, aspect_h = 3, length = .7},
		glow = 13 })
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 4 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
	if obj:get_luaentity().name ~= "mtools:nature" and obj:get_luaentity().name ~= "__builtin:item" then
		core.add_entity(pos, obj:get_luaentity().name)
		self.object:remove()
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "air" and n ~= "default:water_source" and n ~= "default:fresh_water_source" and
		n ~= "default:water_flowing" and n ~= "default:fresh_water_flowing" then	
			bonemeal:on_use(vector.round(pos), 4)
			self.object:remove()
			return
		end
	end
})

core.register_entity("mtools:ice", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_ice.png"},
physical = false,
collisionbox = {0,0,0,0,0,0},
glow = 6,
	},
	age = 0,
	on_activate = function(self)
		if lp ~= true then
	core.add_particlespawner({
		amount = 350,
		time = 0,
		pos = {min = {x=-.3, y=-.3, z=-.3}, max = {x=.3, y=.3, z=.3}},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		attached = self.object,
		exptime = {min = .1, max = .3},
		minsize = .5,
		maxsize = 1,
		texture = "mtools_light_over.png",
		glow = 7 })
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 5 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
	if obj:get_luaentity().name ~= "mtools:ice" and obj:get_luaentity().name ~= "__builtin:item" then
		obj:punch(self.object, 1., {
			full_punch_interval=1.,
			damage_groups={fleshy=2},
		}, nil)
		self.object:remove()
	end
			end
		end
		local n = core.get_node(pos).name
		if n == "default:water_source" or n == "default:fresh_water_source" then	
			core.set_node(pos, {name="default:ice"})
			self.object:remove()
		elseif n ~= "air" then
			local vel = self.object:get_velocity()
	if vel == nil then vel = {x=1,y=1,z=1} end
			self.object:set_velocity({x=vel.x*1, y=0, z=vel.z*1})
		end
	end
})

core.register_entity("mtools:bwhite", {
	initial_properties = {
visual = "sprite",
textures = {"blank.png"},
physical = false,
visual_size = {x= 0, y= 0},
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_activate = function(self)
	core.add_particlespawner({
		amount = 450,
		time = 0,
		pos = {min = {x=-.2, y=-.2, z=-.2}, max = {x=.2, y=.2, z=.2}},
		attached = self.object,
		exptime = {min = .5, max = .7},
		size = .1,
		texture = "default_cloud.png^[colorize:#def",
		glow = 13 })
		if lp ~= true then
	core.add_particlespawner({
		amount = 199,
		time = 0,
		pos = {min = {x=-.2, y=-.2, z=-.2}, max = {x=.2, y=.2, z=.2}},
		attached = self.object,
		exptime = {min = .5, max = .7},
		minsize = 1,
		maxsize = 2,
		texpool = {"twinkle_bwhite.png", "twinkle_bwhite2.png"},
		animation = {type = "vertical_frames", aspect_w = 17, aspect_h = 17, length = -1},
		glow = 13 })
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 4 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then-- Needs a more efficient list of entities to ignore
	if obj:get_luaentity().name ~= "mtools:bwhite" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().type == "monster" then
if obj:get_luaentity().health > 0 then
	local obj_pos = obj:get_pos()
	for i=1, obj:get_luaentity().health do
		core.add_entity(obj_pos, "extra_energy:orb")
	end
	obj:punch(self.object, 1., {
		full_punch_interval=1.,
		damage_groups={fleshy=10000},
	}, nil)
	self.object:remove()
end
	end
			end
		end
	end
})

--Extreme Survival created by Maikerumine
-- Luanti mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine


core.register_craftitem("es:punkin_slice", {
	description = "Extreme Pumkin Slice",
	inventory_image = "farming_pumpkin_slice.png",
	on_use = core.item_eat(50),
})

core.register_craft({
	type = "shapeless",
	output = "es:punkin_slice",
	recipe = {"es:magentium_lump", "farming:pumpkin_slice"}
})

core.register_craft({
	type = "shapeless",
	output = "es:hdglass",
	recipe = {"es:aikerum_crystal", "default:glass"}
})

core.register_craft({
	type = "shapeless",
	output = "es:hdsteel_block",
	recipe = {"es:aikerum_crystal", "default:steel_block"}
})

core.register_craft({
	output = "es:boneblock",
	recipe = {
		{"bones:bones", "bones:bones", "bones:bones"},
		{"bones:bones", "default:steel_block", "bones:bones"},
		{"bones:bones", "bones:bones", "bones:bones"}
	}
})

core.register_craft({
	output = "es:chest",
	recipe = {
		{"es:boneblock","gems:emerald","es:boneblock"},
		{"gems:emerald","default:steel_block","gems:emerald"},
		{"es:boneblock","gems:emerald","es:boneblock"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "es:vault",
	recipe = {"es:chest", "default:steel_ingot"}
})

core.register_craft({
	output = "es:what",
	recipe = {
		{"default:mese_crystal","default:glass","default:mese_crystal"},
		{"default:glass","es:magentium_lump","default:glass"},
		{"default:mese_crystal","default:glass","default:mese_crystal"}
	}
})

if core.get_modpath("technic_worldgen") then
	core.register_craft({
		type = "cooking",
		output = "technic:uranium_ingot",
		recipe = "bucket:bucket_toxic",
		replacements = {{"bucket:bucket_toxic", "bucket:bucket_empty"}}
	})
end

core.register_craft({
	type = "shapeless",
	output = "es:infinium_container",
	recipe = {"vessels:glass_bottle", "es:infinium_goo"}
})
core.register_craft({
	type = "cooking",
	output = "es:infinium_ingot",
	recipe = "es:infinium_container",
})

core.register_craft({
	type = "cooking",
	output = "es:magentium_ingot",
	recipe = "es:magentium_lump",
})

register_nine("es:aikerumblock", "es:aikerum_crystal")
register_nine("es:infiniumblock", "es:infinium_ingot")
register_nine("es:magentiumblock", "es:magentium_ingot")

-- Weapon & Tool Crafting:
core.register_craftitem("es:handle", {
	description = "Extreme Survival Uni-handle",
	inventory_image = "es_handle.png",
})

core.register_craft({
	output = "es:handle 4",
	recipe = {
		{"default:stick", "default:steel_ingot", "default:stick"},
		{"fabric:string", "default:steel_ingot", "fabric:string"},
		{"fabric:string", "default:stick", "fabric:string"}
	}
})

core.register_craft({
	output = "es:sword_emerald",
	recipe = {
		{"gems:emerald"},
		{"gems:emerald"},
		{"es:handle"}
	}
})
core.register_craft({
	output = "es:sword_ruby",
	recipe = {
		{"gems:ruby"},
		{"gems:ruby"},
		{"es:handle"}
	}
})
core.register_craft({
	output = "es:sword_aikerum",
	recipe = {
		{"es:aikerum_crystal"},
		{"es:aikerum_crystal"},
		{"es:handle"}
	}
})
core.register_craft({
	output = "es:sword_magentium",
	recipe = {
		{"es:magentium_ingot"},
		{"es:magentium_ingot"},
		{"es:handle"}
	}
})

core.register_craft({
	output = "es:pick_emerald",
	recipe = {
		{"gems:emerald", "gems:emerald", "gems:emerald"},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:pick_ruby",
	recipe = {
		{"gems:ruby", "gems:ruby", "gems:ruby"},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:pick_aikerum",
	recipe = {
		{"es:aikerum_crystal", "es:aikerum_crystal", "es:aikerum_crystal"},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:pick_magentium",
	recipe = {
		{"es:magentium_ingot", "es:magentium_ingot", "es:magentium_ingot"},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})

core.register_craft({
	output = "es:axe_emerald",
	recipe = {
		{"gems:emerald", "gems:emerald", ""},
		{"gems:emerald", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:axe_ruby",
	recipe = {
		{"gems:ruby", "gems:ruby", ""},
		{"gems:ruby", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:axe_aikerum",
	recipe = {
		{"es:aikerum_crystal", "es:aikerum_crystal", ""},
		{"es:aikerum_crystal", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})

core.register_craft({
	output = "es:shovel_emerald",
	recipe = {
		{"", "gems:emerald", ""},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:shovel_ruby",
	recipe = {
		{"", "gems:ruby", ""},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})
core.register_craft({
	output = "es:shovel_aikerum",
	recipe = {
		{"", "es:aikerum_crystal", ""},
		{"", "default:steel_ingot", ""},
		{"", "es:handle", ""}
	}
})

-- raw meat
core.register_craftitem("es:meat_raw", {
	description = "Raw Radiated Meat",
	inventory_image = "es_meat_raw.png",
	on_use = core.item_eat(3),
})

-- cooked meat
core.register_craftitem("es:meat", {
	description = "Cooked Radiated Meat",
	inventory_image = "es_meat.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	type = "cooking",
	output = "es:meat",
	recipe = "es:meat_raw",
	cooktime = 5,
})

core.register_craft({
	output = "es:zoombot",
	recipe = {
		{"default:diamond", "es:magentium_lump", "default:diamond"},
		{"es:sword_aikerum", "default:mese_crystal", "default:silver_ingot"},
		{"default:steel_ingot", "es:hdsteel_block", "default:steel_ingot"},
	}
})

core.register_craftitem("es:griefer_soul", {
	description = "Griefer Soul",
	inventory_image = "default_coal_lump.png^[colorize:red:120",
})

--rnd code
core.register_craft({
	type = "fuel",
	recipe = "es:griefer_soul",
	burntime = 604800,--	= real time 1 week burn time or 180 = 3 minutes
})

mobs:register_arrow("es:lasershot", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"futuremobs_laser.png"},
	velocity = 5,
	hit_player = function(self, player)
		local s = self.object:get_pos()
		local p = player:get_pos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, .5,  {
			full_punch_interval=.5,
			damage_groups = {fleshy=8},
		}, vec)
	end,
	hit_node = function(self, pos, node)
	end
})

core.register_craftitem("es:alien_skin", {
	description = "Alien Hide",
	inventory_image = "alien_skin.png",
})

core.register_craftitem("es:laser", {
	description = "Laser Bullet",
	inventory_image = "futuremobs_laser.png",
})

core.register_node("es:laser_box", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- Shaft
			{-6.5/17, -1.5/17, -1.5/17, 6.5/17, 1.5/17, 1.5/17},
			--Spitze
			{-4.5/17, 2.5/17, 2.5/17, -3.5/17, -2.5/17, -2.5/17},
			{-8.5/17, 0.5/17, 0.5/17, -6.5/17, -0.5/17, -0.5/17},
			--Federn
			{6.5/17, 1.5/17, 1.5/17, 7.5/17, 2.5/17, 2.5/17},
			{7.5/17, -2.5/17, 2.5/17, 6.5/17, -1.5/17, 1.5/17},
			{7.5/17, 2.5/17, -2.5/17, 6.5/17, 1.5/17, -1.5/17},
			{6.5/17, -1.5/17, -1.5/17, 7.5/17, -2.5/17, -2.5/17},
			
			{7.5/17, 2.5/17, 2.5/17, 8.5/17, 3.5/17, 3.5/17},
			{8.5/17, -3.5/17, 3.5/17, 7.5/17, -2.5/17, 2.5/17},
			{8.5/17, 3.5/17, -3.5/17, 7.5/17, 2.5/17, -2.5/17},
			{7.5/17, -2.5/17, -2.5/17, 8.5/17, -3.5/17, -3.5/17},
		}
	},
	tiles = {"futuremobs_laser.png", "futuremobs_laser.png", "futuremobs_laser.png", "futuremobs_laser.png", "futuremobs_laser.png", "futuremobs_laser.png"},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory=1},
})

local mobs_futuremobs_LASER_ENTITY={
initial_properties = {
	physical = false,
	visual = "wielditem",
	visual_size = {x=.1, y=.1},
	textures = {"es:laser_box"},
	collisionbox = {0,0,0,0,0,0},
},
	timer=0,
	lastpos={},
}

mobs_futuremobs_LASER_ENTITY.on_step = function(self, dtime)
	self.timer=self.timer+dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)

	if self.timer>0.2 then
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "es:laser_entity" and obj:get_luaentity().name ~= "__builtin:item" then
					local damage = 3
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=damage},
					}, nil)
					self.object:remove()
				end
			else
				local damage = 3
				obj:punch(self.object, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=damage},
				}, nil)
				self.object:remove()
			end
		end
	end
	if self.lastpos.x~=nil then
		if node.name ~= "air" then
			core.add_item(self.lastpos, "es:laser")
			self.object:remove()
		end
	end
	self.lastpos={x=pos.x, y=pos.y, z=pos.z}
end

core.register_entity("es:laser_entity", mobs_futuremobs_LASER_ENTITY)

core.register_craft({
	output = "es:laser 80",
	recipe = {
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"}
	}
})

-- Light Steel
core.register_tool("es:sword_lightsteel_blue", {
	description = "Blue LightSteel Sword",
	inventory_image = "sword_lightsteel_blue.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.85}, uses=3, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=3, maxlevel=1},
		},
		damage_groups = {fleshy=9},
	},
})

core.register_tool("es:sword_lightsteel_red", {
	description = "Red LightSteel Sword",
	inventory_image = "sword_lightsteel_red.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.35, [2]=2.10, [3]=2.85}, uses=10, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=9},
	},
})

core.register_tool("es:claw", {
	description = "A Sharp Claw",
	inventory_image = "claw.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.85}, uses=3, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=3, maxlevel=1},
		},
		damage_groups = {fleshy=17},
	},
})

lasers = {
	{"es:laser", "es:laser_entity"},
}

local shoot_laser = function(itemstack, player)
	for _,laser in ipairs(lasers) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == laser[1] then
			if not core.is_creative_enabled(player:get_player_name()) then
				player:get_inventory():remove_item("main", laser[1])
			end
			local ppos = player:get_pos()
			local obj = core.add_entity({x=ppos.x,y=ppos.y+1.5,z=ppos.z}, laser[2])
			local dir = player:get_look_dir()
			obj:set_velocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
			obj:set_acceleration({x=dir.x*-3, y=0, z=dir.z*-3})
			obj:set_yaw(player:get_look_horizontal()+math.pi)
			core.sound_play("laser_sound", {pos=ppos})
			if obj:get_luaentity().player == "" then
				obj:get_luaentity().player = player
			end
			obj:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			return true
		end
	end
	return false
end

core.register_tool("es:blue_laser_gun", {
	description = "Blue Laser Gun",
	inventory_image = "blue_laser_gun.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointd)
		if shoot_laser(item, user, pointd) then
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:add_wear(65535/100)
			end
		end
		return itemstack
	end,
})

core.register_tool("es:red_laser_gun", {
	description = "Red Laser Gun",
	inventory_image = "red_laser_gun.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointd)
		if shoot_laser(item, user, pointd) then
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:add_wear(65535/100)
			end
		end
		return itemstack
	end,
})


local path = core.get_modpath("mobs")

-- Peaceful player privilege
core.register_privilege("peaceful_player", {
	description = "Prevents Mobs Redo mobs from attacking player",
	give_to_singleplayer = false
})


local opm = core.settings:get_bool("only_peaceful_mobs")
local lp = core.settings:get_bool("limit_particles")

local golem_light = "default:light"
if core.get_modpath("illumination") then
	golem_light = "illumination:light_full"
end

core.register_entity("mobs:golem_spirit", {
	initial_properties = {
visual = "sprite",
textures = {"plasma.png"},
physical = false,
use_texture_alpha = true,
collisionbox = {0,0,0,0,0,0},
visual_size = {x=.8, y=.8},
glow = 14
	},
	owner = "",
	follow = nil,
	lastpos = {},
get_staticdata = function(self) return core.serialize({owner = self.owner}) end,
on_activate = function(self, staticdata)
	self.object:set_armor_groups({immortal = 1})
	if not staticdata or staticdata == "" then return end
	local data = core.deserialize(staticdata)
	if not data then return end

	self.owner = data.owner
end,
	on_step = function(self, dtime)
		--self.timer = self.timer or 0
		--self.timer = self.timer+dtime
		local s = self.object:get_pos()

		--[[When in something do something
		local s1 = {x=s.x, y = s.y-1, z = s.z}
		local name = core:get_node(s1).name
		if name == "" then
			self.object:remove()
		end]]

		--Find player to follow
		for _,obj in ipairs(core.get_objects_inside_radius(s, 9)) do
	if obj:is_player() and obj:get_player_name() == self.owner then
		self.follow = obj
		obj:set_hp(obj:get_hp()+10)
	elseif obj:is_player() and self.owner == "" then
		self.owner = obj:get_player_name()
	elseif obj:get_luaentity() ~= nil and opm ~= true then
		local ent = obj:get_luaentity()
		if ent.type == "monster" or ent.name == "tsm_pyramids:mummy" then
			obj:punch(self.object, .5, {
				full_punch_interval=.5,
				damage_groups={fleshy=15},
			}, {x=0,y=0,z=0})
		elseif ent.name == "es:bullet" or ent.name == "mobs:bonebullet" or ent.name == "es:lasershot" or ent.name == "mobs_monster:mese_arrow" or
			ent.name == "dmobs:shuriken" or ent.name == "dmobs:snowball" or ent.name == "awesome_monsters:star" then
			local pos2=obj:get_pos()
			local d=math.max(1,vector.distance(s,pos2))
			local r=(8/d)*2
			obj:set_velocity({x=(pos2.x-s.x)*r, y=(pos2.y-s.y+.1)*r, z=(pos2.z-s.z)*r})
		elseif ent.name == "es:zoombot" then
			local pos2=obj:get_pos()
			local vec = {x=s.x-pos2.x, y=s.y-pos2.y, z=s.z-pos2.z}
			vec.x = vec.x*3  vec.y = vec.y*3  vec.z = vec.z*3
			obj:set_velocity(vec)
		elseif ent.name == "mobs_monster:fireball" or ent.name == "mobs_monster:obsidian_arrow" or ent.name == "mobs_loz:fire" then
			obj:remove()
		end
	end
		end

		--If found a player, follow
		if self.follow and self.follow:get_player_name() == self.owner then
--if  then
--	self.object:set_attach(self.follow, "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
--end
	local p = self.follow:get_pos()
	local ctrl = self.follow:get_player_control()
	local inv = self.follow:get_inventory()
	if self.follow:get_wielded_item():get_name() == "mobs:golem_spirit" and ctrl.sneak then
	if inv:room_for_item("main", "mobs:golem_spirit") then
		inv:add_item("main", "mobs:golem_spirit")
	else
		core.add_item(p, "mobs:golem_spirit")
	end
		if core.get_node(s).name == golem_light then
			core.remove_node(s)
		end
--		self.object:set_detach()
		self.object:remove()
		return
	end
			local horp = self.follow:get_look_horizontal()+1.5

			p.y = p.y + 1
			p.x = p.x- math.cos(horp)/2.5
			p.z = p.z- math.sin(horp)/2.5
			local m = 7

			--Stay close to player
			self.object:set_velocity({x=-(s.x-p.x)*m, y=-(s.y-p.y)*m, z=-(s.z-p.z)*m})

			--[[Every ten seconds do something
			if self.timer > 10 then
				self.timer = 0
				self.follow:set_hp(self.follow:get_hp() + 9)
			end]]
		else
	self.object:set_velocity({x=0, y=0, z=0})
		end
	if core.get_node(s).name == "air" or core.get_node(s).name == golem_light then
		core.set_node(s, {name = golem_light})
		core.get_node_timer(s):start(1)
	end
		if self.lastpos.x~=nil then
	if math.floor(self.lastpos.x+.5) ~= math.floor(s.x+.5)
	or math.floor(self.lastpos.y+.5) ~= math.floor(s.y+.5)
	or math.floor(self.lastpos.z+.5) ~= math.floor(s.z+.5) then
		if core.get_node(self.lastpos).name == golem_light then
			core.remove_node(self.lastpos)
		end
	end
		end
	self.lastpos = s
		if lp ~= true then
	core.add_particlespawner({
		amount = 2,
		time = .3,
		minpos = {x = s.x-.15, y = s.y-.15, z = s.z-.15},
		maxpos = {x = s.x+.15, y = s.y+.15, z = s.z+.15},
		exptime = {min = .1, max = .3},
		minsize = 3,
		maxsize = 5,
		texture = "plasma.png",
		glow = 14 })
		end
	end
})

core.register_craft({
	output = "mobs:golem_spirit",
	recipe = {
		{"default:diamond"},
		{"flowers:lion_tooth"},
		{"extra_energy:great_globe"}
	}
})

core.register_craft({
	output = "mobs:golem_spirit",
	recipe = {
		{"default:diamond"},
		{"farming:celery_S5"},
		{"extra_energy:great_globe"}
	}
})

core.register_craft({
	output = "mobs:golem_spirit",
	recipe = {
		{"default:diamond"},
		{"ecology:iris_lightblue"},
		{"extra_energy:great_globe"}
	}
})

core.register_craft({
	output = "mobs:golem_spirit",
	recipe = {
		{"default:diamond"},
		{"ecology:iris_blue"},
		{"extra_energy:great_globe"}
	}
})

-- Mob API
dofile(path .. "/api.lua")

mobs:register_egg("mobs:golem_spirit", "Golem Spirit", "plasma.png", 1)

-- Rideable Mobs
dofile(path .. "/mount.lua")

-- Mob Items
dofile(path .. "/crafts.lua")

-- Mob Spawner
dofile(path .. "/spawner.lua")

-- Lucky Blocks
if core.get_modpath("lucky_block") then
	dofile(path .. "/lucky_block.lua")
end


print("[MOD] Mobs Redo loaded")

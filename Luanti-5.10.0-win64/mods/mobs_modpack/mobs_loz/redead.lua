--[[
playereffects.register_effect_type("paralysed", "Paralysed", nil, {"speed"}, 
	function(player)
		player:set_physics_override({speed = 0, jump = 0})	-- Doesn't negate your movement
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1, jump = 1})
	end,
	false
)
]]
mobs:register_mob("mobs_loz:redead", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 20,
	hp_max = 30,
	armor = 150,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"redead.png"},
	},
	makes_footstep_sound = true,
	walk_velocity = .6,
	run_velocity = .7,
	drops = {
		{name = "spawn:mirror", chance = 10, min = 0, max = 1},
		{name = "mapgen:green_rupee", chance = 5, min = 1, max = 3},
		{name = "mtools:heart", chance = 3, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 1,
	view_range = 5,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
--[[	do_custom = function(self)
		local pos = self.object:get_pos()	if not pos then return end
		local objs = core.get_objects_inside_radius(pos, 2)	
		for k, obj in pairs(objs) do
			if obj:is_player() and math.random(1,10) == 10 then
				playereffects.apply_effect_type("paralysed", 5, obj)
			end
		end
	end]]
})

mobs:register_egg("mobs_loz:redead", "Redead", "default_dirt.png", 1)
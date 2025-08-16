brewing = {
	settings = {
		-- Amulets
			heart_amulet_hp_inc_by = 5,
			health_amulet_power_level = 15,
			health_amulet_heal_points = 3,
		freeze_time = 4.7,
		freeze_hit_points = 5,
		donut_eat_hp = 7,
		star_blue_amulet_speedup = 1.05,
		-- Chi
		-- Add
		chi_magic_donut = 20,
		chi_fay_cake = 30,
		chi_nymph_salad = 15,
		-- Subtract
		chi_magic_wand = 30,
	},
	posfrontplayer = function(user)
		local d = user:get_look_dir()
		local pos = user:get_pos()
		local player_eye_pos = 1.5
		local posinfront ={
			x = pos.x + (d.x*2),
			y = pos.y + player_eye_pos+(d.y*2),
			z = pos.z + (d.z*2)
		}
		return posinfront
	end,
	magic_aura = function(obj, pos, emitter, magic)
		local minpos = pos
		local maxpos
		if emitter == "player" then
			maxpos = brewing.posfrontplayer(obj)
		elseif emitter == "node" or emitter == "entity" then
			maxpos = {
				x = minpos.x,
				y = minpos.y + .5,
				z = minpos.z
			}
		end
		local texture_name
		if magic == "default" then
			texture_name = "brewing_magic_particle.png"
		elseif magic == "freeze" then
			texture_name = "brewing_freeze_particle.png"
		else
			texture_name = "brewing_magic_particle.png"
		end
		core.add_particlespawner({
			amount = 20,
			time = 1.5,
			minpos = minpos,
			maxpos = maxpos,
			minvel = {x=-1, y=.5, z=-1},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-1, y=.5, z=-1},
			maxacc = {x=1, y=1, z=1},
			exptime = 1,
			minsize = .2,
			maxsize = .4,
			texture = texture_name
		})
	end,
	magic_sound = function(dest, dest_name, soundfile)
		core.sound_play(soundfile, {dest = dest_name, gain = .4})
	end,
}

-- Freeze Entity

core.register_entity("mtools:freeze_entity", {
	initial_properties = {
visual = "sprite",
physical = true,
collide_with_objects = true,
collisionbox = {-.1, -.1, -.1, .1, .1, .1},
visual_size = {x=2.5, y=2.5},
textures = {"mtools_freeze_entity.png"},
pointable = false,
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 5 then self.object:remove() return end
	end
})

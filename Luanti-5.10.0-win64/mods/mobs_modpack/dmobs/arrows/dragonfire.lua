--function to register tamed dragon attacks

function dmobs.register_fire(fname, texture, dmg, replace_node, explode, ice, variance, size)
core.register_entity(fname, {
	initial_properties = {
visual = "sprite",
textures = {texture},
physical = false,
velocity = .1,
damage = dmg,
collisionbox = {0,0,0, 0,0,0},
	},
	on_step = function(self)		
		local remove = core.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= fname and obj:get_luaentity().name ~= "dmobs:dragon_red" and obj:get_luaentity().name ~= "dmobs:dragon_blue"
				and obj:get_luaentity().name ~= "dmobs:dragon_black" and obj:get_luaentity().name ~= "dmobs:dragon_green"
				and obj:get_luaentity().name ~= "dmobs:dragon_great_tame" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(self.launcher, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=3},
					}, nil)
				self.object:remove()
				end
			end
		end
		for dx=0,1 do
		for dy=0,1 do
		for dz=0,1 do
			local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
			local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			local n = core.get_node(p).name
			if n ~= fname and n ~="default:dirt_with_grass" and n ~="default:clay_dirt_with_savanna_grass" and n ~="default:stone"  then	
				if core.registered_nodes[n].groups.flammable then
					core.set_node(t, {name=replace_node})
					self.object:remove()
					return
				end
				if ice and n == "default:water_source" then
					core.set_node(t, {name="default:ice"})
					self.object:remove()
				end
			end
		end
		end
		end
		core.add_particlespawner({
			amount = 6,
			time = .3,
			minpos = {x=pos.x-variance, y=pos.y-variance, z=pos.z-variance},
			maxpos = {x=pos.x+variance, y=pos.y+variance, z=pos.z+variance},
			minacc = {x=variance, y=-.5-variance, z=variance},
			maxacc = {x=.5+variance, y=.5+variance, z=.5+variance},
			exptime = {min = .1, max = .3},
			minsize = size,
			maxsize = size+2,
			texture = texture
		})
	end,
})
end

dmobs.register_fire("dmobs:fire_plyr", "dmobs_fire.png", 2, "fire:basic_flame", true, false, .3, 1)
dmobs.register_fire("dmobs:ice_plyr", "dmobs_ice.png", 2, "default:ice", false, true, .5, 10)
dmobs.register_fire("dmobs:poison_plyr", "dmobs_poison.png", 2, "air", false, false, .3, 1)
dmobs.register_fire("dmobs:lightning_plyr", "dmobs_lightning.png", 2, "air", true, false, 0, .5)

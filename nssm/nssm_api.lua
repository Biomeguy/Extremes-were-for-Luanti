
nssm.lessvirulent = core.settings:get_bool("nssm.lessvirulent") or false
nssm.safebones = core.settings:get_bool("nssm.safebones") or false
nssm.cryosave = core.settings:get_bool("nssm.cryosave") or false

function nssm:virulence(mobe)
	if not nssm.lessvirulent then
		return 0
	end
	return math.ceil(100 / mobe.hp_max)
end

function nssm:affectbones(mobe) -- as function for adaptable heuristic
	return not nssm.safebones
end

function drops(drop)
	if drop then
		drop:set_velocity({
			x = math.random(-10, 10) / 9,
			y = 5,
			z = math.random(-10, 10) / 9,
		})
	end
end

function add_entity_and_particles(entity, pos, particles, multiplier)
	core.add_particlespawner({
		amount = 100*multiplier,
		time = 2,
		minpos = {x=pos.x-2, y=pos.y-1, z=pos.z-2},
		maxpos = {x=pos.x+2, y=pos.y+4, z=pos.z+2},
		minvel = {x=-1, y=0, z=-1},
		maxvel = {x=1, y=2, z=1},
		minacc = {x=-.5,y=.6,z=-.5},
		maxacc = {x=.5,y=.7,z=.5},
		exptime = {min = 2, max = 3},
		minsize = 3,
		maxsize = 5,
		texture = particles,
	})
	core.add_entity(pos, entity)
end

function webber_ability(	--puts randomly around the block defined as w_block
	self,		--the entity of the mob
	w_block, 	--definition of the block to use
	radius)		--max distance the block can be put

	if nssm:virulence(self) ~= 0 and math.random(1, nssm:virulence(self)) ~= 1 then return end

	local pos = self.object:get_pos()	if not pos then return end

	if math.random(55)== 1 then
		local dx= math.random(radius)
		local dz= math.random(radius)
		local p = {x= pos.x+ dx, y=pos.y-1, z= pos.z+ dz}
		local t = {x= pos.x+ dx, y=pos.y, z= pos.z+ dz}
		local n = core.get_node(p).name
		local k = core.get_node(t).name

		if (n~= "air" and k== "air") and not core.is_protected(t, "") then
			core.set_node(t, {name= w_block})
		end
	end
end

repulser={}

repulser.protect=function(pos,a)
	a.name=a.name or "?"
	a.range=a.range or 15
	for i, p in pairs(repulser.get_nodes(pos,a.range,1,{})) do
		local m=core.get_meta(p)
		m:set_string("repulser_protected",a.name)
	end
end

repulser.unprotect=function(pos,a)
	a.name=a.name or ""
	a.range=a.range or 15
	for i, p in pairs(repulser.get_nodes(pos,a.range,1,{})) do
		local m=core.get_meta(p)
		m:set_string("repulser_protected","")
	end
end

repulser.get_nodes=function(self,radio,dencity,filter)
	if not self then return end
	radio=radio or 25
	dencity=dencity or 5
	filter=filter or {"default:dirt","default:stone","air"}
	local pos
	local rpos={}
	local filter2={}
	if not self.object and self.x and self.y and self.z then
		pos=self
	else
		pos=self.object:get_pos()
	end
	pos=repulser.roundpos(pos)
	for _, nod in ipairs(filter) do
		table.insert(filter2,core.get_content_id(nod))
	end
	local pos1 = vector.subtract(pos, 1)
	local pos2 = vector.add(pos, radio)
	local vox = core.get_voxel_manip()
	local min, max = vox:read_from_map(pos1, pos2)
	local area = VoxelArea:new({MinEdge = min, MaxEdge = max})
	local data = vox:get_data()
	for z = -radio, radio do
	for y = -radio, radio do
	for x = -radio, radio do
		local p={x=pos.x+x,y=pos.y+y,z=pos.z+z}
		local v = area:index(p.x,p.y,p.z)
		if math.random(1,dencity)==1 then
			local nf=true
			for _, nod in ipairs(filter2) do
				if not data[v] or data[v]==nod then
					nf=false
					break
				end
			end
			if nf==true then
				table.insert(rpos,p)
			end
		end
	end
	end
	end
	return rpos
end

repulser.roundpos=function(pos)
	if pos and pos.x and pos.y and pos.z then
		pos.x = math.floor(pos.x+.5)
		pos.y = math.floor(pos.y+.5)
		pos.z = math.floor(pos.z+.5)
		return pos
	end
	return nil
end

core.register_node("repulser:block", {
	description = "Repulser Force Field",
	drawtype="nodebox",
	tiles = {"repulser.png"},
	use_texture_alpha = "clip",
	paramtype="light",
	node_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	can_dig = function(pos, player)
		local meta=core.get_meta(pos)
		local name=player:get_player_name() or ""
		local owner=meta:get_string("owner")
		return owner=="" or owner==name or core.check_player_privs(name, {protection_bypass=true})
	end,
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos)
		local name=placer:get_player_name() or ""
		meta:set_string("owner",name)
		core.get_node_timer(pos):start(.1)
		repulser.protect(pos,{range=15})
		core.add_entity(pos, "repulser:field"):set_properties({visual_size = {x=30,y=30}})
	end,
	on_rightclick = function(pos, node, player, itemstack, pointd)
		core.add_entity(pos, "repulser:field"):set_properties({visual_size = {x=30,y=30}})
	end,
	after_destruct = function(pos, oldnode)
		repulser.unprotect(pos,{range=15})
	end,
	on_timer = function (pos, elapsed)
		local meta=core.get_meta(pos)
		local t=meta:get_int("time")
		local t=t+1
		if t>=5 then
			t=0
			repulser.protect(pos,{range=15})
		end
		meta:set_int("time",t)
		for _, ob in ipairs(core.get_objects_inside_radius(pos, 15)) do
			if ob:get_luaentity() ~= nil then
				local ent = ob:get_luaentity()
				if ent.type == "monster" or ent.name == "tsm_pyramids:mummy" or ent.name == "mobs_monster:mese_arrow" or
				ent.name == "dmobs:shuriken" or ent.name == "dmobs:snowball" or ent.name == "es:bullet" or
				ent.name == "mobs:bonebullet" or ent.name == "es:lasershot" or ent.name == "awesome_monsters:star" then
					local pos2=ob:get_pos()
					local d=math.max(1,vector.distance(pos,pos2))
					local r=(8/d)*2
					ob:set_velocity({x=(pos2.x-pos.x)*r, y=(pos2.y-pos.y+.1)*r, z=(pos2.z-pos.z)*r})
				elseif ent.name == "mobs_monster:fireball" or ent.name == "mobs_monster:obsidian_arrow" or ent.name == "mobs_loz:fire" then
					ob:remove()
				end
			end
		end
		return true
	end,
})

core.register_node("repulser:box", {
	drawtype = "nodebox",
	tiles = {"repulser.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -.5, .5},
			{-.5, .5, -.5, .5, .5, .5}, 
			{-.5, -.5, -.5, -.5, .5, .5},
			{.5, -.5, -.5, .5, .5, .5},
			{-.5, -.5, .5, .5, .5, .5},
			{-.5, -.5, -.5, .5, .5, -.5}
		}
	}
})

core.register_entity("repulser:field", {
initial_properties = {
	hp_max = 1,
	physical=false,
	pointable=false,
	visual = "wielditem",
	textures ={"repulser:box"},
},
	on_step=function(self, dtime)
		self.age=self.age+dtime
		if self.age>5 then
		self.object:remove() return end
	end,
	age=0,
})

core.register_craft({
	output = "repulser:block",
	recipe = {
		{"default:steel_ingot"},
		{"default:bronze_block"},
		{"default:steel_ingot"}
	}
})
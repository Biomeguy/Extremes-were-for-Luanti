local function disp(x)
	core.chat_send_all(dump(x))
end

local function check_bit(x,bit)
	return math.floor(x/2^bit)%2==1
end

local wire_radius=2/16
local insulated_wire_radius=3/16

local function make_wire_nodebox(size)
	return {
		type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+

	}
end

local function make_insulated_wire_nodebox(full,include)
	local node_box={type="fixed",fixed={full.fixed}}
	local connects_to={}
	for i=0,5 do
		if check_bit(include,i) then
			local name=inspector.connections[i+1].name
			node_box.fixed[#node_box.fixed+1]=full["connect_"..name]
			connects_to[#connects_to+1]=name
		end
	end
	return node_box,connects_to
end

local wire_connect={"group:placerotated_wire_connect","12wire:insulated_wire_48"}

core.register_node("inspector:wire",{
	description="Wire",
	paramtype="light",
	drawtype="nodebox",
	node_box=make_wire_nodebox(wire_radius),
	connects_to=wire_connect,
	tiles={"default_mese_block.png"},
	groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,placerotated_wire_connect=1},
	walkable = false,
	climbable = true,
})

local function replace_node(pos,placer,new_node)
	local pname= placer:get_player_name()
	if core.is_protected(pos, pname) and not core.check_player_privs(pname, "protection_bypass") then
		core.record_protection_violation(pos, pname)
	else
		core.set_node(pos, new_node)
	end
end

core.register_craftitem("inspector:insulation_tool",{
	description="Insulation Tool",
	inventory_image="pos_wire_insulation.png",
	on_use=function(itemstack,placer,pointd)
		if pointd.under then
			local under=core.get_node(pointd.under)
			if under then
				if under.name=="inspector:wire" then
					replace_node(pointd.under,placer,
						{name="inspector:insulated_wire_"..get_connections(pointd.under)}
					)
				elseif under.name:match("^inspector:insulated_wire_[0-9]+$") then
					replace_node(pointd.under,placer,{name="inspector:wire"})
				end
			end
		end
	end,
})

local function get_sector(x,y,radius)
	if x<-radius then return 1
	elseif x>radius then return 2
	elseif y<-radius then return 3
	elseif y>radius then return 4
	end
end

local function point_to_arm(normal,p)
	local face=core.dir_to_facedir(normal,true)
	if face==4 or face==8 then
		local sector=get_sector(p.x,p.z,insulated_wire_radius)
		if sector then return ({0,1,4,5})[sector]
		elseif face==8 then return 3
		elseif face==4 then return 2
		end
	elseif face==0 or face==2 then
		local sector=get_sector(p.x,p.y,insulated_wire_radius)
		if sector then return ({0,1,2,3})[sector]
		elseif face==0 then return 5
		elseif face==2 then return 4
		end
	elseif face==1 or face==3 then
		local sector=get_sector(p.z,p.y,insulated_wire_radius)
		if sector then return ({4,5,2,3})[sector]
		elseif face==1 then return 1
		elseif face==3 then return 0
		end
	end
end

core.register_craftitem("inspector:wire_cutters",{
	description="Wire cutters",
	inventory_image="pos_wire_cutters.png",
	on_use=function(itemstack,placer,pointd)
		if pointd.under then
			local under=core.get_node(pointd.under)
			if under then
				local field=under.name:match("^inspector:insulated_wire_([0-9]+)$")
				if field then
					local normal,point=inspector.get_point(pointd.above,pointd.under,placer)
					if point then
						local arm=point_to_arm(normal,point)
						if check_bit(field,arm) then
							replace_node(pointd.under,placer,{name="inspector:insulated_wire_"..(field-2^arm)})
						else
							core.set_node(pointd.under,{name="inspector:insulated_wire_"..(field+2^arm)})
						end
					end
				end
			end
		end
	end,
})

local bit_to_texture_index={[0]=4,3,2,1,6,5}
--L R D U F B
local function make_texture_list(field,on,off)
	local list={off,off,off,off,off,off}
	for i=0,5 do
		if check_bit(field,i) then
			list[bit_to_texture_index[i]]=on
		end
	end
	return list
end

local full_box=make_wire_nodebox(insulated_wire_radius)
for i=0,2^6-1 do
	local node_box,connects_to=make_insulated_wire_nodebox(full_box,i)
	local wire_group=1
	if #connects_to==0 then wire_group=0 end
	core.register_node("inspector:insulated_wire_"..i,{
		paramtype="light",
		drawtype="nodebox",
		node_box=node_box,
		connect_sides=connects_to,
		--+Y, -Y, +X, -X, +Z, -Z
		tiles=make_texture_list(i,"fabric_block_blue.png^pos_wire_end.png","fabric_block_blue.png"),
		groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,placerotated_wire_connect=wire_group},
		walkable = false,
		climbable = true,
	})
end

function get_connections(pos)
	local field=0
	for i,connection in ipairs(inspector.connections) do
		if inspector.connects(wire_connect,vector.add(pos,connection.pos),connection.opposite) then
			disp(i)
			field=field+2^(i-1)
		end
	end
	return field
end

-- Node definitions for Homedecor doors

local S = homedecor_i18n.gettext

local function N_(x) return x end

-- doors

local function isSolid(pos, adjust)
    local adj = {x = adjust[1], y = adjust[2], z = adjust[3]}
    local node = core.get_node(vector.add(pos,adj))
    if node then
        local idef = core.registered_nodes[core.get_node(vector.add(pos,adj)).name]
        if idef then
            return idef.walkable
        end
    end
    return false
end

local function countSolids(pos,node,level)
    local solids = 0
    for x = -1, 1 do
        for z = -1, 1 do
            local y = (node.param2 == 5) and -level or level
            -- special cases when x == z == 0
            if x == 0 and z == 0 then
                if level == 1 then
                    -- when looking past the trap door, cannot be solid in center
                    if isSolid(pos,{x,y,z}) then
                        return false
                    end
                    -- no else. it doesn't matter if x == y == z is solid, that's us.
                end
            elseif isSolid(pos,{x,y,z}) then
                solids = solids + 1
            end
        end
    end
    return solids
end

local function calculateClosed(pos)
    local node = core.get_node(pos)
    -- the door is considered closed if it is closing off something.

    local direction = node.param2 % 6
    local isTrap = direction == 0 or direction == 5
    if isTrap then
        -- the trap door is considered closed when all nodes on its sides are solid
        -- or all nodes in the 3x3 above/below it are solid except the center
        for level = 0, 1 do
            local solids = countSolids(pos,node,level)
            if solids == 8 then
                return true
            end
        end
        return false
    else
        -- the door is considered closed when the nodes on its sides are solid
        -- or the 3 nodes in its facing direction are solid nonsolid solid
        -- if the door has two levels (i.e. not a gate) then this must
        -- be true for the top node as well.

        -- sorry I dunno the math to figure whether to x or z
        if direction == 1 or direction == 2 then
            if isSolid(pos,{0,0,-1}) and isSolid(pos,{0,0,1}) then
                if string.find(node.name,'_bottom_') then
                    return calculateClosed({x=pos.x,y=pos.y+1,z=pos.z})
                else
                    return true
                end
            end
            local x = (direction == 1) and 1 or -1
            if isSolid(pos,{x,0,-1}) and not isSolid(pos,{x,0,0}) and isSolid(pos,{x,0,1}) then
                if string.find(node.name,'_bottom_') then
                    return calculateClosed({x=pos.x,y=pos.y+1,z=pos.z})
                else
                    return true
                end
            end
            return false
        else
            -- direction == 3 or 4
            if isSolid(pos,{-1,0,0}) and isSolid(pos,{1,0,0}) then
                if string.find(node.name,'_bottom_') then
                    return calculateClosed({x=pos.x,y=pos.y+1,z=pos.z})
                else
                    return true
                end
            end
            local z = (direction == 3) and 1 or -1
            if isSolid(pos,{-1,0,z}) and not isSolid(pos,{0,0,z}) and isSolid(pos,{1,0,z}) then
                if string.find(node.name,'_bottom_') then
                    return calculateClosed({x=pos.x,y=pos.y+1,z=pos.z})
                else
                    return true
                end
            end
            return false
        end
    end
end

-- isClosed flag, is 0 or 1 0 = open, 1 = closed
local function getClosed(pos)
    local isClosed = core.get_meta(pos):get_string('closed')
    if isClosed=='' then
	return calculateClosed(pos)
    else
        isClosed = tonumber(isClosed)
        -- may be closed or open (1 or 0)
        return isClosed == 1
    end
end

local function addDoorNode(pos,def,isClosed)
    core.set_node(pos, def)
    core.get_meta(pos):set_int('closed', isClosed and 1 or 0)
end

local door_model_list = {
	{	name = "closet_mahogany",
		description = N_("Mahogany Closet Door (@1 opening)"),
		mesh = "homedecor_door_closet.obj",
		usealpha = "clip"
	},

	{	name = "closet_oak",
		description = N_("Oak Closet Door (@1 opening)"),
		mesh = "homedecor_door_closet.obj",
		usealpha = "clip"
	},

	{	name = "exterior_fancy",
		description = N_("Fancy Wood/Glass Door (@1 opening)"),
		mesh = "homedecor_door_fancy.obj",
		tiles = {
			"homedecor_door_exterior_fancy.png",
			"homedecor_door_exterior_fancy_insert.png"
		},
		usealpha = "blend"
	},

	{	name = "glass",
		description = N_("Glass Office Door (@1 opening)"),
		mesh = "homedecor_door_plain.obj",
		usealpha = "clip"
	},

	{	name = "wood_glass_oak",
		description = N_("Glass and Wood, Oak-colored (@1 opening)"),
		mesh = "homedecor_door_wood_glass.obj",
		tiles = {
			"homedecor_door_wood_glass_oak.png",
			"homedecor_door_wood_glass_insert.png",
		},
		usealpha = "clip"
	},

	{	name = "wood_glass_mahogany",
		description = N_("Glass and Wood, Mahogany-colored (@1 opening)"),
		mesh = "homedecor_door_wood_glass.obj",
		tiles = {
			"homedecor_door_wood_glass_mahogany.png",
			"homedecor_door_wood_glass_insert.png",
		},
		usealpha = "clip"
	},

	{	name = "wood_glass_white",
		description = N_("Glass and Wood, White (@1 opening)"),
		mesh = "homedecor_door_wood_glass.obj",
		tiles = {
			"homedecor_door_wood_glass_white.png",
			"homedecor_door_wood_glass_insert.png",
		},
		usealpha = "clip"
	},

	{	name = "wood_plain",
		description = N_("Plain Wooden Door (@1 opening)"),
		mesh = "homedecor_door_plain.obj"
	},

	{	name = "bedroom",
		description = N_("White Bedroom Door (@1 opening)"),
		mesh = "homedecor_door_plain.obj"
	},

	{	name = "wrought_iron",
		description = N_("Wrought Iron Gate/Door (@1 opening)"),
		mesh = "homedecor_door_wrought_iron.obj",
		usealpha = "clip"
	},

	{	name = "woodglass",
		description = N_("Wooden door with glass insert (@1 opening)"),
		mesh = "homedecor_door_woodglass_typea.obj",
		tiles = {
			"homedecor_door_woodglass_typea.png",
			"homedecor_door_woodglass_typea_insert.png",
		},
		usealpha = "blend"
	},

	{	name = "woodglass2",
		description = N_("Wooden door with glass insert, type 2 (@1 opening)"),
		mesh = "homedecor_door_plain.obj",
		usealpha = "blend"
	},
}

local def_selbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, 0.375, 0.5, 1.5, 0.5 }
}

local sides = { N_("left"), N_("right") }

for i, side in ipairs(sides) do

	for _, door_model in ipairs(door_model_list) do

		local doorname = door_model.name

		local selbox = door_model.selectbox or def_selbox
		local colbox = door_model.collisionbox or door_model.selectbox or def_selbox
		local mesh = door_model.mesh
		local groups = {snappy = 3}

		if side == "right" then
			mesh = string.gsub(door_model.mesh, ".obj", "_right.obj")
			groups = {snappy = 3, not_in_creative_inventory = 1}
		end

		core.register_node("decor:door_"..doorname.."_"..side, {
			description = S(door_model.description, S(side)),
			drawtype = "mesh",
			mesh = mesh,
			tiles = door_model.tiles or { "homedecor_door_"..doorname..".png" },
			inventory_image = "homedecor_door_"..doorname.."_inv.png",
			wield_image = "homedecor_door_"..doorname.."_inv.png",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = groups,
			sounds = default.node_sound_wood_defaults(),
			use_texture_alpha = door_model.usealpha,
			selection_box = selbox,
			collision_box = colbox,
			on_rotate = screwdriver.rotate_simple,
			on_place = function(itemstack, placer, pointd)
				return homedecor.stack_wing(itemstack, placer, pointd,
					"decor:door_"..doorname.."_left", "air",
					"decor:door_"..doorname.."_right", "air")
			end,
			on_construct = function(pos)
				core.get_meta(pos):set_int("closed", 1)
			end,
			on_rightclick = function(pos, node, clicker, itemstack, pointd)
				homedecor.flip_door(pos, node, clicker, doorname, side)
				return itemstack
			end,
		    -- both left and right doors may be used for open or closed doors
		    -- so they have to have both action_on and action_off and just
		    -- check when that action is invoked if to continue

		    on_punch = function(pos, node, puncher)
		        core.get_meta(pos):set_string('closed',nil)
		    end,
			drop = "decor:door_"..doorname.."_left",
		    mesecons = {
		        effector = {
		            action_on = function(pos,node)
		                local isClosed = getClosed(pos)
		                if isClosed then
		                    homedecor.flip_door(pos,node,nil,doorname,side,isClosed)
		                end
		            end,
		            action_off = function(pos,node)
		                local isClosed = getClosed(pos)
		                if not isClosed then
		                    homedecor.flip_door(pos,node,nil,doorname,side,isClosed)
		                end
		            end
		        }
		    }
		})

		core.register_alias("decor:door_"..doorname.."_top_"..side, "air")
		core.register_alias("decor:door_"..doorname.."_bottom_"..side, "decor:door_"..doorname.."_"..side)

	end

	core.register_alias("decor:door_wood_glass_top_"..side, "air")
	core.register_alias("decor:door_wood_glass_bottom_"..side, "decor:door_wood_glass_oak_"..side)

end

-- Gates

local gate_list = {
	{ "picket",          S("Unpainted Picket Fence Gate") },
	{ "picket_white",    S("White Picket Fence Gate")     },
	{ "chainlink",       S("Chainlink Fence Gate")        }
}

local gate_models_closed = {
	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -8/16, -8/16, 6/16, -6/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16, 6/16,  8/16,  8/16,  8/16 },	-- right post
	 { -8/16,  7/16, 13/32, 8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32, 8/16, -7/16, 15/32 },	-- bottom piece
	 { -6/16, -8/16,  7/16, 6/16,  8/16,  7/16 }},	-- the wire

	{{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
	 { -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 },	-- the chainlink itself
	 { -8/16, -3/16,  6/16, -6/16,  3/16,  8/16 }},	-- the lump representing the lock

	{{ -8/16, -8/16, 6/16, 8/16, 8/16, 8/16 }}, -- the whole door :P

	{{ -8/16, -8/16, 6/16, 8/16, 8/16, 8/16 }}, -- the whole door :P

}

local gate_models_open = {
	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},

	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},

	{{  6/16, -8/16, -8/16,  8/16,  8/16, -6/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -6/16,  7/16,  8/16,  6/16 }},	-- the wire

	{{  6/16, -8/16, -8/16,  8/16,  8/16, -7/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -8/16,  7/16,  8/16,  8/16 },	-- the chainlink itself
	 {  6/16, -3/16, -8/16,  8/16,  3/16, -6/16 }},	-- the lump representing the lock

	{{ 6/16, -8/16, -8/16, 8/16, 8/16, 8/16 }}, -- the whole door :P

	{{ 6/16, -8/16, -8/16, 8/16, 8/16, 8/16 }}, -- the whole door :P
}

for i, g in ipairs(gate_list) do

	local gate, gatedesc = unpack(g)

	local tiles = {
		"homedecor_gate_"..gate.."_tb.png",
		"homedecor_gate_"..gate.."_tb.png",
		"homedecor_gate_"..gate.."_lr.png",
		"homedecor_gate_"..gate.."_lr.png",
		"homedecor_gate_"..gate.."_fb.png^[transformFX",
		"homedecor_gate_"..gate.."_fb.png"
	}

	if gate == "picket" or gate == "picket_white" then
		tiles = {
			"blank.png",
			"blank.png",
			"blank.png",
			"blank.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_front.png"
		}
	end

    local def = {
		drawtype = "nodebox",
		description = gatedesc,
		tiles = tiles,
		paramtype = "light",
		use_texture_alpha = "clip",
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_closed[i]
		},
		on_rightclick = function(pos, node, clicker, itemstack, pointd)
			homedecor.flip_gate(pos, node, clicker, gate, "closed")
			return itemstack
		end,
        mesecons = {
            effector = {
                action_on = function(pos,node) homedecor.flip_gate(pos,node,nil,gate, "closed") end
            }
        }
	}

    -- gates when placed default to closed, closed.

	core.register_node("decor:gate_"..gate.."_closed", def)

    -- this is either a terrible idea or a great one
    def = table.copy(def)
    def.groups.not_in_creative_inventory = 1
    def.selection_box.fixed = { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
    def.node_box.fixed = gate_models_open[i]
	def.tiles = {
		tiles[1].."^[transformR90",
		tiles[2].."^[transformR270",
		tiles[6],
		tiles[5],
		tiles[4],
		tiles[3]
	}
    def.drop = "decor:gate_"..gate.."_closed"
	def.on_rightclick = function(pos, node, clicker, itemstack, pointd)
        homedecor.flip_gate(pos, node, clicker, gate, "open")
        return itemstack
	end
    def.mesecons.effector = {
        action_off = function(pos,node) homedecor.flip_gate(pos,node,nil,gate, "open") end
    }

	core.register_node("decor:gate_"..gate.."_open", def)
end

core.register_alias("decor:fence_chainlink_gate_open",      "decor:gate_chainlink_open")
core.register_alias("decor:fence_chainlink_gate_closed",    "decor:gate_chainlink_closed")
core.register_alias("decor:fence_picket_gate_open",         "decor:gate_picket_open")
core.register_alias("decor:fence_picket_gate_closed",       "decor:gate_picket_closed")
core.register_alias("decor:fence_picket_gate_white_open",   "decor:gate_picket_white_open")
core.register_alias("decor:fence_picket_gate_white_closed", "decor:gate_picket_white_closed")

-- to open a door, you switch left for right and subtract from param2, or vice versa right for left
-- that is to say open "right" doors become left door nodes, and open left doors right door nodes.
-- also adjusting param2 so the node is at 90 degrees.

function homedecor.flip_door(pos, node, player, name, side, isClosed)
    if isClosed == nil then
        isClosed = getClosed(pos)
    end
    -- this is where we swap the isClosed status!
    -- i.e. if isClosed, we're adding an open door
    -- and if not isClosed, a closed door
    isClosed = not isClosed

	local rside
	local nfdir
	local ofdir = node.param2 or 0
	if side == "left" then
		rside = "right"
		nfdir=ofdir - 1
		if nfdir < 0 then nfdir = 3 end
	else
		rside = "left"
		nfdir=ofdir + 1
		if nfdir > 3 then nfdir = 0 end
	end
	local sound = isClosed and 'close' or 'open'
	core.sound_play("homedecor_door_"..sound, {
		pos=pos,
        max_hear_distance = 5,
		gain = 2,
	})
    -- XXX: does the top half have to remember open/closed too?
	core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "decor:door_"..name.."_top_"..rside, param2=nfdir})

    addDoorNode(pos,{ name = "decor:door_"..name.."_bottom_"..rside, param2=nfdir },isClosed)
end

function homedecor.flip_gate(pos, node, player, gate, oc)
    local isClosed = getClosed(pos);
    core.sound_play("homedecor_gate_open_close", {
		pos=pos,
		max_hear_distance = 5,
		gain = 2,
	})

	local fdir = node.param2 or 0

    -- since right facing gates use "open" nodes for closed, we need an
    -- isClosed flag to tell if it's "really" closed.

	local gateresult
	if oc == "closed" then
		gateresult = "decor:gate_"..gate.."_open"
	else
		gateresult = "decor:gate_"..gate.."_closed"
	end

    local def = {name=gateresult, param2=fdir}

    addDoorNode(pos, def, isClosed)

    -- the following opens and closes gates below and above in sync with this one
    -- (without three gate open/close sounds)

    local above = {x=pos.x, y=pos.y+1, z=pos.z}
    local below = {x=pos.x, y=pos.y-1, z=pos.z}
    local nodeabove = core.get_node(above)
    local nodebelow = core.get_node(below)

	if string.find(nodeabove.name, "decor:gate_"..gate) then
        addDoorNode(above, def, isClosed)
	end

	if string.find(nodebelow.name, "decor:gate_"..gate) then
        addDoorNode(below, def, isClosed)
	end
end

-- Japanese-style wood/paper wall pieces and door

local jp_cbox = {
	type = "fixed",
	fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.0625},
}

core.register_node("decor:japanese_wall_top", {
	description = S("Japanese wall (top)"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_top.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:japanese_wall_middle", {
	description = S("Japanese wall"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_middle.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:japanese_wall_bottom", {
	description = S("Japanese wall (bottom)"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_bottom.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:tatami_mat", {
	tiles = {"homedecor_tatami.png"},
	description = S("Japanese tatami"),
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	}
})

homedecor.register("door_japanese_closed", {
	description = S("Japanese-style door"),
	inventory_image = "homedecor_door_japanese_inv.png",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	mesh = "homedecor_door_japanese_closed.obj",
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 1.5, 0.0625},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 1.5, 0},
	},
	expand = { top = "placeholder" },
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		core.set_node(pos, {name = "decor:door_japanese_open", param2 = node.param2})
		return itemstack
	end
})

homedecor.register("door_japanese_open", {
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	mesh = "homedecor_door_japanese_open.obj",
	groups = { snappy = 3, not_in_creative_inventory = 1 },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.disallow,
	selection_box = {
		type = "fixed",
		fixed = {-1.5, -0.5, -0.0625, 0.5, 1.5, 0},
	},
	collision_box = {
		type = "fixed",
		fixed = {-1.5, -0.5, -0.0625, -0.5, 1.5, 0},
	},
	expand = { top = "placeholder" },
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		core.set_node(pos, {name = "decor:door_japanese_closed", param2 = node.param2})
		return itemstack
	end,
	drop = "decor:door_japanese_closed",
})

homedecor.register("fence_brass", {
	description = S("Fence/railing (@1)", S("brass")),
	drawtype = "fencelike",
	tiles = {"basic_materials_chain_brass.png"},
	inventory_image = "homedecor_fence_brass.png",
	check_for_pole = true,
	selection_box = homedecor.nodebox.bar_y(1/7),
	collision_box = homedecor.nodebox.bar_y(1/7),
	groups = {snappy=3},
	sounds = default.node_sound_metal_defaults(),
})

homedecor.register("fence_wrought_iron", {
	description = S("Fence/railing (@1)", S("wrought iron")),
	drawtype = "fencelike",
	tiles = {"homedecor_generic_metal_wrought_iron.png"},
	inventory_image = "homedecor_fence_wrought_iron.png",
	check_for_pole = true,
	selection_box = homedecor.nodebox.bar_y(1/7),
	collision_box = homedecor.nodebox.bar_y(1/7),
	groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
})

-- other types of fences

homedecor.register("fence_picket", {
	description = S("Unpainted Picket Fence"),
	tiles = {
		"blank.png",
		"blank.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket.png"
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.1),
	node_box = homedecor.nodebox.slab_z(-0.002),
})

homedecor.register("fence_picket_corner", {
	description = S("Unpainted Picket Fence Corner"),
	tiles = {
		"blank.png",
		"blank.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket.png",
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.1, -0.1),
	node_box = homedecor.nodebox.corner_xz(0.002, -0.002),
})

homedecor.register("fence_picket_white", {
	description = S("White Picket Fence"),
	tiles = {
		"blank.png",
		"blank.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white.png"
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.1),
	node_box = homedecor.nodebox.slab_z(-0.002),
})

homedecor.register("fence_picket_corner_white", {
	description = S("White Picket Fence Corner"),
	tiles = {
		"blank.png",
		"blank.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white.png",
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.1, -0.1),
	node_box = homedecor.nodebox.corner_xz(0.002, -0.002),
})

homedecor.register("fence_privacy", {
	description = S("Wooden Privacy Fence"),
	tiles = {
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_backside.png",
		"homedecor_fence_privacy_front.png"
	},
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-3/16),
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16, 5/16, -5/16,  8/16, 7/16 },	-- left part
			{ -4/16, -8/16, 5/16,  3/16,  8/16, 7/16 },	-- middle part
			{  4/16, -8/16, 5/16,  8/16,  8/16, 7/16 },	-- right part
			{ -8/16, -2/16, 7/16,  8/16,  2/16, 8/16 },	-- connecting rung
		}
	},
})

homedecor.register("fence_privacy_corner", {
	description = S("Wooden Privacy Fence Corner"),
	tiles = {
		"homedecor_fence_privacy_corner_tb.png",
		"homedecor_fence_privacy_corner_tb.png^[transformFY",
		"homedecor_fence_privacy_corner_right.png",
		"homedecor_fence_privacy_backside2.png",
		"homedecor_fence_privacy_backside.png",
		"homedecor_fence_privacy_corner_front.png"
	},
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			homedecor.box.slab_z(-3/16),
			{ -0.5, -0.5, -0.5, -5/16, 0.5, 5/16 },
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -7/16, -8/16, 5/16, -5/16, 8/16, 7/16 },	-- left part
			{ -4/16, -8/16, 5/16,  3/16, 8/16, 7/16 },	-- middle part
			{  4/16, -8/16, 5/16,  8/16, 8/16, 7/16 },	-- right part
			{ -8/16, -2/16, 7/16,  8/16, 2/16, 8/16 },	-- back-side connecting rung

			{ -7/16, -8/16,  4/16, -5/16, 8/16,  7/16 },	-- back-most part
			{ -7/16, -8/16, -4/16, -5/16, 8/16,  3/16 },	-- middle part
			{ -7/16, -8/16, -8/16, -5/16, 8/16, -5/16 },	-- front-most part
			{ -8/16, -2/16, -8/16, -7/16, 2/16,  7/16 },	-- left-side connecting rung
		}
	},
})

homedecor.register("fence_chainlink", {
	description = S("Chainlink Fence"),
	mesh="homedecor_fence_chainlink.obj",
	tiles = {
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_fb.png",
		"homedecor_fence_chainlink_fb.png",
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.125),
	collision_box = homedecor.nodebox.slab_z(-0.125),
})


homedecor.register("fence_chainlink_corner", {
	description = S("Chainlink Fence Corner"),
	mesh = "homedecor_fence_chainlink_corner.obj",
	tiles = {
		"homedecor_fence_chainlink_corner_top.png",
		"homedecor_fence_chainlink_corner_top.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.125, -0.125),
	collision_box = homedecor.nodebox.corner_xz(0.125, -0.125),
})

homedecor.register("fence_wrought_iron_2", {
	description = S("Wrought Iron fence (type 2)"),
	tiles = {
		"homedecor_fence_wrought_iron_2_tb.png",
		"homedecor_fence_wrought_iron_2_tb.png",
		"homedecor_fence_wrought_iron_2_sides.png",
		"homedecor_fence_wrought_iron_2_sides.png",
		"homedecor_fence_wrought_iron_2_fb.png",
		"homedecor_fence_wrought_iron_2_fb.png"
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.08),
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16,  14/32, -7.75/16,  8/16,  16/32 }, -- left post
			{  7.75/16, -8/16,  14/32,  8/16,  8/16,  16/32 }, -- right post
			{ -8/16,  7.75/16, 14/32,  8/16,  8/16, 16/32 }, -- top piece
			{ -8/16,  -0.015625, 14.75/32,  8/16,  0.015625, 15.25/32 }, -- cross piece
			{ -0.015625, -8/16,  14.75/32,  0.015625,  8/16,  15.25/32 }, -- cross piece
			{ -8/16, -8/16, 14/32,  8/16, -7.75/16, 16/32 }, -- bottom piece
			{ -8/16, -8/16,  15/32,  8/16,  8/16,  15/32 }	-- the grid itself
		}
	},
})

homedecor.register("fence_wrought_iron_2_corner", {
	description = S("Wrought Iron fence (type 2) Corner"),
	tiles = {
		"homedecor_fence_corner_wrought_iron_2_tb.png",
		"homedecor_fence_corner_wrought_iron_2_tb.png",
		"homedecor_fence_corner_wrought_iron_2_sides.png^[transformFX",
		"homedecor_fence_corner_wrought_iron_2_sides.png",
		"homedecor_fence_corner_wrought_iron_2_sides.png^[transformFX",
		"homedecor_fence_corner_wrought_iron_2_sides.png"
	},
	use_texture_alpha = "clip",
	groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.08, -0.08),
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, 0.453125, -0.453125, 0.5, 0.5 }, -- corner edge
			{ -7.5/16,  7.75/16, 14/32,  8/16,  8/16, 16/32 },	-- top piece
			{ -7.5/16, -8/16, 14/32,  8/16, -7.75/16, 16/32 },	-- bottom piece
			{ -16/32,  7.75/16, -8/16, -14/32,  8/16,  8/16 },	-- top piece, side
			{ -16/32, -8/16, -8/16, -14/32, -7.75/16,  8/16 },	-- bottom piece, side
			{ -7.5/16, -8/16,  7.5/16,  8/16,  8/16,  7.5/16 },	-- the grid itself
			{ -7.5/16, -8/16, -8/16,  -7.5/16,  8/16,  7.5/16 },	-- the grid itself, side
			{ -15.5/32, -0.5, -0.5, -14.5/32, 0.5, -0.484375 }, -- left post side
			{  7.75/16, -8/16,  14.5/32,  8/16,  8/16,  15.5/32 }, -- right post
			{ -8/16,  -0.015625, 14.75/32,  8/16,  0.015625, 15.25/32 }, -- cross piece
			{ -0.015625, -8/16,  14.75/32,  0.015625,  8/16,  15.25/32 }, -- cross piece
			{ -15.25/32, -0.5, -0.015625, -14.75/32, 0.5, 0.015625 }, -- cross piece side
			{ -15.25/32, -0.015625, -0.5, -14.75/32, 0.015625, 0.5 } -- cross piece side
		}
	},
})

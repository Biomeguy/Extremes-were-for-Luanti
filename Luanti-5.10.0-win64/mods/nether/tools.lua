--[[

  Copyright (C) 2020 lortas

  Permission to use, copy, modify, and/or distribute this software for
  any purpose with or without fee is hereby granted, provided that the
  above copyright notice and this permission notice appear in all copies.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
  WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR
  BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES
  OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  SOFTWARE.

]]--

local S = nether.get_translator

core.register_tool("nether:pick_nether", {
	description = S("Nether Pickaxe\nWell suited for mining netherrack"),
	_doc_items_longdesc = S("Uniquely suited for mining netherrack, with minimal wear when doing so. Blunts quickly on other materials."),
	inventory_image = "nether_tool_netherpick.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.90, [2]=0.9, [3]=0.3}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1},

	after_use = function(itemstack, user, node, digparams)
		local wearDivisor = 1
		local nodeDef = core.registered_nodes[node.name]
		if nodeDef ~= nil and nodeDef.groups ~= nil then
			-- The nether pick hardly wears out when mining netherrack
			local workable = nodeDef.groups.workable_with_nether_tools or 0
			wearDivisor =  1 + (3 * workable) -- 10 for netherrack, 1 otherwise. Making it able to mine 350 netherrack nodes, instead of 35.
		end

		local wear = math.floor(digparams.wear / wearDivisor)
		itemstack:add_wear(wear)  -- apply the adjusted wear as usual
		return itemstack
	end
})

core.register_tool("nether:shovel_nether", {
	description = S("Nether Shovel"),
	inventory_image = "nether_tool_nethershovel.png",
	wield_image = "nether_tool_nethershovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.0, [2]=0.4, [3]=0.25}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("nether:axe_nether", {
	description = S("Nether Axe"),
	inventory_image = "nether_tool_netheraxe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.9, [2]=0.7, [3]=0.4}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("nether:sword_nether", {
	description = S("Nether Sword"),
	inventory_image = "nether_tool_nethersword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.5, [2]=0.6, [3]=0.2}, uses=45, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_craftitem("nether:nether_ingot", {
	description = S("Nether Ingot"),
	inventory_image = "nether_nether_ingot.png"
})
core.register_craftitem("nether:nether_lump", {
	description = S("Nether Lump"),
	inventory_image = "nether_nether_lump.png",
})

core.register_craft({
	type = "cooking",
	output = "nether:nether_ingot",
	recipe = "nether:nether_lump",
	cooktime = 30,
})
core.register_craft({
	output = "nether:nether_lump",
	recipe = {
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"},
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"},
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"}
	}
})

core.register_craft({
	output = "nether:pick_nether",
	recipe = {
		{"nether:nether_ingot","nether:nether_ingot","nether:nether_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})
core.register_craft({
	output = "nether:shovel_nether",
	recipe = {
		{"nether:nether_ingot"},
		{"group:stick"},
		{"group:stick"}
	}
})
core.register_craft({
	output = "nether:axe_nether",
	recipe = {
		{"nether:nether_ingot","nether:nether_ingot"},
		{"nether:nether_ingot","group:stick"},
		{"","group:stick"}
	}
})
core.register_craft({
	output = "nether:sword_nether",
	recipe = {
		{"nether:nether_ingot"},
		{"nether:nether_ingot"},
		{"group:stick"}
	}
})




--===========================--
--== Nether Staff of Light ==--
--===========================--

nether.lightstaff_recipes = {
	["nether:rack"]                 = "nether:glowstone",
	["nether:brick"]                = "nether:glowstone",
	["nether:brick_cracked"]        = "nether:glowstone",
	["nether:brick_compressed"]     = "nether:glowstone",
	["stairs:slab_netherrack"]      = "nether:glowstone",
	["nether:rack_deep"]            = "nether:glowstone_deep",
	["nether:brick_deep"]           = "nether:glowstone_deep",
	["stairs:slab_netherrack_deep"] = "nether:glowstone_deep"
}
nether.lightstaff_range    = 100
nether.lightstaff_velocity = 60
nether.lightstaff_gravity  = 0  -- using 0 instead of 10 because projectile arcs look less magical - magic isn't affected by gravity ;) (but set this to 10 if you're making a crossbow etc.)
nether.lightstaff_uses     = 60 -- number of times the Eternal Lightstaff can be used before wearing out
nether.lightstaff_duration = 40 -- lifespan of glowstone created by the termporay Lightstaff

-- 'serverLag' is a rough amount to reduce the projected impact-time the server must wait before initiating the
-- impact events (i.e. node changing to glowstone with explosion particle effect).
-- In tests using https://github.com/jagt/clumsy to simulate network lag I've found this value to not noticeably
-- matter. A large network lag is noticeable in the time between clicking fire and when the shooting-particleEffect
-- begins, as well as the time between when the impact sound/particleEffect start and when the netherrack turns
-- into glowstone. The synchronization that 'serverLag' adjusts seems to already tolerate network lag well enough (at
-- least when lag is consistent, as I have not simulated random lag)
local serverLag = 0.05 -- in seconds. Larger values makes impact events more premature/early.

-- returns a pointd, or nil if no solid node intersected the ray
local function raycastForSolidNode(rayStartPos, rayEndPos)

	local raycast = core.raycast(
		rayStartPos,
		rayEndPos,
		false, -- objects - if false, only nodes will be returned. Default is `true`
		true   -- liquids - if false, liquid nodes won't be returned. Default is `false`
	)
	local next_pointed = raycast:next()
	while next_pointed do
		local under_node = core.get_node(next_pointed.under)
		local under_def = core.registered_nodes[under_node.name]

		if (under_def and not under_def.buildable_to) or not under_def then
			return next_pointed
		end

		next_pointed  = raycast:next(next_pointed)
	end
	return nil
end

-- Turns a node into a light source
-- `lightDuration` 0 is considered permanent, lightDuration is in seconds
-- returns true if a node is transmogrified into a glowstone
local function light_node(pos, playerName, lightDuration)

	local result = false
	if core.is_protected(pos, playerName) then
		core.record_protection_violation(pos, playerName)
		return false
	end

	local oldNode = core.get_node(pos)
	local litNodeName = nether.lightstaff_recipes[oldNode.name]

	if litNodeName ~= nil then
		result = nether.magicallyTransmogrify_node(
			pos,
			playerName,
			{name=litNodeName},
			{name = "nether_rack_destroy", gain = 0.8},
			lightDuration == 0 -- isPermanent
		)

		if lightDuration > 0 then
			core.after(lightDuration,
				function()
					-- Restore the node to its original type.
					--
					-- If the server crashes or shuts down before this is invoked, the node
					-- will remain in its transmogrified state. These could be cleaned up
					-- with an LBM, but I don't think that's necessary: if this functionality
					-- is only being used for the Nether Lightstaff then I don't think it
					-- matters if there's occasionally an extra glowstone left in the
					-- netherrack.
					nether.magicallyTransmogrify_node(pos, playerName)
				end
			)
		end
	end
	return result
end

-- a lightDuration of 0 is considered permanent, lightDuration is in seconds
-- returns true if a node is transmogrified into a glowstone
local function lightstaff_on_use(user, boltColorString, lightDuration)

	if not user then return false end
	local pname			= user:get_player_name()
	local playerlookDir = user:get_look_dir()
	local playerPos		= user:get_pos()
	local playerEyePos	= vector.add(playerPos, {x = 0, y = 1.5, z = 0}) -- not always the cameraPos, e.g. 3rd person mode.
	local target		= vector.add(playerEyePos, vector.multiply(playerlookDir, nether.lightstaff_range))

	local targetHitPos  = nil
	local targetNodePos = nil
	local target_pointed = raycastForSolidNode(playerEyePos, target)
	if target_pointed then
		targetNodePos = target_pointed.under
		targetHitPos = vector.divide(vector.add(target_pointed.under, target_pointed.above), 2)
	end

	local wieldOffset = {x= 0.5, y = -0.2, z= 0.8}
	local lookRotation =  ({x = -user:get_look_vertical(), y = user:get_look_horizontal(), z = 0})
	local wieldPos = vector.add(playerEyePos, vector.rotate(wieldOffset, lookRotation))
	local aimPos = targetHitPos or target
	local distance = math.abs(vector.length(vector.subtract(aimPos, wieldPos)))
	local flightTime = distance / nether.lightstaff_velocity
	local dropDistance = nether.lightstaff_gravity * 0.5 * (flightTime * flightTime)
	aimPos.y = aimPos.y + dropDistance
	local boltDir = vector.normalize(vector.subtract(aimPos, wieldPos))

	core.sound_play("nether_lightstaff", {to_player = pname, gain = 0.8}, true)

	-- animate a "magic bolt" from wieldPos to aimPos
	local particleSpawnDef = {
		amount = 20,
		time = 0.4,
		minpos = vector.add(wieldPos, -0.13),
		maxpos = vector.add(wieldPos,  0.13),
		minvel = vector.multiply(boltDir, nether.lightstaff_velocity - 0.3),
		maxvel = vector.multiply(boltDir, nether.lightstaff_velocity + 0.3),
		minacc = {x=0, y=-nether.lightstaff_gravity, z=0},
		maxacc = {x=0, y=-nether.lightstaff_gravity, z=0},
		exptime = {min = 1, max = 2},
		minsize = 4,
		maxsize = 5,
		collisiondetection = true,
		collision_removal = true,
		texture = "nether_particle_anim3.png",
		animation = { type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = .8 },
		glow = 15 }
	core.add_particlespawner(particleSpawnDef)
	particleSpawnDef.texture = "nether_particle_anim3.png^[colorize:" .. boltColorString .. ":alpha"
	particleSpawnDef.amount  = 12
	particleSpawnDef.time    = 0.2
	particleSpawnDef.minsize = 6
	particleSpawnDef.maxsize = 7
	particleSpawnDef.minpos  = vector.add(wieldPos, -0.35)
	particleSpawnDef.maxpos  = vector.add(wieldPos,  0.35)
	core.add_particlespawner(particleSpawnDef)

	local result = false
	if targetNodePos then
		-- delay the impact until roughly when the particle effects will have reached the target
		core.after(
			math.max(0, (distance / nether.lightstaff_velocity) - serverLag),
			function()
				light_node(targetNodePos, pname, lightDuration)
			end
		)

		if lightDuration ~= 0 then
			-- we don't need to care whether the transmogrify will be successful
			result = true
		else
			-- check whether the transmogrify will be successful
			local targetNode = core.get_node(targetNodePos)
			result = nether.lightstaff_recipes[targetNode.name] ~= nil
		end
	end
	return result
end

-- Inspired by FaceDeer's torch crossbow and Xanthin's Staff of Light
core.register_tool("nether:lightstaff", {
	description = S("Nether staff of Light\nTemporarily transforms the netherrack into glowstone"),
	inventory_image = "nether_lightstaff.png",
	wield_image     = "nether_lightstaff.png",
	light_source = 11, -- used by wielded_light mod etc.
	stack_max = 1,
	on_use = function(itemstack, user, pointd)
		lightstaff_on_use(user, "#F70", nether.lightstaff_duration)
	end
})

core.register_tool("nether:lightstaff_eternal", {
	description = S("Nether staff of Eternal Light\nCreates glowstone from netherrack"),
	inventory_image = "nether_lightstaff.png^[colorize:#55F:90",
	wield_image     = "nether_lightstaff.png^[colorize:#55F:90",
	light_source = 11, -- used by wielded_light mod etc.
	sound = {breaks = "default_tool_breaks"},
	stack_max = 1,
	on_use = function(itemstack, user, pointd)
		if lightstaff_on_use(user, "#23F", 0) then -- was "#8088FF" or "#13F"
			-- The staff of Eternal Light wears out, to limit how much
			-- a player can alter the nether with it.
			itemstack:add_wear(65535 / (nether.lightstaff_uses - 1))
		end
		return itemstack
	end
})

local chest_content = {
	{"nether:rack",			36,  144,	6},
	{"nether:glowstone",	18,  36,	4},
	{"nether:nether_lump",	9,   18,	3},
	{"nether:lightstaff",			6,	1,	2},
	{"nether:lightstaff_eternal",	3,	1,	2},
	{"nether:book_of_portals",	3,	1,	2}
}

core.register_node("nether:chest_placer", {
	description = S("Chest Placer"),
	tiles = {"default_cloud.png"},
	inventory_image = "unknown_node.png",
	paramtype2 = "facedir",
	diggable = false,
	drop = "",
	on_blast = function() end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 0 or p2 == 1 or p2 == 2 or p2 == 3 then
	core.set_node(pos, {name = "default:chest", param2 = p2})
	local inv = core.get_meta(pos):get_inventory()

	local count
	for _,v in ipairs(chest_content) do
		-- repeat this many times
		for count=1, v[4] do
	local inv_size = inv:get_size('main')
	-- to avoid too many things inside a chest, lower chance
	if(count<30 -- make sure it does not get too much and there is still room for a new stack
		and ( core.registered_nodes[ v[1] ] or core.registered_items[ v[1] ]) and inv_size and inv_size > 0
		and v[2] > math.random(1, 99)) then
	-- add itemstack at a random empty position in the chest's inventory
	local index = math.random(1, inv:get_size("main"))
	local stack = ItemStack({name = v[1], count = math.random(1, v[3])})
	if inv:get_stack("main", index):is_empty() then
		inv:set_stack("main", index, stack)
	else
		inv:add_item("main", stack)
	end
	count = count+1
	end
		end
	end

		end
	end,
	groups = {cracky = 11, timer_check = 1, not_in_creative_inventory = 1},
})

local B = {name = "nether:brick", force_place = true}
local b = {name = "nether:brick"}
local C = {name = "nether:brick_cracked", force_place = true}
local F = {name = "nether:fence_nether_brick", force_place = true}

local hideout = {size = {x = 9, y = 8, z = 9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,b,b,b,_,_,_,
_,_,b,C,B,C,b,_,_,
_,_,b,F,F,F,b,_,_,
_,_,b,B,C,B,b,_,_,
_,_,b,b,b,b,b,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,b,b,b,_,_,_,
_,_,b,B,B,B,b,_,_,
_,b,B,I,I,I,B,b,_,
_,b,B,I,I,I,B,b,_,
_,b,B,I,I,I,B,b,_,
_,b,B,C,B,C,B,b,_,
_,_,b,b,b,b,b,_,_,
_,_,_,_,_,_,_,_,_,

_,_,b,b,b,b,b,_,_,
_,b,B,B,B,B,B,b,_,
b,B,I,I,{name = "nether:chest_placer", param2 = 2, force_place = true},I,I,B,b,
b,B,I,I,I,I,I,B,b,
b,B,I,I,I,I,I,B,b,
b,B,B,I,I,I,B,B,b,
_,b,b,B,C,B,b,b,_,
_,_,_,b,b,b,_,_,_,

_,b,b,b,b,b,b,b,_,
b,B,B,B,B,B,B,B,b,
C,I,I,I,I,I,I,I,C,
F,I,I,I,I,I,I,I,F,
B,I,I,I,I,I,I,I,B,
b,C,I,I,I,I,I,C,b,
_,b,B,B,I,B,B,b,_,
_,_,b,b,B,b,b,_,_,

_,b,b,b,b,b,b,b,_,
b,B,B,B,B,B,B,B,b,
B,I,{name = "nether:chest_placer", param2 = 3, force_place = true},I,I,I,{name = "nether:chest_placer", param2 = 1, force_place = true},I,B,
F,I,I,I,I,I,I,I,F,
C,I,I,I,I,I,I,I,C,
b,B,I,I,I,I,I,B,b,
_,b,C,I,I,I,C,b,_,
_,_,b,B,B,B,b,_,_,

_,b,b,b,b,b,b,b,_,
b,B,B,B,B,B,B,B,b,
C,I,I,I,I,I,I,I,C,
F,I,I,I,I,I,I,I,F,
B,I,I,I,I,I,I,I,B,
b,C,I,I,I,I,I,C,b,
_,b,B,B,I,B,B,b,_,
_,_,b,b,B,b,b,_,_,

_,_,b,b,b,b,b,_,_,
_,b,B,B,B,B,B,b,_,
b,B,I,I,{name = "nether:chest_placer", force_place = true},I,I,B,b,
b,B,I,I,I,I,I,B,b,
b,B,I,I,I,I,I,B,b,
b,B,B,I,I,I,B,B,b,
_,b,b,B,C,B,b,b,_,
_,_,_,b,b,b,_,_,_,

_,_,_,b,b,b,_,_,_,
_,_,b,B,B,B,b,_,_,
_,b,B,I,I,I,B,b,_,
_,b,B,I,I,I,B,b,_,
_,b,B,I,I,I,B,b,_,
_,b,B,C,B,C,B,b,_,
_,_,b,b,b,b,b,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,b,b,b,_,_,_,
_,_,b,C,B,C,b,_,_,
_,_,b,F,F,F,b,_,_,
_,_,b,B,C,B,b,_,_,
_,_,b,b,b,b,b,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_}}

local schem_auto = core.settings:get_bool("auto_spawn_structures") and 1 or 0

core.register_node("nether:hideout", {
	description = S("Hideout"),
	tiles = {"nether_hideout_spawner.png"},
	inventory_image = "nether_hideout_spawner.png",
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:ocealite" then
			core.get_node_timer(pos):start(5)
			if core.settings:get_bool("enable_schem_spawn_announce") == true then
				core.chat_send_player(puncher:get_player_name(), S("In 5, 4, 3, 2, 1."))
			end
		else
	local meta = core.get_meta(pos)
	meta:set_string("infotext", S("Hideout; size 3 (-2, 5) 3"))
		end
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 5, {"ignore", "default:bedrock_barrier", "group:cashe_spawner", "group:schem_spawner"}) then
			core.get_node_timer(pos):start(300)
			core.chat_send_all(core.pos_to_string(pos)..S(" Could not spawn, an ignore or spawner node is too close"))
			return
		end
		core.remove_node(pos)
		core.place_schematic({x = pos.x - 4, y = pos.y - 2, z = pos.z - 4}, hideout, "0", nil, false)
	end,
	groups = {cracky = 1, level = 3, cashe_spawner = 1, timer_check = schem_auto},
	sounds = default.node_sound_stone_defaults(),
})

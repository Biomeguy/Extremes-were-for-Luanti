dofile(core.get_modpath("player_api") .. "/api.lua")

-- Default player appearance
player_api.register_model("character.b3d", {
	animation_speed = 30,
	textures = {"character.png"},
	animations = {
		-- Standard animations.
		stand     = {x = 0,   y = 79},
		lay       = {x = 162, y = 166, eye_height = 0.3, override_local = true,
			collisionbox = {-0.6, 0.0, -0.6, 0.6, 0.3, 0.6}},
		walk      = {x = 168, y = 187},
		mine      = {x = 189, y = 198},
		walk_mine = {x = 200, y = 219},
		sit       = {x = 81,  y = 160, eye_height = 0.8, override_local = true,
			collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.0, 0.3}}
	},
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	stepheight = 0.6,
	eye_height = 1.47,
})

-- Update appearance when the player joins
core.register_on_joinplayer(function(player)
	player_api.set_model(player, "character.b3d")
end)

local mod_playerphysics = core.get_modpath("playerphysics") ~= nil

local function top_face(pointd)
	if not pointd then return end
	return pointd.above.y > pointd.under.y
end

function player_api.sit_centered(pos, node, clicker, pointd)
	if not top_face(pointd) then return end
	if not clicker then return end
	local pname = clicker:get_player_name()
	local objs = core.get_objects_inside_radius(pos, .1)
	local vel = clicker:get_velocity()
	local ctrl = clicker:get_player_control()

	for _, obj in pairs(objs) do
		if obj:is_player() and obj:get_player_name() ~= pname then
			return
		end
	end

	if player_api.player_attached[pname] then
		clicker:set_pos(pos)
		if mod_playerphysics then
			playerphysics.remove_physics_factor(clicker, "speed", "player_api:sit_speed")
			playerphysics.remove_physics_factor(clicker, "jump", "player_api:sit_jump")
		else
			clicker:set_physics_override({speed = 1, jump = 1})
		end
		player_api.player_attached[pname] = false
		player_api.set_animation(clicker, "stand", 30)

	elseif not player_api.player_attached[pname] and node.param2 <= 3 and
			not ctrl.sneak and vector.equals(vel, vector.new()) then

		if mod_playerphysics then
			playerphysics.add_physics_factor(clicker, "speed", "player_api:sit_speed", 0)
			playerphysics.add_physics_factor(clicker, "jump", "player_api:sit_jump", 0)
		else
			clicker:set_physics_override({speed = 0, jump = 0})
		end
		clicker:set_pos(pos)
		player_api.player_attached[pname] = true
		player_api.set_animation(clicker, "sit", 30)

		if node.param2 == 0 then
			clicker:set_look_horizontal(math.pi)
		elseif node.param2 == 1 then
			clicker:set_look_horizontal(math.pi/2)
		elseif node.param2 == 2 then
			clicker:set_look_horizontal(0)
		elseif node.param2 == 3 then
			clicker:set_look_horizontal(3*math.pi/2)
		end
	end
end

function player_api.sit_offset(pos, node, clicker, pointd)
	if not top_face(pointd) then return end
	if not clicker then return end
	local pname = clicker:get_player_name()
	local objs = core.get_objects_inside_radius(pos, .1)
	local vel = clicker:get_velocity()
	local ctrl = clicker:get_player_control()

	for _, obj in pairs(objs) do
		if obj:is_player() and obj:get_player_name() ~= pname then
			return
		end
	end

	if player_api.player_attached[pname] then
		clicker:set_pos({x=pos.x, y=pos.y-.5, z=pos.z})
		clicker:set_eye_offset({x=0,y=0,z=0}, {x=0,y=0,z=0})
		if mod_playerphysics then
			playerphysics.remove_physics_factor(clicker, "speed", "player_api:sit_speed")
			playerphysics.remove_physics_factor(clicker, "jump", "player_api:sit_jump")
		else
			clicker:set_physics_override({speed = 1, jump = 1})
		end
		player_api.player_attached[pname] = false
		player_api.set_animation(clicker, "stand", 30)

	elseif not player_api.player_attached[pname] and node.param2 <= 3 and
			not ctrl.sneak and vector.equals(vel, vector.new()) then

		if mod_playerphysics then
			playerphysics.add_physics_factor(clicker, "speed", "player_api:sit_speed", 0)
			playerphysics.add_physics_factor(clicker, "jump", "player_api:sit_jump", 0)
		else
			clicker:set_physics_override({speed = 0, jump = 0})
		end

		local p2 = {x=pos.x, y=pos.y, z=pos.z}
		if not node or node.param2 == 0 then
			p2.z = p2.z+.3
			clicker:set_look_horizontal(math.pi)
		elseif node.param2 == 1 then
			p2.x = p2.x+.3
			clicker:set_look_horizontal(math.pi/2)
		elseif node.param2 == 2 then
			p2.z = p2.z-.3
			clicker:set_look_horizontal(0)
		elseif node.param2 == 3 then
			p2.x = p2.x-.3
			clicker:set_look_horizontal(3*math.pi/2)
		end

		clicker:set_pos(p2)
		clicker:set_eye_offset({x=0,y=0,z=2}, {x=0,y=0,z=0})
		player_api.player_attached[pname] = true
		player_api.set_animation(clicker, "sit", 30)
	end
end

function player_api.sit_dig_centered(pos, digger)
	for _, player in pairs(core.get_objects_inside_radius(pos, .1)) do
		if player:is_player() and player_api.player_attached[player:get_player_name()] then
			return false
		end
	end

	return true
end

function player_api.sit_dig_offset(pos, digger)
	for _, player in pairs(core.get_objects_inside_radius(pos, .5)) do
		if player:is_player() and player_api.player_attached[player:get_player_name()] then
			return false
		end
	end

	return true
end

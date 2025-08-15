
core.register_entity("oceaflight:wings", {
	initial_properties = {
visual = "mesh",
mesh = "oceaflight_wings.b3d",
textures = {"oceaflight_wings.png"},
physical = true,
collisionbox = {-.47, .25, -.47, .47, .55, .47},
pointable = false,
glow = 3
	},
	driver = nil,
--	age = 0,
	on_detach_child = function(self, child)
		if child and child:get_player_name() == self.driver:get_player_name() then
	player_api.player_attached[child:get_player_name()] = false

	core.handle_node_drops(self.object:get_pos(), {self.witem}, child)

	child:set_properties({visual_size = {x=1, y=1}})
	player_api.set_animation(child, "stand" , 30)
	self.driver = nil
		end
	end,
get_staticdata = function(self) return core.serialize({witem = self.witem}) end,
on_activate = function(self, staticdata)
	self.object:set_armor_groups({immortal = 1})
	self.object:set_animation({x=24, y=44})
	if not staticdata or staticdata == "" then return end
	local data = core.deserialize(staticdata)
	if not data then return end

	self.witem = data.witem
end,
	on_step = function(self, dtime)
--		self.age = self.age+dtime
	if self.driver then
		local ctrl = self.driver:get_player_control()
		if ctrl.jump or self.driver:get_hp() == 0 then
			self.driver:set_detach()	self.witem = nil	return end
		local dir = self.driver:get_look_dir()
		local spd = 16
	if ctrl.sneak then
	spd = 4 end
		local vec = {x=dir.x*spd,y=dir.y*spd,z=dir.z*spd}
		self.object:set_velocity(vec)
		local pitch = self.driver:get_look_vertical()
		local yaw = self.driver:get_look_horizontal()
		local roll = self.object:get_rotation().z
		self.oldyaw = self.oldyaw or 0
	if self.oldyaw > 0 then
		roll = (roll+math.sin(yaw-self.oldyaw))*.9
	else	roll = 0	end
	if roll < .01 and roll > -.01 then
	roll = 0	end
		self.object:set_rotation({x= pitch, y= yaw+math.pi, z= roll})
		self.oldyaw = yaw
	else
		if self.witem then
		core.handle_node_drops(self.object:get_pos(), {self.witem}) end
		self.object:remove()
	end
end
})

local up, trn = 5, 8
if core.get_modpath("3d_armor") then
	up, trn = 4.7, 5 end

core.register_tool("oceaflight:item", {
	description = "Flight Item",
	inventory_image = "oceaflight_item.png",
	light_source = 6,
	groups = {disable_repair = 1, not_repaired_by_anvil = 1},
	on_use = function(item, user, pointd)-- Places on the player's back and deploys the wings which propel the player by its ocealite feather surface effect with air, water etc.
if item:get_wear() < 65484 then
		local deployable = true
		local attachd = user:get_attach()
	if attachd and attachd:get_luaentity() and attachd:get_luaentity().name == "oceaflight:wings" then
		deployable = false
	end

		if deployable then
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local name = user:get_player_name()
	local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1+dir.y,z=pos.z+dir.z}, "oceaflight:wings")
	if core.check_player_privs(name, {server=true}) then
		obj:set_properties({physical = false})	end
	local entity = obj:get_luaentity()
	user:set_attach(entity.object, "", {x=0,y=up,z=0}, {x=trn,y=0,z=0})
	entity.driver = user
	player_api.player_attached[name] = true
	player_api.set_animation(user, "lay")
	user:set_properties({visual_size = {x=1, y=-1}, eye_height = .4})
if not core.is_creative_enabled(name) then
	item:add_wear(51)
end
	entity.witem = ItemStack(item):to_string()
	item:take_item()
core.add_particlespawner({
	amount = 15,
	time = .1,
	minpos = {x=pos.x-.2, y=pos.y+1.6, z=pos.z-.2},
	maxpos = {x=pos.x+.2, y=pos.y+1.7, z=pos.z+.2},
	minvel = {x=-2, y=-2, z=-2},
	maxvel = {x=2, y=2, z=2},
	exptime = {min = .6, max = .8},
	minsize = 1,
	maxsize = 3,
	texture = "oceaflight_spawn_effect.png",
	collisiondetection = true,
	glow = 7 })
		end
	return item
end
	end
})

core.register_craft({
	output = "oceaflight:item",
	recipe = {{"oceaflight:item", "default:ocealite_crystal_fragment"}}
})

core.register_craft({
	output = "oceaflight:item",
	recipe = {
		{"", "default:diamite_dust", ""},
		{"default:ocealite_crystal", "flowers:mushroom_white", "default:ocealite_crystal"},
		{"farming:hemp_fibre", "group:salt_water_bucket", "farming:hemp_fibre"}
	},
	replacements = {
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

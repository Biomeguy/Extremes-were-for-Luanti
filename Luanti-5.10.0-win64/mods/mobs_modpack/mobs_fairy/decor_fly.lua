
core.register_abm({
	label = "mobs_fairy:spawn_butterflies",
	nodenames = {"group:flower"},
	neighbors = {"group:soil", "default:compost_pile", "default:mud", "air"},
	interval = 17,
	chance = 10,
	action = function(pos)
local tod = core.get_timeofday()
if tod > .23 and tod < .78 then
		core.add_entity({x=pos.x,y=pos.y+.3,z=pos.z}, "mobs_fairy:butterfly")
end
	end
})

core.register_abm({
	label = "mobs_fairy:spawn_dragonflies",
	nodenames = {"ecology:tall_grass", "default:bulrush_1", "default:bulrush_2", "group:grass"},
	neighbors = {"group:soil", "default:compost_pile", "default:mud", "air"},
	interval = 17,
	chance = 20,
	action = function(pos)
local tod = core.get_timeofday()
if tod > .23 and tod < .78 then
		core.add_entity({x=pos.x,y=pos.y+.3,z=pos.z}, "mobs_fairy:dragonfly")
end
	end
})

core.register_entity("mobs_fairy:butterfly", {
	initial_properties = {
visual = "mesh",
mesh = "decor_fly.b3d",
textures = {"default_cloud.png"},
physical = true,
collide_with_objects = false,
collisionbox = {-.06,-.06,-.06,.06,.06,.06},
visual_size = {x=.3, y=.3},
	},
	age = 0,
	on_activate = function(self)
		local num = math.random(1,7)
		self.object:set_properties({textures = {"fairy_butterfly"..num..".png"} })
		self.object:set_animation({x=1, y=10}, 35)
		self.age = 9
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 30 then self.object:remove() return end

		local pos = self.object:get_pos()	if not pos then return end
		local node = core.get_node_or_nil(pos)
		-- Delete in 'ignore' nodes
		if node and node.name == "ignore" then self.object:remove() return end

	if math.random(1, 9) == 1 then
		local yaw = (self.object:get_yaw() or 0) + math.random(-.5, .5)
	self.object:set_yaw(yaw)

		local v = math.random(.01, 2)-- random velocity
	self.object:set_velocity({x = (math.sin(yaw) * -v), y = math.random(-.6, .6), z = (math.cos(yaw) * v)}) end
	end,
})

core.register_entity("mobs_fairy:dragonfly", {
	initial_properties = {
visual = "mesh",
mesh = "decor_fly.b3d",
textures = {"default_cloud.png"},
physical = true,
collide_with_objects = false,
collisionbox = {-.1,-.1,-.1,.1,.1,.1},
visual_size = {x=.5, y=.5},
	},
	age = 0,
	on_activate = function(self)
		local num = math.random(1,4)
		self.object:set_properties({textures = {"fairy_dragonfly"..num..".png"} })
		self.object:set_animation({x=1, y=10}, 70)
		self.age = 9
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 30 then self.object:remove() return end

		local pos = self.object:get_pos()	if not pos then return end
		local node = core.get_node_or_nil(pos)
		-- Delete in 'ignore' nodes
		if node and node.name == "ignore" then self.object:remove() return end

	if math.random(1, 12) == 1 then
		local yaw = (self.object:get_yaw() or 0) + math.random(-.5, .5)
	self.object:set_rotation({x= -1.0472, y= yaw, z= 0})

		local v = math.random(.01, 3)-- random velocity
	self.object:set_velocity({x = (math.sin(yaw) * -v), y = math.random(-.6, .6), z = (math.cos(yaw) * v)}) end
	end,
})

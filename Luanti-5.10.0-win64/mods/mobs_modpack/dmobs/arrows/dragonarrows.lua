mobs:register_arrow("dmobs:ice", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"dmobs_ice.png"},
	velocity = 8,
	tail = 1, -- enable tail
	tail_texture = "dmobs_ice.png",
	
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_node = function(self, pos, node)
		self.object:remove()
	end,
})
mobs:register_arrow("dmobs:lightning", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"dmobs_lightning.png"},
	velocity = 8,
	tail = 1, -- enable tail
	tail_texture = "dmobs_ice.png",
	
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_node = function(self, pos, node)
		self.object:remove()
	end,
})
mobs:register_arrow("dmobs:poison", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"dmobs_poison.png"},
	velocity = 8,
	tail = 1, -- enable tail
	tail_texture = "dmobs_ice.png",
	
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	
	hit_node = function(self, pos, node)
		self.object:remove()
	end,
})

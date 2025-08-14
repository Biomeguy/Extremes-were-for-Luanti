
local S = mobs.intllib

local all_colours = {
	{"black",		S("Black"),		 "#000000b0",	"wool"},
	{"blue",		S("Blue"),		 "#015dbb70",	"sheet"},
	{"light_blue",	S("Light Blue"), "#02aecc70",	"sheet"},
	{"brown",		S("Brown"),		 "#663300a0",	"wool"},
	{"cyan",		S("Cyan"),		 "#01ffd870",	"sheet"},
	{"dark_green",	S("Dark Green"), "#005b0770",	"sheet"},
	{"dark_grey",	S("Dark Grey"),	 "#303030b0",	"wool"},
	{"green",		S("Green"),		 "#61ff0170",	"sheet"},
	{"grey",		S("Grey"),		 "#5b5b5bb0",	"wool"},
	{"magenta",		S("Magenta"),	 "#ff05bb70",	"sheet"},
	{"orange",		S("Orange"),	 "#ff840170",	"sheet"},
	{"pink",		S("Pink"),		 "#ff65b570",	"sheet"},
	{"red",			S("Red"),		 "#ff0000a0",	"sheet"},
	{"violet",		S("Violet"),	 "#2000c970",	"sheet"},
	{"white",		S("White"),		 "#abababc0",	"wool"},
	{"yellow",		S("Yellow"),	 "#e3ff0070",	"sheet"},
}

-- Sheep by PilzAdam

for _, col in ipairs(all_colours) do

	mobs:register_mob("mobs_animal:sheep_"..col[1], {
		stay_near = {"farming:straw", 10},
		stepheight = 0.6,
		type = "animal",
		passive = true,
		hp_min = 8,
		hp_max = 10,
		armor = 200,
		collisionbox = {-.4, 0, -.4, .4, 1.3, .4},
		visual = "mesh",
		mesh = "mobs_sheep.b3d",
		textures = {--{"mobs_sheep_base.png^(mobs_sheep_"..col[1]..".png^[colorize:" .. col[3] .. ")"}
			{"mobs_sheep_base.png^mobs_sheep_"..col[1]..".png"},
		},
		gotten_texture = {"mobs_sheep_shaved.png"},
		gotten_mesh = "mobs_sheep.b3d",
		makes_footstep_sound = true,
		sounds = {
			random = "mobs_sheep",
		},
		walk_velocity = 1,
		run_velocity = 2,
		runaway = true,
		jump = true,
		jump_height = 4,
		pushable = true,
		drops = {
			{name = "mobs:mutton_raw", chance = 1, min = 1, max = 2},
		},
		water_damage = 0,
		lava_damage = 5,
		light_damage = 0,
		animation = {
			speed_normal = 16,
			speed_run = 16,
			stand_start = 1,
			stand_end = 25,
			walk_start = 27,
			walk_end = 46,
		},
		follow = {"farming:wheat", "default:grass_1", "farming:cut_grass", "farming:hay_pile"},
		view_range = 8,
		replace_rate = 10,
		replace_what = {
			{"group:grass", "air", 0},
			{"default:dirt_with_grass", "default:dirt", -1},
			{"farming:wheat_S8", "air", 0}
		},
		fear_height = 3,
		on_replace = function(self, pos, oldnode, newnode)

			self.food = (self.food or 0) + 1

			-- if sheep replaces 8x grass then it regrows wool
			if self.food >= 8 then

				self.food = 0
				self.gotten = false

				self.object:set_properties({
					textures = {"mobs_sheep_base.png^mobs_sheep_"..col[1]..".png"},
					mesh = "mobs_sheep.b3d",
				})
			end
		end,
		on_rightclick = function(self, clicker)

			--are we feeding?
			if mobs:feed_tame(self, clicker, 8, true, true) then

				--if fed 7x grass or wheat then sheep regrows wool
				if self.food and self.food > 6 then

					self.gotten = false

					self.object:set_properties({
						textures = {"mobs_sheep_base.png^mobs_sheep_"..col[1]..".png"},
						mesh = "mobs_sheep.b3d",
					})
				end

				return
			end

			local item = clicker:get_wielded_item()
			local itemname = item:get_name()
			local name = clicker:get_player_name()

			--are we giving a haircut>
			if itemname == "mobs:shears" then

				if self.gotten ~= false
				or self.child ~= false
				or name ~= self.owner
				or not core.get_modpath("fabric") then
					return
				end

				self.gotten = true -- shaved

				local obj = core.add_item(
					self.object:get_pos(),
					ItemStack("fabric:"..col[4].."_"..col[1].." " .. math.random(1, 3) )
				)

				if obj then

					obj:set_velocity({
						x = math.random(-1, 1),
						y = 5,
						z = math.random(-1, 1)
					})
				end

				item:add_wear(650) -- 100 uses

				clicker:set_wielded_item(item)

				self.object:set_properties({
					textures = {"mobs_sheep_shaved.png"},
					mesh = "mobs_sheep.b3d",
				})

				return
			end

			--are we coloring?
			if itemname:find("dye:") then

				if self.gotten == false
				and self.child == false
				and self.tamed == true
				and name == self.owner then

					local colr = string.split(itemname, ":")[2]

					for _,c in pairs(all_colours) do

						if c[1] == colr then

							local pos = self.object:get_pos()

							self.object:remove()

							local mob = core.add_entity(pos, "mobs_animal:sheep_" .. colr)
							local ent = mob:get_luaentity()

							ent.owner = name
							ent.tamed = true

							-- take item
							if not mobs.is_creative(clicker:get_player_name()) then
								item:take_item()
								clicker:set_wielded_item(item)
							end

							break
						end
					end
				end

				return
			end

			-- protect mod with mobs:protector item
			if mobs:protect(self, clicker) then return end

			--are we capturing?
			if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end
		end,

	on_die = function(self, pos)
		if not pos then return end
		if not self.gotten then
			local obj = core.add_item(pos, ItemStack("fabric:"..col[4].."_"..col[1].." " .. math.random(1, 3) ))

			if obj then
				obj:set_velocity({
					x = math.random(-1, 1),
					y = 6,
					z = math.random(-1, 1)
				})
			end
		end
	end
	})

mobs:register_egg("mobs_animal:sheep_"..col[1], S("@1 Sheep", col[2]), "fabric_block_"..col[1]..".png^mobs_sheep_"..col[1]..".png")

end


mobs:spawn({
	name = "mobs_animal:sheep_white",
	nodes = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})

-- raw mutton
core.register_craftitem(":mobs:mutton_raw", {
	description = S("Raw Mutton"),
	inventory_image = "mobs_mutton_raw.png",
	on_use = core.item_eat(2, "bonemeal:bone 4"),
	groups = {meat_raw = 1, mutton_raw = 1, flammable = 2},
})

-- cooked mutton
core.register_craftitem(":mobs:mutton_cooked", {
	description = S("Cooked Mutton"),
	inventory_image = "mobs_mutton_cooked.png",
	on_use = core.item_eat(6, "bonemeal:bone 4"),
	groups = {meat = 1, mutton = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	output = "mobs:mutton_cooked",
	recipe = "mobs:mutton_raw",
	cooktime = 5,
})

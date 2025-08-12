
-- Obsidian Sword 

core.register_tool("ebitems:sword_obsidian", {
	wield_scale = {x=1.5,y=1.5,z=2.5},
	description = "Obsidian Sword",
	inventory_image = "obsidian_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

-- Luva

if core.global_exists("armor") and armor.elements then
	table.insert(armor.elements, "hand")
end

if core.get_modpath("3d_armor") then
	armor:register_armor("ebitems:glove_glove", {
		description = "Glove",
		inventory_image = "ebitems_inv_glove_glove.png",
		groups = {armor_hand=2, armor_heal=2, armor_use=40,physics_speed=.5,physics_jump=.5},
	})
end

-- TROFÉIS :
 core.register_node("ebitems:frostyqueen_trophy", {
	description = "Frosty Queen Trophy",
	drawtype = "mesh",
	mesh = "frostyqueen_trofeu.obj",
	tiles = {"frostyqueen_trofeu.png"} ,
	wield_scale = {x=1, y=1, z=1},
	groups = {dig_immediate=3},
	paramtype = "light",
-- CAIXA DE COLISÃO :
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-.5, -.5, -.25, .5, .5, .5}
		}
	},
})

core.register_node("ebitems:crazymushrrom_trophy", {
	description = "Crazy Mushrrom Trophy",
	drawtype = "mesh",
	mesh = "crazymushrrom_trofeu.obj",
	tiles = {"crazymushrrom_trofeu.png"} ,
	wield_scale = {x=1, y=1, z=1},
	groups = {dig_immediate=3},
	paramtype = "light",
-- CAIXA DE COLISÃO :
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-.5, -.5, -.25, .5, .5, .5}
		}
	},
})

core.register_node("ebitems:heated_trophy", {
	description = "Heated Trophy",
	drawtype = "mesh",
	mesh = "heated_trofeu.obj",
	tiles = {"heated_trofeu.png"} ,
	wield_scale = {x=1, y=1, z=1},
	groups = {dig_immediate=3},
	paramtype = "light",
-- CAIXA DE COLISÃO :
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-.5, -.5, -.25, .5, .5, .5}
		}
	},
})

-- Cura

-- Sound : https://freesound.org/people/craigglenday/sounds/517173/
core.register_craftitem("ebitems:miraclehealing", {
	description = "Miracle Healing",
	inventory_image = "miraclehealing.png",
	stack_max = 1,
	groups = {vessel = 1},
	on_use = function(itemstack, user) -- função para recuperar vida simples
		local hp = user:get_hp() -- usuario consegue o valor atual de sua vida
		if hp ~= 20 then -- comparando vida
			user:set_hp(hp + 10)  -- atribuindo mais 10 de vida
			--itemstack:take_item()
		end

		local pos = user:get_pos()

	core.sound_play("bebendo", {pos = pos, gain = 1., max_hear_distance = 5})

	for i=1, 30 do
	core.add_particle({
		pos = pos,
		velocity = {x =math.random(-3,3), y=math.random(-3,3), z=math.random(-3,3)},
		expirationtime = 2.,
		size = 2, 
		texture = "curam.png",
		glow = 8 })
	end
		return "vessels:glass_bottle"
	end
})

core.register_craft({
	output = "ebitems:miraclehealing",
	recipe = {
		{"", "default:diamond", ""},
		{"ethereal:illumishroom3", "default:apple", "ethereal:illumishroom3"},
		{"", "vessels:glass_bottle", ""}
	}
})

-- Achievements
if core.get_modpath("awards") then
	awards.register_award("crazym", {
		title = "Crazy Mushroom",
		description = "Find the Mad Mushroom and defeat him to unlock the next achievement..",
		icon = "acm.png",
		background = "awards_bg_mining.png",
		prizes = {"ebitems:crazymushrrom_trophy"},
	})

	awards.register_award("heatedboss", {
		title = "Heated Boss",
		description = "Now you need to find the Obsidian Monster...",
		icon = "heated_a.png",
		background = "awards_bg_mining.png",
		requires = {"crazym"},
		prizes = {"ebitems:heated_trophy"},
	})

	awards.register_award("frostyqueenboss", {
		title = "Frosty Queen",
		description = "Beautiful and with a frozen heart, defeating the queen's warriors is your challenge...",
		icon = "queem.png",
		background = "awards_bg_mining.png",
		requires = {"heatedboss"},
		prizes = {"ebitems:frostyqueen_trophy"},
	})
end
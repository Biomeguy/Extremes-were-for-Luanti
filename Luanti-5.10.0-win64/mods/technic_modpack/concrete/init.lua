--Luanti mod: concrete
--(c) 2013 by RealBadAngel <mk@realbadangel.pl>

local technic = rawget(_G, "technic") or {}
technic.concrete_posts = {}

-- Boilerplate to support localized strings if intllib mod is installed.
local S = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end

for i = 0, 31 do
	core.register_alias("technic:concrete_post"..i, "technic:concrete_post")
end
for i = 32, 63 do
	core.register_alias("technic:concrete_post"..i, "technic:concrete_post_with_platform")
end

core.register_craft({
	output = "technic:concrete_post_platform 6",
	recipe = {
		{"default:concrete_block","technic:concrete_post","default:concrete_block"}
	}
})

core.register_craft({
	output = "technic:concrete_post 24",
	recipe = {
		{"default:concrete_block","default:steel_bar","default:concrete_block"},
		{"default:concrete_block","default:steel_bar","default:concrete_block"},
		{"default:concrete_block","default:steel_bar","default:concrete_block"}
	}
})

core.register_craft({
	output = "technic:blast_resistant_concrete 5",
	recipe = {
		{"default:concrete_block","technic:composite_plate","default:concrete_block"},
		{"technic:composite_plate","default:concrete_block","technic:composite_plate"},
		{"default:concrete_block","technic:composite_plate","default:concrete_block"}
	}
})

core.register_node(":technic:blast_resistant_concrete", {
	description = S("Blast-resistant Concrete Block"),
	tiles = {"technic_blast_resistant_concrete_block.png",},
	groups = {cracky=1, level=3, concrete=1},
	sounds = default.node_sound_stone_defaults(),
	on_blast = function(pos, intensity)
		if intensity > 9 then
			core.remove_node(pos)
			return {"technic:blast_resistant_concrete"}
		end
	end,
})

if core.get_modpath("moreblocks") then
	stairsplus:register_all("technic","blast_resistant_concrete","technic:blast_resistant_concrete",{
		description = "Blast-resistant Concrete",
		tiles = {"technic_blast_resistant_concrete_block.png",},
		groups = {cracky=1, level=3, concrete=1},
		sounds = default.node_sound_stone_defaults(),
		on_blast = function(pos, intensity)
			if intensity > 1 then
				core.remove_node(pos)
				core.add_item(pos, "technic:blast_resistant_concrete")
			end
		end,
	})
end

stairs.register_stair_and_slab("blast_resistant_concrete", "technic:blast_resistant_concrete",
	{cracky=1, level=3, concrete=1}, {"technic_blast_resistant_concrete_block.png"},
	"Blast-resistant Concrete Stair", "Blast-resistant Concrete Slab", default.node_sound_stone_defaults(), true)

local box_platform = {-0.5,  0.3,  -0.5,  0.5,  0.5, 0.5}
local box_post     = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
local box_front    = {-0.1,  -0.3, -0.5,  0.1,  0.3, 0}
local box_back     = {-0.1,  -0.3, 0,     0.1,  0.3, 0.5}
local box_left     = {-0.5,  -0.3, -0.1,  0,    0.3, 0.1}
local box_right    = {0,     -0.3, -0.1,  0.5,  0.3, 0.1}

core.register_node(":technic:concrete_post_platform", {
	description = S("Concrete Post Platform"),
	tiles = {"basic_materials_concrete_block.png",},
	groups={cracky=1, level=2},
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {box_platform}
	},
	on_place = function (itemstack, placer, pointd)
		local node = core.get_node(pointd.under)
		if node.name ~= "technic:concrete_post" then
			return core.item_place_node(itemstack, placer, pointd)
		end
		core.set_node(pointd.under, {name="technic:concrete_post_with_platform"})
		itemstack:take_item()
		placer:set_wielded_item(itemstack)
		return itemstack
	end,
})

for platform = 0, 1 do
	local after_dig_node = nil
	if platform == 1 then
		after_dig_node = function(pos, old_node)
			old_node.name = "technic:concrete_post"
			core.set_node(pos, old_node)
		end
	end

	core.register_node(":technic:concrete_post"..(platform == 1 and "_with_platform" or ""), {
		description = S("Concrete Post"),
		tiles = {"basic_materials_concrete_block.png"},
		groups = {cracky=1, level=2, concrete_post=1, not_in_creative_inventory=platform},
		sounds = default.node_sound_stone_defaults(),
		drop = (platform == 1 and "technic:concrete_post_platform" or
				"technic:concrete_post"),
		paramtype = "light",
		sunlight_propagates = true,
		drawtype = "nodebox",
		connects_to = {"group:concrete", "group:concrete_post"},
		node_box = {
			type = "connected",
			fixed = {box_post, (platform == 1 and box_platform or nil)},
			connect_front = box_front,
			connect_back  = box_back,
			connect_left  = box_left,
			connect_right = box_right,
		},
		after_dig_node = after_dig_node,
	})
end


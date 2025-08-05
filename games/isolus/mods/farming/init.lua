-- farming/init.lua

-- Load support for MT game translation.
local S = core.get_translator("farming")

-- Global farming namespace

farming = {
	path = core.get_modpath("farming"),
	get_translator = S,
	select = {type = "fixed", fixed = {-.5, -.5, -.5, .5, -5/16, .5}}
}

-- Load files

dofile(farming.path .. "/api.lua")
dofile(farming.path .. "/nodes.lua")
dofile(farming.path .. "/tools.lua")
dofile(farming.path .. "/utensils.lua")


-- Register crops and food along with some nice additions from Ademant's grain mod :)
local function ddoo(file)
	dofile(farming.path.."/crops/".. file)
end
ddoo("cotton.lua")
ddoo("wheat.lua")

ddoo("alfalfa.lua")
ddoo("amaranth.lua")
ddoo("artichoke.lua")
ddoo("asparagus.lua")
ddoo("barley.lua")
ddoo("beans.lua")
ddoo("blackberry.lua")
ddoo("blackcurrant.lua")
ddoo("blueberry.lua")
ddoo("buckwheat.lua")
ddoo("carrot.lua")
ddoo("carrot_wild.lua")
ddoo("cauliflower.lua")
ddoo("celery.lua")
ddoo("chili.lua")
ddoo("chive.lua")
ddoo("cilantro.lua")
ddoo("coffee.lua")
ddoo("cucumber.lua")
ddoo("flax.lua")
ddoo("garlic.lua")
ddoo("ginger.lua")
ddoo("gooseberry.lua")
ddoo("grapes.lua")
ddoo("green_onion.lua")
ddoo("habanero.lua")
ddoo("hemp.lua")
ddoo("hops.lua")
ddoo("huckleberry.lua")
ddoo("kohlrabi.lua")
ddoo("leek.lua")
ddoo("lettuce_ir.lua")
ddoo("maize.lua")
ddoo("melon.lua")
ddoo("mint.lua")
ddoo("mustard.lua")
ddoo("oat.lua")
ddoo("onion.lua")
ddoo("parsley.lua")
ddoo("peanut.lua")
ddoo("peas.lua")
ddoo("peppercorn.lua")
ddoo("pineapple.lua")
ddoo("potato.lua")
ddoo("pumpkin.lua")
ddoo("quinoa.lua")
ddoo("raddish.lua")
ddoo("raspberry.lua")
ddoo("red_beet.lua")
ddoo("rhubarb.lua")
ddoo("rice.lua")
ddoo("rosebush.lua")
ddoo("rosemary.lua")
ddoo("rye.lua")
ddoo("strawberry.lua")
ddoo("sugar_beet.lua")
ddoo("sunflower.lua")
ddoo("sweet_pepper.lua")
ddoo("tea.lua")
ddoo("teosinte.lua")
ddoo("tomato.lua")
ddoo("turmeric.lua")
ddoo("vanilla.lua")
ddoo("zucchini.lua")
ddoo("fruiting_trees.lua")

dofile(farming.path .. "/food.lua")
dofile(farming.path .. "/mapgen.lua")
dofile(farming.path .. "/lucky_block.lua")

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"farming:straw_pile", "default:reed_block_dry"},
		{"farming:straw_pile", "default:wood"}
	}
})

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"farming:flax", "default:reed_block_dry"},
		{"farming:flax", "default:wood"}
	}
})

core.register_craft({
	output = "fire:tinder 8",
	recipe = {
		{"farming:straw_pile", "farming:straw_pile"},
		{"farming:straw_pile", "farming:straw_pile"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 4",
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 4",
	recipe = {
		{"farming:flax", "farming:flax"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

-- Register farming items as dungeon loot
if core.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "fabric:string", chance = .5, count = {1, 8}},
		{name = "farming:wheat", chance = .5, count = {2, 5}},
		{name = "farming:seed_cotton", chance = .4, count = {1, 4}, types = {"normal"}},
	})
end

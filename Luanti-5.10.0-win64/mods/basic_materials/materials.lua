
core.register_craftitem("basic_materials:steel_wire", {
	description = "Spool of steel wire",
	inventory_image = "basic_materials_steel_wire.png"
})

core.register_craftitem("basic_materials:copper_wire", {
	description = "Spool of copper wire",
	inventory_image = "basic_materials_copper_wire.png"
})

core.register_craftitem("basic_materials:silver_wire", {
	description = "Spool of silver wire",
	inventory_image = "basic_materials_silver_wire.png"
})

core.register_craftitem("basic_materials:gold_wire", {
	description = "Spool of gold wire",
	inventory_image = "basic_materials_gold_wire.png"
})

core.register_craftitem("basic_materials:steel_strip", {
	description = "Steel Strip",
	inventory_image = "basic_materials_steel_strip.png"
})

core.register_craftitem("basic_materials:copper_strip", {
	description = "Copper Strip",
	inventory_image = "basic_materials_copper_strip.png"
})

core.register_craftitem("basic_materials:chainlink_brass", {
	description = "Chainlinks (brass)",
	inventory_image = "basic_materials_chainlink_brass.png"
})

core.register_craftitem("basic_materials:chainlink_steel", {
	description = "Chainlinks (steel)",
	inventory_image = "basic_materials_chainlink_steel.png"
})

core.register_craftitem("basic_materials:gear_steel", {
	description = "Steel gear",
	inventory_image = "basic_materials_gear_steel.png"
})

core.register_craftitem("basic_materials:plastic_sheet", {
	description = "Plastic sheet",
	inventory_image = "basic_materials_plastic_sheet.png",
})

core.register_craftitem("basic_materials:plastic_strip", {
	description = "Plastic strips",
	inventory_image = "basic_materials_plastic_strip.png",
})

core.register_craftitem("basic_materials:empty_spool", {
	description = "Empty wire spool",
	inventory_image = "basic_materials_empty_spool.png"
})

core.register_craftitem("basic_materials:paraffin", {
	description = "Unprocessed paraffin",
	inventory_image = "basic_materials_paraffin.png",
})

core.register_craftitem("basic_materials:silicon", {
	description = "Silicon lump",
	inventory_image = "basic_materials_silicon.png",
})

core.register_craftitem("basic_materials:ic", {
	description = "Simple Integrated Circuit",
	inventory_image = "basic_materials_ic.png",
})

core.register_craftitem("basic_materials:motor", {
	description = "Simple Motor",
	inventory_image = "basic_materials_motor.png",
})

core.register_craftitem("basic_materials:heating_element", {
	description = "Heating element",
	inventory_image = "basic_materials_heating_element.png",
})

core.register_craftitem("basic_materials:energy_crystal_simple", {
	description = "Simple energy crystal",
	inventory_image = "basic_materials_energy_crystal.png",
})

local chains_sbox = {
	type = "fixed",
	fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }
}

local topchains_sbox = {
	type = "fixed",
	fixed = {
		{ -0.25, 0.35, -0.25, 0.25, 0.5, 0.25 },
		{ -0.1, -0.5, -0.1, 0.1, 0.4, 0.1 }
	}
}

core.register_node("basic_materials:chain_steel", {
	description = "Chain (steel, hanging)",
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_steel_inv.png",
	groups = {cracky=3},
	selection_box = chains_sbox,
})

core.register_node("basic_materials:chain_brass", {
	description = "Chain (brass, hanging)",
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_brass_inv.png",
	groups = {cracky=3},
	selection_box = chains_sbox,
})

core.register_craft({
	type = "shapeless",
	output = "basic_materials:copper_wire 2",
	recipe = {"default:copper_ingot", "basic_materials:empty_spool", "basic_materials:empty_spool"}
})

core.register_craft({
	type = "shapeless",
	output = "basic_materials:silver_wire 2",
	recipe = {"default:silver_ingot", "basic_materials:empty_spool", "basic_materials:empty_spool"}
})

core.register_craft({
	type = "shapeless",
	output = "basic_materials:gold_wire 2",
	recipe = {"default:gold_ingot", "basic_materials:empty_spool", "basic_materials:empty_spool"}
})

core.register_craft({
	type = "shapeless",
	output = "basic_materials:steel_wire 2",
	recipe = {"default:steel_ingot", "basic_materials:empty_spool", "basic_materials:empty_spool"}
})

core.register_craft({
	output = "basic_materials:steel_strip 12",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", ""}
	}
})

core.register_craft({
	output = "basic_materials:copper_strip 12",
	recipe = {
		{"", "default:copper_ingot", ""},
		{"default:copper_ingot", "", ""}
	}
})

core.register_craft({
	output = "basic_materials:chainlink_steel 12",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "basic_materials:chainlink_brass 12",
	recipe = {
		{"", "default:brass_ingot", "default:brass_ingot"},
		{"default:brass_ingot", "", "default:brass_ingot"},
		{"default:brass_ingot", "default:brass_ingot", ""}
	}
})

core.register_craft({
	output = 'basic_materials:chain_steel 2',
	recipe = {
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"}
	}
})

core.register_craft({
	output = 'basic_materials:chain_brass 2',
	recipe = {
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"}
	}
})

core.register_craft({
	output = "basic_materials:gear_steel 6",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot","basic_materials:chainlink_steel", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	type = "cooking",
	output = "basic_materials:plastic_sheet",
	recipe = "basic_materials:paraffin",
})

core.register_craft({
	type = "fuel",
	recipe = "basic_materials:plastic_sheet",
	burntime = 30,
})

core.register_craft({
    output = "basic_materials:plastic_strip 9",
    recipe = {{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}}
})

core.register_craft({
	output = "basic_materials:empty_spool 3",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"", "basic_materials:plastic_sheet", ""},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	type = "cooking",
	output = "basic_materials:paraffin",
	recipe = "default:oil_extract",
	replacements = {{"default:oil_extract", "vessels:glass_bottle"}}
})

core.register_craft({
	type = "fuel",
	recipe = "basic_materials:paraffin",
	burntime = 30,
})

core.register_craft({
	output = "basic_materials:silicon 4",
	recipe = {
		{"default:sand", "default:sand"},
		{"default:sand", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "basic_materials:ic 4",
	recipe = {
		{"basic_materials:silicon", "basic_materials:silicon"},
		{"basic_materials:silicon", "default:copper_ingot"}
	}
})

core.register_craft({
    output = "basic_materials:motor 2",
    recipe = {
		{"default:mese_crystal_fragment", "basic_materials:copper_wire", "basic_materials:plastic_sheet"},
		{"default:copper_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:mese_crystal_fragment", "basic_materials:copper_wire", "basic_materials:plastic_sheet"}
    },
	replacements = {
		{"basic_materials:copper_wire", "basic_materials:empty_spool"},
		{"basic_materials:copper_wire", "basic_materials:empty_spool"}
	}
})

core.register_craft({
    output = "basic_materials:heating_element 2",
    recipe = {
		{"default:copper_ingot", "default:mese_crystal_fragment", "default:copper_ingot"}
    }
})

core.register_craft({
	output = "basic_materials:energy_crystal_simple 2",
	recipe = {
		{"default:mese_crystal_fragment", "default:torch", "default:mese_crystal_fragment"},
		{"default:diamond", "default:gold_ingot", "default:diamond"}
	}
})


local function random_dropped_items_amount(player, itemstack, items_max_amount)
	local amount_to_give = math.random(items_max_amount)
	local stack = ItemStack(itemstack.. tostring(amount_to_give))
	local inv = core.get_inventory({type="player", name=player:get_player_name()})
	inv:add_item("main", stack)
end

core.register_craftitem("basic_materials:car_frame_material", {
	description = "Car Frame Material",
	inventory_image = "car_frame_material.png"
})

core.register_craftitem("basic_materials:silicon_dust", {
	description = "Silicon Dust",
	inventory_image = "silicon_dust.png"
})

core.register_craftitem("basic_materials:aluminium_dust", {
	description = "Aluminium Dust",
	inventory_image = "aluminium_dust.png"
})

core.register_craftitem("basic_materials:phosphorus_dust", {
	description = "Phosphorus Dust",
	inventory_image = "phosphorus_dust.png"
})

core.register_craftitem("basic_materials:aluminium_and_silicon_dusts", {
	description = "Aluminium & Silicon Dusts",
	inventory_image = "aluminium_and_silicon_dusts.png"
})

core.register_craftitem("basic_materials:silumin_ingot", {
	description = "Silumin Ingot",
	inventory_image = "silumin.png"
})

core.register_craftitem("basic_materials:aluminium_lump", {
	description = "Aluminium Lump",
	inventory_image = "aluminium_lump.png"
})

core.register_craftitem("basic_materials:phosphorus_lump", {
	description = "Phosphorus Lump",
	inventory_image = "phosphorus.png"
})

core.register_node("basic_materials:aluminium_ore", {
	description = "Aluminium Ore",
	tiles = {"default_stone.png^aluminium_ore.png"},
	drop="",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		random_dropped_items_amount(digger, "basic_materials:aluminium_lump ", 6)
	end
})

core.register_node("basic_materials:phosphorus_ore", {
	description = "Phosphorus Ore",
	tiles = {"default_stone.png^phosphorus_ore.png"},
	drop="",
	groups = {cracky=2.3},
	sounds = default.node_sound_stone_defaults(),
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		random_dropped_items_amount(digger, "basic_materials:phosphorus_lump ", 3)
	end
})

core.register_ore({
	ore_type = "scatter",
	ore = "basic_materials:aluminium_ore",
	wherein = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 180,
	clust_num_ores = 7,
	clust_size = 4,
	y_max = -40,
	y_min = -31000
})

core.register_ore({
	ore_type = "scatter",
	ore = "basic_materials:phosphorus_ore",
	wherein = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 400,
	clust_num_ores = 4,
	clust_size = 2,
	y_max = -100,
	y_min = -31000
})

for i, v in pairs({"red", "white", "blue", "green"}) do
	core.register_craftitem("basic_materials:".. v .. "_led", {
		description = string.upper(string.sub(v, 1, 1)) .. string.sub(v, 2) .. " LED",
		inventory_image = v .. "_led.png"
	})
end

core.register_craft({
	output = "basic_materials:car_frame_material",
	recipe = {
		{"default:steel_ingot", "basic_materials:plastic_sheet", "basic_materials:aluminium_dust"},
		{"default:steel_ingot", "basic_materials:plastic_sheet", "basic_materials:aluminium_dust"},
		{"basic_materials:plastic_sheet", "xpanes:pane_flat", ""}
	}
})

core.register_craft({
	type="shapeless",
	output = "basic_materials:aluminium_and_silicon_dusts",
	recipe = {"basic_materials:aluminium_dust", "basic_materials:silicon_dust"}
})

core.register_craft({
	type="cooking",
	output = "basic_materials:silumin_ingot",
	recipe = "basic_materials:aluminium_and_silicon_dusts",
	cooktime = 13
})
core.register_craft({
	type="shapeless",
	output = "basic_materials:silicon_dust",
	recipe = {"basic_materials:silicon"}
})

core.register_craft({
	type="shapeless",
	output = "basic_materials:aluminium_dust",
	recipe = {"basic_materials:aluminium_lump"}
})

core.register_craft({
	type="shapeless",
	output = "basic_materials:phosphorus_dust",
	recipe = {"basic_materials:phosphorus_lump"}
})

core.register_craft({
	output = "basic_materials:white_led 12",
	recipe = {
		{"dye:white", "basic_materials:plastic_sheet", "basic_materials:copper_strip"}
	}
})

core.register_craft({
	output = "basic_materials:red_led 12",
	recipe = {
		{"basic_materials:aluminium_dust", "basic_materials:plastic_sheet", "basic_materials:copper_strip"}
	}
})

core.register_craft({
	output = "basic_materials:blue_led 12",
	recipe = {
		{"basic_materials:silicon_dust", "basic_materials:plastic_sheet", "basic_materials:copper_strip"}
	}
})

core.register_craft({
	output = "basic_materials:green_led 12",
	recipe = {
		{"basic_materials:phosphorus_dust", "basic_materials:plastic_sheet", "basic_materials:copper_strip"}
	}
})

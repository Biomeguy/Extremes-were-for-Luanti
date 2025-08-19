--function for registering mineral trees--
function mineraltrees.register_mineral_tree(mineral, has_bloom, tree_rarity, enabled)
	if not enabled then
		return
	end

	core.register_node("mineraltrees:"..mineral.."trunk", {
		description = mineral.."wood Trunk",
		tiles = {"default_orange_trunk_top.png", "default_orange_trunk_top.png", "mineraltrees_"..mineral.."trunk.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {trunk=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		on_place = core.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})

	core.register_node("mineraltrees:"..mineral.."leaves", {
		description = mineral.."wood Leaves",
		drawtype = leaf_drawtype,
		mesh = "leaf_poof.obj",
		waving = waving_style,
		tiles = {"mineraltrees_"..mineral.."leaves.png"},
		inventory_image = leaf_image("mineraltrees_"..mineral.."leaves.png"),
		wield_image = leaf_image("mineraltrees_"..mineral.."leaves.png"),
		paramtype = "light",
		is_ground_content = false,
		collision_box = leaf_cbox,
		groups = {snappy=3, leafdecay=3, flammable=1},
		drop = {
			max_items = 1,
			items = {
				{items = {"mineraltrees:"..mineral.."sapling"}, rarity = 200},
				{items = {"mineraltrees:"..mineral.."leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
	})

	local tree_def = {
		axiom ="FFFFFFFAFFFFF/A",
		rules_a = "[&&[F^TFDFFDFFDFF][--F^TFDFFDFFDFF][----F^TFDFFDFFDFF][++F^TFDFFDFFDFF]]",
		rules_b = "",
		rules_c = "F",
		rules_d = "&",
		trunk="mineraltrees:"..mineral.."trunk",
		leaves="mineraltrees:"..mineral.."leaves",
		angle=mineraltrees.tree_angle,
		iterations=2,
		random_level=0,
		trunk_type="crossed",
		thin_branches=true
	}

local function grow_tree(pos)
	local under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not under then
		core.get_node_timer(pos):start(300)
		return
	end
	if under.name ~= "caverealms:rocks_with_moss" and under.name ~= "caverealms:rocks_with_lichen" and
	under.name ~= "caverealms:rocks_with_algae" and core.get_item_group(under.name, "soil") == 0 then
		core.set_node(pos, {name = "default:dry_shrub"})
		return
	end
	local light_level = core.get_node_light(pos)
	if #core.find_nodes_in_area({x = pos.x +1, y = pos.y +1, z = pos.z +1},
		{x = pos.x -1, y = pos.y -1, z = pos.z -1}, {"group:igniter"}) > 0 or
		not light_level or light_level < 4 or not enough_height(pos, 15) then
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	core.remove_node(pos)
	core.spawn_tree(pos, tree_def)
end

	core.register_node("mineraltrees:"..mineral.."sapling", {
		description = mineral.."wood Sapling",
		drawtype = "plantlike",
		tiles ={"mineraltrees_"..mineral.."sapling.png"},
		inventory_image = "mineraltrees_"..mineral.."sapling.png",
		wield_image = "mineraltrees_"..mineral.."sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_tree,
		selection_box = {
			type = "fixed",
			fixed = {-.3, -.5, -.3, .3, .35, .3}
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1, mineral_life=1, timer_check=1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			core.get_node_timer(pos):start(math.random(600, 3000))
		end
	})

	core.register_craftitem("mineraltrees:"..mineral.."bark", {
		description = mineral.."wood Bark",
		inventory_image = "mineraltrees_"..mineral.."trunk.png"
	})

	--registers bloom if applicable
	if (has_bloom)then
		core.register_craftitem("mineraltrees:"..mineral.."_bloom", {
			description = mineral.." Bloom",
			inventory_image = "mineraltrees_"..mineral.."_bloom.png"
		})

		core.register_craft({
			type = "cooking",
			output = "mineraltrees:"..mineral.."_bloom",
			recipe = "mineraltrees:"..mineral.."bark"
		})
	else
		core.register_craft({
		type = "fuel",
		recipe = "mineraltrees:"..mineral.."bark",
		burntime = 5
	})
	end

	default.register_leafdecay({
		trunks = {"mineraltrees:"..mineral.."trunk"},
		leaves = {"mineraltrees:"..mineral.."leaves"},
		radius = 2,
	})

	table.insert(mineraltrees.bark_array, "mineraltrees:"..mineral.."bark 4")
	table.insert(mineraltrees.bloom_array, "mineraltrees:"..mineral.."_bloom")
	table.insert(mineraltrees.tree_array, "mineraltrees:"..mineral.."trunk")
	mineraltrees.seed_dif = mineraltrees.seed_dif+1

	--adds sapling to sapling array according to rarity
	for i = 0, tree_rarity do
		table.insert(mineraltrees.sapling_rarity_array, "mineraltrees:"..mineral.."sapling")
	end
end
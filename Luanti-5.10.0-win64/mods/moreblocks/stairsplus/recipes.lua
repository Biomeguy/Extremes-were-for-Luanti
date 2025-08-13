--[[
More Blocks: Stairs+

Copyright © 2011-2019 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]


stairsplus.register_recipes = function(category, alternate, modname, subname, recipeitem)
	if category == "micro" and alternate == "" then
		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {"stairs:stair_inner_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 6",
			recipe = {"stairs:stair_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 5",
			recipe = {"stairs:stair_outer_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {"stairs:slab_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":slab_" .. subname .. "_centered"},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":stair_" .. subname .. "_alt"},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":stair_" .. subname .. "_right_half"},
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":panel_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = recipeitem,
			recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
		})

		core.register_alias(modname .. ":micro_" .. subname .. "_bottom", modname .. ":micro_" .. subname)
	elseif category == "panel" and alternate == "" then
		core.register_craft({
			output = modname .. ":panel_" .. subname .. " 12",
			recipe = {
				{recipeitem, ""},
				{recipeitem, recipeitem},
			},
		})

		core.register_craft({
			output = modname .. ":panel_" .. subname .. " 12",
			recipe = {
				{"", recipeitem},
				{recipeitem, recipeitem},
			},
		})

		core.register_craft({
			output = modname .. ":panel_" .. subname .. "_narrow 18",
			recipe = {
				{recipeitem},
				{recipeitem}
			}
		})

		core.register_craft({
			output = modname .. ":slope_" .. subname .. "_pole",
			recipe = {{modname .. ":panel_" .. subname .. "_narrow"}}
		})

		core.register_craft({
			type = "shapeless",
			output = modname .. ":panel_" .. subname,
			recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
		})

		core.register_craft({
			type = "shapeless",
			output = recipeitem,
			recipe = {modname .. ":panel_" .. subname, modname .. ":panel_" .. subname, modname .. ":panel_" .. subname, modname .. ":panel_" .. subname},
		})

		core.register_alias(modname.. ":panel_" ..subname.. "_bottom", modname.. ":panel_" ..subname)
	elseif category == "slab" then
		if alternate == "_quarter" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_three_quarter", modname .. ":slab_" .. subname .. "_quarter"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_three_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1"},
			})

	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_quarter 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_quarter_centered"},
			{""},
			{modname .. ":slab_" .. subname .. "_quarter_centered"}
		}
	})
		elseif alternate == "_three_quarter" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {"stairs:slab_" .. subname, modname .. ":slab_" .. subname .. "_quarter"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_centered", modname .. ":slab_" .. subname .. "_quarter_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_three_quarter",
				recipe = {modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered"},
			})

	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_three_quarter 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_three_quarter_centered"},
			{""},
			{modname .. ":slab_" .. subname .. "_three_quarter_centered"}
		}
	})
		elseif alternate == "_2" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_14", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_14", modname .. ":slab_" .. subname .. "_2_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_2",
				recipe = {modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1"},
			})

	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_2 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_2_centered"},
			{""},
			{modname .. ":slab_" .. subname .. "_2_centered"}
		}
	})
		elseif alternate == "_14" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_14",
				recipe = {modname .. ":slab_" .. subname .. "_three_quarter", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_14",
				recipe = {modname .. ":slab_" .. subname .. "_three_quarter_centered", modname .. ":slab_" .. subname .. "_2_centered"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_14",
				recipe = {modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_14",
				recipe = {modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered"},
			})

			core.register_craft({
				output = modname .. ":slab_" .. subname .. "_14",
				recipe = {{modname .. ":slope_" .. subname .. "_blob"}},
			})
		elseif alternate == "_15" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slab_" .. subname .. "_15", modname .. ":slab_" .. subname .. "_1"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slab_" .. subname .. "_15",
				recipe = {modname .. ":slab_" .. subname .. "_14", modname .. ":slab_" .. subname .. "_1"},
			})
		elseif alternate == "_square_column" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem .. " 2",
				recipe = {modname .. ":slab_" .. subname .. "_square_column", modname .. ":slab_" .. subname .. "_square_column", modname .. ":panel_" .. subname},
			})
		end
	elseif category == "slope" then
		if alternate == "" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname, modname .. ":slope_" .. subname},
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname .. "_curve",
				recipe = {{modname .. ":slope_" .. subname}}
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname,
				recipe = {{modname .. ":slope_" .. subname .. "_curve"}}
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem .. " 2",
				recipe = {modname .. ":slope_" .. subname .. "_oct", modname .. ":slope_" .. subname .. "_oct", modname .. ":panel_" .. subname},
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname .. "_cylinder",
				recipe = {{modname .. ":slope_" .. subname .. "_oct"}}
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem .. " 2",
				recipe = {modname .. ":slope_" .. subname .. "_cylinder", modname .. ":slope_" .. subname .. "_cylinder", modname .. ":panel_" .. subname},
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname .. "_oct",
				recipe = {{modname .. ":slope_" .. subname .. "_cylinder"}}
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_pyramid", modname .. ":slope_" .. subname .. "_pyramid", modname .. ":slope_" .. subname .. "_pyramid", modname .. ":slope_" .. subname .. "_pyramid", modname .. ":slope_" .. subname .. "_pyramid", modname .. ":slope_" .. subname .. "_pyramid"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_sphere", modname .. ":slope_" .. subname .. "_sphere"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem .. " 2",
				recipe = {modname .. ":slope_" .. subname .. "_spike_pyramid", modname .. ":slope_" .. subname .. "_spike_pyramid", modname .. ":slope_" .. subname .. "_spike_pyramid", modname .. ":slope_" .. subname .. "_spike_pyramid"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem .. " 2",
				recipe = {modname .. ":slope_" .. subname .. "_cone", modname .. ":slope_" .. subname .. "_cone", modname .. ":slope_" .. subname .. "_cone", modname .. ":slope_" .. subname .. "_cone"},
			})

			core.register_craft({
				output = modname .. ":panel_" .. subname .. "_narrow",
				recipe = {{modname .. ":slope_" .. subname .. "_pole"}}
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname .. "_blob",
				recipe = {{modname .. ":slab_" .. subname .. "_14"}},
			})

			core.register_craft({
				output = modname .. ":slope_" .. subname .. "_peek 6",
				recipe = {{"", modname .. ":slope_" .. subname, ""},
					{modname .. ":slope_" .. subname, "", modname .. ":slope_" .. subname}}
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname,
				recipe = {modname .. ":slope_" .. subname .. "_peek", modname .. ":slope_" .. subname .. "_peek"},
			})
		elseif alternate == "_half" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_half", modname .. ":slope_" .. subname .. "_half_raised"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_half", modname .. ":slope_" .. subname .. "_half",
					modname .. ":slope_" .. subname .. "_half", modname .. ":slope_" .. subname .. "_half"},
			})
		elseif alternate == "_outer" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_outer", modname .. ":slope_" .. subname .. "_inner"},
			})
		elseif alternate == "_outer_half" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_outer_half", modname .. ":slope_" .. subname .. "_inner_half_raised"},
			})
		elseif alternate == "_inner_half" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_outer_half_raised", modname .. ":slope_" .. subname .. "_inner_half"},
			})
		elseif alternate == "_outer_cut" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_outer_cut", modname .. ":slope_" .. subname .. "_inner_cut"},
			})
		elseif alternate == "_outer_cut_half" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_outer_cut_half", modname .. ":slope_" .. subname .. "_inner_cut_half_raised"},
			})
		elseif alternate == "_cut" then
			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_cut", modname .. ":slope_" .. subname .. "_cut"},
			})
		elseif alternate == "_half_raised" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_half_raised",
				recipe = {modname .. ":slope_" .. subname .. "_half", modname .. ":slope_" .. subname .. "_half",
					modname .. ":slope_" .. subname .. "_half"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_half_raised",
				recipe = {"stairs:slab_" .. subname, modname .. ":slope_" .. subname .. "_half"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_half_raised",
				recipe = {modname .. ":slab_" .. subname .. "_centered", modname .. ":slope_" .. subname .. "_half"},
			})
		elseif alternate == "_inner_half_raised" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_inner_half_raised",
				recipe = {"stairs:slab_" .. subname, modname .. ":slope_" .. subname .. "_inner_half"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_inner_half_raised",
				recipe = {modname .. ":slab_" .. subname .. "_centered", modname .. ":slope_" .. subname .. "_inner_half"},
			})
		elseif alternate == "_outer_half_raised" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_outer_half_raised",
				recipe = {"stairs:slab_" .. subname, modname .. ":slope_" .. subname .. "_outer_half"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_outer_half_raised",
				recipe = {modname .. ":slab_" .. subname .. "_centered", modname .. ":slope_" .. subname .. "_outer_half"},
			})
		elseif alternate == "_inner_cut_half_raised" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_inner_cut_half_raised",
				recipe = {"stairs:slab_" .. subname, modname .. ":slope_" .. subname .. "_inner_cut_half"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":slope_" .. subname .. "_inner_cut_half_raised",
				recipe = {modname .. ":slab_" .. subname .. "_centered", modname .. ":slope_" .. subname .. "_inner_cut_half"},
			})
		elseif alternate == "_angled_slab" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":micro_" .. subname .. " 2",
				recipe = {modname .. ":slope_" .. subname .. "_angled_slab"},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":micro_" .. subname .. " 6",
				recipe = {modname .. ":slope_" .. subname .. "_angled_stair"},
			})

			core.register_craft({
				type = "shapeless",
				output = recipeitem,
				recipe = {modname .. ":slope_" .. subname .. "_angled_slab", modname .. ":slope_" .. subname .. "_angled_stair"},
			})
		end
	elseif category == "stair" then
		if alternate == "_half" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":stair_" .. subname .. "_half",
				recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
			})

			core.register_craft({
				type = "shapeless",
				output = modname .. ":stair_" .. subname .. "_half",
				recipe = {modname .. ":panel_" .. subname, modname .. ":micro_" .. subname},
			})
		elseif alternate == "_right_half" then
			core.register_craft({
				type = "shapeless",
				output = modname .. ":stair_" .. subname .. "_right_half",
				recipe = {modname .. ":stair_" .. subname .. "_half"},
			})
		elseif alternate == "_alt" then
			core.register_craft({ -- See mirrored variation of the recipe below.
				output = modname .. ":stair_" .. subname .. "_alt",
				recipe = {
					{modname .. ":panel_" .. subname, ""},
					{"", modname .. ":panel_" .. subname},
				},
			})

			core.register_craft({ -- Mirrored variation of the recipe above.
				output = modname .. ":stair_" .. subname .. "_alt",
				recipe = {
					{"", modname .. ":panel_" .. subname},
					{modname .. ":panel_" .. subname, ""},
				},
			})
		end
	end
end

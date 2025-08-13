--[[
More Blocks: registrations

Copyright © 2011-2019 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]


local box_slope = {
	type = "fixed",
	fixed = {
		{-.5,  -.5,  -.5, .5, -.25, .5},
		{-.5, -.25, -.25, .5,     0, .5},
		{-.5,     0,     0, .5,  .25, .5},
		{-.5,  .25,  .25, .5,   .5, .5}
	}
}

local box_slope_half = {
	type = "fixed",
	fixed = {
		{-.5, -.5, .25, .5, 0, .5},
		{-.5, -.5, 0, .5, -.125, .25},
		{-.5, -.5, -.25, .5, -.25, 0}, 
		{-.5, -.5, -.5, .5, -.375, -.25}
	}
}

local box_slope_half_raised = {
	type = "fixed",
	fixed = {
		{-.5, -.5,   -.5,  .5, .125, .5},
		{-.5, .125, -.25, .5, .25,  .5},
		{-.5, .25,  0,    .5, .375, .5},
		{-.5, .375, .25, .5,  .5,     .5},
	}
}

local box_slope_inner = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, -.25, .5},
		{-.5, -.5, -.25, .5, 0, .5},
		{-.5, -.5, -.5, .25, 0, .5},
		{-.5, 0, -.5, 0, .25, .5},
		{-.5, 0, 0, .5, .25, .5},
		{-.5, .25, .25, .5, .5, .5},
		{-.5, .25, -.5, -.25, .5, .5},
	}
}

local box_slope_inner_half = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, -.375, .5},
		{-.5, -.375, -.25, .5, -.25, .5},
		{-.5, -.375, -.5, .25, -.25, .5},
		{-.5, -.25, -.5, 0, -.125, .5},
		{-.5, -.25, 0, .5, -.125, .5},
		{-.5, -.125, .25, .5, 0, .5},
		{-.5, -.125, -.5, -.25, 0, .5},
	}
}

local box_slope_inner_half_raised = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .125, .5},
		{-.5, .125, -.25, .5, .25, .5},
		{-.5, .125, -.5, .25, .25, .5},
		{-.5, .25, -.5, 0, .375, .5},
		{-.5, .25, 0, .5, .375, .5},
		{-.5, .375, .25, .5, .5, .5},
		{-.5, .375, -.5, -.25, .5, .5},
	}
}

local box_slope_outer = {
	type = "fixed",
	fixed = {
		{-.5,  -.5,  -.5,   .5, -.25, .5},
		{-.5, -.25, -.25,  .25,     0, .5},
		{-.5,     0,     0,     0,  .25, .5},
		{-.5,  .25,  .25, -.25,   .5, .5}
	}
}

local box_slope_outer_half = {
	type = "fixed",
	fixed = {
		{-.5,  -.5,  -.5,   .5, -.375, .5},
		{-.5, -.375, -.25,  .25, -.25, .5},
		{-.5,  -.25,     0,     0, -.125, .5},
		{-.5,  -.125,  .25, -.25, 0, .5}
	}
}

local box_slope_outer_half_raised = {
	type = "fixed",
	fixed = {
		{-.5,  -.5,  -.5,  .5, .125, .5},
		{-.5, .125, -.25,  .25, .25, .5},
		{-.5,  .25,   0,    0, .375, .5},
		{-.5,  .375,  .25, -.25, .5, .5}
	}
}

local box_column = {
	type = "fixed",
	fixed = {
		{-.2, -.5, -.5, .2, .5, .5},
		{-.4, -.5, -.4, .4, .5, .4},
		{-.5, -.5, -.2, .5, .5, .2}
	}
}

local box_spike = {
	type = "fixed",
	fixed = {
		{-.5,	-.5,	-.5,	.5,	-.25,	.5},
		{-.375,	-.25,	-.375,	.375,	0,	.375},
		{-.25,	0,	-.25,	.25,	.25,	.25},
		{-.125,	.25,	-.125,	.125,	.5,	.125}
	}
}

local box_pyr = {
	type = "fixed",
	fixed = {
		{-.5,	-.5,	-.5,	.5,		-.375,	.5},
		{-.375,	-.375,	-.375,	.375,	-.25,	.375},
		{-.25,	-.25,	-.25,	.25,	-.125,	.25},
		{-.125,	-.125,	-.125,	.125,	0,	.125}
	}
}

local box_cone = {
	type = "fixed",
	fixed = {
		{-.2, -.5, -.5, .2, -.25, .5},
		{-.4, -.5, -.4, .4, -.25, .4},
		{-.5, -.5, -.2, .5, -.25, .2},
		{-.125, -.25, -.35, .125, 0, .35},
		{-.3, -.25, -.3, .3, 0, .3},
		{-.35, -.25, -.125, .35, 0, .125},
		{-.2, 0, -.2, .2, .25, .2},
		{-.12, .25, -.12, .12, .5, .12}
	}
}

local box_sphere = {
	type = "fixed",
	fixed = {
		{-.25, -.25, -.45,	.25, .25, .45},
		{-.35, -.35, -.35,	.35, .35, .35},
		{-.45, -.25, -.25,	.45, .25, .25},
		{-.25, -.45, -.25,	.25, .45, .25}
	}
}

local box_slope_o45 = {
	type = "fixed",
	fixed = {
		{-.5, -.5, .25, -.25, .5, .5},
		{-.5, -.5, 0, -.25, .25, .25},
		{-.5, -.5, -.25, -.25, 0, 0},
		{-.5, -.5, -.5, -.25, -.25, -.25},
		{-.25, -.5, .25, 0, .25, .5},
		{0, -.5, .25, .25, 0, .5},
		{.25, -.5, .25, .5, -.25, .5},
		{-.25, -.5, 0, 0, 0, .25},
		{-.25, -.5, -.25, 0, -.25, 0},
		{0, -.5, 0, .25, -.25, .25}
	}
}

local box_slope_o45_half = {
	type = "fixed",
	fixed = {
		{-.5, -.5, .25, -.25, 0, .5},
		{-.5, -.5, 0, -.25, -.125, .25},
		{-.5, -.5, -.25, -.25, -.25, 0},
		{-.5, -.5, -.5, -.25, -.375, -.25},
		{-.25, -.5, .25, 0, -.125, .5},
		{0, -.5, .25, .25, -.25, .5},
		{.25, -.5, .25, .5, -.375, .5},
		{-.25, -.5, 0, 0, -.25, .25},
		{-.25, -.5, -.25, 0, -.375, 0},
		{0, -.5, 0, .25, -.375, .25}
	}
}

local box_curve = {
	type = "fixed",
	fixed = {
		{-.5, -.5, .4375,	.5, .5,		.5},
		{-.5, -.5, .375,	.5, .125,	.5},
		{-.5, -.5, -.5,		.5, -.4375,	.5},
		{-.5, -.5, -.125,	.5, -.375,	.5},
		{-.5, -.5, .0625,	.5, -.25,	.5},
		{-.5, -.5, .25,		.5, -.0625,	.5},
		{-.5, -.5, .25,		.5, -.0625,	.5},
		{-.5, -.5, .0625,	.5, -.25,	.5}
	}
}

local box_blob = {
	type = "fixed",
	fixed = {
		{-.5,	-.25,	-.5,	.5,		.25,	.5},
		{-.375,	-.437,	-.375,	.375,	.437,	.375}
	}
}

local box_peek = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5,		.5, -.25,	.5},
		{-.5, -.25, -.25,	.5, 0,	.25}
	}
}

stairsplus.defs = {
	["micro"] = {
		[""] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, 0, .5},
			},
		},
		["_1"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, -.4375, .5},
			},
		},
		["_2"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, -.375, .5},
			},
		},
		["_4"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, -.25, .5},
			},
		},
		["_12"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, .25, .5},
			},
		},
		["_14"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, .375, .5},
			},
		},
		["_15"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, 0, .4375, .5},
			},
		}
	},
	["panel"] = {
		[""] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, 0, .5},
			},
		},
		["_1"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, -.4375, .5},
			},
		},
		["_2"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, -.375, .5},
			},
		},
		["_4"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, -.25, .5},
			},
		},
		["_12"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, .25, .5},
			},
		},
		["_14"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, .375, .5},
			},
		},
		["_15"] = {
			node_box = {
				type = "fixed",
				fixed = {-.5, -.5, 0, .5, .4375, .5},
			},
		},
		["_narrow"] = {
			node_box = {
				type = "fixed",
				fixed = {-.125, -.5, -.125, .125, .5, .125},
			},
		}
	},
	["slab"] = {
		["_quarter"] = 4,
		["_three_quarter"] = 12,
		["_1"] = 1,
		["_2"] = 2,
		["_14"] = 14,
		["_15"] = 15,
		["_two_sides"] = {
			{ -.5, -.5, -.5, .5, -7/16, 7/16 },
			{ -.5, -.5, 7/16, .5, .5, .5 }
		},
		["_three_sides"] = {
			{ -7/16, -.5, -.5, .5, -7/16, 7/16 },
			{ -7/16, -.5, 7/16, .5, .5, .5 },
			{ -.5, -.5, -.5, -7/16, .5, .5 }
		},
		["_three_sides_u"] = {
			{ -.5, -.5, -.5, .5, .5, -7/16 },
			{ -.5, -.5, -7/16, .5, -7/16, 7/16 },
			{ -.5, -.5, 7/16, .5, .5, .5 }
		},
		["_square_column"] = {
			{ .3, -.5, .5, -.3, .5, -.5 },
			{ -.5, -.5, -.3, .5, .5, .3 }
		},
		["_2_centered"] = {-.5, -.5, -.0625, .5, .5, .0625},
		["_quarter_centered"] = {-.5, -.5, -.125, .5, .5, .125},
		["_centered"] = {-.5, -.5, -.25, .5, .5, .25},
		["_three_quarter_centered"] = {-.5, -.5, -.375, .5, .5, .375}
	},
	["slope"] = {
		[""] = {
			mesh = "moreblocks_slope.obj",
			collision_box = box_slope,
			selection_box = box_slope,
		},
		["_half"] = {
			mesh = "moreblocks_slope_half.obj",
			collision_box = box_slope_half,
			selection_box = box_slope_half,
		},
		["_half_raised"] = {
			mesh = "moreblocks_slope_half_raised.obj",
			collision_box = box_slope_half_raised,
			selection_box = box_slope_half_raised,
		},

		--==============================================================

		["_inner"] = {
			mesh = "moreblocks_slope_inner.obj",
			collision_box = box_slope_inner,
			selection_box = box_slope_inner,
		},
		["_inner_half"] = {
			mesh = "moreblocks_slope_inner_half.obj",
			collision_box = box_slope_inner_half,
			selection_box = box_slope_inner_half,
		},
		["_inner_half_raised"] = {
			mesh = "moreblocks_slope_inner_half_raised.obj",
			collision_box = box_slope_inner_half_raised,
			selection_box = box_slope_inner_half_raised,
		},

		--==============================================================

		["_inner_cut"] = {
			mesh = "moreblocks_slope_inner_cut.obj",
			collision_box = box_slope_inner,
			selection_box = box_slope_inner,
		},
		["_inner_cut_half"] = {
			mesh = "moreblocks_slope_inner_cut_half.obj",
			collision_box = box_slope_inner_half,
			selection_box = box_slope_inner_half,
		},
		["_inner_cut_half_raised"] = {
			mesh = "moreblocks_slope_inner_cut_half_raised.obj",
			collision_box = box_slope_inner_half_raised,
			selection_box = box_slope_inner_half_raised,
		},

		--==============================================================

		["_outer"] = {
			mesh = "moreblocks_slope_outer.obj",
			collision_box = box_slope_outer,
			selection_box = box_slope_outer,
		},
		["_outer_half"] = {
			mesh = "moreblocks_slope_outer_half.obj",
			collision_box = box_slope_outer_half,
			selection_box = box_slope_outer_half,
		},
		["_outer_half_raised"] = {
			mesh = "moreblocks_slope_outer_half_raised.obj",
			collision_box = box_slope_outer_half_raised,
			selection_box = box_slope_outer_half_raised,
		},

		--==============================================================

		["_outer_cut"] = {
			mesh = "moreblocks_slope_outer_cut.obj",
			collision_box = box_slope_o45,
			selection_box = box_slope_o45,
		},
		["_outer_cut_half"] = {
			mesh = "moreblocks_slope_outer_cut_half.obj",
			collision_box = box_slope_o45_half,
			selection_box = box_slope_o45_half,
		},
		["_outer_cut_half_raised"] = {
			mesh = "moreblocks_slope_outer_cut_half_raised.obj",
			collision_box = box_slope_outer_half_raised,
			selection_box = box_slope_outer_half_raised,
		},
		["_cut"] = {
			mesh = "moreblocks_slope_cut.obj",
			collision_box = box_slope_outer,
			selection_box = box_slope_outer,
		},
		["_angled_slab"] = {
			mesh = "moreblocks_angled_slab.obj",
			collision_box = {
				type = "fixed",
				fixed = {
			{-.5, -.5, 0, .0625, 0, .5},
			{.0625, -.5, .0625, .125, 0, .5},
			{.125, -.5, .125, .1875, 0, .5},
			{.1875, -.5, .1875, .25, 0, .5},
			{.25, -.5, .25, .3125, 0, .5},
			{.3125, -.5, .3125, .375, 0, .5},
			{.375, -.5, .375, .4375, 0, .5},
			{.4375, -.5, .4375, .5, 0, .5},
			{-.5, -.5, -.5, -.4375, 0, -.4375},
			{-.5, -.5, -.4375, -.375, 0, -.375},
			{-.5, -.5, -.375, -.3125, 0, -.3125},
			{-.5, -.5, -.3125, -.25, 0, -.25},
			{-.5, -.5, -.25, -.1875, 0, -.1875},
			{-.5, -.5, -.1875, -.125, 0, -.125},
			{-.5, -.5, -.125, -.0625, 0, -.0625},
			{-.5, -.5, -.0625, 0, 0, 0}
				}
			},
			selection_box = box_slope_o45_half,
		},
		["_angled_stair"] = {
			mesh = "moreblocks_angled_stair.obj",
			collision_box = {
				type = "fixed",
				fixed = {
			{-.5, -.5, 0, .0625, .5, .5},
			{.0625, -.5, .0625, .125, .5, .5},
			{.125, -.5, .125, .1875, .5, .5},
			{.1875, -.5, .1875, .25, .5, .5},
			{.25, -.5, .25, .3125, .5, .5},
			{.3125, -.5, .3125, .375, .5, .5},
			{.375, -.5, .375, .4375, .5, .5},
			{.4375, -.5, .4375, .5, .5, .5},
			{-.5, -.5, -.5, -.4375, .5, -.4375},
			{-.5, -.5, -.4375, -.375, .5, -.375},
			{-.5, -.5, -.375, -.3125, .5, -.3125},
			{-.5, -.5, -.3125, -.25, .5, -.25},
			{-.5, -.5, -.25, -.1875, .5, -.1875},
			{-.5, -.5, -.1875, -.125, .5, -.125},
			{-.5, -.5, -.125, -.0625, .5, -.0625},
			{-.5, -.5, -.0625, 0, .5, 0},
			{-.5, -.5, -.5, .5, 0, .5}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-.5, -.5, -.5, .5, 0, .5},
					{-.5, 0, 0, 0, .5, .5}
				}
			},
		},
		["_oct"] = {
			mesh = "mymeshnodes_oct.obj",
			collision_box = box_column,
			selection_box = box_column,
		},
		["_cylinder"] = {
			mesh = "moreblocks_cylinder.obj",
			collision_box = box_column,
			selection_box = box_column,
		},
		["_spike_pyramid"] = {
			mesh = "moreblocks_spike_pyramid.obj",
			collision_box = box_spike,
			selection_box = box_spike,
		},
		["_pyramid"] = {
			mesh = "moreblocks_pyramid.obj",
			collision_box = box_pyr,
			selection_box = box_pyr,
		},
		["_cone"] = {
			mesh = "moreblocks_cone.obj",
			collision_box = box_cone,
			selection_box = box_cone,
		},
		["_sphere"] = {
			mesh = "moreblocks_sphere.obj",
			collision_box = box_sphere,
			selection_box = box_sphere,
		},
		["_pole"] = {
			mesh = "mymeshnodes_pole.obj",
			collision_box = {
				type = "fixed",
				fixed = {-.12, -.5, -.12, .12, .5, .12}
			},
			selection_box = {
				type = "fixed",
				fixed = {-.12, -.5, -.12, .12, .5, .12}
			},
		},
		["_curve"] = {
			mesh = "mymeshnodes_curve.obj",
			collision_box = box_curve,
			selection_box = box_curve,
		},
		["_blob"] = {
			mesh = "mymeshnodes_blob.obj",
			collision_box = box_blob,
			selection_box = box_blob,
		},
		["_peek"] = {
			mesh = "mymeshnodes_peek.obj",
			collision_box = box_peek,
			selection_box = box_peek,
		}
	},
	["stair"] = {
		["_half"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{-.5, -.5, -.5, 0, 0, .5},
					{-.5, 0, 0, 0, .5, .5}
				}
			},
		},
		["_right_half"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{0, -.5, -.5, .5, 0, .5},
					{0, 0, 0, .5, .5, .5}
				}
			},
		},
		["_alt"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{-.5, -.5, -.5, .5, 0, 0},
					{-.5, 0, 0, .5, .5, .5}
				}
			},
		},
		["_alt_1"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{-.5, -.0625, -.5, .5, 0, 0},
					{-.5, .4375, 0, .5, .5, .5}
				}
			},
		},
		["_alt_2"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{-.5, -.125, -.5, .5, 0, 0},
					{-.5, .375, 0, .5, .5, .5}
				}
			},
		},
		["_alt_4"] = {
			node_box = {
				type = "fixed",
				fixed = {
					{-.5, -.25, -.5, .5, 0, 0},
					{-.5, .25, 0, .5, .5, .5}
				}
			},
		}
	},
}

for type,a in pairs(stairsplus.defs) do
	for name,b in pairs(stairsplus.defs[type]) do
		table.insert(stairsplus.shapes_list, { type .. "_", name })
	end
end

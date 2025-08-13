
local R = {name = "mapgen:terracotta_shingles", force_place = true}
local S0 = {name = "stairs:stair_terracotta_shingles", force_place = true}
local S1 = {name = "stairs:stair_terracotta_shingles", param2 = 1, force_place = true}
local S2 = {name = "stairs:stair_terracotta_shingles", param2 = 2, force_place = true}
local S3 = {name = "stairs:stair_terracotta_shingles", param2 = 3, force_place = true}
local O0 = {name = "stairs:stair_outer_terracotta_shingles", force_place = true}
local O1 = {name = "stairs:stair_outer_terracotta_shingles", param2 = 1, force_place = true}
local O2 = {name = "stairs:stair_outer_terracotta_shingles", param2 = 2, force_place = true}
local O3 = {name = "stairs:stair_outer_terracotta_shingles", param2 = 3, force_place = true}
local MP = {name = "default:mese_post_light_acacia_wood", force_place = true}
local FW = {name = "fabric:block_white", force_place = true}
local F = {name = "mapgen:dark_sandstone", force_place = true}
local W0 = {name = "mapgen:limestone_pale", force_place = true}
local B0 = {name = "default:diamite", force_place = true}
local G0 = {name = "xpanes:pane_flat", force_place = true}
local G3 = {name = "xpanes:pane_flat", param2 = 3, force_place = true}
local SO = {name = "farming:soil_wet", force_place = true}
local CR = {name = "farming:carrot_S8", force_place = true}

mg_trader_house = {size = {x = 9, y = 7, z = 9}, data = {
__,__,__,__,__,__,__,__,__,
SO,SO,SO,SO, F,SO,SO,SO,SO,
CR,CR,CR,CR,__,CR,CR,CR,CR,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,

__,__,__,__,__,__,__,__,__,
SO,SO,SO,SO, F,SO,SO,SO,SO,
CR,CR,CR,CR,II,CR,CR,CR,CR,
__,__,MP,II,II,II,MP,__,__,
__,__,S0,S0,S0,S0,S0,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,

__,__,__, F, F, F,__,__,__,
SO,SO, F, F,FW, F, F,SO,SO,
CR,CR,B0,W0,{name = "doors:door_wood_a", force_place = true},W0,B0,CR,CR,
__,MP,B0,W0,{name = "doors:hidden", force_place = true},W0,B0,MP,__,
__,S1,W0,W0,W0,W0,W0,S3,__,
__,__,O1,S0,S0,S0,O0,__,__,
__,__,__,__,__,__,__,__,__,

__,__, F, F, F, F, F,__,__,
SO,SO, F,FW,FW, F, F,SO,SO,
CR,CR,W0,II,II,{name = "schem_spawn:chest_placer", param2 = 1, force_place = true},W0,CR,CR,
__,__,W0,II,II,II,W0,__,__,
__,S1,W0,II,II,II,W0,S3,__,
__,__,S1,W0,W0,W0,S3,__,__,
__,__,__,O1,S0,O0,__,__,__,

__,__, F, F,{name = "default:fresh_water_source", force_place = true}, F, F,__,__,
SO,SO, F,FW,FW,FW, F,SO,SO,
CR,CR,W0,II,II,II,W0,CR,CR,
__,__,G3,II,II,II,G3,__,__,
__,S1,W0,II,{name = "default:meselamp_torch", force_place = true},II,W0,S3,__,
__,__,S1,W0,W0,W0,S3,__,__,
__,__,__,S1, R,S3,__,__,__,

__,__, F, F, F, F, F,__,__,
SO,SO, F, F,FW, F, F,SO,SO,
CR,CR,W0,{name = "schem_spawn:chest_placer", force_place = true},II,{name = "schem_spawn:furnace_placer", force_place = true},W0,CR,CR,
__,__,W0,II,II,II,W0,__,__,
__,S1,W0,II,II,II,W0,S3,__,
__,__,S1,W0,W0,W0,S3,__,__,
__,__,__,O2,S2,O3,__,__,__,

__,__,__, F, F, F,__,__,__,
SO,SO, F, F, F, F, F,SO,SO,
CR,CR,B0,W0,W0,W0,B0,CR,CR,
__,MP,B0,W0,G0,W0,B0,MP,__,
__,S1,W0,W0,W0,W0,W0,S3,__,
__,__,O2,S2,S2,S2,O3,__,__,
__,__,__,__,__,__,__,__,__,

__,__,__,__,__,__,__,__,__,
SO,SO,SO,SO,SO,SO,SO,SO,SO,
CR,CR,CR,CR,CR,CR,CR,CR,CR,
__,__,MP,__,__,__,MP,__,__,
__,__,S2,S2,S2,S2,S2,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,

__,__,__,__,__,__,__,__,__,
SO,SO,SO,SO,SO,SO,SO,SO,SO,
CR,CR,CR,CR,CR,CR,CR,CR,CR,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__,
__,__,__,__,__,__,__,__,__}}

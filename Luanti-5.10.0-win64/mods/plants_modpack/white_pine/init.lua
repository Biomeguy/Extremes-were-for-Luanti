
-- White Pine trees

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "white_pine:needles"}
local M = {name = "white_pine:needles", prob = 223}
local T = {name = "white_pine:trunk", force_place = true}

white_pine_tree = {size = {x = 9, y = 17, z = 9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,L,L,_,
_,M,_,_,_,_,_,M,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,L,L,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,L,T,L,_,L,T,L,_,
_,_,L,_,_,_,L,_,_,
_,_,_,L,T,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,L,T,L,_,L,T,L,_,
_,_,L,_,_,_,L,_,_,
_,_,_,L,T,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,L,L,_,L,L,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,T,_,T,L,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,T,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,L,T,_,T,L,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,T,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,L,_,_,_,
_,_,L,T,T,_,_,_,_,
_,_,_,L,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
L,L,T,T,T,T,T,L,L,
_,L,L,_,T,_,L,L,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
L,L,T,T,T,T,T,L,L,
_,L,L,_,T,_,L,L,_,
_,_,_,L,T,L,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,T,_,T,L,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,T,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,L,T,_,T,L,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,T,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,L,T,L,_,L,T,L,_,
_,_,L,_,_,_,L,_,_,
_,_,_,L,T,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,L,T,L,_,L,T,L,_,
_,_,L,_,_,_,L,_,_,
_,_,_,L,T,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,L,L,_,L,L,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,L,L,_,
_,M,_,_,_,_,_,M,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,L,L,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

white_pine_tree2 = {size = {x = 11, y = 29, z = 11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,L,_,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
L,L,T,T,T,T,T,T,T,L,L,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
L,L,T,T,T,T,T,T,T,L,L,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
L,L,T,T,T,T,T,T,T,L,L,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
L,L,T,T,T,T,T,T,T,L,L,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,T,_,L,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,T,L,_,L,T,L,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,L,_,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,T,L,_,_,_,L,T,L,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,_,_,_,_,_,_,_,M,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 17, prob = 127}}}

local function grow_white_pine_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 25) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, white_pine_tree2)
		return
	end
	add_tree(pos, 4, 1, 4, white_pine_tree)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.0005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"coniferous_forest"},
		y_min = 1,
		y_max = 32,
		schematic = white_pine_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("white_pine:sapling", {
	description = S("White Pine Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"white_pine_sapling.png"},
	inventory_image = "white_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_white_pine_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"white_pine:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 14, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 13,
})

core.register_node("white_pine:trunk", {
	description = S("White Pine Trunk"),
	tiles = {"white_pine_trunk_top.png", "white_pine_trunk_top.png", "white_pine_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, flammable = 3, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

local needle_scale2, needle_scale1
local force_poof = core.settings:get_bool("force_poofy_pines")
local leaf_type = tonumber(core.settings:get("mesh_leaves")) or 0

if force_poof == true then
	needle_drawtype = "mesh"
	needle_cbox = default.leaf_cbox
	needle_scale2 = 2
	needle_scale1 = 1.5
	function needle_image(image) return image end
else
	if leaf_type > 0 then
		needle_scale2 = 2
		needle_scale1 = 1.5
	end
	needle_drawtype = leaf_drawtype
	needle_image = leaf_image
	needle_cbox = leaf_cbox
end

core.register_node("white_pine:needles", {
	description = S("White Pine Needles"),
	drawtype = needle_drawtype,
	mesh = "leaf_poof.obj",
	visual_scale = needle_scale2,
	waving = waving_style,
	tiles = {"white_pine_needles.png"},
	inventory_image = needle_image("white_pine_needles.png"),
	wield_image = needle_image("white_pine_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = needle_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, resinous = 1},
	drop = {
		max_items = 2,
		items = {
			{items = {"white_pine:sapling"}, rarity = 20},
			{items = {"default:pine_nuts"}, rarity = 5},
			{items = {"white_pine:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("white_pine:needles_with_snow", {
	drawtype = needle_drawtype,
	mesh = "leaf_poof.obj",
	visual_scale = needle_scale2,
	waving = waving_style,
	tiles = {"white_pine_needles_with_snow.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = needle_cbox,
	on_timer = default.melt_near_heat,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, snowy = 1},
	drop = {
		max_items = 2,
		items = {
			{items = {"white_pine:sapling"}, rarity = 20},
			{items = {"default:pine_nuts"}, rarity = 5},
			{items = {"white_pine:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

if leaf_type > 0 or force_poof == true then
core.override_item("default:pine_needles",{
	drawtype = needle_drawtype,
	visual_scale = needle_scale1,
	tiles = {"defaults_pine_needles.png"},
	inventory_image = needle_image("defaults_pine_needles.png"),
	wield_image = needle_image("defaults_pine_needles.png"),
	collision_box = needle_cbox,
})

core.override_item("default:pinecone_needles",{
	drawtype = needle_drawtype,
	visual_scale = needle_scale1,
	tiles = {"defaults_pine_needles.png^defaults_pinecones.png"},
	collision_box = needle_cbox,
})
end

core.register_node(":default:pine_needles_with_snow",{
	drawtype = needle_drawtype,
	mesh = "leaf_poof.obj",
	visual_scale = needle_scale1,
	waving = waving_style,
	tiles = {"defaults_pine_needles_with_snow.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = needle_cbox,
	on_timer = default.melt_near_heat,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, snowy = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			{items = {"default:pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_abm({
	label = "Snowy pine needles",
	name = "white_pine:snowy_needles",
	nodenames = {"default:pine_needles", "default:pinecone_needles", "white_pine:needles"},
	neighbors = {"default:snow"},
	interval = 12,
	chance = 25,
	action = function(pos, node)
		local above = core.get_node({x= pos.x, y= pos.y+ 1, z= pos.z})
		if above.name ~= "default:snow" then
			return
		end
		if node.name == "white_pine:needles" then
			swap_preserved(pos, "white_pine:needles_with_snow")
		else
	if node.name == "default:pinecone_needles" then
		local f = core.find_node_near(pos, 2, "default:pine_trunk")
		if f then
		local meta = core.get_meta(pos)
		meta:set_string("pinecones", "true") end
	end
			swap_preserved(pos, "default:pine_needles_with_snow")
		end
		core.get_node_timer(pos):start(math.random(5, 9))
	end
})

-- Recipes

core.register_craft({
	output = "default:pine_wood 4",
	recipe = {{"white_pine:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "white_pine:trunk",
	burntime = 30,
})


core.register_lbm({
	name = "white_pine:convert_white_pine_saplings_to_node_timer",
	nodenames = {"white_pine:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"white_pine:trunk"},
	leaves = {"white_pine:needles"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:pine_trunk"},
	leaves = {"default:pine_needles", "default:pinecone_needles", "default:pine_needles_with_snow"},
	radius = 2,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"white_pine:sapling", grow_white_pine_tree, "soil"},
	})
end

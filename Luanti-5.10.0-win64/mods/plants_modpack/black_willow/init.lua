
-- Black willow tree	Salix nigra

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "black_willow:leaves"}
local M = {name = "black_willow:leaves", prob = 126}
local T = {name = "black_willow:trunk", force_place = true}

black_willow_tree = {size = {x=17, y=15, z=17}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,L,L,_,_,_,
_,_,_,L,L,_,_,_,L,_,_,L,L,M,_,_,_,
_,_,_,M,L,L,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,L,_,_,_,_,
_,_,_,_,L,_,_,_,L,_,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,_,_,_,_,L,L,L,_,_,_,
_,_,_,L,L,L,_,_,L,_,_,L,L,_,_,_,_,
_,_,_,_,L,L,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,T,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,L,_,_,L,T,L,L,_,_,_,
_,_,_,L,L,T,L,_,L,_,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,T,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,L,_,L,_,L,_,_,_,_,
_,_,L,L,_,_,L,_,_,L,T,L,L,L,L,_,_,
_,_,_,_,L,L,T,L,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,L,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,L,L,T,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,L,_,L,L,L,_,_,_,_,
_,L,L,L,L,L,L,_,_,T,L,L,L,L,L,L,_,
_,L,L,L,L,L,_,T,_,_,L,L,L,L,L,L,_,
_,L,L,L,_,L,L,_,_,L,L,_,_,L,L,L,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,T,T,T,_,_,L,_,_,_,_,
M,L,_,L,L,L,T,_,T,_,T,L,L,L,_,L,M,
L,L,L,L,T,T,L,L,T,L,L,T,T,L,L,L,L,
L,L,T,T,L,L,L,_,T,_,L,L,L,T,T,L,L,
_,L,L,L,L,L,_,_,T,_,_,L,L,L,L,L,_,
_,_,L,L,L,L,L,T,T,T,L,L,L,L,L,_,_,
_,_,_,_,L,L,T,L,T,L,T,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,T,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,L,_,L,L,L,_,_,_,_,
_,L,L,L,L,L,L,T,_,_,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,_,_,T,_,L,L,L,L,L,_,
_,L,L,L,_,_,L,L,_,_,L,L,_,L,L,L,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,T,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,L,_,_,_,L,_,_,_,_,
_,_,L,L,L,L,T,L,_,_,L,_,_,L,L,_,_,
_,_,_,_,_,L,L,L,_,L,T,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,L,T,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,T,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,_,_,
_,_,_,L,L,T,L,_,_,L,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,_,L,_,L,T,L,L,_,_,_,
_,_,_,_,_,_,_,L,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,L,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,_,L,_,_,_,L,_,_,_,_,
_,_,_,L,L,L,_,_,_,_,L,L,L,L,_,_,_,
_,_,_,_,L,L,_,_,L,_,_,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,L,L,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,M,L,L,_,_,L,_,_,_,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,L,L,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,L,T,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=123}}}

local function grow_black_willow_tree(pos)
	add_tree(pos, 8, 1, 8, black_willow_tree)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 62,
		schematic = black_willow_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = {"default:water_source", "default:fresh_water_source"},
		num_spawn_by = 2,
	})
end

-- Nodes

core.register_node("black_willow:sapling", {
	description = S("Black Willow Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"black_willow_sapling.png"},
	inventory_image = "black_willow_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"black_willow:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -8, y = 1, z = -8},
			{x = 8, y = 12, z = 8},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

	on_timer = function(pos)
		if #core.find_nodes_in_area({x = pos.x + 5, y = pos.y - 1, z = pos.z + 5},
			{x = pos.x - 5, y = pos.y - 1, z = pos.z - 5}, {"default:water_source", "default:fresh_water_source"}) > 0 then

			if not default.can_grow(pos) then
				core.get_node_timer(pos):start(math.random(250, 1450))
			else
				core.log("action", "A black willow sapling grows into a tree at ".. core.pos_to_string(pos))
				grow_black_willow_tree(pos)
			end
		else
			core.set_node(pos, {name = "default:dry_shrub"})
		end
	end,
	grown_height = 11,
})

core.register_node("black_willow:trunk", {
	description = S("Black Willow Trunk"),
	tiles = {"black_willow_trunk_top.png", "black_willow_trunk_top.png", "black_willow_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("black_willow:wood", {
	description = S("Black Willow Wood"),
	tiles = {"black_willow_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("black_willow:leaves", {
	description = S("Black Willow Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"black_willow_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("black_willow_leaves.png"),
	wield_image = leaf_image("black_willow_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"black_willow:sapling"}, rarity = 20},
			{items = {"black_willow:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "black_willow:wood 4",
	recipe = {{"black_willow:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "black_willow:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "black_willow:wood",
	burntime = 9,
})


core.register_lbm({
	name = "black_willow:convert_black_willow_saplings_to_node_timer",
	nodenames = {"black_willow:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"black_willow:trunk"},
	leaves = {"black_willow:leaves"},
	radius = 2,
})

doors.register_fencegate("black_willow:wood_gate", {
	description = S("Black Willow Wood Fence Gate"),
	texture = "black_willow_wood.png",
	material = "black_willow:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("black_willow:wood_fence", {
	description = S("Black Willow Wood Fence"),
	texture = "black_willow_fence.png",
	material = "black_willow:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("black_willow_wood", "black_willow:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"black_willow_wood.png"},
	S("Black Willow Wood Stair"),
	S("Black Willow Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"black_willow:sapling", nil, "soil"},
	})
end

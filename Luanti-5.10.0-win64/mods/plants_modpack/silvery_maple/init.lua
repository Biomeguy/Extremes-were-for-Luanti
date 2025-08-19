
-- silvery_maple tree

-- internationalization boilerplate
local S = core.get_translator("silvery_maple")

local L = {name = "silvery_maple:leaves"}
local M = {name = "silvery_maple:leaves", prob = 223}
local T = {name = "silvery_maple:trunk", force_place = true}

silvery_maple_tree = {size = {x = 15, y = 19, z = 15}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,
_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,
_,_,_,_,_,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,M,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,M,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,L,L,L,_,_,_,_,_,_,
_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,
_,_,_,_,_,L,L,T,L,L,L,M,_,_,_,
_,_,_,_,_,M,L,L,L,M,L,M,_,_,_,
_,_,_,_,_,_,M,L,M,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,M,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,_,_,_,_,_,_,_,_,
_,_,L,L,T,L,L,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,M,L,M,_,_,_,_,_,_,
_,_,_,M,L,M,L,L,T,M,L,M,_,_,_,
_,_,_,_,M,M,L,L,L,L,L,L,M,_,_,
_,_,_,M,L,M,M,L,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,M,_,M,L,M,_,_,_,
_,_,_,_,M,_,_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,T,M,_,_,T,_,_,_,_,_,
_,_,M,L,L,L,M,_,_,T,_,_,_,_,_,
_,_,_,M,L,M,_,M,_,T,_,_,_,_,_,
_,_,_,_,M,_,M,L,M,L,L,L,M,_,_,
_,_,_,M,L,M,M,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,M,L,L,T,L,L,M,_,
_,_,M,L,L,L,M,_,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,_,_,M,L,M,_,_,_,
_,_,_,_,M,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,T,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,T,_,T,_,_,_,_,_,
_,_,_,_,M,_,T,_,_,T,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,T,M,L,M,_,
_,_,M,L,L,L,M,_,M,L,T,L,L,L,M,
_,_,L,L,T,L,L,_,M,L,L,L,L,L,M,
_,_,L,L,T,L,L,M,L,M,L,M,L,M,_,
_,_,M,L,L,L,M,M,L,M,M,_,M,_,_,
_,_,_,M,L,M,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,
_,_,M,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,M,_,T,_,_,_,_,M,L,L,L,M,
_,M,L,M,L,T,_,_,_,M,L,L,L,L,L,
_,_,M,L,L,L,M,M,L,M,L,L,T,L,L,
_,_,M,L,L,L,M,L,L,L,M,L,L,L,M,
_,_,_,M,L,M,M,L,L,L,M,M,L,M,_,
_,_,_,_,M,_,_,M,L,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,T,_,_,_,
_,M,L,M,_,_,T,_,_,_,_,T,_,_,_,
M,L,L,L,M,M,_,_,_,_,M,T,L,M,_,
M,L,L,L,M,L,M,_,_,M,L,T,L,L,M,
_,M,L,M,L,L,M,L,T,L,L,L,L,L,M,
_,_,M,M,L,M,L,L,T,L,L,L,L,M,_,
_,_,_,_,M,_,L,L,T,L,L,M,M,_,_,
_,_,_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,_,_,M,L,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,T,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
M,L,L,L,M,_,_,T,_,_,_,_,_,_,_,
L,L,L,L,L,L,M,T,_,M,L,L,L,M,_,
L,L,T,L,L,L,L,T,_,L,L,L,L,L,_,
M,L,L,L,L,L,L,T,L,L,L,T,L,L,_,
_,M,L,M,M,L,M,L,L,L,L,L,L,M,_,
_,_,_,_,_,M,L,L,L,L,M,L,M,_,_,
_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,
_,_,_,_,_,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,M,_,_,_,_,_,_,_,_,_,_,_,
M,L,L,T,L,L,L,M,_,_,M,L,M,_,_,
M,L,L,L,L,L,L,L,_,M,L,L,L,M,_,
_,M,L,L,L,T,L,L,M,M,L,L,L,L,M,
_,_,M,L,L,L,L,T,L,M,M,L,L,L,M,
_,_,M,L,M,L,L,T,L,L,_,M,L,M,_,
_,_,_,M,_,L,L,T,L,L,_,_,M,_,_,
_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,
_,_,_,_,_,_,M,L,M,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,M,_,T,_,_,_,_,M,_,_,_,_,_,
_,M,L,M,T,L,M,_,M,L,M,M,M,_,_,
_,M,L,M,T,L,L,M,M,L,M,L,L,L,M,
_,_,M,L,T,L,L,M,_,M,L,L,T,L,L,
_,M,L,L,L,L,M,L,M,_,L,L,T,L,L,
_,M,L,L,L,M,L,L,L,M,M,L,L,L,M,
_,_,M,L,M,M,L,L,L,M,_,M,L,M,_,
_,_,_,M,_,_,M,L,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,M,L,T,_,_,_,_,
_,_,_,_,_,M,L,M,L,L,L,T,L,M,_,
_,_,_,_,M,T,L,L,L,L,L,T,L,L,M,
_,M,L,L,L,L,L,L,M,L,M,L,L,L,M,
_,L,L,T,L,L,L,M,_,M,M,L,L,L,M,
_,L,L,T,L,L,M,L,M,_,_,M,L,M,_,
_,M,L,L,L,M,M,L,M,_,_,_,M,_,_,
_,_,M,L,M,_,_,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,T,L,M,_,_,_,
_,_,_,_,M,L,L,L,L,T,L,L,L,L,M,
_,_,_,_,L,L,L,L,L,T,L,L,L,L,L,
_,_,M,L,L,L,T,L,L,L,L,L,T,L,L,
_,M,L,L,L,L,L,L,M,L,M,L,L,L,M,
_,M,L,L,L,M,L,M,_,_,_,M,L,M,_,
_,_,M,L,M,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,M,L,M,L,L,L,M,L,M,_,
_,_,_,_,M,L,L,L,L,L,L,L,L,L,M,
_,_,_,M,M,L,L,L,M,L,M,L,L,L,M,
_,_,M,L,M,M,L,M,_,M,_,M,L,M,_,
_,_,M,L,M,_,M,_,_,_,_,_,M,_,_,
_,_,_,M,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,_,_,_,_,_,
_,_,_,_,_,_,M,_,M,L,M,_,M,_,_,
_,_,_,_,_,M,L,M,M,L,M,M,L,M,_,
_,_,_,_,_,M,L,M,_,M,_,M,L,M,_,
_,_,_,_,_,_,M,_,_,_,_,_,M,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=4, prob=127}}}

local function grow_silvery_maple_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 7, 1, 7, silvery_maple_tree)
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
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 32,
		schematic = silvery_maple_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("silvery_maple:sapling", {
	description = S("Silvery Maple Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"silvery_maple_sapling.png"},
	inventory_image = "silvery_maple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_silvery_maple_tree,
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
			"silvery_maple:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -7, y = 1, z = -7},
			{x = 7, y = 16, z = 7},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 15,
})

core.register_node("silvery_maple:trunk", {
	description = S("Silvery Maple Trunk"),
	tiles = {"silvery_maple_trunk_top.png", "silvery_maple_trunk_top.png", "silvery_maple_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("silvery_maple:wood", {
	description = S("Silvery Maple Wood"),
	tiles = {"silvery_maple_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("silvery_maple:leaves", {
	description = S("Silvery Maple Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"silvery_maple_leaves.png"},
	inventory_image = leaf_image("silvery_maple_leaves.png"),
	wield_image = leaf_image("silvery_maple_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"silvery_maple:sapling"}, rarity = 50},
			{items = {"silvery_maple:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "silvery_maple:wood 4",
	recipe = {{"silvery_maple:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "silvery_maple:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "silvery_maple:wood",
	burntime = 7,
})


core.register_lbm({
	name = "silvery_maple:convert_silvery_maple_saplings_to_node_timer",
	nodenames = {"silvery_maple:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"silvery_maple:trunk"},
	leaves = {"silvery_maple:leaves"},
	radius = 2,
})

doors.register_fencegate("silvery_maple:wood_gate", {
	description = S("Silvery Maple Wood Fence Gate"),
	texture = "silvery_maple_wood.png",
	material = "silvery_maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("silvery_maple:wood_fence", {
	description = S("Silvery Maple Wood Fence"),
	texture = "silvery_maple_fence.png",
	material = "silvery_maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("silvery_maple_wood", "silvery_maple:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"silvery_maple_wood.png"},
	S("Silvery Maple Wood Stair"),
	S("Silvery Maple Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"silvery_maple:sapling", grow_silvery_maple_tree, "soil"},
	})
end

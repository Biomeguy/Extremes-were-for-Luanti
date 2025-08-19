
-- Teak tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "teak:leaves"}
local M = {name = "teak:leaves", prob = 213}
local T = {name = "teak:trunk", force_place = true}

teak_tree = {size = {x=9, y=18, z=9}, data = {
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
_,_,_,_,_,M,M,M,_,
_,_,_,_,_,M,L,M,_,
_,_,_,_,_,_,_,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,M,L,M,_,_,_,
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
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,
_,_,_,_,M,L,L,L,M,
_,_,_,_,M,L,L,L,M,
_,_,_,_,L,M,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,_,_,
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
_,_,_,_,_,_,T,_,_,
_,_,_,_,_,L,T,L,_,
_,_,_,_,L,L,T,L,M,
_,_,_,_,L,L,L,L,L,
_,M,M,L,T,L,L,L,_,
_,M,L,L,T,L,M,_,_,
_,_,L,L,L,L,L,M,_,
_,_,_,L,L,L,L,M,_,
_,_,_,M,L,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,
_,_,_,_,_,T,_,_,_,
_,_,_,_,_,T,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,
_,_,_,_,T,L,L,L,M,
_,_,L,_,T,L,L,L,M,
M,L,L,L,_,_,L,M,_,
M,L,L,L,L,_,L,_,_,
_,M,L,L,L,L,L,L,M,
_,_,M,L,L,L,L,L,M,
_,_,M,L,L,L,L,M,_,
_,_,_,M,L,M,_,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,M,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,T,T,_,_,_,_,
_,_,_,T,T,_,_,_,_,
_,_,_,T,T,_,_,_,_,
_,_,T,_,T,_,M,M,_,
_,L,T,_,T,T,L,M,_,
M,L,T,L,T,T,_,_,_,
L,L,L,L,T,_,T,L,_,
_,L,L,L,T,L,T,L,M,
_,_,M,L,T,L,L,L,L,
_,_,L,L,L,L,L,L,_,
_,_,_,L,L,L,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,_,_,_,
M,L,L,L,L,L,_,_,_,
M,L,L,L,_,_,L,_,_,
_,M,L,_,L,L,L,L,M,
_,_,M,L,L,L,L,L,M,
_,_,M,L,L,L,L,M,_,
_,_,_,M,L,M,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,L,T,L,_,_,_,
_,_,M,L,T,L,M,_,_,
_,M,L,L,L,L,L,_,_,
_,M,L,L,L,L,_,_,_,
_,_,_,_,_,M,M,M,_,
_,_,_,M,M,M,L,M,_,
_,_,_,M,L,M,_,_,_,
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
_,_,M,L,L,L,M,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,_,_,
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
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,M,L,M,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=123}, {ypos=4, prob=123}}}

teak_tree2 = {size = {x=11, y=22, z=11}, data = {
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
_,_,_,_,_,_,M,M,M,_,_,
_,_,_,_,_,_,M,L,M,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,_,_,M,L,L,L,M,_,
_,_,_,_,_,M,L,L,L,M,_,
_,_,_,_,_,_,M,L,M,_,_,
_,_,_,M,M,M,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,T,L,_,_,
_,_,_,_,_,M,L,T,L,M,_,
_,_,_,_,_,L,L,L,L,L,_,
_,_,_,_,L,_,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,_,_,
_,_,M,L,L,L,M,_,_,_,_,
_,_,_,M,L,M,_,_,_,_,_,
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
_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,_,_,M,L,L,L,M,_,
_,_,_,_,_,M,L,L,L,M,_,
_,M,M,L,T,L,M,L,M,_,_,
_,M,L,L,T,L,M,_,_,_,_,
_,_,L,L,L,L,L,M,M,_,_,
_,_,_,L,L,L,M,L,M,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,M,M,_,_,
_,_,L,_,_,T,M,L,M,_,_,
M,L,L,L,M,_,_,_,_,_,_,
M,L,L,L,M,_,_,L,_,_,_,
_,M,L,M,M,M,L,L,L,M,_,
_,_,_,M,L,M,L,L,L,M,_,
_,_,_,_,_,L,M,L,M,_,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,

_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,T,T,_,_,_,_,_,
_,_,_,T,_,T,_,_,_,_,_,
_,_,_,T,_,T,_,M,M,M,_,
_,L,T,_,_,T,T,M,L,M,_,
M,L,T,L,_,T,T,_,_,_,_,
L,L,L,L,L,T,_,T,L,_,_,
_,L,L,L,_,T,L,T,L,M,_,
_,_,M,M,_,T,L,L,L,L,_,
_,_,M,L,L,T,L,L,L,_,_,
_,_,_,M,L,T,L,M,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,T,_,_,_,
_,_,_,_,_,T,_,T,_,_,_,
_,_,_,_,_,_,_,T,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,L,L,L,M,
_,_,L,_,_,_,_,L,L,L,M,
M,L,L,L,T,M,_,M,L,M,_,
M,L,L,L,T,_,_,L,_,_,_,
_,M,L,M,_,M,L,L,L,M,_,
_,M,L,L,M,M,L,L,L,M,_,
_,M,L,L,M,L,M,L,M,_,_,
_,_,M,L,L,L,L,M,_,_,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,L,T,L,_,
_,_,_,_,_,_,M,L,T,L,M,
_,_,_,M,L,L,L,L,L,L,L,
_,M,M,M,L,L,L,L,L,L,_,
_,M,L,_,M,L,M,_,_,_,_,
_,_,L,T,L,_,M,M,M,_,_,
_,M,L,T,L,M,M,L,M,_,_,
_,L,L,L,L,L,_,_,_,_,_,
_,_,L,L,L,M,M,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
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
_,_,_,_,_,_,_,_,L,_,_,
_,_,_,_,L,T,L,L,L,L,M,
_,_,_,M,L,T,L,L,L,L,M,
_,_,_,L,L,L,L,L,L,M,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,L,_,_,_,_,_,_,_,
_,M,L,L,L,M,_,_,_,_,_,
_,M,L,L,L,M,_,_,_,_,_,
_,_,M,L,M,_,_,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,M,M,M,_,
_,_,_,M,L,L,L,M,L,M,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,_,_,_,_,_,_,
_,_,M,L,M,_,_,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=123}}}

local function grow_teak_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 18) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, teak_tree2)
		return
	end
	add_tree(pos, 4, 1, 4, teak_tree)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 62,
		schematic = teak_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("teak:sapling", {
	description = S("Teak Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"teak_sapling.png"},
	inventory_image = "teak_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_teak_tree,
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
			"teak:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 15, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 14,
})

core.register_node("teak:trunk", {
	description = S("Teak Trunk"),
	tiles = {"teak_trunk_top.png", "teak_trunk_top.png", "teak_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 1, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("teak:wood", {
	description = S("Teak Wood"),
	tiles = {"teak_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("teak:leaves", {
	description = S("Teak Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"teak_leaves.png"},
	inventory_image = leaf_image("teak_leaves.png"),
	wield_image = leaf_image("teak_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"teak:sapling"}, rarity = 20},
			{items = {"teak:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "teak:wood 4",
	recipe = {{"teak:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "teak:trunk",
	burntime = 27,
})

core.register_craft({
	type = "fuel",
	recipe = "teak:wood",
	burntime = 8,
})


core.register_lbm({
	name = "teak:convert_teak_saplings_to_node_timer",
	nodenames = {"teak:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"teak:trunk"},
	leaves = {"teak:leaves"},
	radius = 2,
})

doors.register_fencegate("teak:wood_gate", {
	description = S("Teak Fence Gate"),
	texture = "teak_wood.png",
	material = "teak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("teak:wood_fence", {
	description = S("Teak Fence"),
	texture = "teak_fence.png",
	material = "teak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("teak_wood", "teak:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"teak_wood.png"},
	S("Teak Stair"),
	S("Teak Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"teak:sapling", grow_teak_tree, "soil"},
	})
end


-- Yellow ipe tree

-- internationalization boilerplate
local S = core.get_translator("yellow_ipe")

local L = {name = "yellow_ipe:blossoms"}
local M = {name = "yellow_ipe:blossoms", prob = 128}
local T = {name = "yellow_ipe:trunk", force_place = true}

yellow_ipe_tree = {size = {x=9, y=11, z=9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,M,L,M,M,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,L,_,_,_,L,L,M,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,_,_,_,_,_,L,M,
L,L,L,L,_,L,L,L,L,
_,L,L,L,T,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
L,L,_,_,T,_,_,L,L,
L,L,L,_,T,_,L,L,L,
M,L,L,T,T,T,L,L,M,
_,M,L,L,T,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,_,_,_,_,_,L,M,
L,L,L,L,_,L,L,L,L,
_,L,L,L,T,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,L,_,_,_,L,L,M,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,M,L,M,M,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

yellow_ipe_tree2 = {size = {x = 13, y = 20, z = 13}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,M,L,M,M,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,M,L,M,M,_,_,
_,_,M,M,L,L,L,L,L,M,_,_,_,
_,_,_,L,L,L,L,L,L,_,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,M,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,L,M,_,_,
_,_,M,L,L,L,L,L,L,M,_,_,_,
_,_,_,M,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,M,L,M,L,L,_,_,_,L,M,_,
_,M,L,L,L,L,T,L,L,L,L,M,_,
_,L,L,L,L,L,T,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,L,M,_,_,
_,_,M,L,L,L,L,L,M,M,_,_,_,
_,_,_,M,M,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
M,L,L,L,L,L,T,T,_,_,L,L,_,
_,L,L,L,T,L,L,L,T,L,L,L,M,
_,M,L,L,T,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,M,M,_,_,
_,_,_,M,L,L,L,L,L,_,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
M,L,M,M,L,T,M,_,_,_,_,M,_,
L,L,L,L,L,L,L,L,L,M,L,L,M,
_,L,L,L,M,L,L,L,L,L,L,L,L,
_,M,L,L,L,M,L,L,L,L,L,L,_,
_,_,M,L,L,L,M,L,L,L,L,M,_,
_,_,_,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,

_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,T,_,_,_,_,_,
L,L,L,L,L,L,T,M,T,L,L,M,_,
L,L,L,T,L,M,T,L,T,L,L,L,L,
M,L,L,L,L,M,T,M,M,T,L,L,L,
_,M,L,L,L,L,T,L,L,L,L,L,M,
_,_,M,L,L,M,T,M,L,L,L,M,_,
_,_,_,L,L,L,T,L,L,L,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,L,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,_,_,
_,_,_,_,T,_,_,_,_,_,_,_,_,
M,L,L,_,T,L,T,M,L,M,M,_,_,
L,L,L,L,L,M,L,T,L,L,L,L,M,
_,L,L,L,L,L,L,L,L,M,L,L,L,
_,M,L,L,L,L,L,L,L,L,L,L,_,
_,_,M,L,L,L,L,L,L,L,L,M,_,
_,_,_,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
M,L,M,L,L,L,L,L,_,_,_,_,_,
_,L,L,L,T,L,T,L,L,L,L,L,M,
_,M,L,L,L,L,T,L,T,L,L,L,_,
_,_,M,L,L,L,L,L,L,L,L,M,_,
_,_,_,M,L,L,L,L,L,L,M,_,_,
_,_,_,_,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,M,M,L,M,_,_,_,_,_,
_,L,L,L,L,L,L,L,M,L,L,M,_,
_,_,L,L,L,L,L,L,L,L,L,L,_,
_,_,M,L,L,L,T,L,L,L,L,_,_,
_,_,_,M,L,L,L,L,L,L,M,_,_,
_,_,_,_,M,L,L,L,M,M,_,_,_,
_,_,_,_,_,M,L,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,M,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,L,M,M,_,_,_,_,_,_,
_,_,_,L,L,L,M,M,L,M,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,M,L,M,M,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}, {ypos=2, prob=127}}}

local function grow_yellow_ipe_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 15) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 6, 1, 6, yellow_ipe_tree2)
		return
	end
	add_tree(pos, 4, 1, 4, yellow_ipe_tree, "0")
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
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 32,
		schematic = yellow_ipe_tree2,
		flags = "place_center_x, place_center_z",
	})
	
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = yellow_ipe_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("yellow_ipe:sapling", {
	description = S("Yellow Ipe Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"yellow_ipe_sapling.png"},
	inventory_image = "yellow_ipe_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_yellow_ipe_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"yellow_ipe:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 6,
})

core.register_node("yellow_ipe:trunk", {
	description = S("Yellow Ipe Trunk"),
	tiles = {"yellow_ipe_trunk_top.png", "yellow_ipe_trunk_top.png", "yellow_ipe_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("yellow_ipe:wood", {
	description = S("Yellow Ipe Wood"),
	tiles = {"yellow_ipe_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("yellow_ipe:blossoms", {
	description = S("Yellow Ipe Blossoms"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"yellow_ipe_blossoms.png"},
	special_tiles = {"yellow_ipe_blossoms_simple.png"},
	inventory_image = leaf_image("yellow_ipe_blossoms.png"),
	wield_image = leaf_image("yellow_ipe_blossoms.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 1, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"yellow_ipe:sapling"}, rarity = 20},
			{items = {"yellow_ipe:blossoms"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "yellow_ipe:wood 4",
	recipe = {{"yellow_ipe:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "yellow_ipe:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "yellow_ipe:wood",
	burntime = 7,
})


core.register_lbm({
	name = "yellow_ipe:convert_yellow_ipe_saplings_to_node_timer",
	nodenames = {"yellow_ipe:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"yellow_ipe:trunk"},
	leaves = {"yellow_ipe:blossoms"},
	radius = 3,
})

doors.register_fencegate("yellow_ipe:wood_gate", {
	description = S("Yellow Ipe Wood Fence Gate"),
	texture = "yellow_ipe_wood.png",
	material = "yellow_ipe:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("yellow_ipe:wood_fence", {
	description = S("Yellow Ipe Wood Fence"),
	texture = "yellow_ipe_fence.png",
	inventory_image = "default_fence_overlay.png^yellow_ipe_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^yellow_ipe_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "yellow_ipe:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("yellow_ipe_wood", "yellow_ipe:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"yellow_ipe_wood.png"},
	S("Yellow Ipe Wood Stair"),
	S("Yellow Ipe Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"yellow_ipe:sapling", grow_yellow_ipe_tree, "soil"},
	})
end


-- White spruce tree

-- internationalization boilerplate
local S = core.get_translator("white_spruce")

local N = {name = "default:snow"}
local C = {name = "white_spruce:cones"}
local L = {name = "white_spruce:needles"}
local T = {name = "white_spruce:trunk", force_place = true}

white_spruce_tree = {size = {x = 7, y = 14, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,_,L,L,
L,L,L,_,L,L,L,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,T,_,L,L,
L,L,L,T,L,L,L,
L,L,L,T,L,L,L,
_,L,L,T,L,L,_,
_,L,L,T,L,L,_,
_,L,L,T,L,L,_,
_,_,C,L,C,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,_,L,L,
L,L,L,_,L,L,L,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

snowy_white_spruce_tree = {size = {x = 7, y = 15, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,N,L,L,L,N,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,_,L,L,
L,L,L,_,L,L,L,
N,L,L,L,L,L,N,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,N,L,L,L,N,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,T,_,L,L,
L,L,L,T,L,L,L,
L,L,L,T,L,L,L,
N,L,L,T,L,L,N,
_,L,L,T,L,L,_,
_,L,L,T,L,L,_,
_,N,L,L,L,N,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,_,L,L,
L,L,L,_,L,L,L,
N,L,L,L,L,L,N,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,N,L,L,L,N,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,N,L,L,L,N,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,N,L,N,_,_,
_,_,_,L,_,_,_,
_,_,_,N,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

white_spruce_tree2 = {size = {x = 11, y = 23, z = 11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,_,_,L,L,L,_,
_,L,L,L,L,_,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
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
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,L,_,_,_,L,L,L,L,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
L,L,_,_,_,_,_,_,_,L,L,
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,L,L,_,L,L,L,L,L,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
L,L,_,_,_,T,_,_,_,L,L,
L,L,_,_,_,T,_,_,_,L,L,
L,L,L,_,_,T,_,_,L,L,L,
L,L,L,L,_,T,_,L,L,L,L,
L,L,T,L,L,T,L,L,T,L,L,
L,L,T,L,L,T,L,L,T,L,L,
_,L,L,T,L,T,L,T,L,L,_,
_,L,L,T,L,T,L,T,L,L,_,
_,L,L,L,T,T,T,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,C,L,T,L,C,_,_,_,
_,_,_,C,L,T,L,C,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
L,L,_,_,_,_,_,_,_,L,L,
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,L,L,_,L,L,L,L,L,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
L,L,L,_,_,_,_,_,L,L,L,
L,L,L,L,_,_,_,L,L,L,L,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,_,_,_,L,L,L,_,
_,L,L,L,L,_,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
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
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

local function grow_white_spruce_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 17) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, white_spruce_tree2, "0")
		return
	end
	add_tree(pos, 3, 1, 3, white_spruce_tree, "0")
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
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"coniferous_forest"},
		y_min = 1,
		y_max = 32,
		schematic = white_spruce_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("white_spruce:sapling", {
	description = S("White Spruce Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"white_spruce_needles.png"},
	inventory_image = "white_spruce_needles.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_white_spruce_tree,
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
			"white_spruce:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 9, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 8,
})

core.register_node("white_spruce:trunk", {
	description = S("White Spruce Trunk"),
	tiles = {"white_spruce_trunk_top.png", "white_spruce_trunk_top.png", "white_spruce_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-4,4 do
		for j=-4,4 do
		for k=-4,4 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 4, "white_spruce:needles") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "white_spruce:needles" and meta:get_string("sprucecones") == "true" then
				core.set_node(p, {name = "white_spruce:cones"})
				core.get_node_timer(pos):start(200)
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 3, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

-- white spruce needles
core.register_node("white_spruce:needles", {
	description = S("White Spruce Needles"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"white_spruce_needles.png"},
	inventory_image = leaf_image("white_spruce_needles.png"),
	wield_image = leaf_image("white_spruce_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"white_spruce:sapling"}, rarity = 20},
			{items = {"white_spruce:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("white_spruce:cones", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"white_spruce_needles.png^spruce_cones.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "white_spruce:needles",
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"default:spruce_nuts 3"}},
			{items = {"default:spruce_nuts 2"}, rarity = 2},
			{items = {"default:spruce_nuts 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "white_spruce:needles"})
		local f = core.find_node_near(pos, 4, "white_spruce:trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("sprucecones", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

-- Recipes

core.register_craft({
	type = "fuel",
	recipe = "white_spruce:trunk",
	burntime = 30,
})

core.register_lbm({
	name = "white_spruce:convert_white_spruce_saplings_to_node_timer",
	nodenames = {"white_spruce:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"white_spruce:trunk"},
	leaves = {"white_spruce:needles", "white_spruce:cones"},
	radius = 4,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"white_spruce:sapling", grow_white_spruce_tree, "soil"},
	})
end

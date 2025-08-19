
-- FIRS MOD
-- For Luanti-c55
-- Created by Cisoun (cysoun[at]gmail.com).

local L = {name = "fir:needles"}
local T = {name = "fir:trunk", force_place = true}
local C = {name = "fir:cones"}

fir_tree = {size = {x = 7, y = 14, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
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
_,_,_,L,_,_,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
L,L,L,L,L,L,L,
_,L,L,L,L,L,_,
L,L,L,L,L,L,L,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,L,L,T,L,L,_,
L,L,L,T,L,L,L,
_,L,L,T,L,L,_,
L,L,L,T,L,L,L,
_,L,L,T,L,L,_,
_,L,L,T,L,L,_,
_,_,L,T,L,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
L,L,L,L,L,L,L,
_,L,L,L,L,L,_,
L,L,L,L,L,L,L,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

fir_tree2 = {size = {x = 11, y = 30, z = 11}, data = {
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
L,L,L,T,L,T,L,T,L,L,L,
_,L,L,L,T,T,T,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
L,L,L,T,L,T,L,T,L,L,L,
_,L,L,L,T,T,T,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 5, prob = 127}, {ypos = 9, prob = 127}, {ypos = 14, prob = 127}, {ypos = 19, prob = 127}}}

local function grow_fir_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
   	end
	if on_compost(pos) then
		if not enough_height(pos, 24) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, fir_tree2, 0)
		return
	end
	add_tree(pos, 3, 1, 3, fir_tree, 0)
end

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
		schematic = fir_tree2,
		flags = "place_center_x, place_center_z",
	})
end

-- Node definitions and crafting
core.register_node("fir:trunk", {
	description = "Fir trunk",
	tiles = {"fir_trunk_top.png", "fir_trunk_top.png", "fir_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-3,3 do
		for j=-3,3 do
		for k=-3,3 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 3, "fir:needles") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "fir:needles" and meta:get_string("fircones") == "true" then
				core.set_node(p, {name = "fir:cones"})
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

core.register_node("fir:wood", {
	description = "Fir Wood",
	tiles = {"fir_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("fir:needles", {
	description = "Fir Needles",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
    waving = waving_style,
	tiles = {"fir_needles.png"},
	inventory_image = leaf_image("fir_needles.png"),
	wield_image = leaf_image("fir_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'fir:sapling'}, rarity = 20},
			{items = {'fir:needles'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("fir:cones", {
	description = "Fir Cone Needles",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
    waving = waving_style,
	tiles = {"fir_needles.png^fir_cones.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "fir:needles",
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"fir:cone 3"}},
			{items = {"fir:cone 2"}, rarity = 2},
			{items = {"fir:cone 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "fir:needles"})
		local f = core.find_node_near(pos, 3, "fir:trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("fircones", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("fir:sapling", {
	description = "Fir Tree sapling",
	drawtype = "plantlike",
	tiles = {"fir_sapling.png"},
	inventory_image = "fir_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_timer = grow_fir_tree,
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"fir:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 25, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})

core.register_craftitem("fir:cone", {
	description = "Fir Cone",
	inventory_image = "fir_cone.png",
	groups = {flammable = 3},
})

core.register_craftitem("fir:nuts", {
	description = "Roasted Fir Nuts",
	inventory_image = "fir_nuts.png",
	on_use = core.item_eat(1),
	groups = {flammable = 2},
})

core.register_craft({
	output = 'fir:wood 4',
	recipe = {{'fir:trunk'}}
})

core.register_craft({
	type = "cooking",
	output = "fir:nuts 4",
	recipe = "fir:cone",
	replacements = {{"fir:cone", "farming:spent_biomasse"}}
})

core.register_lbm({
	name = "fir:convert_fir_saplings_to_node_timer",
	nodenames = {"fir:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(1200, 2400))
	end
})

default.register_leafdecay({
	trunks = {"fir:trunk"},
	leaves = {"fir:needles", "fir:cones"},
	radius = 3,
})

doors.register_fencegate("fir:wood_gate", {
	description = "Fir Wood Fence Gate",
	texture = "fir_wood.png",
	material = "fir:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4}
})

default.register_fence("fir:wood_fence", {
	description = "Fir Wood Fence",
	texture = "fir_fence.png",
	material = "fir:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("fir_wood", "fir:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 4},
	{"fir_wood.png"},
	"Fir Wood Stair",
	"Fir Wood Slab",
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then	
	bonemeal:add_sapling({
		{"fir:sapling", grow_fir_tree, "soil"},
	})
end

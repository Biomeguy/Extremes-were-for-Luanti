
-- Boulders

local S = {name = "default:stone", force_place = true}
local C = {name = "default:stone_with_coal", force_place = true}
local F = {name = "default:stone_with_iron", force_place = true}

boulder_1 = {size = {x = 3, y = 3, z = 3}, data = {
_,S,_,
S,F,S,
_,S,_,

F,S,S,
S,S,S,
S,S,C,

_,C,_,
S,S,S,
_,S,_}}

boulder_2 = {size = {x = 3, y = 3, z = 3}, data = {
_,S,_,
C,S,S,
_,S,_,

S,C,F,
S,S,S,
S,F,C,

_,S,_,
F,S,S,
_,S,_}}

boulder_3 = {size = {x = 3, y = 3, z = 3}, data = {
_,S,_,
C,F,S,
_,C,_,

S,C,S,
F,F,S,
S,S,F,

_,F,_,
S,S,C,
_,S,_}}

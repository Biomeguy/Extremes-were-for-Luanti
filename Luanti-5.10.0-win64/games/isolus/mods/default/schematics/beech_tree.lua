
-- Beech tree

local L = {name = "default:beech_leaves"}
local M = {name = "default:beech_leaves", prob = 223}
local T = {name = "default:beech_trunk", force_place = true}

default.beech_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,M,L,M,_,_,
_,_,_,M,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,L,L,L,_,
_,M,L,L,L,M,_,
_,_,_,M,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
M,L,T,_,T,L,M,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,L,_,_,_,L,L,
M,L,L,L,L,L,M,
_,M,L,L,L,M,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
M,L,T,_,T,L,M,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,L,L,L,_,
_,M,L,L,L,M,_,
_,_,_,M,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,M,L,M,_,_,
_,_,_,M,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- Beech tree log

default.beech_log = {size = {x = 4, y = 2, z = 1}, data = {
{name = "default:beech_trunk", param2 = 12, prob = 127},
{name = "default:beech_trunk", param2 = 12},
{name = "default:beech_trunk", param2 = 12},
{name = "default:beech_trunk", param2 = 12},
_,
{name = "flowers:mushroom_brown", prob = 63},
_,
_}}

-- Bush

local L = {name = "default:bush_leaves"}
local M = {name = "default:bush_leaves", prob = 191}
local N = {name = "default:bush_leaves", prob = 127}
local S = {name = "default:bush_stem", force_place = true}

default.bush = {size = {x = 3, y = 2, z = 3}, data = {
M,L,M,
N,M,N,

L,S,L,
M,L,M,

M,L,M,
N,M,N}}


-- Blueberry bush

local L = {name = "default:blueberry_bush_leaves_fruiting", force_place = true}
local M = {name = "default:blueberry_bush_leaves_fruiting", prob = 223}
local N = {name = "default:blueberry_bush_leaves_fruiting", prob = 95}

default.blueberry_bush = {size = {x = 3, y = 1, z = 3}, data = {
N,M,N,

M,L,M,

N,M,N}}

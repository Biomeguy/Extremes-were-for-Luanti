
-- Chestnut tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "chestnut:leaves"}
local M = {name = "chestnut:leaves", prob = 128}
local E = {name = "chestnut:bur"}
local F = {name = "chestnut:bur", prob = 174}
local T = {name = "chestnut:trunk", force_place = true}

chestnut_tree = {size = {x=13, y=14, z=13}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,L,F,_,_,_,_,_,
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
_,_,_,_,_,L,T,L,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,F,_,_,_,_,
_,_,_,_,F,L,T,L,_,_,_,_,_,
_,_,_,_,_,_,L,F,_,_,_,_,_,
_,_,_,_,_,_,L,L,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,_,_,
_,_,_,_,_,L,F,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,_,_,_,_,
_,_,_,_,_,L,T,L,_,L,M,_,_,
_,_,_,_,_,L,T,L,_,L,L,_,_,
_,_,_,_,_,_,L,_,_,F,_,_,_,
_,_,_,_,_,_,_,F,_,_,_,_,_,
_,E,L,L,L,L,L,_,L,M,_,_,_,
_,_,_,M,F,L,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,M,L,L,M,_,_,_,_,_,
_,_,_,_,L,_,L,F,_,_,_,_,_,
_,_,_,_,_,F,L,L,_,_,_,_,_,
_,L,M,_,L,L,T,L,L,L,F,_,_,
_,F,_,_,_,L,L,L,L,L,L,F,L,
_,_,_,_,_,E,L,L,L,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,L,L,L,L,L,T,L,L,_,_,_,_,
_,E,L,L,L,L,L,L,E,_,_,_,_,
_,_,_,_,_,_,_,_,L,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,T,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,L,_,_,_,_,
_,_,_,L,_,L,T,L,F,_,_,_,_,
M,L,L,L,L,L,L,L,L,L,_,_,_,
_,L,M,L,L,L,L,L,_,L,L,L,L,
_,_,_,E,L,L,L,_,_,L,F,_,_,
_,_,L,L,L,L,T,L,L,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,_,_,
_,M,L,L,L,L,L,L,L,_,_,_,_,
_,_,_,_,F,L,L,F,L,L,M,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,L,T,L,_,_,_,_,_,
_,_,_,F,L,T,T,_,_,_,_,_,_,
_,L,L,L,L,L,T,T,_,_,_,_,_,
L,T,T,T,T,L,T,L,T,L,L,F,_,
_,L,L,L,T,T,T,L,L,T,T,T,L,
_,_,M,L,L,L,T,_,_,L,L,L,F,
_,_,_,_,L,T,T,T,L,L,_,_,_,
_,L,L,L,T,L,T,_,T,L,E,_,_,
_,_,_,L,L,L,T,L,L,L,L,_,_,
_,_,_,M,L,_,L,M,E,_,_,_,_,
_,_,_,_,_,_,L,L,L,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,M,_,_,_,_,
_,_,_,_,L,L,L,F,_,_,_,_,_,
_,L,_,F,L,L,L,L,_,_,_,_,_,
_,L,L,L,_,L,T,L,_,_,_,_,_,
_,F,L,_,L,L,L,_,_,L,L,L,M,
_,_,_,L,L,L,L,L,_,L,L,L,_,
_,_,_,L,L,L,T,L,L,E,_,M,_,
_,_,F,L,L,L,L,L,L,L,L,_,_,
_,_,E,L,L,L,L,L,L,L,F,_,_,
_,_,_,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,L,L,F,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,F,_,_,L,L,_,_,_,_,
F,L,_,L,L,L,T,L,F,_,_,_,_,
_,_,_,_,L,_,L,L,_,L,L,L,_,
_,_,L,L,_,_,_,L,_,_,M,F,_,
_,_,_,E,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,L,T,L,_,L,_,_,_,
_,_,L,L,L,L,L,L,F,_,_,_,_,
_,_,_,_,L,L,L,L,_,_,_,_,_,
_,_,_,_,F,_,L,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,L,L,_,_,_,
_,L,F,L,L,L,T,_,_,_,_,_,_,
_,_,_,L,_,L,T,L,_,M,L,L,_,
_,_,F,L,_,L,_,_,_,_,_,_,_,
_,_,_,_,E,L,F,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,E,L,L,L,L,L,_,_,_,
_,_,_,M,L,_,F,L,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,M,_,_,_,
_,_,_,L,L,L,L,_,F,_,_,_,_,
_,_,_,L,L,L,T,L,_,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,_,_,
_,_,_,_,_,E,L,L,_,M,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,F,L,_,_,_,_,_,_,
_,_,_,_,E,L,T,L,_,_,_,_,_,
_,_,_,_,L,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,F,_,_,_,_,_,_,
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
_,_,_,_,_,L,L,L,M,_,_,_,_,
_,_,_,_,E,L,L,F,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_}}

chestnut_tree2 = {size = {x=13, y=13, z=13}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,T,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
L,L,L,L,L,L,T,L,L,L,L,L,L,
L,L,L,T,L,L,L,L,L,T,L,L,L,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,

_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,L,L,T,L,L,_,_,_,_,
L,L,L,L,L,L,T,L,L,L,L,L,L,
L,L,L,L,L,T,T,T,L,L,L,L,L,
L,L,L,L,T,L,T,L,T,L,L,L,L,
L,L,L,L,L,L,T,L,L,L,L,L,L,
_,L,L,L,L,L,T,L,L,L,L,L,_,
_,_,_,L,L,L,T,L,L,L,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
L,L,L,L,L,L,T,L,L,L,L,L,L,
L,L,L,T,L,L,L,L,L,T,L,L,L,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,T,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,_,L,L,L,L,L,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,L,L,L,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_}}

local function grow_chestnut_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	local model = chestnut_tree
	if math.random() > 0.5 then
		model = chestnut_tree2
	end
	add_tree(pos, 6, 1, 6, model)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.00005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 1,
		y_max = 80,
		schematic = chestnut_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("chestnut:sapling", {
	description = S("Chestnut Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"chestnut_sapling.png"},
	inventory_image = "chestnut_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_chestnut_tree,
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
			"chestnut:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 10, z = 6},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})

core.register_node("chestnut:trunk", {
	description = S("Chestnut Tree Trunk"),
	tiles = {"chestnut_trunk_top.png", "chestnut_trunk_top.png", "chestnut_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local f = core.find_node_near(pos, 3, "chestnut:bur_mark")
		if not f then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(f) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(f, {name = "chestnut:bur"})
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("chestnut:wood", {
	description = S("Chestnut Tree Wood"),
	tiles = {"chestnut_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("chestnut:leaves", {
	description = S("Chestnut Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"chestnut_leaves.png"},
	inventory_image = leaf_image("chestnut_leaves.png"),
	wield_image = leaf_image("chestnut_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"chestnut:sapling"}, rarity = 20},
			{items = {"chestnut:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Chestnut Bur

core.register_node("chestnut:bur", {
	description = S("Chestnut Bur"),
	drawtype = "plantlike",
	tiles = {"chestnut_bur.png"},
	inventory_image = "chestnut_bur.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -7/16, -3/16, 3/16, 4/16, 3/16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,

	after_dig_node = function(pos, oldnode)
		if oldnode.param2 == 0 then
			core.set_node(pos, {name = "chestnut:bur_mark"})
			local f = core.find_node_near(pos, 1, "chestnut:trunk")
			if f then
				core.get_node_timer(f):start(math.random(300, 1500))
			end
		end
	end,
})

core.register_node("chestnut:bur_mark", {
	description = "Chestnut Bur Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

-- Chestnut Fruit

core.register_craftitem("chestnut:fruit", {
	description = S("Chestnut"),
	inventory_image = "chestnut_fruit.png",	
	on_use = core.item_eat(3),
	groups = {flammable = 2},
})

core.register_craft({
	output = "chestnut:fruit 3",
	recipe = {
		{"chestnut:bur"}
	},
	replacements = {{"chestnut:bur", "farming:spent_biomasse"}}
})

-- Recipes

core.register_craft({
	output = "chestnut:wood 4",
	recipe = {{"chestnut:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "chestnut:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "chestnut:wood",
	burntime = 7,
})


core.register_lbm({
	name = "chestnut:convert_chestnut_saplings_to_node_timer",
	nodenames = {"chestnut:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"chestnut:trunk"},
	leaves = {"chestnut:leaves", "chestnut:bur", "chestnut:bur_mark"},
	radius = 3,
})

doors.register_fencegate("chestnut:wood_gate", {
	description = S("Chestnut Wood Fence Gate"),
	texture = "chestnut_wood.png",
	material = "chestnut:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("chestnut:wood_fence", {
	description = S("Chestnut Wood Fence"),
	texture = "chestnut_fence.png",
	material = "chestnut:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("chestnut_wood", "chestnut:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"chestnut_wood.png"},
	S("Chestnut Wood Stair"),
	S("Chestnut Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"chestnut:sapling", grow_chestnut_tree, "soil"},
	})
end

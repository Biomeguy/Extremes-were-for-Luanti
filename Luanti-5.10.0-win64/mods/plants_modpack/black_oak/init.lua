
-- Black oak tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "black_oak:leaves"}
local M = {name = "black_oak:leaves", prob = 226}
local A = {name = "black_oak:leaves_fruiting", prob = 126}
local T = {name = "black_oak:trunk", force_place = true}

black_oak_tree = {size = {x=7, y=10, z=7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,L,_,
_,_,L,L,L,L,_,
_,_,_,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,L,L,L,_,
L,L,L,L,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,L,_,_,
L,L,L,L,T,L,_,
L,L,L,L,T,L,L,
L,L,L,L,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,T,T,_,L,_,
L,T,L,T,L,L,L,
L,L,L,_,L,L,L,
L,L,L,L,L,L,L,
_,L,L,L,L,L,L,
_,L,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,_,T,L,_,
L,L,L,_,L,T,L,
L,L,L,T,L,L,L,
L,L,T,L,L,L,L,
L,L,L,L,L,L,_,
_,L,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,L,L,L,L,
L,L,L,L,L,L,L,
L,L,L,L,L,L,_,
L,L,L,L,L,_,_,
_,_,L,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,_,L,L,_,_,_,
_,L,L,L,L,_,_,
_,L,L,L,_,_,_,
_,_,_,_,_,_,_}}

black_oak_tree2 = {size = {x=21, y=18, z=21}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,A,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,M,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,A,L,L,L,A,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,A,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,M,M,M,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,M,A,M,M,L,M,L,M,M,A,M,_,_,_,_,_,
_,_,_,_,_,A,M,A,M,A,_,A,M,A,M,A,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,T,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,L,L,L,L,L,L,L,M,_,_,_,_,_,_,
_,_,_,_,A,M,L,L,L,L,L,L,L,L,L,M,A,_,_,_,_,
_,_,_,_,M,M,L,L,L,L,M,L,L,L,L,M,M,_,_,_,_,
_,_,_,_,_,_,M,M,A,M,A,M,A,M,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,_,_,
_,_,M,A,M,A,M,M,L,L,T,L,L,M,M,A,M,A,M,_,_,
_,_,M,M,M,M,L,L,L,L,L,L,L,L,L,M,M,M,M,_,_,
_,_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,_,
_,_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,_,
_,_,_,_,_,M,A,L,L,L,L,L,L,L,A,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,A,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,M,_,_,_,L,T,L,_,_,_,M,M,M,_,_,_,
_,A,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,A,_,
_,M,A,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,A,M,_,
_,_,_,M,L,L,L,T,L,L,L,L,L,T,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,_,
_,_,_,_,_,A,M,L,L,L,L,L,L,L,M,A,_,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,L,_,_,_,T,_,_,_,L,L,M,M,M,_,_,
_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,
_,A,L,L,L,L,L,L,T,L,L,L,T,L,L,L,L,L,L,A,_,
_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,
_,_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,_,
_,_,_,_,_,M,M,L,L,L,T,L,L,L,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,M,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,L,_,_,_,_,_,_,_,L,L,M,M,M,_,_,
_,A,L,L,T,T,L,L,_,_,_,_,_,L,L,T,T,L,L,A,_,
_,M,L,L,L,L,L,L,T,_,_,_,T,L,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,
_,M,A,M,M,M,L,L,L,L,T,L,L,L,L,M,M,M,A,M,_,
_,_,_,_,_,_,M,L,L,L,L,L,L,L,M,_,_,_,_,_,_,
_,_,_,_,M,A,M,L,L,L,L,L,L,L,M,A,M,_,_,_,_,
_,_,_,_,A,M,A,M,L,L,L,L,L,M,A,M,A,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,A,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,T,T,_,_,_,_,_,T,T,L,M,M,M,_,_,
_,M,L,L,L,L,L,L,_,T,_,T,_,L,L,L,L,L,L,M,_,
_,A,L,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,L,A,_,
M,L,L,L,L,L,L,L,L,L,_,L,L,L,L,L,L,L,L,L,M,
A,M,L,L,L,L,L,L,L,L,T,L,L,L,L,L,L,L,L,M,A,
_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,
_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,
_,_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,_,
_,_,_,_,_,M,M,A,L,L,L,L,L,A,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,A,M,A,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,T,_,T,_,_,_,_,_,_,_,_,
_,_,_,M,L,L,_,_,_,_,T,_,_,_,_,L,L,M,_,_,_,
_,A,M,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,M,A,_,
_,M,L,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,L,M,_,
A,L,L,L,L,L,L,_,_,_,T,_,_,_,L,L,L,L,L,L,A,
M,L,L,L,L,L,L,_,_,_,_,_,_,_,L,L,L,L,L,L,M,
_,A,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,A,_,
_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,
_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,
_,_,_,_,M,A,M,L,L,L,L,L,L,L,M,A,M,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,M,M,M,M,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,T,T,T,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,L,T,T,_,T,_,T,T,L,L,L,L,M,_,_,
_,M,L,L,L,T,T,_,_,_,T,_,_,_,T,T,L,L,L,M,_,
M,L,L,T,T,L,L,_,_,_,T,_,_,_,L,L,T,T,L,L,M,
A,L,L,L,L,L,L,_,_,T,T,T,_,_,L,L,L,L,L,L,A,
_,M,A,L,L,L,L,T,T,_,T,_,T,T,L,L,L,L,A,M,_,
_,_,_,A,L,L,T,L,L,L,T,L,L,L,T,L,L,A,_,_,_,
_,_,_,M,L,L,L,L,L,L,T,L,L,L,L,L,L,M,_,_,_,
_,_,_,_,A,M,A,L,L,L,T,L,L,L,A,M,A,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,A,M,A,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,T,_,T,_,T,_,_,_,_,_,_,_,_,
_,_,_,M,L,L,_,_,_,_,T,_,_,_,_,L,L,M,_,_,_,
_,A,M,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,M,A,_,
_,M,L,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,L,M,_,
A,L,L,L,L,L,L,_,_,_,T,_,_,_,L,L,L,L,L,L,A,
M,L,L,L,L,L,L,_,_,_,_,_,_,_,L,L,L,L,L,L,M,
_,A,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,A,_,
_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,
_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,
_,_,_,_,M,A,M,L,L,L,L,L,L,L,M,A,M,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,M,M,M,M,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,T,T,_,_,_,_,_,T,T,L,M,M,M,_,_,
_,M,L,L,L,L,L,L,_,T,_,T,_,L,L,L,L,L,L,M,_,
_,A,L,L,L,L,L,L,_,_,_,_,_,L,L,L,L,L,L,A,_,
M,L,L,L,L,L,L,L,L,L,_,L,L,L,L,L,L,L,L,L,M,
A,M,L,L,L,L,L,L,L,L,T,L,L,L,L,L,L,L,L,M,A,
_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,
_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,
_,_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,_,
_,_,_,_,_,M,M,A,L,L,L,L,L,A,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,A,M,A,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,T,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,L,_,_,_,_,_,_,_,L,L,M,M,M,_,_,
_,A,L,L,T,T,L,L,_,_,_,_,_,L,L,T,T,L,L,A,_,
_,M,L,L,L,L,L,L,T,_,_,_,T,L,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,
_,M,A,M,M,M,L,L,L,L,T,L,L,L,L,M,M,M,A,M,_,
_,_,_,_,_,_,M,L,L,L,L,L,L,L,M,_,_,_,_,_,_,
_,_,_,_,M,A,M,L,L,L,L,L,L,L,M,A,M,_,_,_,_,
_,_,_,_,A,M,A,M,L,L,L,L,L,M,A,M,A,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,A,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,M,M,L,L,_,_,_,T,_,_,_,L,L,M,M,M,_,_,
_,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,_,
_,A,L,L,L,L,L,L,T,L,L,L,T,L,L,L,L,L,L,A,_,
_,_,M,M,L,L,L,L,L,L,L,L,L,L,L,L,L,M,M,_,_,
_,_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,_,
_,_,_,_,_,M,M,L,L,L,T,L,L,L,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,M,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,M,_,_,_,L,T,L,_,_,_,M,M,M,_,_,_,
_,A,M,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,M,A,_,
_,M,A,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,A,M,_,
_,_,_,M,L,L,L,T,L,L,L,L,L,T,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,_,
_,_,_,_,_,A,M,L,L,L,L,L,L,L,M,A,_,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,L,L,L,L,_,_,_,_,_,_,_,_,
_,_,M,A,M,A,M,M,L,L,T,L,L,M,M,A,M,A,M,_,_,
_,_,M,M,M,M,L,L,L,L,L,L,L,L,L,M,M,M,M,_,_,
_,_,_,_,M,L,L,L,L,L,L,L,L,L,L,L,M,_,_,_,_,
_,_,_,_,A,L,L,L,L,L,L,L,L,L,L,L,A,_,_,_,_,
_,_,_,_,_,M,A,L,L,L,L,L,L,L,A,M,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,A,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,L,L,L,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,T,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,L,L,L,L,L,L,L,M,_,_,_,_,_,_,
_,_,_,_,A,M,L,L,L,L,L,L,L,L,L,M,A,_,_,_,_,
_,_,_,_,M,M,L,L,L,L,M,L,L,L,L,M,M,_,_,_,_,
_,_,_,_,_,_,M,M,A,M,A,M,A,M,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,M,M,M,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,A,L,L,L,L,L,A,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,L,L,L,L,L,M,_,_,_,_,_,_,_,
_,_,_,_,_,M,A,M,M,L,M,L,M,M,A,M,_,_,_,_,_,
_,_,_,_,_,A,M,A,M,A,_,A,M,A,M,A,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,M,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,M,L,L,L,M,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,M,A,L,L,L,A,M,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,A,M,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,A,M,A,M,A,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,M,A,M,A,M,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=223}}}

local function grow_black_oak_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 14) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 10, 1, 10, black_oak_tree2)
		return
	end
	add_tree(pos, 3, 1, 3, black_oak_tree)
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
		schematic = black_oak_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("black_oak:sapling", {
	description = S("Black Oak Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"black_oak_sapling.png"},
	inventory_image = "black_oak_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_black_oak_tree,
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
			"black_oak:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 7, z = 10},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 6,
})

core.register_node("black_oak:trunk", {
	description = S("Black Oak Trunk"),
	tiles = {"black_oak_trunk_top.png", "black_oak_trunk_top.png", "black_oak_trunk.png"},
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
		if not core.find_node_near(pos, 3, "black_oak:leaves") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "black_oak:leaves" and meta:get_string("acorns") == "true" then
				core.set_node(p, {name = "black_oak:leaves_fruiting"})
				core.get_node_timer(pos):start(200)
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 1, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("black_oak:wood", {
	description = S("Black Oak Wood"),
	tiles = {"black_oak_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("black_oak:leaves", {
	description = S("Black Oak Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"black_oak_leaves.png"},
	inventory_image = leaf_image("black_oak_leaves.png"),
	wield_image = leaf_image("black_oak_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"black_oak:sapling"}, rarity = 20},
			{items = {"black_oak:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("black_oak:leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"black_oak_leaves.png^black_oak_acorns.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "black_oak:leaves",
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"black_oak:acorn 3"}},
			{items = {"black_oak:acorn 2"}, rarity = 2},
			{items = {"black_oak:acorn 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "black_oak:leaves"})
		local f = core.find_node_near(pos, 3, "black_oak:trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("acorns", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("black_oak:acorn", {
	description = S("Acorn"),
	inventory_image = "black_oak_acorn.png",
	groups = {flammable = 1},
})

core.register_craftitem("black_oak:acorn_flour", {
	description = S("Acorn Flour"),
	inventory_image = "farming_wheat_flour.png^[colorize:brown:20",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("black_oak:acorn_muffin_dough", {
	description = S("Acorn Muffin Dough"),
	inventory_image = "black_oak_acorn_muffin_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("black_oak:acorn_muffin", {
	description = S("Acorn Muffin"),
	inventory_image = "black_oak_acorn_muffin.png",
	on_use = core.item_eat(4),
	groups = {flammable = 2},
})

-- Recipes

core.register_craft({
	output = "black_oak:wood 4",
	recipe = {{"black_oak:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "black_oak:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "black_oak:wood",
	burntime = 9,
})

core.register_craft({
	type = "shapeless",
	output = "black_oak:acorn_flour",
	recipe = {"black_oak:acorn", "black_oak:acorn", "black_oak:acorn", "black_oak:acorn",
		"black_oak:acorn", "black_oak:acorn", "group:grinder", "group:water_bucket"},
	replacements = {
		{"black_oak:acorn", "farming:spent_biomasse 6"},
		{"farm:mortar_pestle", "farm:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "black_oak:acorn_muffin_dough",
	recipe = {"black_oak:acorn_flour", "black_oak:acorn_flour",
		"black_oak:acorn_flour", "black_oak:acorn_flour", "default:coconut_milk"},
	replacements = {{"default:coconut_milk", "vessels:drinking_glass"}}
})

core.register_craft({
	type = "cooking",
	output = "black_oak:acorn_muffin 4",
	recipe = "black_oak:acorn_muffin_dough",
})


core.register_lbm({
	name = "black_oak:convert_black_oak_saplings_to_node_timer",
	nodenames = {"black_oak:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"black_oak:trunk"},
	leaves = {"black_oak:leaves", "black_oak:leaves_fruiting"},
	radius = 3,
})

doors.register_fencegate("black_oak:wood_gate", {
	description = S("Black Oak Wood Fence Gate"),
	texture = "black_oak_wood.png",
	material = "black_oak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("black_oak:wood_fence", {
	description = S("Black Oak Wood Fence"),
	texture = "black_oak_fence.png",
	material = "black_oak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("black_oak_wood", "black_oak:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"black_oak_wood.png"},
	S("Black Oak Wood Stair"),
	S("Black Oak Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"black_oak:sapling", grow_black_oak_tree, "soil"},
	})
end


-- waterlily

ethereal.waterlily = {size = {x = 1, y = 3, z = 1}, data = {
{name = "default:sand"},
{name = "default:water_source"},
{name = "flowers:waterlily"}}}

local C = {name = "default:coral_brown", force_place = true}
local c = {name = "default:coral_brown", prob = 191, force_place = true}
local O = {name = "default:coral_orange", force_place = true}
local o = {name = "default:coral_orange", prob = 191, force_place = true}
local X = {name = "default:coral_skeleton", force_place = true}
local x = {name = "default:coral_skeleton", prob = 63, force_place = true}

ethereal.coral = {size = {x = 5, y = 3, z = 5}, data = {
_,_,_,_,_,
o,C,O,c,_,
_,C,x,_,_,

_,_,X,_,_,
C,O,O,C,o,
c,c,O,o,x,

_,X,X,X,_,
c,C,C,O,O,
O,C,O,C,c,

_,_,X,_,_,
x,O,C,O,C,
_,x,C,O,_,

_,_,_,_,_,
_,o,O,C,c,
_,_,o,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

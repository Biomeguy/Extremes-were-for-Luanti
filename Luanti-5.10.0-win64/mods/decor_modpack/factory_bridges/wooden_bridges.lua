
--[[ Mod for Luanti that adds bridges (only one node wide!).
    
    Copyright (C) 2013 Sokomine

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

leg_front_left		= {-.5,-.5,-.5,-.4,.5,-.4}
leg_front_right		= {.4,-.5,-.5,.5,.5,-.4}
leg_back_left		= {-.5,-.5,.4,-.4,.5,.5}
leg_back_right		= {.4,-.5,.4,.5,.5,.5}

bar_left		= {-.5,.35,-.4,-.4,.4,.4}
bar_right		= {.4,.35,-.4,.5,.4,.4}
bar_back		= {.4,.35,.4,-.4,.4,.5}
bar_front		= {.5,.35,-.5,-.5,.4,-.4}

grond_small		= {-.4,-.45,-.5,.4,-.4,.5}
grond_corner	= {-.5,-.45,-.5,.5,-.4,.5} -- slightly larger

local WOOD = "stairs:slab_wood"
local BASIS = FB.NAME..":bridge_basis"
local RAIL = FB.NAME..":handrail"
local ROND = "group:leaves"

if( core.get_modpath( 'moreblocks' )) then
	WOOD = 'moreblocks:slab_wood'
end


local BRIDGE_PARTS = {
	-- name, description, node definition, crafting receipe, additional information for yield of receipe
	-- the groundplate - essential for bridge building
	{"bridge_basis", "groundplate of a bridge", {
		grond_small}, {
		{ROND, ROND, ROND},
		{ROND, WOOD,  ROND},
		{ROND, ROND, ROND}}, " 2"}, -- yields 2 groundplates

	-- the handrail is a basic part out of which bridges and handrails for staircases can be constructed
	{"handrail", "handrail for bridges and staircases, one side closed", {
		leg_back_left, leg_back_right, bar_back}, {
		{"",    "",    ""},
		{"",    BASIS, ""},
		{"", "default:wood", ""}}, " 4"}, -- yiels 4 handrails

	-- bridges
	{"bridge", "bridge", {
		leg_front_left, leg_front_right, leg_back_left, leg_back_right, bar_right, bar_left, grond_small}, {
		{"", "",    ""},
		{RAIL, BASIS, RAIL},
		{"", "",    ""}}, "" },

	{"bridge_corner", "corner of a bridge", {
		leg_front_left, leg_front_right, leg_back_left, leg_back_right, bar_right, bar_back, grond_corner}, {
		{"", RAIL,  ""},
		{"", BASIS, RAIL},
		{"group:stick", "", ""}}, "" },

	{"bridge_t",  "T junction of a bridge", {
		leg_front_left, leg_front_right, leg_back_left, leg_back_right, bar_back, grond_corner}, {
		{"", RAIL,  ""},
		{"",    BASIS, ""},
		{"group:stick", "", "group:stick"}}, "" },

	{"bridge_end", "end of a bridge", {
		leg_front_left, leg_front_right, leg_back_left, leg_back_right, bar_left, bar_right, bar_back, grond_corner}, {
		{"", RAIL,  ""},
		{RAIL,  BASIS, RAIL},
		{"", "",    ""}}, "" },

	-- handrails for the top of starcaises so that people won't fall down
	{"handrail_corner", "handrail for staircases, two sides closed", {
		leg_front_right, leg_back_left, leg_back_right, bar_back, bar_right}, {
		{"", RAIL, ""},
		{"",  "",    RAIL},
		{"",  "",    ""}}, "" },

	{"handrail_closed", "handrail for staircases, three sides closed", {
		leg_front_left, leg_front_right, leg_back_left, leg_back_right, bar_left, bar_right, bar_back}, {
		{"", RAIL,  ""},
		{RAIL,  "",    RAIL},
		{"", "",  ""}}, "" },
}

for i in ipairs( BRIDGE_PARTS ) do
core.register_node(FB.NAME..":"..BRIDGE_PARTS[i][1], {
	description = BRIDGE_PARTS[i][2],
	drawtype = "nodebox",
	tiles = {"default_wood.png"},
	paramtype = 'light',
	paramtype2 = "facedir",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = BRIDGE_PARTS[i][3],
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})

core.register_craft({
	output = FB.NAME..":"..BRIDGE_PARTS[i][1]..BRIDGE_PARTS[i][5],
	recipe = BRIDGE_PARTS[i][4],
})
end

Mirror of Returning
===================
Version 1.0.4

## Description
This mod adds a magical item, the Mirror of Returning. This item teleports the user back to a previously
set location, at the cost of some chi (if applicable).

## Usage
While holding the mirror:

* Rightclick to set the mirror's teleport location.
* Leftclick to immediately teleport back to the mirror's teleport location.

Each mirror has is own teleport location and “remembers” it throughout the game, until a new
teleport location has been set.

Initially, a mirror has no teleport location set, so you have to set it before the first teleportation.

If the Chi mod [chi] is present, setting and teleporting costs chi. The default cost are:

* Setting teleport location: 20
* Teleporting: 200

## Configuration
You can change the chi costs via minetest.conf. The following settings are used:

* `returnmirror_cost_set`: Chi cost for setting (number)
* `returnmirror_cost_teleport`: Chi cost for teleporting (number)

If a setting is not present, the default cost is used.

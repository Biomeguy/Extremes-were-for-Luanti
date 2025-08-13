--readme of LegendofMinetest
 _                               _        _____  ____            _            _   
| |                             | |      / _|  \/  (_)          | |          | |  
| |     ___  __ _  ___ _ __   __| | ___ | |_| .  . |_ _ __   ___| |_ ___  ___| |_ 
| |    / _ \/ _` |/ _ \ '_ \ / _` |/ _ \|  _| |\/| | | '_ \ / _ \ __/ _ \/ __| __|
| |___|  __/ (_| |  __/ | | | (_| | (_) | | | |  | | | | | |  __/ ||  __/\__ \ |_ 
\_____/\___|\__, |\___|_| |_|\__,_|\___/|_| \_|  |_/_|_| |_|\___|\__\___||___/\__|
             __/ |                                                                
            |___/                                                          
Created by D00Med, but with a lot of help from tobyplowy (aka toby109tt),
and also help from Noah K.(aka WinkingBaby)(https://www.youtube.com/channel/UCu8MTAFrihYO9PxKm-pk_xw), Mastersyfodiaz, and Sam Labbato(https://soundcloud.com/sam-labbato)

Gameplay information:
In addition to the usual mining and building objectives of the game, there are now bosses and the triforce as objectives.
The triforce can be obtained either by mining mese, searching dungeons, or by defeating Ganon. Scattered throughout the dungeons are triforce shards, and magic pendants. 
These pendants can be used to craft boss spawners. Once placed, the bosses will spawn after 5 seconds. Currently there are three minor bosses, spawned with blocks crafted with the three pendants.
These bosses drop the three stones required to obtain the mastersword, which will turn any boss spawner into a Ganon spawner when right clicked. 
The bosses are tough so be prepared! Also, in an attempt to break away from the usual mining aspect, some materials can be traded with npc's.

Mods by D00Med:
doomshrooms
hyrule
icetools
mobs_fairy(based on mobs_bat)
mobs_loz
moreplants
kblocks
twilight
vehicles_loz
witchcraft
music
masks
clawshot

Changelog:
V1>V2:

>minetest_game is now used as a base instead of MinetestNeXt
>New dungeon nodes
>Bombs now use a 3d model and can the thrown by left clicking
>Bomb flowers have been added, right click to harvest bombs
>boomerangs now use a 3d model and return to the player.
>magic boomerangs can be controlled by looking around after throwing
>clawshots have been added, left click to be pulled towards something, shift+click to swing towards something horizontally.
>added butterflies and waterfall effects
>added hawk eye
>removed mobs_monster
>hearts are now an entity that automatically heals any players who collect them
>added roots, caveferns, stalagmites/tites, ice spikes and obsidian spikes
>added the icesheet biome
>new doors, some require keys
>new plants in the moreplants mod
>added dragonflies
>added keys
>added dungeon torch
>added some sloped nodes
>added stair corners
>changed chicken to cuccoo
>changed cow and sheep models
>merged icetools with hyruletools
>added flame rod
>added connected chests (shift and click on the side of a chest)
>added treasure and key chests
>added wind boomerang
>added villages
>added letters
>letterbox now uses a model
>removed tv
>added junglevines
>improved 3rd person view
>arrows can be picked up from when they are inside a node
>added subrosia(hell mod)
>added magnetic gloves which can pull or push magnetic nodes
>pots have a new model and textures
>added classic shield and sword
>collecting rupees makes a different sound
>added spikes, sinking sand, fake carpet
>waterlily and cactus now use models
>optional leaf model(like nodebox_trees)
>waterlilies are walkable
>added lamps which trigger doors when righ clicked with a lantern
>lanterns dropped by poes
>added new dungeons(above and below ground)
>added rupee blocks
>player effects is now used(much better physics overrides)
>new ice nodes
>new swamp biome
>fixed the lost woods biome being almost impossible to find
>added quest npc's, which can be used to add quests really easily
>added deku mask
>bones changed to a tombstone
>new players(singleplayer only) will spawn inside a cave
>new player skin
>chi added, tools now use this
>added witchcraft mod and better potions
>improved medallions, they now work as they do in link to the past
>removed xdecor potion
>added cave crystals
>changed deku scrub to an actual deku scrub
>business scrubs are added(previously deku scrub)
>added corals and shrubs
>flowerpots now use a 3d model
>removed xdecor walls added walls mod
>ganon now has his own dungeon, which is placed by his spawner
>ganon can't be killed until all 'ganon' orbs in the dungeon are destroyed
>removed twilight model change :'(
>added music
>beamos
>new sound effects
>mobs_loz mobs all have new models and textures
>hud item counters are shown in singleplayer mode to count bombs rupees and keys
>new nodes added
>many textures have been changed

>New mobs:
*Midna
*subrosian
*redead
*peahat
*skulltula
*shopkeeper
*octorock
*hiploop
*giant octorock
*mimics
*wolfos
*keese
*biri
*darknut
*white wolfos
*tektite
*armos
*leever
*moldorm
*zol
*mad scrubs


For other mods see license.txt in the folder of each mod.
License of code: GNU GPL v3 (C) 2016-2017 D00Med
License of textures: CC BY-SA 3.0 (C) 2016-2017 D00Med and tobyplowy(aka toby109tt)

An edit of Minetest Game all code licensed as shown below unless otherwise stated.
see readme below;

--readme of Minetest Game
Minetest Game [minetest_game]
=============================
The main subgame for the Luanti engine
========================================

To use this subgame with the Luanti engine, insert this repository as
	/games/minetest_game

The Luanti engine can be found in:
	https://github.com/minetest/minetest/

Compatibility
--------------
The Minetest Game github master HEAD is generally compatible with the github
master HEAD of the Luanti engine.

Additionally, when the Luanti engine is tagged to be a certain version (eg.
0.4.10), Minetest Game is tagged with the version too.

When stable releases are made, Minetest Game is packaged and made available in
	http://minetest.net/download
and in case the repository has grown too much, it may be reset. In that sense,
this is not a "real" git repository. (Package maintainers please note!)

License of source code
----------------------
Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt in each mod directory for information about other authors.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

License of media (textures and sounds)
--------------------------------------
Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt in each mod directory for information about other authors.

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/

Baked Clay

bakedclay_block.png
bakedclay_block_slab.png
bakedclay_brick.png

Author of textures: Napiophelios
License of textures: CC BY-SA 3.0

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/

This mod lets the player bake clay into hardened blocks and colour them with
dye (8x baked clay and 1x dye in centre), stairs and slabs are also available.

https://forum.minetest.net/viewtopic.php?id=8890

Changelog:

- 0.7 - Added support for stairsplus so that stairs are registered properly
- 0.6 - Added 3 new flowers and a new grass that are used for missing dyes
- 0.5 - Now using minecraft recipe to colour baked clay (8x baked clay, 1x dye in centre)
- 0.4 - Code tweak and tidy
- 0.3 - Added Stairs and Slabs for each colour
- 0.2 - Any colour of baked clay can be re-dyed into another colour
- 0.1 - Initial Release

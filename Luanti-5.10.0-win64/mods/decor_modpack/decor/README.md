## X-Decor ##

##### A decoration mod meant to be simple and well-featured. #####
##### It adds a bunch of cute cubes, various mechanisms and stuff for [cutting](https://forum.minetest.net/viewtopic.php?f=11&t=14085), [enchanting](https://forum.minetest.net/viewtopic.php?f=11&t=14087), cooking, etc. #####
##### This mod is a lightweight alternative to Home Decor and More Blocks all together. #####

This is what I consider to be a fairly feature-filled home decor modpack.  
See the forum thread at 
https://forum.minetest.net/viewtopic.php?f=11&t=2041 for details about 
this modpack.

### Credits ###

##### Special thanks to Gambit for the textures from the PixelBOX pack for Luanti. #####

##### Thanks to all contributors that keep this mod alive. #####

![Preview](http://i.imgur.com/AVoyCQy.png)

abriglass
===

Stained glass Luanti mod by Shara RedCat which adds:

1. Coloured glass.
2. Patterned stained glass.
3. Glass lights.
4. One way windows. 
5. Portholes.
6. Hidden light node.


Crafting
---------

Plain abriglass can be crafted using default glass. Coloured glass can then be made using this and dye. 

Glass lights can be crafted using glass, dye and torches.

Patterned glass can be crafted using combinations of coloured glass.

One way windows can be crafted using their wall type, glass and a mese crystal fragment. 

Hidden light is not in the inventory, has no recipes and can only be acquired through commands. This is an invisible node which can be walked through and is intended to provide gentle lighting in areas where regular lighting may be undesirable. 

Special thanks to agaran for assisting with the recipes. 


Licenses and Attribution
-----------------------

Code for this mod is released under MIT (https://opensource.org/licenses/MIT).

Textures for this mod are released under CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/), attribution: Shara RedCat.


Recommended Additions
-----------------------

- [abriflame](https://github.com/Ezhh/abriflame) allows coloured flames to be lit on coloured glass nodes.

# block_in_block
A silly mod to spark creativity.
![Preview](https://github.com/TumeniNodes/block_in_block/blob/master/screenshot.png)
![Preview](https://github.com/TumeniNodes/block_in_block/blob/master/screenshot_2.png)

Liscence of this mod: GPLv3
Autor: Sokomine

---
--- Textures and media:
---
VanessaE (CC-by-SA 3.0):
   cottages_wagonwheel.png 
   cottages_homedecor_shingles_asphalt.png
   cottages_homedecor_shingles_terracotta.png
   cottages_homedecor_shingles_wood.png
   cottages_sleepingmat.png
   cottages_barrel.png

badger436 (created for this mod; CC BY-SA 3.0):
   cottages_feldweg.png

Some textures are taken from
	https://github.com/minetest/minetest_game
and renamed (default_NAME.png -> cottages_NAME.png)

Zeg9 (CC BY-SA 3.0):
   cottages_steel_block.png (for steel hatch and stovepipie)

MasterGollum (WTFPL, darkage mod):
   cottages_reet.png (straw texture changed in color)

Sokomine (CC-by-SA 3.0):
   cottages_glass_pane.png (modification of default_glass.png)
   cottages_loam.png (part of a real loam wall)

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/
   cottages_clay.png (washing place, stairs and slab)
From the supplied minimal game:
   cottages_minimal_wood.png

Bas080 (CC; see https://forum.minetest.net/viewtopic.php?t=2344)
   cottages_rope.png

Derived from Universal schema.jpg by Stefanie Lindener, which can be found here: http://de.wikipedia.org/w/index.php?title=Datei:Universal_schema.jpg&filetimestamp=20060510110309& The texture is CC-by-sa 2.0/de.
   cottages_slate.png

Textures not provided but used (need to be supplied by a default mod):
	default_wood.png
	default_beech_trunk.png
	default_dirt.png
	default_grass_side.png
	default_stick.png

# DarkAge Mod for Luanti
Original mod by Master Gollum 
Modified by addi. 

Contains code from CragiDavi and HybridDog

## Introduction:
  This mod adds a few new blocks that allows to create new buildings in a
  pre industrial landscape. Of course, feel free to use them in any other 
  construction :P

  It also provides more layers of stones. I tried not to turn mining in
  a rainbow, so don't expect to find them easily. There are two kinds of
  materials, stones, that spawns in layers at different deep and clay
  like materials (silt and mud) that you will find in water places.
  Silt and Mud are more easy to find than stone layers, but if you find
  one it will be a real mine, with all probability with hundreds of blocks.

  I used mainly 4 square recipes to avoid collisions with other MODs, 
  anyway I have not checked all them, so it is possible that another 
  person is already using one or more of this combinations.

  I also used Desert Sand and Desert Stone, because they almost are not
  used in the default version. Probably I will change this recipes in 
  next releases.

  

## Release Notes
Version 1.2

* corrected Sounds of Stairs
* updated to new Moreblocks api
* added Serpentine Stairs

Version 1.1

* Fix spelling mistakes in README file
* Bug fix
* Rename slate_tale to slate_tile
* Remove unneeded code
* Add marble tile
* Remove unneeded code
* Capitalise a couple of descriptions
* Add marble tile texture
* Rename alias.lua to aliases.lua

Version 1.0.1 

 * fixed init.lua which get broken by upload on github


Version 1.0 

* compatibility with stairsplus added
* added new item iron_stick
* added craft reziep for iron stick
* changed reziep of iron_bars to avoid conflicts with iron bars mod
* changed reziep of chain to avoid conflicts with 3d furniture mod
* changed reziep of darkage:stonebrick to avoid conflicts with moreblocks
* disabled marble_tile to avoid the message "texture not found"
* added compatibility with stairsplus (now its moreblocks)
* added darkage:glass a nice looking glass that must be in this mod 
* changed the sound_node_leaves_default to wood_default from  box and wooden shelves
* added craft reziep for darkage:chalk
* improved the textures of reinforced wood and chalk to save a bit more loadtime on servers
* added another reziep for darkage straw (this can be crafted now, if farming is installed, with farming:harvested_weed

Version 0.3

* 29 Nodes + 3 Craft Items
* Furniture and building decoration
* Stone layers



Version 0.2

* 13 Nodes
* Sedimentary stones


Version 0.1

* 6 Nodes


### How to install:
  Unzip the archive an place it in luanti-base-directory/mods/
  if you have a windows client or a linux run-in-place client. If you 
  have a linux system-wide installation place it in 
  ~/.luanti/mods/.
  If you want to install this mod only in one world create the folder
  worldmods/ in your worlddirectory. Remember to activate it for your world by pressing the 'configure' button and doubleclick darkage in the right list.
  For further information or help see:
   http://wiki.minetest.net/Installing_Mods

## BUILDING NODES

### Adobe: 
Sand and Clay mixture with Straw to build houses or walls.
Used from historical times, one of the first bricks 
invented. I have to improve this texture, it is ugly :P

     CRAFT -> 4
     [Sand] [Sand]
     [Clay Lump] [Straw]


### Basalt:
A darken version of the default Stone
  
     COOKING
     [Basalt Rubble]


### Basalt Rubble:
A darken version of the default Cobble.
  
     CRAFT -> 4
     [Cobble] [Cobble]
     [Coal Lump] [Coal Lump]


### Chalk:
A soft, white and porous sedimentary rock. It becomes
Chalk Powder when dug. Can't be craft, only found as stratum.


### Chalk Powder:
Pile of chalk from digging Chalk stones. Can
be used to prepare plaster. See Cobblestone with Plaster.


### Cobblestone with Plaster:
Cobbles where has been applied a
layer of white plaster.
When dug it lost the plaster layer!

     CRAFT -> 2
     [Cobblestone] [Chalk Powder]
     [Cobblestone] [Chalk Powder]


### Dark Dirt: 
A darken version of the Dirt where the grass doesn't
grown, perfect for create a path in a forest. I was using
Gravel, but the noise walking was annoying to me (like
walking over iron coal with the nude feet :P), for this I
created this node.

     CRAFT -> 4
     [Dirt] [Dirt]
     [Gravel] [Gravel]


### Desert Iron Ore:
I know that others MODs add ores to the 
Desert Stones, mine also does it, but just Iron, I supposed
the red color is because of the iron, so it goes with more
high probability than regular Stones and it doesn't add
Coal to them. It will not be a lot so you can keep it with
another MOD that does the same or just comment the lines that
does it.


### Dry Leaves:
Just a cube of Leaves toasted :P Well I found the
Leaves are not useful so I thought to turn them into Straw, ok
it is not the same, but well, why not? Just dry them in a
Furnace and then put together to create the Straw

     COOKING
     [Leaves]


### Gneiss:
High grade metamorphic rock formed from Schist, very
common, and used in construction. It sometimes brakes in
Gneiss Rubble when being dug.

     COOKING
     [Schist]


### Gneiss Rubble:
Cobble version of the gneiss.
  
     From dig gneiss


### Mud:
Mixture of water and some combination of soil, silt, and
clay. Used for build houses, specially in desert regions.
It brakes in 4 Mud Lumps when dug.

     CRAFT -> 3
     [Dirt] [Dirt]
     [Clay Lump] [Silt Lump]

     CRAFT -> 1
     [Mud Lump] [Mud Lump]
     [Mud Lump] [Mud Lump]


### Old Red Sandstone:
A light red sandstone, in fact it's
sandstone with iron that gives it this color.

     CRAFT -> 4
     [Sandstone] [Sandstone]
     [Iron Lump] [Sandstone]

     COOKING
     [Old Red Sandstone Rubble]


### Old Red Sandstone Rubble:
Cobbles of Old Red Sandstone.
  
     CRAFT -> 4
     [Sandstone] [Sandstone]
     [Iron Lump] [Sandstone]


### Reinforced Cobble:
Brick with crossed wooden.
  
     CRAFT -> 1
     [Stick] [] [Stick]
     [] [Cobble] []
     [Stick] [] [Stick]


### Schist:
Medium grade metamorphic rock from Slate.
  
     COOKING
     [Slate]


### Silt:
Granular material of a size somewhere between sand and clay.
It brakes in 4 Silt Lumps.
	 
     CRAFT -> 1
     [Silt Lump] [Silt Lump]
     [Silt Lump] [Silt Lump]


### Slate:
Fine-grained, foliated, homogeneous metamorphic rock
derived from an original shale-type sedimentary rock through
low-grade regional metamorphism. It is used to build roof.
	 
     COOKING
     [Shale]

     COOKING
     [Slate Cobble]

 
### Slate Rubble:
Cobble obtained from Slate

     From dig Slate


### Slate Tile:
Nice blue slate tiles for roofs. They has been used
as building traditional building material in zones where
slate is easy to find.
Note: It has stairs and slabs.
	 
     CRAFT -> 2
     [Slate Rubble] [Slate Rubble]
     [Slate Rubble] [Slate Rubble]


### Straw Bale:
 A decoration item, looks great for a farm or a 
 country side house.
	 
     CRAFT -> 1
     [Straw] [Straw]
     [Straw] [Straw]
 

### Desert Stone:
 Just the default block, it can be obtained now
 from Desert Sand. The idea is that Desert Sand is stonier
 than regular Sand, so it takes less to create a Desert
 Stone than a Sandstone.
	 
     CRAFT -> 2
     [Sandstone] [Sandstone]
     [Sandstone] [Sandstone]


##FURNITURE NODES
Just started so they are few ones

### Box:
A more smaller container than the Chest, but it requires
less wood. As cheep as 4 woods and have 16 slots. The craft
is a little weird but I think it makes sense and avoids
collision with the recipe of Hardwood of the MOD 
building_blocks.
     
     CRAFT -> 2
     [Wood] [] [Wood]
     [] [] []
     [Wood] [] [Wood]

### Chain:
Climbable chain.
  
     CRAFT -> 2
     [Steel Ingot]
     [Steel Ingot]
     [Steel Ingot]


### Iron Bars:
 Alternative window for the Glass.
  
     CRAFT -> 3
     [Iron Stick] [] [Iron Stick]
     [Iron Stick] [] [Iron Stick]
     [Iron Stick] [] [Iron Stick]


###Iron Grille:
 Alternative window for the Glass.
  
     CRAFT -> 3
     []          [Iron Bars]      []
     [Iron Bars]     []       [Iron Bars]
     []          [Iron Bars]      []


###Wood Bars:
Alternative window for the Glass.
  
     CRAFT -> 3
     [Stick] [] [Stick]
     [Stick] [] [Stick]
     [Stick] [] [Stick]


###Wood Frame:
Alternative window for the Glass.
  
     CRAFT -> 1
     [Stick] [Stick]  [Stick]
     [Stick] [Glass]  [Stick]
     [Stick] [Stick]  [Stick]


### Medieval Glass:
A good looking glass, with small tiles
  
     CRAFT -> 8
     [Glass]       [steel_ingot]       [Glass]
     [steel_ingot] [Glass]       [steel_ingot]
     [Glass]       [steel_ingot]       [Glass]

     or:
     CRAFT -> 1
     [Medieval Glow Glass]


### Medieval Glow Glass:
A good looking glass, with small tiles which are glowing by itself
  
     CRAFT -> 8
     [Medieval Glass]
     [torch] 
	 
	 
##License:
Sourcecode: WTFPL (see below)
Graphics: WTFPL (see below)

#See also:
http://minetest.net/

---


```
#!

         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

=== DarkAge MOD for LUANTI-C55 ===
by Master Gollum

Introduction:
  This mod adds a few new blocks that allows to create new buildings in a
  pre industrial landscape. Of course, feel free to use them in any other 
  construction :P

  It also provides more layers of stones. I tried not to turn mining in
  a rainbow, so don't expect to find them easily. There are two kinds of
  materials, stones, that spawns in layers at different deep and clay
  like materials (silt and mud) that you will find in water places.
  Silt and Mud are more easy to find than stone layers, but if you find
  one it will be a real mine, with all probability with hundreds of blocks.

  I used mainly 4 square recipes to avoid collisions with other MODs, 
  anyway I have not checked all them, so it is possible that another 
  person is already using one or more of this combinations.


Release Notes

  Version 0.3
    * 29 Nodes + 3 Craft Items
    * Furniture and building decoration
    * Stone layers

  Version 0.2
    * 13 Nodes
    * Sedimentary stones

  Version 0.1
    * 6 Nodes

PS: This document has been structured as the README.txt of PilzAdam in 
    his Bed MOD.

How to install:
  Unzip the archive an place it in luanti-base-directory/mods/minetest/
  if you have a windows client or a linux run-in-place client. If you 
  have a linux system-wide instalation place it in 
  ~/.luanti/mods/minetest/.
  If you want to install this mod only in one world create the folder
  worldmods/ in your worlddirectory.
  For further information or help see:
    http://wiki.minetest.com/wiki/Installing_Mods


  BUILDING NODES

  Adobe: Sand and Clay mixture with Straw to build houses or walls
         Used from historical times, one of the first bricks 
         invented. I have to improve this texture, it is ugly :P
     CRAFT -> 4
     [Sand] [Sand]
     [Clay Lumb] [Straw]

  Chalk: a soft, white and porous sedimentary rock. It becomes
     Chalk Powder when dug. Found as stratum.

  Chalk Powder: can be crafted into Chalk.
     CRAFT -> 1
     [Chalk Powder] [Chalk Powder]
     [Chalk Powder] [Chalk Powder]

  Gneiss: high grade metamorphic rock formed from Schist, very
     common, and used in construction. It sometimes breaks in
     Gneiss Cobble when being dug.
     COOKING
     [Schist]

  Gneiss Cobble: brick version of the gneiss.
     From dig gneiss

  Mud: mixture of water and some combination of soil, silt, and
     clay. Used for build houses, specially in desertic regions.
     It breaks into 4 Mud Lumps when dug.
     CRAFT -> 3
     [Dirt] [Dirt]
     [Clay Lump] [Silt Lump]
     CRAFT -> 1
     [Mud Lump] [Mud Lump]
     [Mud Lump] [Mud Lump]

  Reinforced Cobble: brick with crossed wooden.
     CRAFT -> 1
     [Stick] [] [Stick]
     [] [Cobble] []
     [Stick] [] [Stick]

  Schist: medium grade metamorphic rock from Slate.
     COOKING
     [Slate]

  Silt: granular material of a size somewhere between sand and clay.
     It brokes in 4 Silt Lumps.
     CRAFT -> 1
     [Silt Lump] [Silt Lump]
     [Silt Lump] [Silt Lump]

  Slate: fine-grained, foliated, homogeneous metamorphic rock
     derived from an original shale-type sedimentary rock through
     low-grade regional metamorphism. It is used to build roof.
     COOKING
     [Shale]
     COOKING
     [Slate Cobble]

  Slate Cobble: Cobble obtained from Slate
     From dig Slate

  Slate Tale: Nice blue slate tales for roofs. They has been used
     as building traditional building material in zones where
     slate is easy to find.
     Note: It has stairs and slabs.
     CRAFT -> 2
     [Slate Cobble] [Slate Cobble]
     [Slate Cobble] [Slate Cobble]


  FURNITURE NODES
  Just started so they are few ones

  Box: a smaller container than a Chest, but it requires
     less wood. As cheep as 4 woods and has 16 slots. The craft
     is a little weird but I think it makes sense and avoids
     collision with the Hardwood recipe from the MOD 
     building_blocks.
     CRAFT -> 2
     [Wood] [] [Wood]
     [] [] []
     [Wood] [] [Wood]

  Chain: climbable chain.
     CRAFT -> 2
     [Steel Ingot]
     [Steel Ingot]
     [Steel Ingot]

  Iron Bars: alternative window for the Glass.
     CRAFT -> 3
     [Steel Ingot] [] [Steel Ingot]
     [Steel Ingot] [] [Steel Ingot]
     [Steel Ingot] [] [Steel Ingot]

  Iron Grille: alternative window for the Glass.
     CRAFT -> 3
     []          [Iron Bars]      []
     [Iron Bars]     []       [Iron Bars]
     []          [Iron Bars]      []

  Wood Bars: alternative window for the Glass.
     CRAFT -> 3
     [Stick] [] [Stick]
     [Stick] [] [Stick]
     [Stick] [] [Stick]

  Wood Frame: alternative window for the Glass.
     CRAFT -> 1
     [Stick] [Stick]  [Stick]
     [Stick] [Glass]  [Stick]
     [Stick] [Stick]  [Stick]


License:
Sourcecode: WTFPL (see below)
Graphics: WTFPL (see below)

See also:
http://minetest.net/

         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO. 

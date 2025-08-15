Snow Ball Mod
 Version 3.2

By Splizard and LazyJ.

Luanti version:  0.4.9
Depends: default
License:  GPL v2

Complimentary Mods:
---------------------
*	"Snowdrift" by paramat


Install:

Forum post: http://minetest.net/forum/viewtopic.php?id=2290
Github: https://github.com/Splizard/minetest-mod-snow
Website: http://splizard.com/minetest/mods/snow/

INSTALL:
----------
Place this folder in your luanti mods folder.
(http://dev.minetest.net/Installing_Mods)

	* After downloading, unzip the file.
	* Rename the directory "luanti-mod-snow-master" to "snow"
	* Copy the "snow" directory into either
	../luanti/worlds/yourworld'sname/worldmods/
	or
	../luanti/mods/
	* If you put "snow" in the ../luanti/mods/ directory, either
	enable the mod from within Luanti's "Configure" button
	(main menu, bottom right) or by adding this line to the
	world's "world.mt" file:
	load_mod_snow = true



NOTICE
While this mod is installed you may experience slower map loading while a snow biome is generated.

USAGE:
-------
Snow can be picked up and thrown as snowballs.
Snow Shoes allow for faster travel on snow.

MAPGEN_V7:
------------
If you are using minetest 0.4.8 or the latest dev version of luanti you can choose to generate a v7 map.
This option can be found when creating a new map from the menu.
Snow Biomes has support for this though you might need a couple other biomes too otherwise you will only spawn snow.
There are a couple of bugs and limitations with this such as no ice being generated at the moment.

Config file:
------------
After starting a game in luanti with snow mod, a config file will be placed in this folder that contains the various options for snow mod.
As admin you can use the /snow command in-game to make various changes.

UNINSTALL:
------------
Simply delete the folder snow from the mods folder.



TODO:
— use the settingtypes.txt
— test if the fixed ground_y search works correctly at chunkcorners at ground level

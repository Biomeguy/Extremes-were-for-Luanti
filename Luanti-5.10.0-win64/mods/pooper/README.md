Version: 1.2
Code: LGPL 2.1
Assets: CC BY-SA 3.0
MT Version: 0.4.13+
Date: 2016-09-01

A thanks to Hybrid Dog for key methods (WTFPL), timtube, jorickhoofd and IFartInUrGeneralDirection (freesound.org) for Creative Commons audio assets.

To install this mod, unzip the containing folder of this file and place the unziped folder into your ~/minetest/mods/ directory. The folder name needs to remain as "pooper" in order to function. You may need to create the "mods" folder if no mods have been installed yet.

Defecation:
You will poop on a preconfigured cycle or you can poop manually by pressing "Use" (E key by default) after your gut growls to indicate the urge to go. Eating any kind of food will hasten the need to poop.

Feces:
Feces can be eaten to restore half a heart or can be used to create a Pile of Feces node by placing Feces on a horizontal row of three, with one centered in the row above in the crafting grid.

Pile of Feces:
Breaking a Pile of Feces can be done by hand and will yield four individual Feces. A Pile of Feces will cause the player to hold their breath within a five node radius but a lot of it together will surely suffocate any passerby.

Raw Digestive Agent:
Gather a Red Mushroom and a Waterlily and place them in a Glass Bottle to prepare a Raw Digestive Agent. This can be eaten but does nothing besides fill your bowels a little. Cook in a furnace to craft Laxative.

Laxative:
Evacuates your fecal matter in a short span of time.

- bug: eating can cause gut gurgle notification to be skipped
- is using + 1 instead of + dtime really universal to all users? Server tickrate will affect this. 0.1 default but admins can change this

1.3
- Added Raw Digestive Agent as a benign food and recipe item.
- Added Laxative. Try not to make a mess!
- Added craft recipes for Digestive Agent and Laxative, updated Readme.

1.2
- Added check to ensure mod folder name "pooper" is used.
- Simplified on_item_eat digestion code.
- Increased default setting for minimum time between defecation by 200%.
- Forced setting of random bowel level on player join to scale with configurable minimum time between poop parameter.

1.1
- Added gut gurgling sound effect to notify players of readiness to defecate.
- Changed manual defecate key to "Use" (E key by default).
- Switched to GitLab for project hosting and mod download.
- Players no longer join with empty digestive system.

1.0
- Release! Removed all references to "WIP".
- Death and respawn now resets player's bodily cycle.
- Decreased slightly how filling food is.

0.9
- Saplings can now grow on Pile of Feces nodes.
- Greatly increased time between defecation to three per in-game day on average.
- Finalized Feces texture, added deeper bumpmapping effect.
- Added screenshot.png for mods tab preview.

0.8
- Pile of Feces suffocation effect now leaves players alive with one heart for balance.
- Removed suffocation damage player protection debug message.
- Cleaned up server warning messages, localized variables and some optimizations.
- Increased variance between player bowel movements (true random).

0.7
- Added delay to eating food's effect on bowel filling for simulated digestion time.
- Changed mod name to "pooper" mod to distinguish from other projects.
- Added bump mapping effect to Feces and Pile of Feces textures.
- Rebalanced bowel cycle and Pile of Feces' suffocation effect damage value.

0.6
- Fixed bug where one player eating would fill all player's bowels.
- Fully isolated player defecation cycles (multiplayer is no longer experimental).
- Fixed bug in which manually defecating would trigger a bowel level check for all players.
- Added rudimentary area-of-denial suffocation effect to Pile of Feces node.

0.5
- Fixed multiplayer issue where manual defecate would cause all players to poop at once.
- Added unique bowel cycle for each individual player. No more sync'd pooping!
- New feature - eating food items will accelerate time until next excrement.
- Adjusted Pile of Feces texture edges so that they now align.

0.4
- Recipe for Pile of Feces now resembles the shape of a pile (.:.).
- Fixed Feces not healing hearts on being eaten.
- Pile of Feces is now a falling node, as clumped turd would have little rigidity.
- Added default dirt sounds to Pile of Feces.

0.3
- Limited the distance that pooping sound may travel.
- Experimental support for multiplayer, removed legacy core.env calls.
- Removed <suffocation placeholder> debug message.
- Added more sound variety.

0.2
- Changed manual defecation from "/dump" command to sneak key. Satisfying!
- Added cooldown time between manual defecations with player notification.
- Revised textures for Feces item and Pile of Feces node.
- Added readme.txt with descriptions of item and node features.

0.1
- Pile of Feces now drops four Feces on destruction.
- New feature /dump to poop on-command.
- Increased minimum time between bowel movements.
- Removed <defecation placeholder> debug message.

0.0
- Player poops on a predefined, randomized cadence.
- Craft turds into Pile of Feces node.
- Feces are edible.
- Defecation sound to accompany pooping action.

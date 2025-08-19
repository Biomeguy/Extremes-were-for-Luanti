# Maple
Sugar Maple Tree for Luanti by ExeterDad

This mod adds a sugar maple tree to the minetest game.
Originally written for the Hometown server (http://hometownserver.com/) by ExeterDad (https://forum.minetest.net/memberlist.php?mode=viewprofile&u=10544).

## The tree
![Maple Tree](https://github.com/h-v-smacker/maple/blob/master/maple_in_the_wild.jpg)

## Technic chainsaw
Add this to technic/technic/tools/chainsaw.lua to enable support for maple trees for the chainsaw tool:

```
-- Support maple
if core.get_modpath("maple") then
	timber_nodenames["maple:maple_tree"]         = true
	if chainsaw_leaves then
		timber_nodenames["maple:maple_leaves"] = true
	end
end
```

## Stairs and slabs
Maple tries to register fancy wooden shapes for maple wood with stairs or moreblocks.

## Drawers
If storage drawers mod is available, maple registers the corresponding assortment of drawers.

## Arcs
If pkarcs (simple arcs) mod is found, maple arcs are registered.
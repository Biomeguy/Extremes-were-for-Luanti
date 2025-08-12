-- The content of the guide
local guide_infos = {
	{"Nether Mushroom",
[[Nether mushrooms can be found on the hell's ground. They can be dug by hand.
<item name=caverealms:nether_shroom width=100>

<my_h2><b>Crafting Items</b></my_h2>
If we drop a Nether mushroom without holding the fast key, we can split it into its stem and head. We can use them to craft a Nether Mushroom Pickaxe, a Hell Blood Extractor, and an uncooked Hell Pearl.
<item name=hell:shroom_head width=100> <item name=hell:shroom_stem width=100>

<my_h2><b>Cultivating Mushrooms</b></my_h2>
We can get more mushrooms using Dirty Hell Rack:
1. Search a dark place (light level <= 7) and, if necessary, place Hell Rack with air above it
  <img name=hell_rack.png width=100>
2. Right click with Cooked Blood onto the Hell Rack to turn it into Dirty Hell Rack
  <item name=hell:hotbed width=100> <img name=hell_rack.png^hell_rack_soil.png width=100>
3. Right click onto the Dirty Hell Rack with a Nether mushroom head to add some spores
  <item name=hell:shroom_head width=100> <img name=hell_rack.png^hell_rack_soil.png width=100>
4. Wait
5. Dig the Nether mushroom which grew after some time to make place for another one. After some time new spores need to be added (step 3).
  <img name=caverealms_nether_shroom_side.png width=100>
  <img name=hell_rack.png^hell_rack_soil.png width=100>
]]},

	{"Blood Structures",
[[We can find blood structures on the ground and dig their nodes with the bare hand. They contain four kinds of nodes: Hell Blood Stem, Hell Blood, Hell Blood Head, and Hell Fruit.
<item name=hell:blood_stem width=100> <item name=hell:blood width=100> <item name=hell:fruit width=100>
We can craft four Hell Blood Wood nodes with the stem.
<item name=hell:blood_wood width=100>
The four red blood nodes can be cooked in a furnace and, except Hell Blood Wood, their blood can be extracted with a Hell Blood Extractor.

<my_h2><b>Hell Fruit</b></my_h2>
<item name=hell:fruit width=100>
Eating a Hell Fruit decreases life but it might work against hunger and give us blood:
<item name=hell:blood_extracted width=100>
If we eat it at the right place inside a portal, we will teleport instead of getting blood.
If we drop it without holding the fast key, we can split it into its fruit and leaf:
<item name=hell:fruit_leaf width=100> <item name=hell:fruit_no_leaf width=100>
We can craft a fruit leave block out of 9 fruit leaves
The fruit can be used to craft a Hell Pearl.
<item name=hell:fruit_leaves width=100>
A fruit leaves block

<my_h2><b>Cultivating Blood Structures</b></my_h2>
If we dig a Hell vine we get a Hell Blood Child. If this sapling is put in a dark place (light level <= 3) on top of a Hell Blood Head node, it grows into a new blood structure after some time.
<img name=hell_sapling.png width=100>
<img name=hell_blood.png^hell_blood_side.png width=100>
]]},

	{"Tools",
[[We can craft five kinds of tools in hell, which (except the Nether Mushroom Pickaxe) require sticks to be crafted. To obtain Hell Sticks we can use the Hell Blood Extractor.

<my_h2><b>Nether Mushroom Pickaxe</b></my_h2>
<item name=hell:pick_mushroom width=100>
Strength: 1
This pickaxe needs mushroom stems and heads to be crafted.

<my_h2><b>Hell Wood Pickaxe</b></my_h2>
<item name=hell:pick_wood width=100>
Strength: 2
This pickaxe can be crafted with Cooked Hell Blood Wood.

<my_h2><b>Hell Rack Tools</b></my_h2>
<item name=hell:axe_rack width=100> <item name=hell:shovel_rack width=100> <item name=hell:sword_rack width=100> <item name=hell:pick_rack width=100>
Strength: 3
The red Hell Rack tools can be crafted with usual Hell Rack.

<my_h2><b>Faster Tools</b></my_h2>
<item name=hell:axe_rack_blue width=100> <item name=hell:shovel_rack_blue width=100> <item name=hell:sword_rack_blue width=100> <item name=hell:pick_rack_blue width=100>
Strength: 3
The blue Hell Rack tools can be crafted with Blue Hell Rack.

<item name=hell:axe_white width=100> <item name=hell:shovel_white width=100> <item name=hell:sword_white width=100> <item name=hell:pick_white width=100>
Strength: 3
The Siwtonic tools can be crafted with the Siwtonic block.
]]},

	{"Cooking",
[[To get a furnace we need to dig at least 8 Hell Rack Bricks. They can be found at pyramid-like constructions and require at least a strength 1 hell pickaxe to be dug.
To begin cooking things, we can use a mushroom or fruit to power a furnace. After that it is recommended to use cooked blood nodes.

<my_h2><b>Craft Recipe</b></my_h2>
To craft the furnace, we can use the hell rack bricks like cobble:
<item name=hell:rack_brick width=100> <item name=hell:rack_brick width=100> <item name=hell:rack_brick width=100>
<item name=hell:rack_brick width=100> <img name=_transparent.png width=100> <item name=hell:rack_brick width=100>
<item name=hell:rack_brick width=100> <item name=hell:rack_brick width=100> <item name=hell:rack_brick width=100>

<my_h2><b>Cooking Outputs</b></my_h2>
Some hell items can be cooked, for example the Blood Structure's nodes.
<item name=hell:blood_stem_cooked width=100> <item name=hell:blood_cooked width=100> <item name=hell:blood_top_cooked width=100> <item name=hell:wood_cooked width=100>
Other cookable items are Blood and an item to get a Hell Pearl.
<item name=hell:hotbed width=100> <item name=hell:pearl width=100>
]]},

	{"Hell Blood Extractor",
[[With this extractor we can separate Blood from the Blood Structure's nodes. An alternative way to get Blood is to eat Hell Fruits. The Hell Blood Extractor enables us to obtain a Hell Blood Stem Extracted, which we can craft to (empty) Hell Wood and then to Hell Sticks.

<my_h2><b>Craft Recipe</b></my_h2>
We can craft the Hell Blood Extractor as follows:
<item name=hell:rack_brick width=100> <item name=hell:blood_top_cooked width=100> <item name=hell:rack_brick width=100>
<item name=hell:blood_cooked width=100> <item name=hell:shroom_stem width=100> <item name=hell:blood_cooked width=100> <img name=blank.png width=100> <item name=hell:extractor width=100>
<item name=hell:rack_brick width=100> <item name=hell:blood_stem_cooked width=100> <item name=hell:rack_brick width=100>

<my_h2><b>Usage</b></my_h2>
We can feed the extractor with Blood to make it separate Blood from neighbouring nodes:
1. Place the Hell Blood Extractor somewhere
2. Place four or fewer Blood Structure's nodes next to it. Example viewed from the top:
<img name=blank.png width=100> <img name=hell_blood_stem_top.png width=100> <img name=blank.png width=100>
<img name=hell_blood.png width=100> <img name=hell_blood_extractor.png width=100> <img name=hell_blood.png width=100>
<img name=blank.png width=100> <img name=hell_blood.png width=100> <img name=blank.png width=100>
3. Right click the extractor with Blood to power it
<img name=blank.png width=100> <img name=hell_blood_stem_top_empty.png width=100> <img name=blank.png width=100>
<img name=hell_blood_empty.png width=100> <img name=hell_blood_extractor.png width=100> <img name=hell_blood_empty.png width=100>
<img name=blank.png width=100> <img name=hell_blood_empty.png width=100> <img name=blank.png width=100>
4. Take the new extracted blood and dig the extracted nodes
]]},

	{"Ores and Bricks",
[[Digging ores requires a pickaxe from hell of a sufficient strength. Pickaxes from the overworld do not work in general.

<my_h2><b>Strength 1</b></my_h2>
<item name=glow:stone width=100>
The Glowing stone can be dug with pickaxes from the overworld or a pickaxe from hell with a strenght of least one. We can find it in hell's and hell forest's ceiling and use it for lighting.

<my_h2><b>Strength 2</b></my_h2>
<item name=hell:rack width=100> <item name=hell:rack_tiled width=100> <item name=hell:rack_black width=100>
The (red) Hell Rack is generated like stone, Tiled Hell Rack is generated like coal ore and the Black Hell Rack is generated like gravel.

<my_h2><b>Strength 3</b></my_h2>
<item name=hell:rack_blue width=100> <item name=hell:white width=100>
The Blue Hell Rack is generated like diamond ore and the Siwtonic block is generated like mese blocks.

<my_h2><b>Bricks</b></my_h2>
There are three types of Bricks: red, Blue, and Black Hell Rack Brick. We can craft them from the corresponding Hell Rack nodes and additionally, the (red) Hell Rack Brick is generated in pyramid-like structures in hell. In comparison to the Hell Rack nodes, all three Bricks can be dug with a pickaxe with strength 1.
<item name=hell:rack_brick width=100> <item name=hell:rack_brick_blue width=100> <item name=hell:rack_brick_black width=100>
]]},

	{"Hell Vines",
[[Hell vines are at the ceiling of hell and can be dug by hand. They drop Hell Blood Child nodes, from which we can grow Blood Structures. By feeding Blood to a Hell vine with air beneath it, it grows one node.
<item name=hell:vine width=100>
]]},

	{"Portals",
[[This hell mod supports two types of portals: the well-known Minecraft-like one made of Obsidian, and a portal which is specific to this mod. The Obsidian portal allows us to reach hell from the overworld, but it is one-way and kills us.

<my_h2><b>Build Instructions</b></my_h2>
A hell portal requires the following nodes:
<item name=hell:wood_empty width=100> <item name=hell:rack_black width=100> <item name=hell:rack_brick_blue width=100> <item name=hell:rack width=100>  <item name=hell:blood_cooked width=100> <item name=hell:fruit width=100> <item name=hell:white width=100>
* 25 Empty Hell Wood (height 5-6)
* 16 Black Hell Rack (height 1)
* 12 Blue Hell Rack Bricks (height 2-4)
* 8 (red) Hell Rack (height 1)
* 8 Cooked Hell Blood (height 5)
* 4 Hell Fruits (height 4)
* 2 Siwtonic blocks (height 1 and 5)

The heights in parenthesis correspond to the relative vertical positions of the nodes. When built, the portal should look approximately like this one:
<img name=hell_teleporter.png width=600>

<my_h2><b>Usage</b></my_h2>
Before using the portal the first time, we may want to fill our inventory with enough items so that we can build a second portal on the overworld to get back.
We can activate the portal as follows:
1. Stand in the middle on the Siwtonic block
2. Eat a Hell Fruit. If the portal was built correctly, we can hear a special sound and are teleported to the overworld.

If two portals in hell and overworld have the same X and Z coordinates, they teleport us to the centre, i.e. onto the Siwtonic block, of the opposite portal when eating a Hell Fruit.
]]},

	{"Pearls",
[[The hell pearl can be used to teleport by throwing it.

<my_h2><b>Craft Recipe</b></my_h2>
First, we need to craft two Nether Mushroom Heads and a Hell Fruit Without Leaf together as follows:
<item name=hell:shroom_head width=100>
<item name=hell:fruit_no_leaf width=100>
<item name=hell:shroom_head width=100>
This gives us the Hell Fruit in Mushroom (FIM), which we can cook in a furnace to obtain a Hell Pearl.
<item name=hell:fim width=100> <item name=hell:pearl width=100>
]]},

	{"Hell Forest",
[[The hell forest is generated in caves above hell and contains decorative plants.

<my_h2><b>Grass and Flower</b></my_h2>
<item name=hell:grass_big width=100> <item name=hell:grass_middle width=100> <item name=hell:grass_small width=100>
We can craft the Hell Grass item to another grass item, which can be cooked to get Dried Hell Grass. We can then craft this dried grass to paper.

<item name=hell:glowflower width=100>
The Glowing Flower can be used for lighting and decoration.

<my_h2><b>Hell Tree</b></my_h2>
<item name=hell:tree width=100>
Hell trunks can be found at Hell Trees and be crafted into Hell Wood Blocks via Hell Wood Planks. Furthermore, the Hell Tree Saplings grow even in the overworld if they have Hell Dirt beneath them.
]]}
}

-- The guide formspecs
local guide_forms = {}

-- Convert the guide content to formspecs
for n,data in ipairs(guide_infos) do
	local title, html_content = data[1], data[2]
	--~ local html_text = "<global background=#242424 size=24><tag name=my_h1 size=35>" ..
	local html_text = "<global size=24><tag name=my_h1 size=35>" ..
		"<tag name=my_h2 size=30>" ..
		"<my_h1><b><center>" .. title .. "</b></center></my_h1>\n" ..
		html_content
	local spec_width = 16
	local spec_height = 16
	local html_padding = 0.5
	local form = ("formspec_version[4]size[%g,%g;]" ..
			"hypertext[%g,%g;%g,%g;html;%s]button[%g,%g;2,0.8;quit;Back]"
		):format(
		spec_width, spec_height,
		html_padding, html_padding,
		spec_width - 2 * html_padding, spec_height - 1 - 2 * html_padding,
		core.formspec_escape(html_text),
		0.5 * spec_width - 1, spec_height - 1)

	guide_forms[n] = {title, form}
end

local title_to_index = {}
for n, i in ipairs(guide_forms) do
	title_to_index[i[1]] = n
end

-- Create the contents formspec
guide_forms.contents = "formspec_version[4]size[6," .. (#guide_infos) + 2 ..
	";]label[2,0.8;Contents:]"
for i, data in ipairs(guide_forms) do
	local desc = data[1]
	local y = i + 0.5 + 0.1
	guide_forms.contents = guide_forms.contents ..
		"button[0.5," .. y .. ";5,0.8;name;" .. desc .. "]"
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "hell_guide_contents" then
		local fname = fields.name
		local pname = player:get_player_name()
		if fname
		and pname then
			core.show_formspec(pname, "hell_guide",
				guide_forms[title_to_index[fname]][2])
		end
	elseif formname == "hell_guide" then
		local fname = fields.quit
		local pname = player:get_player_name()
		if fname
		and pname then
			core.show_formspec(pname, "hell_guide_contents",
				guide_forms["contents"])
		end
	end
end)

core.register_chatcommand("hell_help", {
	params = "",
	description = "Shows a hell guide",
	func = function(name)
		local player = core.get_player_by_name(name)
		if not player then
			return false, "Something went wrong."
		end
		if not hell.overworld_help and player:get_pos().y > hell.start then
			return false, "Usually you don't neet this guide here. " ..
				"You can view it in hell."
		end
		core.chat_send_player(name, "Showing guide...")
		-- Show the Contents (overview) page
		core.show_formspec(name, "hell_guide_contents",
			guide_forms["contents"])
		return true
	end
})

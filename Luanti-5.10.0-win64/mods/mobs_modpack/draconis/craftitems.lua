
core.register_craftitem("draconis:dragon_staff", {
	description = ("Dragon Staff"),
	inventory_image = "draconis_dragon_staff.png",
	stack_max = 1,
})

local page1n2 = "size[13,9]"..
"background[-2,-.65;16.9,10.4;draconis_bestiary_gui.png]"..
	"image[-.6,-.5;7.6,4.1;draconis_fire_wyvern_image.png]"..
	"image[4.1,1.8;2.4,2.4;draconis_fire_egg.png]"..
"label[1.9,2.1;Fire Wyvern]"..
"label[1.7,2.4;Draconis verignis]"..
"label[-.1,2.8;Temperment of first three: Aggressive]"..
"label[-.1,3.1;Health: 417,  Speed: 8]"..
"label[-.1,3.4;Bite Damage: 28,  Fire Damage: 10-30]"..
"label[-.1,3.7;Habitat: High Mountains]"..
	"image[6.92,-.5;7.6,4.1;draconis_ice_wyvern_image.png]"..
	"image[11.5,1.8;2.4,2.4;draconis_ice_egg.png]"..
"label[9.3,2.1;Ice Wyvern]"..
"label[9.1,2.4;Draconis pruibestia]"..
"label[7.2,2.8;Taming of all four: Imprint]"..
"label[7.2,3.1;Health: 394,  Speed: 9]"..
"label[7.2,3.4;Bite Damage: 24,  Ice Damage: ?]"..
"label[7.2,3.7;Habitat: High Snowy Mountains]"..
	"image[-.6,4;7.6,4.1;draconis_fire_dragon_image.png]"..
	"image[4.1,6.3;2.4,2.4;draconis_fire_egg2.png]"..
"label[1.9,6.7;Fire Dragon]"..
"label[1.7,7;Draconis verignus rex]"..
"label[-.1,7.7;Health: 582,  Speed: 5]"..
"label[-.1,8;Bite Damage: 34,  Ice Damage: 8-40]"..
"label[-.1,8.3;Habitat: High Mountains]"..
	"image[6.92,4.05;7.6,4.1;draconis_jungle_wyvern_image.png]"..
	"image[11.5,6.3;2.4,2.4;draconis_jungle_egg.png]"..
"label[9.3,6.7;Jungle Wyvern]"..
"label[9.1,7;Draconis lacordyla]"..
"label[7.2,7.4;Temperment: Aggressive to players]"..
"label[7.2,7.7;Health: 41, Speed: 8]"..
"label[7.2,8;Bite Damage: 7]"..
"label[7.2,8.3;Habitat: Jungle,  Prefered Food: Cocoa Beans]"

core.register_craftitem("draconis:bestiary", {
	description = "Bestiary",
	inventory_image = "draconis_bestiary.png",
	groups = {book=1},
	on_use = function(_, user)
		core.show_formspec(user:get_player_name(), "draconis:bestiary_page", page1n2)
	end,
})

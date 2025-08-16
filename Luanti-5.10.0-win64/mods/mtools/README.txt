The potion pot brews its contents without fire, so there is no need to light one underneath.

Need some slime? try scraping it out of an empty cauldron with a glass jar.

Extra energy or Chi equivalence for consumption or damage is about 10 to 6 = one heart and 5 to 1 = half a heart, values greater than 10 = 15 or one heart and a half.

--Potions by Traxie21--

--API DOCUMENTATION--

Potion Registering Format:

traxie21s.register_potion(NAME, COLOR, EXPIRE TIME, ACTIVATION FUNCTION, EXPIRE FUNCTION)

NAME: Name of potion. Invalid characeters are automagically stripped from it.

COLOR: Color of potion image in-game, available colors: black, brown, cyan, darkblue, darkgrey, lightgrey, darkred, dull, green, orange, pink, purple, red, white, and yellow.

EXPIRE TIME: Number in seconds.

ACTIVATION FUNCTION: The function that is run when the ground is right-clicked with the potion.

EXPIRE FUNCTION: The function that is run when the expire time runs out.


--EXAMPLE--

traxie21s.register_potion("Anti Gravity", "purple", 60,
function(itemstack, user, pointd) 
	user:set_physics_override({speed = 3, jump = 1.5, gravity = .5})
	core.chat_send_player(user:get_player_name(), "You have been blessed with Anti Gravity for 60 seconds!")
end,

function(itemstack, user, pointd)
	user:set_physics_override({speed = 1, jump = 1, gravity = 1})
	core.chat_send_player(user:get_player_name(), "Anti Gravity has worn off.")
end)
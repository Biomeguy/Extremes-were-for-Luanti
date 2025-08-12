# Chi [chi]

* Version: 1.3.1
* Note: This mod uses semantic versioning, as defined by version 2.0.0 of the SemVer standard. See: <http://semver.org/>

## Description
This mod adds basic support for chi to Luanti.

Each player will have an additional attribute: Chi. To be precise:

* Current chi reserves: How much chi the player currently has
* Maximum possible chi: How much chi the player can have at maximum
* Chi regeneration amont: How much chi will be generated each “chi tick” (default 0.2 seconds)

By default, each player spawns with 0/200 chi, and regenerates 1 chi per fifth of a second. All
these values can be configured with the server settings (`minetest.conf`) and it is highly advised to do
so if you plan to integrate this mod into a game.

The chi regeneration rate (the “chi tick”) is a global setting and is *not* configured on a
per-player basis.

The mod provides a simple API to set, get, add and subtract the chi (and maximum) chi of any player, and
for setting the regeneration amount. Note that this mod itself does *not* change the gameplay in a meaningful
way. You should install other mods which use the Chi mod as a dependency.

The API documentation is in the file `API.md`.

If the mod “HUD bars” [`hudbars`] is installed, a blue bar will be added to the HUD showing the player's chi reserves.

Otherwise, the chi is just shown as text.

## Configuration

This mod can be configured with minetest.conf! The following settings are accepted:

* `chi_default_max`: Initial max. chi given to new players. Default: `200`. This value must be non-negative.
* `chi_default_regen`: Initial regenerated chi per “chi tick”. Default: `1`. This value can be a floating value. I.e. if the value is `0.5`, 1 chi is generated every two chi ticks (note that the player's chi amount is still a whole number). This value can be negative, in which case the player will lose chi.
* `chi_regen_timer`: The length of a “chi tick” in seconds. Each player will get his/her chi increased by the current
  regen value per chi tick. Default: `0.2`. This value must be positive, also try to avoid very small values
  as those could probably stress your machine a lot.

License information
===================
* `textures/chi_icon.png`: [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/) by [Buch](http://opengameart.org/users/Buch).
* `textures/chi_bgicon.png`: CC BY 3.0, originally by Buch, modified by Wuzzy.
* `textures/chi_bar.png`: [MIT License](https://opensource.org/licenses/MIT) by Wuzzy.
* Everything else: MIT License.

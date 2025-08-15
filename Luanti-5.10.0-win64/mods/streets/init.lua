
--	## StreetsMod 2.0 ##

-- Register a global streets namespace to operate in
streets = {}

-- Config stuff goes here
streets.conf = {
	version = "2.0",
	licenseCode = "MIT License",
	licenseMedia = "CC-BY-SA 3.0",
}

-- The API collects some data here
streets.surfaces = { surfacetypes = {} }

local path = core.get_modpath("streets")

dofile(path .. "/api.lua")
dofile(path .. "/nodes.lua")
dofile(path .. "/api_register_all.lua")

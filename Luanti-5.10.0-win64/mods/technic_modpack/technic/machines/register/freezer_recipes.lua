
local S = technic.getter

technic.register_recipe_type("freezing", { description = S("Freezing") })

function technic.register_freezer_recipe(data)
	data.time = data.time or 5
	technic.register_recipe("freezing", data)
end

local recipes = {
	{"bucket:clay_bucket_water", {"default:ice", "bucket:clay_bucket_empty"}},
	{"bucket:clay_bucket_fresh_water", {"default:ice", "bucket:clay_bucket_empty"}},
	{"bucket:wooden_bucket_water", {"default:ice", "bucket:wooden_bucket_empty"}},
	{"bucket:wooden_bucket_fresh_water", {"default:ice", "bucket:wooden_bucket_empty"}},
	{"bucket:bucket_water", {"default:ice", "bucket:bucket_empty"}},
	{"bucket:bucket_fresh_water", {"default:ice", "bucket:bucket_empty"}},
	{"default:dirt", "default:dirt_with_snow"},
	{"bucket:bucket_lava", {"default:obsidian", "bucket:bucket_empty"}}
}

for _, data in pairs(recipes) do
	technic.register_freezer_recipe({input = {data[1]}, output = data[2]})
end

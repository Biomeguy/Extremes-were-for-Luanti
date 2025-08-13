
local function mapfix(minp, maxp)
	local vm = core.get_voxel_manip(minp, maxp)
	vm:write_to_map()
	vm:update_liquids()
	vm:update_map()
end

local previous = os.time()

local default_size = tonumber(core.settings:get("mapfix_default_size")) or 40
local max_size = tonumber(core.settings:get("mapfix_max_size")) or 50
local delay = tonumber(core.settings:get("mapfix_delay")) or 15

core.register_chatcommand("mapfix", {
	params = "<size>",
	description = "Recalculate the flowing liquids and the light of a chunk",
	func = function(name, param)
		local pos = core.get_player_by_name(name):get_pos()
		local size = tonumber(param) or default_size
		local privs = core.check_player_privs(name, {server=true})
		local time = os.time()

		if not privs then
			if size > max_size then
				return false, "You need the server privilege to exceed the radius of ".. max_size .." blocks"
			elseif time - previous < delay then
				return false, "Wait at least ".. delay .." seconds from the previous \"/mapfix\"."
			end
			previous = time
		end

		local minp = vector.round(vector.subtract(pos, size - .5))
		local maxp = vector.round(vector.add(pos, size + .5))

		core.log("action", name .." uses mapfix at ".. core.pos_to_string(vector.round(pos)) .." with radius ".. size)
		mapfix(minp, maxp)
		return true, "Done."
	end,
})
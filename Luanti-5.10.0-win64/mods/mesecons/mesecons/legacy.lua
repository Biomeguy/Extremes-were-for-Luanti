-- Un-forceload any forceloaded mapblocks from older versions of Mesecons which
-- used forceloading instead of VoxelManipulators.
local BLOCKSIZE = 16

-- convert block hash --> node position
local function unhash_blockpos(hash)
	return vector.multiply(core.get_position_from_hash(hash), BLOCKSIZE)
end

local old_forceloaded_blocks = mesecon.file2table("mesecon_forceloaded")
for hash, _ in pairs(old_forceloaded_blocks) do
	core.forceload_free_block(unhash_blockpos(hash))
end
os.remove(core.get_worldpath()..DIR_DELIM.."mesecon_forceloaded")

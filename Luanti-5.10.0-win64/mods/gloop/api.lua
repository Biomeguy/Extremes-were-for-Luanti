function gloop.set_tool_recipe(modname, type, material, name)
	if type == "sword" then
		core.register_craft({
			recipe = {{material},{material},{"default:stick"}},
			output = modname..":sword_"..name,
		})
	end
	if type == "axe" then
		core.register_craft({
			recipe = {{material, material}, {material, "default:stick"}, {"","default:stick"}},
			output = modname..":axe_"..name,
		})
	end
	if type == "pick" or type == "pickaxe" then
		core.register_craft({
			recipe = {{material, material, material}, {"","default:stick",""}, {"","default:stick",""}},
			output = modname..":pick_"..name,
		})
	end
	if type == "shovel" then
		core.register_craft({
			recipe = {{material},{"default:stick"},{"default:stick"}},
			output = modname..":shovel_"..name,
		})
	end
	if type == "handsaw" then
		core.register_craft({
			recipe = {{material, "default:stick"},{material, "default:stick"},{"", "default:stick"}},
			output = modname..":handsaw_"..name,
		})
	end
	if type == "hammer" then
		core.register_craft({
			recipe = {{material, "default:stick", material}, {material, "default:stick", material}, {"", "default:stick", ""}},
			output = modname..":hammer_"..name,
		})
	end
end

function gloop.register_ore(modname, name, desc, uses)
	if uses.block ~= nil and uses.block.makes ~= false then
		core.register_node(modname..":"..name.."_block", {
			description = desc.." Block",
			tiles = {uses.block.texture},
			is_ground_content = false,
			light_source = uses.block.light or 0,
			groups = uses.block.groups,
			sounds = uses.block.sounds
		})
		if uses.block.fromingots == true and uses.ingot ~= nil then
			core.register_craft({
				output = modname..":"..name.."_block",
				recipe = {
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"},
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"},
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"}
				}
			})
			core.register_craft({
				output = modname..":"..name.."_ingot 9",
				recipe = {
					{modname..":"..name.."_block"}
				}
			})
		end
	end
	if uses.ore ~= nil and uses.ore.makes ~= false then
local ore_texture
	if name == "talinite" then
ore_texture = {"default_stone.png^[colorize:black:8^gloop_mineral_talinite.png", "default_stone.png^[colorize:black:144^gloop_mineral_talinite.png",
	"default_stone.png^[colorize:black:87^gloop_mineral_talinite.png", "default_stone.png^[colorize:black:87^gloop_mineral_talinite.png",
	"default_stone.png^[colorize:black:52^gloop_mineral_talinite.png"}
	else
ore_texture = {uses.ore.texture.base.."^"..uses.ore.texture.overlay}
	end
		core.register_node(modname..":mineral_"..name, {
			description = desc.." Ore",
			tiles = ore_texture,
			drop = uses.ore.drop,
			light_source = uses.ore.light or 0,
			groups = uses.ore.groups,
			sounds = uses.ore.sounds
		})
		core.register_ore({
			ore_type       = "scatter",
			ore            = modname..":mineral_"..name,
			wherein        = uses.ore.generate.generate_inside_of,
			clust_scarcity = uses.ore.generate.chunks_per_mapblock,
			clust_num_ores = uses.ore.generate.max_blocks_per_chunk,
			clust_size     = uses.ore.generate.chunk_size,
			y_max     = uses.ore.generate.maxy,
			y_min     = uses.ore.generate.miny,
		})
	end
	if uses.lump ~= nil and uses.lump.makes ~= false then
		core.register_craftitem(modname..":"..name.."_"..uses.lump.name, {
			description = desc.." "..uses.lump.desc,
			inventory_image = uses.lump.texture,
		})
	end
	if uses.ingot ~= nil and uses.ingot.makes ~= false then
		core.register_craftitem(modname..":"..name.."_ingot", {
			description = desc.." Ingot",
			inventory_image = uses.ingot.texture,
		})
		if uses.ingot.smeltrecipe == true and uses.lump ~= nil then
			core.register_craft({
				type = "cooking",
				output = modname..":"..name.."_ingot",
				recipe = modname..":"..name.."_"..uses.lump.name,
			})
		end
	end
	if uses.tools ~= nil and uses.tools.make ~= nil then
		if uses.tools.make.sword == true then
			core.register_tool(modname..":sword_"..name, {
				description = desc.." Sword",
				inventory_image = uses.tools.texture.sword,
				tool_capabilities = uses.tools.caps.sword,
			})
			gloop.set_tool_recipe(modname,"sword",modname..":"..name.."_ingot",name)
		end
		if uses.tools.make.axe == true then
			core.register_tool(modname..":axe_"..name, {
				description = desc.." Axe",
				inventory_image = uses.tools.texture.axe,
				tool_capabilities = uses.tools.caps.axe,
			})
			gloop.set_tool_recipe(modname,"axe",modname..":"..name.."_ingot",name)
		end
		if uses.tools.make.pick == true then
			core.register_tool(modname..":pick_"..name, {
				description = desc.." Pickaxe",
				inventory_image = uses.tools.texture.pick,
				tool_capabilities = uses.tools.caps.pick,
			})
			gloop.set_tool_recipe(modname,"pick",modname..":"..name.."_ingot",name)
		end
		if uses.tools.make.shovel == true then
			core.register_tool(modname..":shovel_"..name, {
				description = desc.." Shovel",
				inventory_image = uses.tools.texture.shovel,
				wield_image = uses.tools.texture.shovel.."^[transformFX",
				tool_capabilities = uses.tools.caps.shovel,
			})
			gloop.set_tool_recipe(modname,"shovel",modname..":"..name.."_ingot",name)
		end
	end
end

function gloop.register_tools(modname, name, desc, material, uses)
	if uses.handsaw ~= nil and uses.handsaw.makes ~= false then
		core.register_tool(modname..":handsaw_"..name, {
			description = desc.." Handsaw",
			inventory_image = uses.handsaw.texture,
			tool_capabilities = uses.handsaw.caps,
		})
		gloop.set_tool_recipe(modname,"handsaw",material,name)
	end
	if uses.hammer ~= nil and uses.hammer.makes ~= false then
		core.register_tool(modname..":hammer_"..name, {
			description = desc.." Hammer",
			inventory_image = uses.hammer.texture,
			tool_capabilities = uses.hammer.caps,
		})
		gloop.set_tool_recipe(modname,"hammer",material,name)
	end
	if uses.sword ~= nil and uses.sword.makes ~= false then
		core.register_tool(modname..":sword_"..name, {
			description = desc.." Sword",
			inventory_image = uses.sword.texture,
			tool_capabilities = uses.sword.caps,
		})
		gloop.set_tool_recipe(modname,"sword",material,name)
	end
	if uses.axe ~= nil and uses.axe.makes ~= false then
		core.register_tool(modname..":axe_"..name, {
			description = desc.." Axe",
			inventory_image = uses.axe.texture,
			tool_capabilities = uses.axe.caps,
		})
		gloop.set_tool_recipe(modname,"axe",material,name)
	end
	if uses.pick ~= nil and uses.pick.makes ~= false then
		core.register_tool(modname..":pick_"..name, {
			description = desc.." Pickaxe",
			inventory_image = uses.pick.texture,
			tool_capabilities = uses.pick.caps,
		})
		gloop.set_tool_recipe(modname,"pick",material,name)
	end
	if uses.shovel ~= nil and uses.shovel.makes ~= false then
		core.register_tool(modname..":shovel_"..name, {
			description = desc.." Shovel",
			inventory_image = uses.shovel.texture,
			wield_image = uses.shovel.texture.."^[transformFX",
			tool_capabilities = uses.shovel.caps,
		})
		gloop.set_tool_recipe(modname,"shovel",material,name)
	end
end
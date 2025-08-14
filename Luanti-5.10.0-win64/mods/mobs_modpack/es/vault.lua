es.chest = {}

function es.chest.get_es_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[20,12]" ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;20,7;]" ..
		"list[current_player;main;6,7.85;8,1;]" ..
		"list[current_player;main;6,9.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(6,7.85)
	return formspec
end

function es.chest.register_chest(name, d)
	local def = table.copy(d)
	def.paramtype2 = "facedir"
	def.legacy_facedir_simple = true
	def.is_ground_content = false

	if def.protected then
		def.on_construct = function(pos)
			local meta = core.get_meta(pos)
			meta:set_string("infotext", "Locked Super ESM Chest")
			meta:set_string("owner", "")
			local inv = meta:get_inventory()
			inv:set_size("main", 20*7)
		end
		def.after_place_node = function(pos, placer)
			local meta = core.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", "Locked Super ESM Chest (owned by " ..
					meta:get_string("owner") .. ")")
		end
		def.can_dig = function(pos,player)
			local meta = core.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:is_empty("main") and
					default.can_interact_with_node(player, pos)
		end
		def.allow_metadata_inventory_move = function(pos, from_list, from_index,
				to_list, to_index, count, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return count
		end
		def.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.on_rightclick = function(pos, node, clicker, itemstack, pointd)
			if not default.can_interact_with_node(clicker, pos) then
				return itemstack
			end
			core.after(0.2, core.show_formspec,
					clicker:get_player_name(),
					"es:chest", es.chest.get_es_chest_formspec(pos))
		end
		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local secret = core.get_meta(pos):get_string("key_lock_secret")
			local itemstack = player:get_wielded_item()
			local key_meta = itemstack:get_meta()

			if itemstack:get_meta():get_string("") == "" then
				return
			end

			if key_meta:get_string("secret") == "" then
				key_meta:set_string("secret", core.parse_json(itemstack:get_meta():get_string("")).secret)
				itemstack:get_meta():set_string("", "")
			end

			if secret ~= key_meta:get_string("secret") then
				return
			end

			core.show_formspec(
				player:get_player_name(),
				"es:vault",
				es.chest.get_es_chest_formspec(pos)
			)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			local meta = core.get_meta(pos)
			local owner = meta:get_string("owner")
			local pn = player:get_player_name()

			-- verify placer is owner of lockable chest
			if owner ~= pn then
				core.record_protection_violation(pos, pn)
				core.chat_send_player(pn, "You do not own this chest.")
				player:set_hp(1)
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, "a locked chest", owner
		end
	else
		def.on_construct = function(pos)
			local meta = core.get_meta(pos)
			meta:set_string("infotext", "Super ESM Chest")
			local inv = meta:get_inventory()
			inv:set_size("main", 20*7)
		end
		def.can_dig = function(pos,player)
			local meta = core.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end
		def.on_rightclick = function(pos, node, clicker)
			core.after(0.2, core.show_formspec,
					clicker:get_player_name(),
					"es:chest", es.chest.get_es_chest_formspec(pos))
		end
		def.on_blast = function(pos)
			local drops = {}
			es.get_inventory_drops(pos, "main", drops)
			drops[#drops+1] = "es:" .. name
			core.remove_node(pos)
			return drops
		end
	end

	def.on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. core.pos_to_string(pos))
	end
	def.on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. core.pos_to_string(pos))
	end
	def.on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. core.pos_to_string(pos))
	end

	local es_chests = table.copy(def)

	for i = 1, #es_chests.tiles do
		if type(es_chests.tiles[i]) == "string" then
			es_chests.tiles[i] = {name = es_chests.tiles[i], backface_culling = true}
		elseif es_chests.tiles[i].backface_culling == nil then
			es_chests.tiles[i].backface_culling = true
		end
	end
	es_chests.drop = "es:" .. name

	core.register_node("es:" .. name, es_chests)
end

es.chest.register_chest("chest", {
	description = "Extreme Chest",
	tiles = {"vault.png", "vault.png", "vault.png", "vault.png",
	"vault.png", "vault.png^[colorize:#00FF00:55"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

es.chest.register_chest("vault", {
	description = "Extreme Locked Chest",
	tiles = {"vault.png", "vault.png", "vault.png", "vault.png",
	"vault.png", "vault.png^[colorize:#00FF00:110"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	protected = true,
})

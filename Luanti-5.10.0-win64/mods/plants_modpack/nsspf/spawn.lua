function place_spore(itemstack, placer, pointd, name, topoint, soilblock)

	local pt = pointd

	-- check if pointing at a node
	if not pt or pt.type ~= "node" then
		return
	end

	local under = core.get_node(pt.under)
	local uu = {x=pt.under.x, y=pt.under.y-1, z=pt.under.z}

	-- return if any of the nodes is not registered
	if not core.registered_nodes[under.name] then
		return
	end

	-- if not protected then add node and remove 1 item from the itemstack
	if not core.is_protected(pt.under, placer:get_player_name()) then
		if (under.name == topoint) and (core.get_node(uu).name == soilblock) then
			core.set_node(uu, {name = name})
			core.sound_play("default_place_node", {pos = uu, gain = 1.0})
			if not core.settings:get_bool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end
end

function nsspf_register_mycorrhizalmycelium (name, descr, trunk, int, ch, spread)

	core.register_node("nsspf:"..name.."_mycelium", {
		description = descr,
		tiles = {"mycorrhizalmycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	core.register_craftitem("nsspf:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointd)
			return place_spore(itemstack, placer, pointd, "nsspf:"..name.."_mycelium",trunk, "default:dirt")
		end,
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {trunk},
		interval = 30*int,
		chance = 200*ch,
		action = function(pos, node)
			local flag = 0
				for dx = -2,2 do
					for dy = -2,1 do
						for dz = -2,2 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = 1
								return
							end
						end
					end
				end
			--if no other mycelium have been found:
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			core.set_node(pos, {name="nsspf:"..name.."_fungusdirt"})
			core.get_node_timer(pos):start(300)
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_snow"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			core.set_node(pos, {name="default:dirt"})
		end
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 12*int,
		chance = 10*ch,
		action = function(pos, node)
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_grass"},
		interval = 5*int,
		chance = 1*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = core.get_node(pos1).name
			local nn = core.get_node(pos2).name
			if (n== "air" or n=="group:flora") and nn== "default:dirt_with_grass" then
				core.set_node(pos1, {name = "nsspf:"..name})
				core.get_node_timer(pos1):start(300)
			end
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = core.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									core.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "nsspf:"..name.."_fungusdirt"})
									core.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})
end

nsspf_register_mycorrhizalmycelium ('amanita_muscaria','Amanita muscaria Mycelium', "default:pine_trunk", 10, 10, 8)
nsspf_register_mycorrhizalmycelium ('amanita_phalloides','Amanita phalloides Mycelium', "default:pine_trunk", 16, 12, 8)
nsspf_register_mycorrhizalmycelium ('boletus_edulis','Boletus edulis Mycelium', "default:beech_trunk", 10, 10, 8)
nsspf_register_mycorrhizalmycelium ('boletus_satanas','Boletus satanas Mycelium', "default:beech_trunk", 12, 12, 8)
nsspf_register_mycorrhizalmycelium ('boletus_pinophilus','Boletus pinophilus Mycelium', "default:pine_trunk", 12, 12, 8)
nsspf_register_mycorrhizalmycelium ('suillus_grevillei','Suillus grevillei Mycelium','default:pine_trunk', 8, 8, 12)
nsspf_register_mycorrhizalmycelium ('russula_xerampelina','Russula xerampelina Mycelium', "default:pine_trunk", 9, 9, 12)
nsspf_register_mycorrhizalmycelium ('cantharellus_cibarius','Cantherellus cibarius Mycelium', "default:pine_trunk", 8, 8, 14)
nsspf_register_mycorrhizalmycelium ('morchella_conica','Morchella conica Mycelium', "default:aspen_trunk", 10, 10, 8)

--tuber
function nsspf_register_tuber (name, descr, trunk, int, ch, gnam, spread)

	core.register_node("nsspf:"..name.."_tuber_mycelium", {
		description = descr,
		tiles = {"tuber_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {trunk},
		interval = 30*int,
		chance = 300*ch,
		action = function(pos, node)
			local flag = 0
				for dx = -2,2 do
					for dy = -2,1 do
						for dz = -2,2 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = 1
								return
							end
						end
					end
				end
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_tuber_mycelium"})
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_tuber_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action =
		function(pos, node)
			core.set_node(pos, {name="nsspf:"..name.."_fungusdirt"})
			core.get_node_timer(pos):start(300)
		end
	})

	core.register_node("nsspf:"..name.."_fruit", {
		description = descr.." Truffle",
		tiles = {"default_dirt.png"},
		drop = "nsspf:"..name,
		groups = {crumbly = 3, not_in_creative_inventory =1},
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"nsspf:"..name.."_tuber_mycelium"},
		interval = 12*int,
		chance = 6*ch,
		action = function(pos, node)
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_tuber_mycelium"})
		end
	})

	core.register_craftitem("nsspf:"..name, {
		description = descr,
		on_use = core.item_eat(gnam),
		image = name..".png",
	})

	core.register_craftitem("nsspf:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointd)
			return place_spore(itemstack, placer, pointd, "nsspf:"..name.."_tuber_mycelium",trunk, "default:dirt")
		end,
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"nsspf:"..name.."_tuber_mycelium"},
		interval = 12*int,
		chance = 8*ch,
		action = function(pos, node)
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_fruit"})
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_tuber_mycelium"},
		neighbors = {"nsspf:"..name.."_tuber_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = core.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									core.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "nsspf:"..name.."_fungusdirt"})
									core.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})
end

nsspf_register_tuber ("tuber_magnatum_pico","Tuber magnatum pico","default:beech_trunk", 14, 14, 20, 20)
nsspf_register_tuber ("tuber_melanosporum","Tuber melanosporum","default:beech_trunk", 12, 12, 16, 20)
nsspf_register_tuber ("tuber_borchii","Tuber borchii","default:aspen_trunk", 10, 10, 12, 20)
nsspf_register_tuber ("terfezia_arenaria","Terfezia arenaria","default:acacia_trunk", 11, 11, 12, 20)

function nssbf_register_saprotrophicontrees (name, descr, trunk, int, ch)

core.register_abm({
	nodenames = {trunk},
	neighbors = {"air"},
	interval = 20*int,
	chance = 40*ch,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y, z=pos.z-1}
		local n = core.get_node(pos1).name
		if n == 'air' then
			core.set_node({x = pos.x, y = pos.y, z = pos.z-1}, {name = "nsspf:"..name})
			core.get_node_timer(pos):start(300)
		end
	end
})
end

nssbf_register_saprotrophicontrees ('armillaria_mellea', 'Armillaria mellea', 'default:beech_trunk', 16, 24)
nssbf_register_saprotrophicontrees ('panellus_pusillus', 'Panellus pusillus', 'default:beech_trunk', 23, 37)
nssbf_register_saprotrophicontrees ('fomes_fomentarius', 'Fomes fomentarius', 'default:aspen_trunk', 13, 18)
nssbf_register_saprotrophicontrees ('fistulina_hepatica', 'Fistulina hepatica', 'default:pine_trunk', 16, 24)
nssbf_register_saprotrophicontrees ('mycena_chlorophos', 'Mycena clorophos', 'default:dirt', 30, 43)
nssbf_register_saprotrophicontrees ('clitocybula_azurea', 'Clitocybula azurea', 'default:jungle_trunk', 12, 28)
nssbf_register_saprotrophicontrees ('ganoderma_lucidum', 'Ganoderma lucidum', 'default:jungle_trunk', 14, 28)


local OPEN_TIME_START = 0.2
local OPEN_TIME_END = 0.8
local OPEN_CHECK = 10

set_fluo = function (pos)
	if (core.get_node_light(pos) < 10) and ((core.get_timeofday() < 19500) or (core.get_timeofday() > 5000)) then
		core.add_node(pos, { name = "nsspf:mycena_chlorophos_light" })
	else
		core.add_node(pos, { name = "nsspf:mycena_chlorophos" })
	end
end

core.register_abm({
	nodenames = { "nsspf:mycena_chlorophos", "nsspf:mycena_chlorophos_light"},
	interval = OPEN_CHECK,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		set_fluo(pos)
	end
})

set_fluor = function (pos)
	if (core.get_node_light(pos) < 10) and ((core.get_timeofday() < 19500) or (core.get_timeofday() > 5000)) then
		core.env:add_node(pos, { name = "nsspf:panellus_pusillus_light" })
	else
		core.env:add_node(pos, { name = "nsspf:panellus_pusillus" })
	end
end

core.register_abm({
	nodenames = { "nsspf:panellus_pusillus", "nsspf:panellus_pusillus_light" },
	interval = OPEN_CHECK,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		set_fluor(pos)
	end
})


--Saprotrophic fungi that grow on the ground
function nsspf_register_saprotrophicground (name, descr, int, ch, spread)

	core.register_node("nsspf:"..name.."_mycelium", {
		description = descr,
		tiles = {"saprotrophic_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	core.register_craftitem("nsspf:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointd)
			return place_spore(itemstack, placer, pointd, "nsspf:"..name.."_mycelium","default:dirt_with_grass", "default:dirt")
		end,
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_grass"},
		interval = 3*int,
		chance = 1*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = core.get_node(pos1).name
			local nn = core.get_node(pos2).name
			if (n== "air" or n=="group:flora") and nn== "default:dirt_with_grass" then
				core.set_node(pos1, {name = "nsspf:"..name})
				core.get_node_timer(pos1):start(300)
			end
		end
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 6*int,
		chance = 7+ch,
		action = function(pos, node)
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
		end
	})

	core.register_abm({
		nodenames = {"default:dirt_with_grass"},
		neighbors = {"air"},
		interval = 18*int,
		chance = 4500*ch,
		action = function(pos, node)
			local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
			local n = core.get_node(pos3).name
			if n== "default:dirt" then
				core.set_node(pos3, {name = "nsspf:"..name.."_mycelium"})
			end
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"air","default:water_source"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			core.set_node(pos, {name="nsspf:"..name.."_fungusdirt"})
			core.get_node_timer(pos):start(300)
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = core.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									core.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "nsspf:"..name.."_fungusdirt"})
									core.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})
end

nsspf_register_saprotrophicground ('macrolepiota_procera','Macrolepiota procera', 10, 12, 10)
nsspf_register_saprotrophicground ('coprinus_atramentarius','Coprinus atramentarius', 16, 16, 6)
nsspf_register_saprotrophicground ('lycoperdon_pyriforme','Lycoperdon piriforme',10, 10, 8)
nsspf_register_saprotrophicground ('psilocybe_cubensis','Psilocybe cubensis', 20, 16, 12)
nsspf_register_saprotrophicground ('gyromitra_esculenta','Gyromitra esculenta', 12, 14, 8)

--jungle fungi

core.register_abm({
	nodenames = {"default:jungle_trunk"},
	neighbors = {"air"},
	interval = 180.0,
	chance = 600,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.env:get_node(pos1).name
		if n == 'air' then
			core.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "nsspf:marasmius_haematocephalus"})
			core.get_node_timer(pos):start(300)
		end
	end
})


core.register_abm({
	nodenames = {"default:jungle_trunk"},
	neighbors = {"air"},
	interval = 180.0,
	chance = 450,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.env:get_node(pos1).name
		if n == 'air' then
			core.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "nsspf:lentinus_strigosus"})
			core.get_node_timer(pos):start(300)
		end
	end
})

--snowbank fungi
function nsspf_register_snowbankfungi (name, descr, int, ch, spread)

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"air"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			core.set_node(pos, {name="nsspf:"..name.."_fungusdirt"})
			core.get_node_timer(pos):start(300)
		end
	})

	core.register_node("nsspf:"..name.."_mycelium", {
		description = descr,
		tiles = {"snowbank_mycelium.png"},
		groups = {crumbly = 2, not_in_creative_inventory =1},
	})

	core.register_craftitem("nsspf:"..name.."_spores", {
		description = descr.." Spores",
		image = "spores.png",
		on_place = function(itemstack, placer, pointd)
			return place_spore(itemstack, placer, pointd, "nsspf:"..name.."_mycelium","default:dirt_with_snow", "default:dirt")
		end,
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"default:dirt_with_snow"},
		interval = 2*int,
		chance = 3*ch,
		action = function(pos, node)
			local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
			local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
			local n = core.get_node(pos1).name
			local nn = core.get_node(pos2).name
			if (n== "air" or n== "default:snow") and nn== "default:dirt_with_snow" then
				core.set_node(pos1, {name = "nsspf:"..name})
				core.get_node_timer(pos1):start(300)
			end
		end
	})

	core.register_abm({
		nodenames = {"default:dirt_with_snow"},
		neighbors = {"air", "default:snow"},
		interval = 18*int,
		chance = 5500*ch,
		action = function(pos, node)
			local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
			local n = core.get_node(pos3).name
			if n== "default:dirt" then
				core.set_node(pos3, {name = "nsspf:"..name.."_mycelium"})
			end
		end
	})

	core.register_abm({
		nodenames = {"default:dirt"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 12*int,
		chance = 10*ch,
		action = function(pos, node)
			core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
		end
	})

	core.register_abm({
		nodenames = {"nsspf:"..name.."_mycelium"},
		neighbors = {"nsspf:"..name.."_mycelium"},
		interval = 10,
		chance = 1,
		action = function(pos, node)
			local flag = 0
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = core.get_node(pos1).name
							if n and string.match(n,"mycelium") then	-- if the name contains "mycelium" then exit
								flag = flag+1
							end
						end
					end
				end
			if flag > spread then
				for dx = -4,4 do
					for dy = -4,1 do
						for dz = -4,4 do
							local pos2 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local k = core.get_node(pos2).name
								if k and string.match(k,"mycelium") then
									core.set_node({x = pos2.x, y = pos2.y, z = pos2.z}, {name = "nsspf:"..name.."_fungusdirt"})
									core.get_node_timer(pos2):start(300)
								end
						end
					end
				end
			end
		end
	})
end

nsspf_register_snowbankfungi ('plectania_nannfeldtii','Plectania nannfeldtii', 18, 10, 8)
nsspf_register_snowbankfungi ('hygrophorus_goetzii','Hygrophorus goetzii', 16, 10, 6)
nsspf_register_snowbankfungi ('clitocybe_glacialis','Clitocybe glacialis', 15, 10, 6)

core.register_abm({
	nodenames = {"flowers:mushroom_red"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
	end
})

core.register_abm({
	nodenames = {"flowers:mushroom_brown"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		core.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
	end
})
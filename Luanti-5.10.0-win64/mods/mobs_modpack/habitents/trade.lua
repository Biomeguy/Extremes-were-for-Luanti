
local S = core.get_translator("habitents")-- Dummy call

--This code comes almost exclusively from the trader and inventory of mobf, by Sapier.
--The copyright notice below is from mobf:
-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file inventory.lua
--! @brief component containing mob inventory related functions
--! @copyright Sapier
--! @author Sapier
--! @date 2013-01-02
--
--! @defgroup Inventory Inventory subcomponent
--! @brief Component handling mob inventory
--! @ingroup framework_int
--! @{
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

-- This code has been heavily modified by isaiah658.
-- Trades are saved in entity metadata so they always stay the same after
-- initially being chosen.  Also the formspec uses item image buttons instead of
-- inventory slots.

local function add_goods(self, race)

	local trade_index = 1
	local trades_already_added = {}
	local trader_pool_size = 10
	local item_pool_size = #race.items -- get number of items on list

	self.trades = {}

	if item_pool_size < trader_pool_size then
		trader_pool_size = item_pool_size
	end

	for i = 1, trader_pool_size do

		-- If there are more trades than the amount being added, they are
		-- randomly selected.  If they are equal, there is no reason to randomly
		-- select them
		local random_trade = nil

		if item_pool_size == trader_pool_size then
			random_trade = i
		else
			while random_trade == nil do

				local num = math.random(item_pool_size)

				if trades_already_added[num] == nil then
					trades_already_added[num] = true
					random_trade = num
				end
			end
		end

		if math.random(0, 100) > race.items[random_trade][3] then

			self.trades[trade_index] = {
				race.items[random_trade][1],
				race.items[random_trade][2]}

			trade_index = trade_index + 1
		end
	end
end


function mobs_producer(self, clicker, race)

	if not self.id then
		self.id = (math.random(1, 1000) * math.random(1, 10000))
			.. self.name .. (math.random(1, 1000) ^ 2)
	end

	if not self.game_name then

		self.game_name = tostring(race.names[math.random(1, #race.names)])
		self.nametag = S("Producer @1", self.game_name)

		self.object:set_properties({
			nametag = self.nametag,
			nametag_color = "#00FF00"
		})
	end

	if self.trades == nil then
		add_goods(self, race)
	end

	local pname = clicker:get_player_name() or ""

	core.chat_send_player(pname,
		S("[NPC] <Producer @1> Hello, @2, have a look at my wares.",
		self.game_name, pname))

	-- Make formspec trade list
	local formspec_trade_list = ""
	local x, y

	for i = 1, 10 do

		if self.trades[i] and self.trades[i] ~= "" then

			if i < 6 then
				x = 0.5
				y = i - 0.5
			else
				x = 4.5
				y = i - 5.5
			end

			formspec_trade_list = formspec_trade_list
			.. "item_image_button[".. x ..",".. y ..";1,1;"
				.. self.trades[i][2] .. ";prices#".. i .."#".. self.id ..";]"
			.. "item_image_button[".. x + 2 ..",".. y ..";1,1;"
				.. self.trades[i][1] .. ";goods#".. i .."#".. self.id ..";]"
			.. "image[".. x + 1 ..",".. y ..";1,1;gui_arrow_blank.png]"
		end
	end

	core.show_formspec(pname, "habitents:trade", "size[8,10]"
		.. default.gui_bg_img
		.. default.gui_slots
		.. "label[0.5,-0.1;" .. S("Producer @1's stock:", self.game_name) .. "]"
		.. formspec_trade_list
		.. "list[current_player;main;0,6;8,4;]"
	)
end


core.register_on_player_receive_fields(function(player, formname, fields)

	if formname ~= "habitents:trade" then return end

	if fields then

		local trade = ""

		for k, v in pairs(fields) do
			trade = tostring(k)
		end

		local id = trade:split("#")[3]
		local self = nil

		if id ~= nil then

			for k, v in pairs(core.luaentities) do

				if v.object and v.id and v.id == id then
					self = v
					break
				end
			end
		end

		if self ~= nil then

			local trade_number = tonumber(trade:split("#")[2])

			if trade_number ~= nil and self.trades[trade_number] ~= nil then

				local price = self.trades[trade_number][2]
				local goods = self.trades[trade_number][1]
				local inv = player:get_inventory()

				if inv:contains_item("main", price) then

					inv:remove_item("main", price)

					local leftover = inv:add_item("main", goods)

					if leftover:get_count() > 0 then

						-- drop item(s) in front of player
						local droppos = player:get_pos()
						local dir = player:get_look_dir()

						droppos.x = droppos.x + dir.x
						droppos.z = droppos.z + dir.z

						core.add_item(droppos, leftover)
					end
				end
			end
		end
	end
end)

if core.get_modpath("hbhunger") then
habitents.crop_correspondences = {-- Not very realistic if a food producer
	["farming:blackberry_S6"] = "farming:blackberry_S4",
	["farming:blackcurrant_S7"] = "farming:blackcurrant_S5",
	["farming:blueberry_S7"] = "farming:blueberry_S5",
	["farming:carrot_S7"] = "farming:carrot_S1",
	["farming:carrot_S8"] = "farming:carrot_S1",
	["farming:celery_S5"] = "farming:celery_S1",
	["farming:cilantro_S5"] = "farming:cilantro_S1",
	["farming:cucumber_S7"] = "farming:cucumber_S1",
	["farming:gooseberry_S7"] = "farming:gooseberry_S5",
	["farming:gooseberry_S8"] = "farming:gooseberry_S5",
	["farming:grapes_S8"] = "farming:grapes_S1",
	["farming:grapes_S9"] = "farming:grapes_S1",
	["farming:grapes_S10"] = "farming:grapes_S1",
	["farming:grapes_S11"] = "farming:grapes_S1",
	["farming:huckleberry_S6"] = "farming:huckleberry_S3",
	["farming:iceberg_lettuce_S7"] = "farming:iceberg_lettuce_S1",
	["farming:romaine_lettuce_S5"] = "farming:romaine_lettuce_S1",
	["farming:melon_S7"] = "farming:melon_S1",
	["farming:parsley_S5"] = "farming:parsley_S1",
	["farming:raspberry_S6"] = "farming:raspberry_S4",
	["farming:strawberry_10"] = "farming:strawberry_S1",
	["farming:zucchini_S7"] = "farming:zucchini_S1",
	["farming:zucchini_S8"] = "farming:zucchini_S1",
}
end

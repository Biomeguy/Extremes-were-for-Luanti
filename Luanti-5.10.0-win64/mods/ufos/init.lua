
ufos = {}

local UFO_SPEED = 1
local UFO_MAX_SPEED = 10
local UFO_FUEL_USE = .01

ufos.fuel_from_wear = function(wear)
	local fuel
	if wear == 0 then
		fuel = 0
	else
		fuel = (65535-(wear-1))*100/65535
	end
	return fuel
end

ufos.wear_from_fuel = function(fuel)
	local wear = (100-(fuel))*65535/100+1
	if wear > 65535 then wear = 0 end
	return wear
end

ufos.get_fuel = function(self)
	return self.fuel
end

ufos.set_fuel = function(self,fuel)
	self.fuel = fuel
end

ufos.ufo_to_item = function(self)
	local wear = ufos.wear_from_fuel(ufos.get_fuel(self))
	return {name="ufos:ufo",wear=wear}
end

ufos.ufo_from_item = function(itemstack,placer,pointd)
	-- set owner
	ufos.next_owner = placer:get_player_name()
	-- restore the fuel inside the item
	local wear = itemstack:get_wear()
	ufos.set_fuel(ufos.ufo,	ufos.fuel_from_wear(wear))
	-- add the entity
	e = core.add_entity(pointd.above, "ufos:ufo")
	-- remove the item
	itemstack:take_item()
	-- reset owner for next ufo
	ufos.next_owner = ""
end

ufos.check_owner = function(self, clicker)
	if self.owner_name ~= "" and clicker:get_player_name() ~= self.owner_name then
		core.chat_send_player(clicker:get_player_name(), "This UFO is owned by "..self.owner_name.." !")
		return false
	elseif self.owner_name == "" then
		core.chat_send_player(clicker:get_player_name(), "This UFO was not protected, you are now its owner !")
		self.owner_name = clicker:get_player_name()
	end
	return true
end

local function get_v(v)
	return math.sqrt(v.x ^ 2 + v.z ^ 2)
end


ufos.next_owner = ""
ufos.ufo = {
	initial_properties = {
		physical = true,
		collisionbox = {-1.4,0,-1.4, 1.4,2,1.4},
		selectionbox = {-1.2,.1,-1.2, 1.2,.9,1.2},
		visual = "mesh",
		mesh = "ufo.x",
		textures = {"ufo_0.png"},
	},
	driver = nil,
	owner_name = "",
	v = 0,
	removed = false,
	fuel = 0,
	fueli = 0,
	--glow = 7
}

function ufos.ufo:on_rightclick (clicker)
	if not clicker or not clicker:is_player() then return end
	if self.driver and clicker == self.driver then
		self.driver = nil
		clicker:set_detach()
	elseif not self.driver then
		if ufos.check_owner(self,clicker) then
			self.driver = clicker
			clicker:set_attach(self.object, "", {x=0,y=.1,z=0}, {x=0,y=0,z=0})
		end
	end
end

function ufos.ufo:on_activate (staticdata, dtime_s)
	if ufos.next_owner ~= "" then
		self.owner_name = ufos.next_owner
		ufos.next_owner = ""
	else
		local data = staticdata:split(';')
		if data and data[1] and data[2] then
			self.owner_name = data[1]
			self.fuel = tonumber(data[2])
		end
	end
	if self.fuel then
self.object:set_properties({textures = {"ufo_"..math.floor(self.fuel*8/100)..".png"}}) end
	self.object:set_armor_groups({immortal=1})
end

function ufos.ufo:on_punch (puncher)
	if puncher and puncher:is_player() and not self.removed then
		if ufos.check_owner(self,puncher) then
			self.removed = true
			puncher:get_inventory():add_item("main", ufos.ufo_to_item(self))
			self.object:remove()
		end
	end
end

function ufos.ufo:on_step (dtime)
	local fuel = ufos.get_fuel(self)
	if self.driver then
		local ctrl = self.driver:get_player_control()
		local vel = self.object:get_velocity()
		local yaw = self.object:get_yaw()
self.v = get_v(vel) * math.sign(self.v)
	if fuel == nil then fuel = 0 end
		if fuel > 0 and ctrl.up then
			self.v = self.v + dtime * 2.5
			vel.x = - math.sin(yaw)*self.v
			vel.z = math.cos(yaw)*self.v
			fuel = fuel - UFO_FUEL_USE
		else
			vel.x = vel.x*.99
			vel.z = vel.z*.99
		end
		if ctrl.down then
			vel.x = vel.x*.9
			vel.z = vel.z*.9
		end
		if fuel > 0 and ctrl.jump then
			vel.y = vel.y+UFO_SPEED
			fuel = fuel - UFO_FUEL_USE
		elseif fuel > 0 and ctrl.sneak then
			vel.y = vel.y-UFO_SPEED
			fuel = fuel - UFO_FUEL_USE
		else
			vel.y = vel.y*.9
		end
		if vel.x > UFO_MAX_SPEED then vel.x = UFO_MAX_SPEED end
		if vel.x < -UFO_MAX_SPEED then vel.x = -UFO_MAX_SPEED end
		if vel.y > UFO_MAX_SPEED then vel.y = UFO_MAX_SPEED end
		if vel.y < -UFO_MAX_SPEED then vel.y = -UFO_MAX_SPEED end
		if vel.z > UFO_MAX_SPEED then vel.z = UFO_MAX_SPEED end
		if vel.z < -UFO_MAX_SPEED then vel.z = -UFO_MAX_SPEED end
		self.object:set_velocity(vel)
		if ctrl.left then
			self.object:set_yaw(yaw+dtime*.9)
		end
		if ctrl.right then
			self.object:set_yaw(yaw-dtime*.9)
		end
		if ctrl.aux1 then
			local pos = self.object:get_pos()
			local t = {{x=2,z=0},{x=-2,z=0},{x=0,z=2},{x=0,z=-2}}
			for _, i in ipairs(t) do
				pos.x = pos.x + i.x;	pos.z = pos.z + i.z;
				if core.get_node(pos).name == "ufos:furnace" then
					local meta = core.get_meta(pos)
					if fuel < 100 and meta:get_int("charge") > 0 then
						fuel = fuel + 1
						meta:set_int("charge",meta:get_int("charge")-1)
						meta:set_string("formspec", ufos.charger_formspec
							.. "label[0,0;Charge: "..meta:get_int("charge"))
					end
				end
				pos.x = pos.x - i.x; pos.z = pos.z - i.z;
			end
		end
	end
	if not self.driver then
		local vel = self.object:get_velocity()
		vel.x = vel.x*.96	vel.y = vel.y*.96	vel.z = vel.z*.96
		self.object:set_velocity(vel)
		return
	end

	if fuel < 0 then fuel = 0 end
	if fuel > 100 then fuel = 100 end
	if self.fueli ~= math.floor(fuel*8/100) then
		self.fueli = math.floor(fuel*8/100)
		self.object:set_properties({textures = {"ufo_"..self.fueli..".png"}})
	end
	ufos.set_fuel(self,fuel)
end

function ufos.ufo:get_staticdata()
	return self.owner_name..";"..tostring(self.fuel)
end

core.register_entity("ufos:ufo", ufos.ufo)


core.register_tool("ufos:ufo", {
	description = "UFO",
	inventory_image = "ufos_inventory.png",
	wield_image = "ufos_inventory.png",
	tool_capabilities = {load=0,max_drop_level=0, groupcaps={fleshy={times={}, uses=100, maxlevel=0}}},
	groups = {not_repaired_by_anvil = 1},
	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" then
			return
		end
		
		-- Call on_rightclick if the pointed node defines it
		if placer and not placer:get_player_control().sneak then
			local n = core.get_node(pointd.under)
			local nn = n.name
			if core.registered_nodes[nn] and core.registered_nodes[nn].on_rightclick then
				return core.registered_nodes[nn].on_rightclick(pointd.under, n, placer, itemstack) or itemstack
			end
		end
		
		ufos.ufo_from_item(itemstack,placer,pointd)
		return itemstack
	end,
})

core.register_craft({
	output = "ufos:ufo",
	recipe = {
		{"", "default:glass", ""},
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
		{"default:steel_block", "default:mese", "default:steel_block"}
	}
})

dofile(core.get_modpath("ufos").."/furnace.lua")

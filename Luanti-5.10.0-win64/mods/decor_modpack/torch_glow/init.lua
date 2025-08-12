
core.register_abm({
	nodenames = {"default:torch", "default:torch_ceiling", "default:torch_wall",
	"default:meselamp_torch", "default:meselamp_torch_wall",
	"gloop:kalite_torch", "gloop:kalite_torch_ceiling", "gloop:kalite_torch_wall",
	"xtraores:antracite_torch", "xtraores:antracite_torch_ceiling", "xtraores:antracite_torch_wall"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		local tod = core.get_timeofday()
		if tod > .79 or tod < .2 then
	local glowtex = "default_torchglow.png"

	if node.name:find("gloop:kalite_torch") then
		glowtex = "kalite_torchglow.png"
	elseif node.name:find("xtraores:antracite_torch") then
		glowtex = "antracite_torchglow.png"
	end

	local offx = pos.x
	local offy = pos.y+.1
	local offz = pos.z

	if node.param2 == 0 then
		offy = pos.y
	elseif node.param2 == 2 then
		offx = pos.x+.25
	elseif node.param2 == 3 then
		offx = pos.x-.25
	elseif node.param2 == 4 then
		offz = pos.z+.25
	elseif node.param2 == 5 then
		offz = pos.z-.25
	end
	core.add_particle({
		pos = {x=offx, y=offy, z=offz},
		expirationtime = 5,
		size = 15,
		texture = glowtex,
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = .5},
		glow = 14 })
		end
	end
})

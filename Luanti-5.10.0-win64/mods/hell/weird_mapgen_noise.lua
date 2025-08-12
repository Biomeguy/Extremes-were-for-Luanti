--V2
local function get_random(a, b, seed)
	return PseudoRandom(math.abs(a+b*5)+seed)
end

local r_chs = {}

local function hell_weird_noise(minp, fct, s, seed, range, scale)
	if not r_chs[s] then
		r_chs[s] = math.floor(s/3+0.5)
	end
	scale = scale or 15
	local r_ch = r_chs[s]
	local maxp = vector.add(minp, scale)

	local tab,n = {},1
	local sm = range or (s+r_ch)*2
	for z = -sm, scale+sm do
		local pz = z+minp.z
		if pz%s == 0 then
			for x = -sm, scale+sm do
				local px = x+minp.x
				if px%s == 0 then
					local pr = get_random(px, pz, seed)
					tab[n] = {x=px+pr:next(-r_ch, r_ch), y=0, z=pz+pr:next(-r_ch, r_ch)}
					n = n+1
				end
			end
		end
	end

	local tab2,n = {},1
	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do
			local h = sm
			for _,i in ipairs(tab) do
				h = math.min(h, fct(x, i.x, z, i.z))
			end
			tab2[n] = {x=x, y=maxp.y-h, z=z}
			n = n+1
		end
	end
	return tab2
end

return hell_weird_noise

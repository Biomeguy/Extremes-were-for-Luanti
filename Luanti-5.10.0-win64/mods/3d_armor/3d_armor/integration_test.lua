
core.log("warning", "[TEST] integration-test enabled!")

core.register_on_mods_loaded(function()
	core.after(1, function()

		local data = core.write_json({ success = true }, true);
		local file = io.open(core.get_worldpath().."/integration_test.json", "w" );
		if file then
			file:write(data)
			file:close()
		end

		file = io.open(core.get_worldpath().."/registered_nodes.txt", "w" );
		if file then
			for name in pairs(core.registered_nodes) do
				file:write(name .. '\n')
			end
			file:close()
		end

		core.log("warning", "[TEST] integration tests done!")
		core.request_shutdown("success")
	end)
end)

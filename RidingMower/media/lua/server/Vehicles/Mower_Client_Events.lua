if not isServer() then return end -- Prevent load the file on SP
local Commands = {};
Commands.RidingMower = {};


Commands.RidingMower.PlayerEnter = function(source, args)
	local players = getOnlinePlayers();
	local sourceId = source:getOnlineID();
	local vehicle = getVehicleById(args.vehicleId)
	print("Fired Client Enter")

	for i = 0, players:size() - 1 do
		local player = players:get(i);

		if player ~= source then
			sendServerCommand(player, "RidingMower", "PlayerEnter", {
				playerId = sourceId,
				vehicleId = args.vehicleId
			})
		end
	end
end

Commands.RidingMower.PlayerExit = function(source, args)
	local players = getOnlinePlayers();
	local sourceId = source:getOnlineID();
	print("Fired Client Exit")

	for i = 0, players:size() - 1 do
		local player = players:get(i);

		if player ~= source then
			sendServerCommand(player, "RidingMower", "PlayerExit", {
				playerId = sourceId
			})
		end
	end
end

local onClientCommand = function(module, command, player, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)
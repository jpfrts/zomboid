--if not isClient() then return end -- Prevent load the file on SP
local Commands = {};
Commands.RidingMower = {};

Commands.RidingMower.SetPlayerVehicleScriptName = function(args)
    local source = getPlayer();
    local vehicle = getVehicleById(args.vehicleId)
    
	source:SetVariable("VehicleScriptName", vehicle:getScriptName())
end

Commands.RidingMower.PlayerEnter = function(args)
	local players = getOnlinePlayers();
	local vehicle = getVehicleById(args.vehicleId)
	print("Fired Server Enter")

	for i = 0, players:size() - 1 do
		local player = players:get(i);

		if player:getOnlineID() == args.playerId then

			player:SetVariable("VehicleScriptName", vehicle:getScriptName());

			break
		end
	end
end

Commands.RidingMower.PlayerExit = function(args)
	local players = getOnlinePlayers();
	print("Fired Server Exit")

	for i = 0, players:size() - 1 do
		local player = players:get(i);

		if player:getOnlineID() == args.playerId then
			player:SetVariable("VehicleScriptName", "");
			player:SetVariable("VehicleForward", "false")

			break
		end
	end
end

local onServerCommand = function(module, command, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](args)
	end
end

Events.OnServerCommand.Add(onServerCommand)

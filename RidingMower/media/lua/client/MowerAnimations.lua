local function MowerEnter(player)
    local vehicle = player:getVehicle()
    sendClientCommand(source, "RidingMower", "PlayerEnter", {
        vehicleId = vehicle:getId()
    })
    player:SetVariable("VehicleScriptName", vehicle:getScriptName());
end

local function MowerExit(player)
    --player:SetVariable("VehicleScriptName", "")
    sendClientCommand(source, "RidingMower", "PlayerExit", {})
    player:SetVariable("VehicleScriptName", "");
end

Events.OnEnterVehicle.Add(MowerEnter)
Events.OnExitVehicle.Add(MowerExit)
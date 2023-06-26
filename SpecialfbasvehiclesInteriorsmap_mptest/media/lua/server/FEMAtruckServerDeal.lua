
local vehicleName = "Base.Vehicles_fematruck01"

RVInterior.addInterior(vehicleName, { 21001, 7205, 0 })

local function migrateVehicles_fematruck01()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().Vehicles_fematruck01num then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().Vehicles_fematruck01num,
                    player:getModData().migrateVehicles_fematruck01pos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverVehicles_fematruck01num then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverVehicles_fematruck01num,
                    getGameTime():getModData().serverVehicles_fematruck01)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverVehicles_fematruck01num")
        end
    end
end

Events.OnGameStart.Add(migrateVehicles_fematruck01)
Events.OnServerStarted.Add(migrateVehicles_fematruck01)
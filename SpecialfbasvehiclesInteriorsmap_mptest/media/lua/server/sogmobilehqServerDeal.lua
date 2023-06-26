
local vehicleName = "Base.Vehicles_sogmobilehq"

RVInterior.addInterior(vehicleName, { 21001, 7506, 0 })

local function migrateVehicles_sogmobilehq()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().Vehicles_sogmobilehqnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().Vehicles_sogmobilehqnum,
                    player:getModData().migrateVehicles_sogmobilehqpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverVehicles_sogmobilehqnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverVehicles_sogmobilehqnum,
                    getGameTime():getModData().serverVehicles_sogmobilehq)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverVehicles_sogmobilehqnum")
        end
    end
end

Events.OnGameStart.Add(migrateVehicles_sogmobilehq)
Events.OnServerStarted.Add(migrateVehicles_sogmobilehq)
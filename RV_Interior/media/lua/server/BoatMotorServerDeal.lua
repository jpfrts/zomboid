local vehicleName = "Base.BoatMotor"

RVInterior.addInterior(vehicleName, { 23101, 12907, 0 }, {0, 8, 0})
RVInterior.setInteriorIsBoat(vehicleName)
-- Make the grounded version of the motorboat share the same interiors as the normal version.
RVInterior.shareInterior("Base.BoatMotor_Ground", vehicleName)

local function migrateBoatMotor()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().BoatMotornum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().BoatMotornum,
                    player:getModData().BoatMotorpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverBoatMotornum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverBoatMotornum,
                    getGameTime():getModData().serverBoatMotor)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverBoatMotornum")
        end
    end
end

Events.OnGameStart.Add(migrateBoatMotor)
Events.OnServerStarted.Add(migrateBoatMotor)
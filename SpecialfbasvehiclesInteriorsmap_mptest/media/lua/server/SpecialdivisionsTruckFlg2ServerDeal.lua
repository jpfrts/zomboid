local vehicleName = "Base.SpecialdivisionsTruckFlg2"

RVInterior.addInterior(vehicleName, { 21002, 8100, 0 })

local function migrateSpecialdivisionsTruckFlg2()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().SpecialdivisionsTruckFlg2num then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().SpecialdivisionsTruckFlg2num,
                    player:getModData().SpecialdivisionsTruckFlg2pos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverSpecialdivisionsTruckFlg2num then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverSpecialdivisionsTruckFlg2num,
                    getGameTime():getModData().serverSpecialdivisionsTruckFlg2)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverSpecialdivisionsTruckFlg2num")
        end
    end
end

Events.OnGameStart.Add(migrateSpecialdivisionsTruckFlg2)
Events.OnServerStarted.Add(migrateSpecialdivisionsTruckFlg2)
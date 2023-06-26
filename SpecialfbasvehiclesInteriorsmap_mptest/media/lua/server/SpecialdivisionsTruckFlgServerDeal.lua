local vehicleName = "Base.SpecialdivisionsTruckFlg"

RVInterior.addInterior(vehicleName, { 21002, 7800, 0 })

local function migrateSpecialdivisionsTruckFlg()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().SpecialdivisionsTruckFlgnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().SpecialdivisionsTruckFlgnum,
                    player:getModData().SpecialdivisionsTruckFlgpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverSpecialdivisionsTruckFlgnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverSpecialdivisionsTruckFlgnum,
                    getGameTime():getModData().serverSpecialdivisionsTruckFlg)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverSpecialdivisionsTruckFlgnum")
        end
    end
end

Events.OnGameStart.Add(migrateSpecialdivisionsTruckFlg)
Events.OnServerStarted.Add(migrateSpecialdivisionsTruckFlg)
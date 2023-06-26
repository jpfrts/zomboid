local vehicleName = "Base.f700boxbombsquadLG"

RVInterior.addInterior(vehicleName, { 21001, 6906, 0 })

local function migratef700boxbombsquadLG()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().bombsquadLGnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().bombsquadLGnum,
                    player:getModData().bombsquadLGpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverbombsquadLGnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverbombsquadLGnum,
                    getGameTime():getModData().serverbombsquadLG)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverbombsquadLGnum")
        end
    end
end

Events.OnGameStart.Add(migratef700boxbombsquadLG)
Events.OnServerStarted.Add(migratef700boxbombsquadLG)
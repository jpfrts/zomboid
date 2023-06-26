local vehicleName = "Base.86econolinervFBIMHQLG"

RVInterior.addInterior(vehicleName, { 21000, 6305, 0 })

local function migrate86econolinervFBIMHQLG()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().econolinervFBIMHQLGnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().econolinervFBIMHQLGnum,
                    player:getModData().econolinervFBIMHQLGpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().servereconolinervFBIMHQLGnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().servereconolinervFBIMHQLGnum,
                    getGameTime():getModData().servereconolinervFBIMHQLG)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "servereconolinervFBIMHQLGnum")
        end
    end
end

Events.OnGameStart.Add(migrate86econolinervFBIMHQLG)
Events.OnServerStarted.Add(migrate86econolinervFBIMHQLG)
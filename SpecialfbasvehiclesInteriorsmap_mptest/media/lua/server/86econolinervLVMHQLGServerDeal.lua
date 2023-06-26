local vehicleName = "Base.86econolinervLVMHQLG"

RVInterior.addInterior(vehicleName, { 21001, 6606, 0 })

local function migrate86econolinervLVMHQLG()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().econolinervLVMHQLGnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().econolinervLVMHQLGnum,
                    player:getModData().econolinervLVMHQLGpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().servereconolinervLVMHQLGnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().servereconolinervLVMHQLGnum,
                    getGameTime():getModData().servereconolinervLVMHQLG)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "servereconolinervLVMHQLGnum")
        end
    end
end

Events.OnGameStart.Add(migrate86econolinervLVMHQLG)
Events.OnServerStarted.Add(migrate86econolinervLVMHQLG)
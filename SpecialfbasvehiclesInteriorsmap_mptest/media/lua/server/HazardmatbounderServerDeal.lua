
local vehicleName = "Base.86bounderHAzardmaterials"

RVInterior.addInterior(vehicleName, { 21001, 6005, 0 })

local function migrate86bounderHAzardmaterials()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().bounderHAzardmaterialsnum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().bounderHAzardmaterialsnum,
                    player:getModData().bounderHAzardmaterialspos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverbounderHAzardmaterialsnum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverbounderHAzardmaterialsnum,
                    getGameTime():getModData().serverbounderHAzardmaterials)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverbounderHAzardmaterialsnum")
        end
    end
end

Events.OnGameStart.Add(migrate86bounderHAzardmaterials)
Events.OnServerStarted.Add(migrate86bounderHAzardmaterials)
Events.OnInitGlobalModData.Add(function()
local activatedMods = getActivatedMods()
if activatedMods:contains('MusicfortheEndSH') then
if SandboxVars.MFTEOTWSH.easterEgg then
local itemList =
{"Tsarcraft.CrackedCassettePS","Tsarcraft.CrackedCassetteAB","Tsarcraft.CrackedCassetteSB","Tsarcraft.CrackedCassetteTS","Tsarcraft.CrackedCassetteFO","Tsarcraft.CrackedCassetteMT","Tsarcraft.CrackedCassetteBB","Tsarcraft.CrackedCassetteDS","Tsarcraft.CrackedCassetteUB","Tsarcraft.CrackedCassetteMC"}

local function onRefreshInventoryWindowContainers(inventoryPage)
    if not inventoryPage.inventory or not instanceof(inventoryPage.inventory:getParent(), "IsoDeadBody") or inventoryPage.inventory:getParent():getModData().shdummiesReplaced then return end
    local container = inventoryPage.inventory
    local shdummies = container:getAllType("Tsarcraft.CrackedBlank") -- dummy item type
    for i = 0, shdummies:size()-1 do
        container:Remove(shdummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
    container:getParent():getModData().shdummiesReplaced = true
end

Events.OnRefreshInventoryWindowContainers.Add(onRefreshInventoryWindowContainers)

        table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Tsarcraft.CrackedBlank");
        table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.025);
        table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Tsarcraft.CrackedBlank");
        table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.025);
	end
    end
ItemPickerJava.Parse()
end)
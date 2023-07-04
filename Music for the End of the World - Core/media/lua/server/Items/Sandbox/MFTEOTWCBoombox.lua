local itemList = {"Tsarcraft.TCBoombox"}

Events.OnInitGlobalModData.Add(function()
    for i=1,#itemList do
        local item = ScriptManager.instance:getItem(itemList[i])
        if item then
            item:DoParam("Weight = " .. 1 * SandboxVars.MFTEOTWC.boomboxWeight)
        end
    end

    for i=1,#itemList do
        local item = ScriptManager.instance:getItem(itemList[i])
        if item then
            item:DoParam("UseDelta = " .. 0.009 * SandboxVars.MFTEOTWC.batteryUse)
        end
    end
end)
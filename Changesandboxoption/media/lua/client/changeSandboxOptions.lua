local function changesandboxoptions(_keyPressed)

    local key = _keyPressed
	-- print(key)
    if key == 26 then -- If you want to change the key, you can change this number
        -- SandboxOptions.new()
		if ISServerSandboxOptionsUIover.instance then
            ISServerSandboxOptionsUIover.instance:close()
        end
		local ui = ISServerSandboxOptionsUIover:new(150, 150,800, 600)
		ui:initialise()
		ui:addToUIManager()
    end

end




Events.OnKeyPressed.Add(changesandboxoptions)

-- function ISServerSandboxOptionsUIover:settingsFromUI(options)
-- 	for i=1,options:getNumOptions() do
-- 		local option = options:getOptionByIndex(i-1)
-- 		local control = self.controls[option:getName()]
-- 		if control then
-- 			if option:getType() == "boolean" then
-- 				option:setValue(control.selected[1] == true)
-- 			elseif option:getType() == "double" then
-- 				option:parse(control:getText())
-- 			elseif option:getType() == "enum" then
-- 				option:setValue(control.selected)
-- 			elseif option:getType() == "integer" then
-- 				option:parse(control:getText())
-- 			elseif option:getType() == "string" then
-- 				option:setValue(control:getText())
-- 			elseif option:getType() == "text" then
-- 				option:setValue(control:getText())
-- 			end
-- 			getSandboxOptions():set(option:getName(),option:getValue())
-- 		end
-- 	end
-- end

local function rightclickground(player, context, worldObjects)
	-- local sandboxmenu = context:addOption("Sandbox Options", worldObjects)
	context:addOption("Sandbox Options", worldObjects,function() changesandboxoptions(26) end)
end
Events.OnFillWorldObjectContextMenu.Add(rightclickground)
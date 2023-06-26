-------------------------------------------------------------------
--						DEBUG MENU
-------------------------------------------------------------------
local Rv_adminMenu = {}
-------------------------------------------------------------------


-------------------------------------------------------------------
Rv_adminMenu.xywh = function(w, h)
	local screenWidth = Core.getInstance():getScreenWidth()
	local screenHeight = Core.getInstance():getScreenHeight()
	return (screenWidth - w) / 2, (screenHeight - h) / 2, w, h;
end
----------------------------------------------------------------------

Rv_adminMenu.onFillWorldObjectContextMenu = function(playerId, context, worldObjects)
	local player = getSpecificPlayer(playerId)
	if isAdmin() or isDebugEnabled() then
		local KeyMenu = context:addOption(getText('UI_rvdebug_menu'), worldObjects);
		local subMenu = ISContextMenu:getNew(context);
		Rv_adminMenu.context = context
		Rv_adminMenu.subMenu = subMenu
		context:addSubMenu(KeyMenu, subMenu);
		local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
		if not vehicle then
			subMenu:addOption(getText('UI_rvdebug_sit'), worldObjects)
		elseif not RVInterior.hasInteriorParameters(vehicle:getScript():getFullName()) then
			subMenu:addOption(getText('UI_rvdebug_no_interior') .. vehicle:getScript():getFullName(), worldObjects)
		else
			subMenu:addOption(getText('UI_rvdebug_num'), worldObjects, Rv_adminMenu.getAssignedNumber, player)
			subMenu:addOption(getText('UI_rvdebug_teleport_vehicle'), worldObjects, Rv_adminMenu.promptTeleport, player)
			subMenu:addOption(getText('UI_rvdebug_manual_assign'), worldObjects, Rv_adminMenu.promptAssignedNumber, player)
			subMenu:addOption(getText('UI_rvdebug_reset'), worldObjects, Rv_adminMenu.resetVehicle, player)
			subMenu:addOption(getText('UI_rvdebug_reset_type') .. vehicle:getScript():getFullName(), worldObjects, Rv_adminMenu.resetVehicleType, player)
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(Rv_adminMenu.onFillWorldObjectContextMenu)
-------------------------------------------------------------------
-------------------------------------------------------------------
Rv_adminMenu.resetVehicle = function(_worldObjects, player)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
	if vehicle then
		local confirmClosure = function (_this, button)
			if button.internal == "YES" then
				sendClientCommand("RVInteriorAdmin", "clientResetVehicle",
						{ vehicleId = vehicle:getId(), playerId = player:getOnlineID() })
			end
		end
		local x, y, w, h = Rv_adminMenu.xywh(250, 150);
		local confirmDialog = ISModalDialog:new(x, y, w, h,
				getText("UI_rvdebug_reset_confirm"), true, nil, confirmClosure)
		confirmDialog:initialise()
		confirmDialog:addToUIManager()
		if JoypadState.players[player:getPlayerNum()+1] then
			setJoypadFocus(player:getPlayerNum(), confirmDialog)
		end
	end
end
-------------------------------------------------------------------
Rv_adminMenu.getAssignedNumber = function(_worldObjects, player)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
	if vehicle then
		sendClientCommand("RVInteriorAdmin", "clientGetAssignedNumber",
				{ vehicleId = vehicle:getId(), playerId = player:getOnlineID() })
	end
end
-------------------------------------------------------------------
Rv_adminMenu.promptTeleport = function(_worldObjects, player)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
	if vehicle then
		sendClientCommand("RVInteriorAdmin", "clientPromptTeleport",
				{ vehicleId = vehicle:getId(), playerId = player:getOnlineID() })
	end
end
-------------------------------------------------------------------
Rv_adminMenu.promptAssignedNumber = function(_worldObjects, player)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
	if vehicle then
		sendClientCommand("RVInteriorAdmin", "clientPromptAssignedNumber",
				{ vehicleId = vehicle:getId(), playerId = player:getOnlineID() })
	end
end
-------------------------------------------------------------------
Rv_adminMenu.resetVehicleType = function(_worldObjects, player)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(player)
	if vehicle then
		local confirmClosure = function (_this, button)
			if button.internal == "YES" then
				sendClientCommand("RVInteriorAdmin", "clientResetVehicleType",
						{ vehicleId = vehicle:getId(), playerId = player:getOnlineID() })
			end
		end
		local x, y, w, h = Rv_adminMenu.xywh(250, 150);
		local confirmDialog = ISModalDialog:new(x, y, w, h,
				getText("UI_rvdebug_reset_type_confirm"), true, nil, confirmClosure)
		confirmDialog:initialise()
		confirmDialog:addToUIManager()
		if JoypadState.players[player:getPlayerNum()+1] then
			setJoypadFocus(player:getPlayerNum(), confirmDialog)
		end
	end
end
-------------------------------------------------------------------

function comboBoxDialog(player, text, interiorCount, current, onApply)
	local x, y, w, h = Rv_adminMenu.xywh(300, 100);
	local selectDialog = ISPanel:new(x, y, w, h);
	selectDialog.character = player;
	selectDialog:addChild(ISLabel:new(10, 10, 10, text, 1, 1, 1, 1, UIFont.Small, true));
	-- Add combobox to select
	local comboBox = ISComboBox:new((w - 50) / 2, 25, 50, 25, selectDialog);
	for interior = 1, interiorCount do
		comboBox:addOption(tostring(interior));
	end
	comboBox.selected = current;
	selectDialog:addChild(comboBox);
	-- Add apply and cancel buttons
	selectDialog:addChild(ISButton:new(10, 80, 100, 15, getText('UI_btn_apply'), selectDialog, function()
		onApply(tonumber(comboBox:getSelectedText()));
		ISModalDialog.destroy(selectDialog);
	end));
	selectDialog:addChild(ISButton:new(w - 110, 80, 100, 15, getText('UI_btn_cancel'), selectDialog, function()
		ISModalDialog.destroy(selectDialog);
	end));
	----
	selectDialog:initialise();
	selectDialog:addToUIManager()
	if JoypadState.players[player:getPlayerNum()+1] then
		setJoypadFocus(player:getPlayerNum(), selectDialog)
	end
end


-------------------------------------------------------------------
--                         SERVER COMMANDS
-------------------------------------------------------------------

local adminServerCommandHandlers = {}

local function adminMenuOnServerCommand(module, command, arguments)
	if module ~= "RVInteriorAdmin" then
		return
	end
	if adminServerCommandHandlers[command] then
		local player = getSpecificPlayer(arguments.playerId % 4)
		adminServerCommandHandlers[command](player, arguments)
	end
end

Events.OnServerCommand.Add(adminMenuOnServerCommand)

-------------------------------------------------------------------

adminServerCommandHandlers.serverGetAssignedNumber = function(player, arguments)
	if arguments[1] == -1 then
		player:Say(getText("UI_rvdebug_none"))
	else
		player:Say(getText('UI_rvdebug_assigned_start') .. tostring(arguments[1]) .. "/" .. tostring(arguments[2]))
	end
end

-------------------------------------------------------------------

adminServerCommandHandlers.serverPromptTeleport = function(player, arguments)
	local current = arguments.interiorInstance;
	local interiorCount = arguments.interiorCount;
	local vehicleId = arguments.vehicleId;
	if interiorCount > 0 then
		comboBoxDialog(player, getText('UI_rvdebug_teleport_dialog'), interiorCount, current,
				function(interiorInstance)
					sendClientCommand("RVInteriorAdmin", "clientAdminTeleport",
							{ vehicleId = vehicleId, playerId = player:getOnlineID(), interiorInstance = interiorInstance });
				end);
	end
end

-------------------------------------------------------------------

adminServerCommandHandlers.serverPromptAssignedNumber = function(player, arguments)
	local current = arguments.interiorInstance;
	local interiorCount = arguments.interiorCount;
	local vehicleId = arguments.vehicleId;
	if interiorCount > 0 then
		comboBoxDialog(player, getText('UI_rvdebug_manual_assign_dialog'), interiorCount, current,
				function(interiorInstance)
					sendClientCommand("RVInteriorAdmin", "clientSetAssignedNumber",
							{ vehicleId = vehicleId, playerId = player:getOnlineID(), interiorInstance = interiorInstance });
				end);
	end
end

-------------------------------------------------------------------

adminServerCommandHandlers.serverResetVehicle = function(player)
	player:Say(getText("UI_rvdebug_isreset"))
end

-------------------------------------------------------------------

adminServerCommandHandlers.serverResetVehicleType = function(player, arguments)
	local vehicleId = arguments.vehicleId;
	local vehicle = getVehicleById(vehicleId);
	player:Say(getText("UI_rvdebug_reset_type_done") .. vehicle:getScript():getFullName());
end

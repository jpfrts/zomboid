--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.6

KI5 = KI5 or {};
CAM69 = CAM69 or {};

function CAM69.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "69camaro" )) then

				self.character:SetVariable("KI5vehicle", "Low")
			end
		
	vanillaEnter(self);
		
		local seat = self.seat
    		if not seat then return end
				if seat == 0 then		
					self.character:SetVariable("BobIsDriverLow", "True")
				else		
					self.character:SetVariable("BobIsDriverLow", "False")
			end
	end
end

function CAM69.pvFixSwitch(player)
	local player = getPlayer()
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "69camaro" )) then

			player:SetVariable("KI5vehicle", "Low")

			local seat = vehicle:getSeat(player)
	    		if not seat then return end
					if seat == 0 then		
						player:SetVariable("BobIsDriverLow", "True")
					else		
						player:SetVariable("BobIsDriverLow", "False")
				end

	end
end

function CAM69.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(CAM69.pvFixCheck);
Events.OnGameStart.Add(CAM69.pvFixSwitch);
Events.OnExitVehicle.Add(CAM69.pvFixClear);
Events.OnSwitchVehicleSeat.Add(CAM69.pvFixSwitch);
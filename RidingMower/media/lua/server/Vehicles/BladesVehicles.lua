--***********************************************************
--**                    THE INDIE SKIZ                    **

function Vehicles.Create.Blade(vehicle, part)
	local item = VehicleUtils.createPartInventoryItem(part)
end

function Vehicles.Init.Blade(vehicle, part)
end

function Vehicles.Update.Blade(vehicle, part, elapsedMinutes)
	
end

function Vehicles.InstallComplete.Blade(vehicle, part)
	vehicle:doDamageOverlay();
end

function Vehicles.UninstallComplete.Blade(vehicle, part, item)
	vehicle:doDamageOverlay();
end


function Vehicles.Create.SeatFrontRight(vehicle, part)
		part:setInventoryItem(nil)
end

function Vehicles.Init.SeatFrontRight(vehicle, part)
		part:setInventoryItem(nil)
end

function Vehicles.Update.SeatFrontRight(vehicle, part, elapsedMinutes)
		part:setInventoryItem(nil)
end
---
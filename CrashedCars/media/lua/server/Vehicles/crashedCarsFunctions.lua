-- From 0 to 100 (Integer)
local rotateChance = 5
local upsideDownChance = 100     -- % of the rotate chance

vehicleColorByType = {}



local function crashedCarsRotateVehicle(vehicle)
    if ZombRand(100) < rotateChance then
        local zAngles = {-90, 90}
        local zRot = zAngles[ZombRand(2) + 1]
        if ZombRand(100) < upsideDownChance then
            zRot = 180
        end
        vehicle:setAngles(0, vehicle:getAngleY(), zRot)
    end
end



local function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

local function getValueThatNotInTable(tab, min, max)
	for i=min, max do
		if not tab[i] then
			return i
		end
	end
	return nil
end

function Vehicles.Create.WreckGloveBox(vehicle, part)
    local invItem = VehicleUtils.createPartInventoryItem(part);
	crashedCarsRotateVehicle(vehicle)

	-- skin "random"
	local vehicleName = vehicle:getScript():getName()
	local vehicleKeyID = vehicle:getKeyId()
	local vehicleColorIndex = vehicle:getSkinIndex()
	if vehicleColorIndex == -1 then return end


	if vehicleColorByType[vehicleName] == nil then
		vehicleColorByType[vehicleName] = {}
		vehicleColorByType[vehicleName]["vehicleKeyID"] = vehicleKeyID
		vehicleColorByType[vehicleName]["colorIndexes"] = {}
		vehicleColorByType[vehicleName]["colorIndexes"][vehicleColorIndex] = true
	elseif vehicleColorByType[vehicleName]["vehicleKeyID"] ~= vehicleKeyID then
		local colorCount = vehicle:getSkinCount()
		if colorCount <= 1 then return end

		if tablelength(vehicleColorByType[vehicleName]["colorIndexes"]) == colorCount then
			vehicleColorByType[vehicleName]["colorIndexes"] = {}
		end

		if vehicleColorByType[vehicleName]["colorIndexes"][vehicleColorIndex] then
			local tmp = getValueThatNotInTable(vehicleColorByType[vehicleName]["colorIndexes"], 0, colorCount-1)
			if tmp == nil then
				vehicleColorByType[vehicleName] = {}
				return
			end
			vehicle:setSkinIndex(tmp)
			vehicleColorByType[vehicleName]["colorIndexes"][tmp] = true
		else
			vehicleColorByType[vehicleName]["colorIndexes"][vehicleColorIndex] = true
		end

		vehicleColorByType[vehicleName]["vehicleKeyID"] = vehicleKeyID
	end
end


function Vehicles.ContainerAccess.WreckGloveBox(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		-- Can the seated player reach the passenger seat?
		-- Only character in front seat can access it
		return seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		-- Can't reach from inside a different vehicle.
		return false
	else
		-- Standing outside the vehicle.
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		return true
	end
end
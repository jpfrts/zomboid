--[[*]]-- Generated automagically by RotatorsLib --[[*]]--

require "Vehicles/ISUI/ISCarMechanicsOverlay"

local function BaseRidingMowerMechanicsOverlay()
	for _,name in ipairs({ "MowerBlade" }) do
		ISCarMechanicsOverlay.PartList[name] = ISCarMechanicsOverlay.PartList[name] or {}
		ISCarMechanicsOverlay.PartList[name].vehicles = ISCarMechanicsOverlay.PartList[name].vehicles or {}
	end

	ISCarMechanicsOverlay.CarList["Base.RidingMower"] = { imgPrefix = "RidingMower_", x = 10, y = 0, PartList = {} }
	ISCarMechanicsOverlay.CarList["Base.RidingMower"].PartList.MowerBlade = { img = "blade" }
    ISCarMechanicsOverlay.CarList["Base.RacingMower"] = {imgPrefix = "RidingMower_", x = 10, y = 0, PartList = {} }
    ISCarMechanicsOverlay.CarList["Base.RacingMower"].PartList.MowerBlade = { img = "blade" }
    ISCarMechanicsOverlay.CarList["Base.RidingMower_Trailer"] = {imgPrefix = "RidingMower_Trailer_", x=10,y=0};    
    ISCarMechanicsOverlay.CarList["Base.MiniMower"] = {imgPrefix = "RidingMower_", x = 10, y = 0, PartList = {} }	
	

	ISCarMechanicsOverlay.PartList.MowerBlade.vehicles.RidingMower_ = { x = 20, y = 265, x2 = 60, y2 = 343 }
    ISCarMechanicsOverlay.PartList.MowerBlade.vehicles.RacingMower_ = { x = 20, y = 265, x2 = 60, y2 = 343 }
end

Events.OnInitWorld.Add(BaseRidingMowerMechanicsOverlay)

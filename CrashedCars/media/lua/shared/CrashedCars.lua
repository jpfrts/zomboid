--[[
    in summ chances must be near 100 (in each category)
]]

-- HERE WE LOAD FROM THE BURNTVEHICLES.TXT, THE VEHICLE HEADER NAME
if VehicleZoneDistribution then -- check if the table exists for backwards compatibility
    
    VehicleZoneDistribution.normalburnt.vehicles["Base.CarNormalBurnt"] = {index = -1, spawnChance = 9};
    VehicleZoneDistribution.normalburnt.vehicles["Base.NormalCrashedBurnt"] = {index = -1, spawnChance = 9};
    VehicleZoneDistribution.normalburnt.vehicles["Base.CarNormalBurntClassic"] = {index = -1, spawnChance = 1};     -- standard burnt car

    VehicleZoneDistribution.normalburnt.vehicles["Base.SmallCarBurnt"] = {index = -1, spawnChance = 1};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.Small2CrashedBurnt"] = {index = -1, spawnChance = 7};
    VehicleZoneDistribution.normalburnt.vehicles["Base.Small2FlippedCrashedBurnt"] = {index = -1, spawnChance = 7};
    VehicleZoneDistribution.normalburnt.vehicles["Base.SmallCar02Burnt"] = {index = -1, spawnChance = 7};
    VehicleZoneDistribution.normalburnt.vehicles["Base.SmallCar02BurntClassic"] = {index = -1, spawnChance = 0};     -- standard burnt car


    VehicleZoneDistribution.normalburnt.vehicles["Base.LuxuryCarBurnt"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.ModernCar02Burnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.ModernCar02BurntClassic"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.ModernCarBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.ModernCarBurntClassic"] = {index = -1, spawnChance = 1};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.ModernCrashedBurnt"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.normalburnt.vehicles["Base.OffRoadBurnt"] = {index = -1, spawnChance = 1};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.PickupBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.PickupBurntClassic"] = {index = -1, spawnChance = 1};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.PickUpVanBurnt"] = {index = -1, spawnChance = 0};     -- standard burnt car
   
    VehicleZoneDistribution.normalburnt.vehicles["Base.SportsCarBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.SportsCarBurntClassic"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.SUV2CrashedBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.SUVBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.SUVBurntClassic"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.Taxi2CrashedBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.TaxiBurnt"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.normalburnt.vehicles["Base.TaxiBurntClassic"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.VanBurnt"] = {index = -1, spawnChance = 1};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.VanSeatsBurnt"] = {index = -1, spawnChance = 0};     -- standard burnt car
    VehicleZoneDistribution.normalburnt.vehicles["Base.Wagon02CrashedBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.normalburnt.vehicles["Base.WagonCrashedBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.normalburnt.vehicles["Base.WagonSpecialBloodyCrashedBurnt"] = {index = -1, spawnChance = 4};

    

    
    VehicleZoneDistribution.specialburnt.vehicles["Base.AmbulanceBurnt"] = {index = -1, spawnChance = 19};
    VehicleZoneDistribution.specialburnt.vehicles["Base.AmbulanceBurntClassic"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.specialburnt.vehicles["Base.NormalCarBurntPolice"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.specialburnt.vehicles["Base.NormalCarBurntPoliceClassic"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.specialburnt.vehicles["Base.NormalCarBurntRanger"] = {index = -1, spawnChance = 9};

    VehicleZoneDistribution.specialburnt.vehicles["Base.PickupSpecialBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickupSpecialPoliceBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickupSpecialFireBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickupSpecialFossoilBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickupSpecialBurntClassic"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.specialburnt.vehicles["Base.PickUpVanLightsBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickUpVanLightsFossoilBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickUpVanLightsPoliceBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickUpVanLightsRangerBurnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.specialburnt.vehicles["Base.PickUpVanLightsBurntClassic"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.specialburnt.vehicles["Base.VanRadioBurnt"] = {index = -1, spawnChance = 19};
    VehicleZoneDistribution.specialburnt.vehicles["Base.VanRadioBurntClassic"] = {index = -1, spawnChance = 1};
end

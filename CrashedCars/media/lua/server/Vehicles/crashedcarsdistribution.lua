-- pull the vehicle distributions into a local table
local distributionTable = VehicleDistributions[1]


distributionTable["AmbulanceBurnt"] = distributionTable["VanAmbulance"]
distributionTable["VanRadioBurnt"] = distributionTable["VanRadio"]
distributionTable["NormalCarBurntPolice"] = distributionTable["CarLightsPolice"]
distributionTable["NormalCarBurntRanger"] = distributionTable["CarLights0"]


distributionTable["PickupSpecialBurnt"] = distributionTable["PickUpTruckMccoy"]
distributionTable["PickupSpecialPoliceBurnt"] = distributionTable["CarLightsPolice"]
distributionTable["PickupSpecialFireBurnt"] = distributionTable["PickUpTruckLightsFire"]
distributionTable["PickupSpecialFossoilBurnt"] = distributionTable["PickUpTruckLights1"]

distributionTable["PickUpVanLightsBurnt"] = distributionTable["PickUpVanLightsFire"]
distributionTable["PickUpVanLightsFossoilBurnt"] = distributionTable["PickUpVanLights1"]
distributionTable["PickUpVanLightsPoliceBurnt"] = distributionTable["PickUpVanLightsPolice"]
distributionTable["PickUpVanLightsRangerBurnt"] = distributionTable["PickUpVanLights0"]


distributionTable["CarNormalBurnt"] = distributionTable["CarNormal"]
distributionTable["ModernCar02Burnt"] = distributionTable["ModernCar"]
distributionTable["ModernCarBurnt"] = distributionTable["ModernCar"]
distributionTable["ModernCrashedBurnt"] = distributionTable["ModernCar"]
distributionTable["NormalCrashedBurnt"] = distributionTable["CarNormal"]
distributionTable["PickupBurnt"] = distributionTable["PickUpTruck"]
distributionTable["Small2CrashedBurnt"] = distributionTable["CarNormal"]
distributionTable["Small2FlippedCrashedBurnt"] = distributionTable["CarNormal"]
distributionTable["SmallCar02Burnt"] = distributionTable["CarNormal"]
distributionTable["SportsCarBurnt"] = distributionTable["CarNormal"]
distributionTable["SUV2CrashedBurnt"] = distributionTable["SUV"]
distributionTable["SUVBurnt"] = distributionTable["SUV"]
distributionTable["Taxi2CrashedBurnt"] = distributionTable["CarTaxi"]
distributionTable["TaxiBurnt"] = distributionTable["CarTaxi"]
distributionTable["Wagon02CrashedBurnt"] = distributionTable["CarNormal"]
distributionTable["WagonCrashedBurnt"] = distributionTable["CarNormal"]
distributionTable["WagonSpecialBloodyCrashedBurnt"] = distributionTable["CarNormal"]



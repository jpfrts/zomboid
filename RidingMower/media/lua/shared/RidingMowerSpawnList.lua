if VehicleZoneDistribution then

--vehicletiny: Used for very small vehicles that usually wouldn't be found in a driveway. Usually will be placed in yards and such.--
VehicleZoneDistribution.vehicletiny = {};
VehicleZoneDistribution.vehicletiny.vehicles = {};

VehicleZoneDistribution.vehicletiny.vehicles["Base.GoKart"] = {index = -1, spawnChance = 75};
VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 75};
VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.vehicletiny.chanceToSpawnKey = 90;
VehicleZoneDistribution.vehicletiny.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.vehicletiny.spawnRate = 70;

--mower: Zone specifically for the mower. Will be near utility sheds, or in some lawns like the tiny vehicle list--

VehicleZoneDistribution.mower = {};
VehicleZoneDistribution.mower.vehicles = {};

VehicleZoneDistribution.mower.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 75};
VehicleZoneDistribution.mower.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.mower.chanceToSpawnKey = 80;
VehicleZoneDistribution.mower.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.mower.spawnRate = 80;

--trailertiny: Right now, this is only the mower trailer. Will usually be near sheds, or nearby tiny vehicle spawns.--
VehicleZoneDistribution.trailertiny = {};
VehicleZoneDistribution.trailertiny.vehicles = {};

VehicleZoneDistribution.trailertiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.trailertiny.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.trailertiny.spawnRate = 80;


VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.bad.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.medium.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerMower"] = {index = -1, spawnChance = 1};
end
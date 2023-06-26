--********************************************************
--**               		THUZTOR               			**
--********************************************************

require "Conf/sprayCanConf"
require "Items/ProceduralDistributions"

-- Distributions for ProceduralDistributions.lua
local sprayPaintTable = {
  "SchoolLockers", 1, 
  "ClassroomDesk", 0.5,
  "CratePaint", 4,  
  "CrateTools", 6,
  "GarageTools", 4,
  "MechanicShelfTools", 8,
}

local chalkPaintTable = {
  "SchoolLockers", 2, 
  "ClassroomDesk", 1,
  "ClassroomMisc", 8,
  "CratePaint", 4,  
  "CrateTools", 4,
  "GarageTools", 3,
  "GigamartSchool", 15,
  "CrateOfficeSupplies", 2,
}

local chalkWHITESchoolTable = {
  "SchoolLockers", 3, 
  "ClassroomDesk", 2,
  "ClassroomMisc", 15,
  "GigamartSchool", 15,
  "CrateOfficeSupplies", 3,
}

for i = 1, #sprayPaintTable, 2 do 
	for _,v in ipairs(sprayCanConf.list) do
		table.insert(ProceduralDistributions.list[sprayPaintTable[i]].items, "spraypaint."..v.name)
		table.insert(ProceduralDistributions.list[sprayPaintTable[i]].items, sprayPaintTable[i+1])
	end
end

for i = 1, #chalkPaintTable, 2 do 
	for _,v in ipairs(sprayCanConf.listChalk) do
		table.insert(ProceduralDistributions.list[chalkPaintTable[i]].items, "spraypaint."..v.name)
		table.insert(ProceduralDistributions.list[chalkPaintTable[i]].items, chalkPaintTable[i+1])
	end
end

for i = 1, #chalkWHITESchoolTable, 2 do 
		table.insert(ProceduralDistributions.list[chalkWHITESchoolTable[i]].items, "spraypaint.ChalkWhite")
		table.insert(ProceduralDistributions.list[chalkWHITESchoolTable[i]].items, chalkWHITESchoolTable[i+1])
end
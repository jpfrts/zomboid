local wTransformFieldNum = nil
local function getJavaFieldNum(object, fieldName)
    for i = 0, getNumClassFields(object) - 1 do
        local javaField = getClassField(object, i)
        if luautils.stringEnds(tostring(javaField), '.' .. fieldName) then
            return i
        end
    end
end
local function moveMower(vehicle, trailer, y_Offset, z_Offset)
    if wTransformFieldNum == nil then
        wTransformFieldNum = getJavaFieldNum(trailer, "tempTransform")
    end

    local tmpTransform = getClassFieldVal(trailer, getClassField(trailer, wTransformFieldNum))
    local wTranform = trailer:getWorldTransform(tmpTransform)
    local origin = getClassFieldVal(wTranform, getClassField(wTranform, 1))
    origin:set(origin:x(), origin:y() + y_Offset, origin:z() - z_Offset)
    vehicle:setWorldTransform(wTranform)
end

local function distance( x1,y1,x2,y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return math.sqrt ( dx * dx + dy * dy )
end
function GetCartoLoad(vehicle)
    local allVehicles = getCell():getVehicles()
    local test
    for i = allVehicles:size() - 1, 0, -1 do
        testV = allVehicles:get(i)
        local part = vehicle:getPartById("TruckBed")
        local areaCenter = vehicle:getAreaCenter(part:getArea())
        if not areaCenter then print("no Area")return nil end
        local square = getCell():getGridSquare(areaCenter:getX(), areaCenter:getY(), vehicle:getZ())
        if not square then print("no square") return nil end

        local tDist = distance(areaCenter:getX(), areaCenter:getY(), testV:getX(), testV:getY())
        --print("Distance from trunk2 = " .. tDist)

        if ( tDist < 4) and testV:getScriptName() ~= "Base.TrailerMower" then
            return testV
        end
    end
    --print("----NEW----")
end

local function onLoadTrailer(player, vehicle)
    --player:Say("welp, This is where we load it!")
    local TruckBed = vehicle:getPartById("TruckBed")
    local TBData = TruckBed:getModData();
    local allVehicles = getCell():getVehicles()
    local test
    for i = allVehicles:size() - 1, 0, -1 do
        testV = allVehicles:get(i)
        if "Base.RidingMower" == testV:getScriptName() or "Base.RacingMower" == testV:getScriptName()then
            if testV:getDistanceSq(vehicle) < 10 then
                if testV:getVehicleTowing() then
                    testV:breakConstraint(true, false)
                end
                testV:setAngles(vehicle:getAngleX(), vehicle:getAngleY(), vehicle:getAngleZ())
                --detach Trailers
                moveMower(testV, vehicle, 0.5, 0);
                TBData.oldMass = testV:getMass()
                testV:setMass(1);                
                testV:setPhysicsActive(true)
                TBData.Loaded = true;
                return
            end
        end
    end
end

local function onUnloadTrailer(player, vehicle)

    local TruckBed = vehicle:getPartById("TruckBed")
    local TBData = TruckBed:getModData() 
    local allVehicles = getCell():getVehicles()
    local test
    for i = allVehicles:size() - 1, 0, -1 do
        testV = allVehicles:get(i)
        if "Base.RidingMower" == testV:getScriptName() or "Base.RacingMower" == testV:getScriptName()then
            if testV:getDistanceSq(vehicle) < 0.75 then
                testV:setAngles(vehicle:getAngleX(), vehicle:getAngleY(), vehicle:getAngleZ())
                moveMower(testV, vehicle, 0.75, 2.5);
                testV:setMass(TBData.oldMass);
                TBData.oldMass = nil                
                testV:setPhysicsActive(true)
                TBData.Loaded = false;
                return
            end
        end
    end    
end

local function LoadMenu(menu, args)
    menu:addSlice("Yes", getTexture("media/ui/emotes/thumbup_green.png"), onLoadTrailer, args[1], args[2]) 
end

local function UnloadMenu(menu, args)
    menu:addSlice("Yes", getTexture("media/ui/emotes/thumbup_green.png"), onUnloadTrailer, args[1], args[2]) 
end

VehicleMenuAPI.registerSliceOutside("LoadTrailer", function(menu, player, vehicle)
    if vehicle:getScript() and vehicle:getScriptName() == "Base.TrailerMower" then
        local TruckBed = vehicle:getPartById("TruckBed")
        local isCar = GetCartoLoad(vehicle)        
        if TruckBed then
            local TBData = TruckBed:getModData();
            if TBData ~= nil  then
                if TBData.Loaded == false or TBData.Loaded == nil then
                    if isCar ~= nil then
                        menu:addSlice("Load Mower", getTexture("media/ui/icons/LoadMower.png"), ISRadialMenu.createSubMenu, menu, LoadMenu, {player, vehicle}) 
                    end
                else
                    menu:addSlice("Unload Mower", getTexture("media/ui/icons/UnloadMower.png"), ISRadialMenu.createSubMenu, menu, UnloadMenu, {player, vehicle}) 
                end
            else
                menu:addSlice("Load Mower", getTexture("media/ui/icons/LoadMower.png"), ISRadialMenu.createSubMenu, menu, LoadMenu, {player, vehicle}) 
            end
        end
    end
end)

--load/unload from inside the towing
--VehicleMenuAPI.registerSlice("LoadTrailerInCar", function(menu, player, vehicle)
--    if vehicle == nil or vehicle:getVehicleTowing():getScript():getFullName() ~= "Base.TrailerMower" then
--        return
--    end 
--    local getTrailer = vehicle:getVehicleTowing()
--    if getTrailer:getScript() and getTrailer:getScriptName() == "Base.TrailerMower" then
--        local TruckBed = getTrailer:getPartById("TruckBed")
--        if TruckBed then
--            local TBData = TruckBed:getModData();
--            if TBData ~= nil  then
--                if TBData.Loaded == false or TBData.Loaded == nil then
--                    menu:addSlice("Load Mower", getTexture("media/ui/icons/LoadMower.png"), ISRadialMenu.createSubMenu, menu, LoadMenu, {player, getTrailer}) 
--                else
--                    menu:addSlice("Unload Mower", getTexture("media/ui/icons/UnloadMower.png"), ISRadialMenu.createSubMenu, menu, UnloadMenu, {player, getTrailer}) 
--                end
--            else
--                menu:addSlice("Load Mower", getTexture("media/ui/icons/LoadMower.png"), ISRadialMenu.createSubMenu, menu, LoadMenu, {player, getTrailer}) 
--            end
--        end
--    end
--end)
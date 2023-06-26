if not MowerTuning then MowerTuning = {} end
if not MowerTuning.Use then MowerTuning.Use = {} end

local function bresenhamAlgo(x0, y0, x1, y1)
    -- Bresenham's line algorithm
    -- It is a line drawing algorithm that determines the points of an n-dimensional raster that should be selected in order to form a close approximation to a straight line between two points.
    -- Come from https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
    local dx = x1 - x0;
    local dy = y1 - y0;
    local yi = 1;
    local xi = 1;
    if dy < 0 then
        yi = -1;
        dy = -dy;
    end
    if dx < 0 then
        xi = -1;
        dx = -dx;
    end
    local dd = 2*dy - dx;
    local y = y0;
    local squares = {}

    for x = x0, x1, xi do
        table.insert(squares, {x, y})
        if dd > 0 then
            y = y + yi;
            dd = dd + (2*(dy-dx));
        else
            dd = dd + 2*dy;
        end
    end
    return squares;
end

function angleOffset(veh, offsetAngle, length)
    local addAngle = offsetAngle
    local deltt = {}
    deltt[1] = math.sin(math.rad(addAngle))
    if math.abs(veh:getAngleZ())  > 90 then
        deltt[2] = -math.cos(math.rad(addAngle))
    else
        deltt[2] = math.cos(math.rad(addAngle))
    end
    local xxx = veh:getX()
    local yyy = veh:getY()
    xxx  = xxx + length*deltt[1]
    yyy =  yyy + length*deltt[2]
    newPos = Vector3f.new(xxx,yyy,0)
    return newPos
end

local function bIs10YLActive()
    local activeMods = getActivatedMods()
    local modIDs = {"10YL_HIGH","10YL_MEDIUM","10YL_LOW"}

    for _,mod in pairs(modIDs) do
        if activeMods:contains(mod) then
            return true
        end
    end
    
    return false
end

local tempVector = Vector3f.new()
local function MowerUpkeep(player)
    local vehicle = player.getVehicle and player:getVehicle() or nil

    if (vehicle and vehicle:getScriptName() == "Base.RidingMower") then
        local part = vehicle:getPartById("GasTank")
        if part:getCondition() < 100 then
        --    part:setCondition(100)
        end
        part = vehicle:getPartById("Engine")
        if part:getCondition() < 100 then
        --    part:setCondition(100)
        end

        --vehicle:getPartById("TireFrontLeft"):repair()
        --vehicle:getPartById("TireFrontRight"):repair()
        --vehicle:getPartById("TireRearLeft"):repair()
        --vehicle:getPartById("TireRearRight"):repair()


        part = vehicle:getPartById("DoorFrontLeft")
    	if part:getCondition() < 100 then
            part:setCondition(100)
        end

        local Blade = vehicle:getPartById("MowerBlade")
        local BladeHealth = Blade:getCondition()
        local HitDmg = 1
        local Killdmg = 2
        if BladeHealth > 0 then
        --if vehicle:getEngineSpeed() > 0 then
            local coords = {}
            local vec = vehicle:getWorldPos(-0.25, -0.25, 0, tempVector)
            coords[1] = {vec:x(), vec:y()}

            vec = vehicle:getWorldPos(0.25, 0.25, 0, tempVector)
            coords[2] = {vec:x(), vec:y()}

            vec = vehicle:getWorldPos(0.25, -0.25, 0, tempVector)
            coords[3] = {vec:x(), vec:y()}

            vec = vehicle:getWorldPos(-0.25, 0.25, 0, tempVector)
            coords[4] = {vec:x(), vec:y()}

            vec = vehicle:getWorldPos(0, 0, 0, tempVector)
            coords[5] = {vec:x(), vec:y()}

            ---
            vec = vehicle:getWorldPos(-1, 0, 0, tempVector)
            local diffx = (coords[5][1] - vec:x())/10.0
            local diffy = (coords[5][2] - vec:y())/10.0

            vec = vehicle:getWorldPos(-0.25, -0.25, 0, tempVector)
            local startBloodPoint = {vec:x(), vec:y()}
            vec = vehicle:getWorldPos(-0.25, 0.25, 0, tempVector)
            local wideDiffX = (vec:x() - startBloodPoint[1])/10.0
            local wideDiffY = (vec:y() - startBloodPoint[2])/10.0
            
            local cell = getCell()
            for _, pair in ipairs(coords) do
                local square = cell:getGridSquare(pair[1], pair[2], 0)

                local sqObjs = square:getObjects();
                local sqSize = sqObjs:size();
        
                --highlights
                if getDebug() then
                    for i = sqSize - 1, 0, -1 do
                        local obj = sqObjs:get(i)
                        obj:setHighlighted(true)        
                    end
                end
        
                local objects = square:getObjects()
                for index=0, objects:size()-1 do
                    local GrassBush = objects:get(index)

                    if GrassBush then
                        if GrassBush:getSprite() and GrassBush:getSprite():getProperties() and (GrassBush:getSprite():getProperties():Is(IsoFlagType.canBeRemoved) or GrassBush:getSprite():getProperties():Is(IsoFlagType.canBeCut)) and not luautils.stringStarts(GrassBush:getSprite():getName(), "blends_natural") then
                            --print("GrassBush = " .. tostring(GrassBush:getSprite():getName())) 
                            if isClient() then 
                                sledgeDestroy(GrassBush) 
                                --square:transmitRemoveItemFromSquare(GrassBush)    
                                vehicle:playSound("VehicleHitTree")
                            else
                                GrassBush:getSquare():RemoveTileObjectErosionNoRecalc(GrassBush)
                                vehicle:playSound("VehicleHitTree")
                            end 
                            break;                              
                        else
                            local attached = GrassBush:getAttachedAnimSprite()
                            if attached then
                                for n=1,attached:size() do
                                    local sprite = attached:get(n-1)
                                    --print("Attached = " .. tostring(sprite:getParentSprite():getName())) 
                                    if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() 
                                        and (luautils.stringStarts(sprite:getParentSprite():getName(), "blends_grassoverlays")
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "d_plants")
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "d_generic")
                                        --or luautils.stringStarts(sprite:getParentSprite():getName(), "f_wallvines")
                                        --or luautils.stringStarts(sprite:getParentSprite():getName(), "blends_natural")
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "e_newgrass")
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")                                        
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "trash_01")                                         
                                        or luautils.stringStarts(sprite:getParentSprite():getName(), "vegetation_farm"))
                                        and not luautils.stringStarts(sprite:getParentSprite():getName(), "blends_natural") then
                                        --player:Say("Attached Sprite: " .. tostring(GrassBush:getSprite():getName())) 
                                        GrassBush:RemoveAttachedAnim(n-1)
                                        GrassBush:transmitUpdatedSpriteToClients() 
                                        --GrassBush:getSquare():RemoveTileObjectErosionNoRecalc(GrassBush)
                                        --print(sprite:getParentSprite():getName())
                                        --square:transmitRemoveItemFromSquare(GrassBush)                                            
                                        vehicle:playSound("VehicleHitTree")
                                        break;
                                    end
                                end
                            end
                        end
                    end
                end
                --zombie killing
                local zombie = square:getZombie()
                if zombie and (zombie:getCurrentState() == ZombieOnGroundState.instance() or zombie:isCrawling()) then
                    vehicle:playSound("VehicleHitCharacter")
                    -- add spray here.
                    Blade:setCondition(BladeHealth - HitDmg)
                    zombie:setHealth(zombie:getHealth() - 0.05)
                end

                -- corpse removing
                local chunk =  square:getChunk()
                local angleStep = 3
                local angleStart = 0
                local angleStop = 359
                local sprayStart = 0.1
                local sprayLength = 1
                local sprayStep = 0.1
                local corpse = square:getStaticMovingObjects()

                for index=corpse:size()-1, 0, -1 do 
                    local isCorpse = corpse:get(index)
                    if instanceof(isCorpse, "IsoDeadBody") then
                        --for i = 1,20 do
                        --    addBloodSplat(square, ZombRand(100));
                        --end
                        Blade:setCondition(BladeHealth - Killdmg)
                        for a = angleStart, angleStop, angleStep do
                            for o = sprayStart, sprayLength, sprayStep do
                                local pos = angleOffset(vehicle, a, o)
                                chunk:addBloodSplat(pos:x(), pos:y() , pos:z() ,ZombRand(100))
                            end
                        end


                        --for ii = 1, 10 do
                        --    vehicle:playSound("VehicleHitCharacter")
                        --    for jj = 1, 20 do
                        --        --print("X" .. startBloodPoint[1] + ii*wideDiffX + jj*diffx .. "Y" .. startBloodPoint[2] + ii*wideDiffY + jj*diffy)
                        --        square:getChunk():addBloodSplat(startBloodPoint[1] + ii*wideDiffX - jj*diffx, startBloodPoint[2] + ii*wideDiffY - jj*diffy, 0, ZombRand(100))
                        --    end
                        --end
                        square:removeCorpse(isCorpse, false);
                        vehicle:playSound("HeadSmash");
                    end
                end
            end
        end
    end
end

Events.OnPlayerUpdate.Add(MowerUpkeep)


local function info()
    local dir = getDir(MOD_ID)
end
Events.OnInitWorld.Add(info)

local function onWeaponHitCharacter(attacker, player, weapon, damage)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "RidingMower" )) then
        player:setAvoidDamage(true)
    end
end
Events.OnWeaponHitCharacter.Add(onWeaponHitCharacter)


function MowerTuning.Use.Door(vehicle, part, character)
    for seat=0,vehicle:getMaxPassengers()-1 do
        if vehicle:getPassengerDoor(seat) == part then
            if not vehicle:getCharacter(seat) then
                ISVehicleMenu.onEnter(character, vehicle, seat)
                break
            end
        end
        if vehicle:getPassengerDoor2(seat) == part then
            if not vehicle:getCharacter(seat) then
                ISVehicleMenu.onEnter(character, vehicle, seat)
                break
            end
        end
    end
end
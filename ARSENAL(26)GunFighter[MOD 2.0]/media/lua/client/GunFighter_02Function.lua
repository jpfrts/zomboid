--------------------------------------------------------------------------
--  DISTANCE UTILITY FROM SUPERB-SURVIVORS (by Nolan Richie)			--
--------------------------------------------------------------------------
function getDistanceBetween(z1,z2)
	if(z1 == nil) or (z2 == nil) then
		return -1
	end
	local	z1x = z1:getX();
	local	z1y = z1:getY();
	local	z2x = z2:getX();
	local	z2y = z2:getY();
	local	dx = z1x - z2x
	local	dy = z1y - z2y
	return	math.sqrt ( dx * dx + dy * dy )
end

--------------------------------------------------------------------------
--  DEBUG MESSAGE LEVEL													--
--------------------------------------------------------------------------
function DebugSay(lvl,text)
	local	level = (GUNFIGHTER.OPTIONS.options.dropdown17)
	if	(lvl <= level) then
		getSpecificPlayer(0):addLineChatElement(text)
	--	getSpecificPlayer(0):Say(text)
	--	getTextManager():DrawString(UIFont.Medium, 100, 100, text, 1, 1, 1, 1.0);
	end
end

--------------------------------------------------------------------------
--  SEE IF TARGET IS FACING AWAY										--
--------------------------------------------------------------------------
function isFacingAway(player, target)
	local	dir		= player:getDirectionAngle()
	local	zdir	= target:getDirectionAngle()
	local	Facing	= nil
	local	zFacing	= nil
	local	away	= false

	if 		(dir <= -157.5)	or	(dir > 157.5) then
			Facing = "W"
	elseif	(dir > -157.5)	and	(dir <= -112.5) then
			Facing = "NW"
	elseif	(dir > -112.5)	and	(dir <= -67.5) then
			Facing = "N"		
	elseif	(dir > -67.5)	and	(dir <= -22.5) then
			Facing = "NE"
	elseif	(dir > -22.5)	and	(dir <= 22.5) then
			Facing = "E"
	elseif	(dir > 22.5)	and	(dir <= 67.5) then
			Facing = "SE"
	elseif	(dir > 67.5)	and	(dir <= 112.5) then
			Facing = "S"
	elseif	(dir > 112.5)	and	(dir <= 157.5) then
			Facing = "SW"
	end

	if 		(zdir <= -157.5)	or	(zdir > 157.5) then
			zFacing = "W"				
	elseif	(zdir > -157.5)	and	(zdir <= -112.5) then
			zFacing = "NW"			
	elseif	(zdir > -112.5)	and	(zdir <= -67.5) then
			zFacing = "N"		
	elseif	(zdir > -67.5)	and	(zdir <= -22.5) then
			zFacing = "NE"	
	elseif	(zdir > -22.5)	and	(zdir <= 22.5) then
			zFacing = "E"
	elseif	(zdir > 22.5)	and	(zdir <= 67.5) then
			zFacing = "SE"
	elseif	(zdir > 67.5)	and	(zdir <= 112.5) then
			zFacing = "S"
	elseif	(zdir > 112.5)	and	(zdir <= 157.5) then
			zFacing = "SW"
	end

	if		target:isOnFloor() == true then
		if	target:isFallOnFront() == true then
			--	DebugSay(2,"FALLEN FRONT")
				away = true
		else	--	DebugSay(2,"FALLEN BACK")
				away = false
		end
	elseif	Facing == "W"	and (zFacing == "W" or zFacing == "SW" or zFacing == "NW") then
			away = true
	elseif	Facing == "E"	and (zFacing == "E" or zFacing == "SE" or zFacing == "NE") then
			away = true
	elseif	Facing == "N"	and (zFacing == "N" or zFacing == "NE" or zFacing == "NW") then
			away = true
	elseif	Facing == "S"	and (zFacing == "S" or zFacing == "SW" or zFacing == "SE") then
			away = true
	elseif	Facing == "NW"	and (zFacing == "NW" or zFacing == "N" or zFacing == "W") then
			away = true
	elseif	Facing == "NE"	and (zFacing == "NE" or zFacing == "N" or zFacing == "E") then
			away = true
	elseif	Facing == "SW"	and (zFacing == "SW" or zFacing == "S" or zFacing == "W") then
			away = true
	elseif	Facing == "SE"	and (zFacing == "SE" or zFacing == "S" or zFacing == "E") then
			away = true
	end

	return	away
end

--------------------------------------------------------------------------
--  CHECK FOR LAUNCHER	INCLUDES ROCKETS AND FLAREGUN					--
--------------------------------------------------------------------------
function isLauncher(weapon)
	if	(weapon:getAmmoType() == "Base.40HERound") or
		(weapon:getAmmoType() == "Base.40INCRound") or
		(weapon:getAmmoType() == "Base.HERocket") or
		(weapon:getAmmoType() == "Base.Flare") then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR ROCKET OR MISSLE ONLY										--
--------------------------------------------------------------------------
function isRocket(weapon)
	if		(weapon:getAmmoType() == "Base.HERocket") then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR FLAME THROWER OR LIQUID WEAPON							--
--------------------------------------------------------------------------
function isFlamer(weapon)
	if		(weapon:getAmmoType() == "Base.FlameFuel") or (weapon:getAmmoType() == "Base.WaterAmmo") then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR EXTINGUISHER												--
--------------------------------------------------------------------------
function isExtinguisher(weapon)
	if		(weapon:getAmmoType() == "Base.Smoke") or (weapon:getAmmoType() == "Base.PB68") then
			return true
	else	return false
	end
end


--------------------------------------------------------------------------
--  CHECK FOR BOW														--
--------------------------------------------------------------------------
function isBow(weapon)
	if		(weapon:getAmmoType() == "Base.Bolt_Bear") or
			(weapon:getAmmoType() == "Base.Arrow_Fiberglass") or
			(weapon:getAmmoType() == "Base.CrossbowBolt") or
			(weapon:getAmmoType() == "Base.CrossbowBoltLarge") or
			(weapon:getAmmoType() == "Base.WoodenBolt") or
			(weapon:getAmmoType() == "Base.SlingShotAmmo_Rock") or
			(weapon:getAmmoType() == "Base.SlingShotAmmo_Marble") then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR BB-GUN													--
--------------------------------------------------------------------------
function isBBGun(weapon)
	if		(weapon:getAmmoType() == "Base.BB177")  or (weapon:getAmmoType() == "Base.PB68") then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR SHOTGUN 													--
--------------------------------------------------------------------------
function isShotgun(weapon)
	if		(weapon:getAmmoType() == "Base.410gShotgunShells")	or
			(weapon:getAmmoType() == "Base.20gShotgunShells")	or
			(weapon:getAmmoType() == "Base.ShotgunShells")		or
			(weapon:getAmmoType() == "Base.10gShotgunShells")	or
			(weapon:getAmmoType() == "Base.4gShotgunShells")	then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR ALTERNATE LOADING METHOD									--
--------------------------------------------------------------------------
function canUseClip(weapon)
	if		(weapon:getModData().ClipType ~= nil) then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR SUPPRESSION												--
--------------------------------------------------------------------------
function isSuppressed(weapon)
	local	scriptItem = weapon:getScriptItem()
	local	canon = weapon:getCanon()
	if		(canon) and (string.find(canon:getType(), "Suppressor") or string.find(canon:getType(), "Linear")) then
			return true
	elseif	(string.find(scriptItem:getSwingSound(), "SD")) then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR COMP OR MUZZLE BRAKE										--
--------------------------------------------------------------------------
function isCompensated(weapon)
	local	scriptItem = weapon:getScriptItem()
	local	canon = weapon:getCanon()
	if		(canon) and (string.find(canon:getType(), "Compensator") or string.find(canon:getType(), "Brake") or string.find(canon:getType(), "Linear")) then
			return true
	elseif	weapon:hasTag("Comp") then
			return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR INSERTED MAG												--
--------------------------------------------------------------------------
function showMag(weapon)
	local	clip		= weapon:getClip()
	local	Std			= weapon:getModData().MagType
	local	Ext  		= weapon:getModData().ExtMagType
	local	Drum 		= weapon:getModData().DrumMagType
	local	Loaded		= weapon:isContainsClip()
	local	TempLoaded	= weapon:getModData().TempContainsClip
	local	Type		= weapon:getMagazineType()

	if	weapon:hasTag("DualMag") then
		Loaded		= weapon:getModData().TempContainsClip
		Type		= weapon:getModData().TempMagType
		Ext			= weapon:getModData().TempExtMagType
		Drum		= weapon:getModData().TempDrumMagType
	end

	----------------------------------
	--	FOR EVERYTHING ELSE			--
	----------------------------------
--	if	weapon:hasTag("Rocket") or weapon:hasTag("DualMag") then		-- Workaround for ROCKET LAUNCHER
	if	weapon:hasTag("Rocket") then									-- Workaround for ROCKET LAUNCHER ONLY
--		DebugSay(2,"Skip Visible Mag")
--	if	(isLauncher(weapon)) then				-- Workaround for K11
--		DebugSay(3,"Launcher - Skip Visible Mag")
	elseif 	Loaded == true or TempLoaded == true then
			if		Ext ~= nil and Type == Ext then	MagPart = InventoryItemFactory.CreateItem('Extended_Mag');
			elseif	Drum ~= nil and Type == Drum then	MagPart = InventoryItemFactory.CreateItem('Drum_Mag');
			elseif	Type ~= nil then				MagPart = InventoryItemFactory.CreateItem('Standard_Mag');
			elseif	Std ~= nil then				MagPart = InventoryItemFactory.CreateItem('Standard_Mag');
 			end
			if		MagPart and clip == nil then
					weapon:attachWeaponPart(MagPart)
--					weapon:setWeaponPart("Mag",MagPart)
			end
	elseif	clip ~= nil then
			if		Ext ~= nil and (string.find(clip:getType(), "Extended_Mag")) then
					weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--					weapon:setWeaponPart("Mag",nil)
			elseif	Drum ~= nil and (string.find(clip:getType(), "Drum_Mag")) then
					weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--					weapon:setWeaponPart("Mag",nil)
			elseif	Type ~= nil and (string.find(clip:getType(), "Standard_Mag")) then
					weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--					weapon:setWeaponPart("Mag",nil)
			end
	end

	----------------------------------
	--	FOR DUAL MAG				--
	----------------------------------





	----------------------------------
	--	FOR ROCKET LAUNCHERS		--
	----------------------------------
	if	weapon:hasTag("Rocket") then
		if	(weapon:getCurrentAmmoCount() > 0) then
			MagPart = InventoryItemFactory.CreateItem('Standard_Mag');
			if MagPart then
				weapon:attachWeaponPart(MagPart)
			end
		else	weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
		end
	end

end


--------------------------------------------------------------------------
--  HOTBAR AFTER TRANSFORM FOR KBM PLAYERS (NO HOTBAR W/GAMEPAD)		--
--------------------------------------------------------------------------
function checkHotbar(player, weapon, result, time)

	player:getModData().TempSprite = result:getWeaponSprite()					-- STORE THIS FOR LATER
	player:getModData().TimeSprite = time + 8

	ISTimedActionQueue.add(ISManipulateFirearm:new(player, weapon, result, time))

--	if	(weapon) and ((weapon:hasTag("Flex")) or (isBow(weapon)) or (isLauncher(weapon)) or (isFlamer(weapon))) then
--		local Hotbar = getPlayerHotbar(0)
--		if Hotbar ~= nil then						-- APPLY FOR GAMEPAD TOO
--			local W_slot = weapon:getAttachedSlot()
--			local slot = Hotbar.availableSlot[W_slot]
--			if (slot) and (result) and (not Hotbar:isInHotbar(result)) and (Hotbar:canBeAttached(slot, result)) then
--				Hotbar:removeItem(weapon, false)
--				Hotbar:attachItem(result, slot.def.attachments[result:getAttachmentType()], W_slot, slot.def, false)	
--			end
--		else	DebugSay (3,"Hotbar - N/A")
--		end
--	else	ISTimedActionQueue.add(ISManipulateFirearm:new(player, weapon, result, time))
--	end
end


--------------------------------------------------------------------------
--  CHECK IF ITEM IS MAGAZINE FOR COMPAT W/SORTING MODS					--
--------------------------------------------------------------------------
function isMagazine(item)
	if	(item:getDisplayCategory() == "GunMag") then
		DebugSay(3,"StandardCategory")
		return true
	elseif	(item:getDisplayCategory() == "FixedMag") then
		DebugSay(3,"StandardCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepFAmmo_C") then
		DebugSay(3,"OnMineCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepAmmoMag") then
		DebugSay(3,"BetterSortCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepAmmoMagF") then
		DebugSay(3,"BetterSortCategory")
		return true
	else	return false
	end
end


----------------------------------------------------------------------------------
--  GET BOUNCE CHANCE OF PROJECTILES											--
----------------------------------------------------------------------------------
function getBounce(projectile)
	local	value = 0

	if		projectile == "Bolt_Bear"				then	value = 0	-- ALWAYS STICK
	elseif	projectile == "Arrow_Fiberglass"		then	value = 0	-- ALWAYS STICK
	elseif	projectile == "ThrowingKnife_Thrown"	then	value = 1
	elseif	projectile == "NinjaStar"				then	value = 1
	elseif	projectile == "SpearCrafted_Thrown"		then	value = 2
	elseif	projectile == "Tactical_Axe_Thrown"		then	value = 2
	elseif	projectile == "HuntingKnife_Thrown"		then	value = 3
	elseif	projectile == "RamboKnife_Thrown"		then	value = 3
	elseif	projectile == "SlingShotAmmo_Marble"	then	value = 3
	elseif	projectile == "HandAxe_Thrown"			then	value = 4
	elseif	projectile == "MeatCleaver_Thrown"		then	value = 4
	elseif	projectile == "RussianMachete_Thrown"	then	value = 4
	elseif	projectile == "KitchenKnife_Thrown"		then	value = 5
	elseif	projectile == "GardenFork_Thrown"		then	value = 5
	elseif	projectile == "SlingShotAmmo_Rock"		then	value = 6
	end
	return	value
end

function getBounceSound(projectile)
	local	value = "Unstuckkitchenknife"		-- THIS SOUND MEANS NOT ON LIST
	local	proj = projectile

--	PUT AMMO ITEMS ON TOP OF LIST
	if		proj == "Base.Bolt_Bear"				then	value = "PZ_FootSteps_Concrete_02"
	elseif	proj == "Base.Arrow_Fiberglass"			then	value = "PZ_FootSteps_Concrete_02"
	elseif	proj == "Base.Bolt_Bear_Broken"			then	value = "Arrow_Break"
	elseif	proj == "Base.Arrow_Fiberglass_Broken"	then	value = "Arrow_Break"
	elseif	proj == "Base.SlingShotAmmo_Marble"		then	value = "PZ_FootSteps_Concrete_04"
	elseif	proj == "Base.SlingShotAmmo_Rock"		then	value = "PZ_FootSteps_Concrete_04"

--	THEN PUT THROWN (WEAPON TYPE) ITEMS BELOW
	else		proj 	= proj:getType()
		if		proj == "HandAxe_Thrown"			then	value = "bathit"			-- HEAVY WEIGHT
		elseif	proj == "MeatCleaver_Thrown"		then	value = "bathit"			-- HEAVY WEIGHT
		elseif	proj == "RussianMachete_Thrown"		then	value = "bathit"			-- HEAVY WEIGHT
		elseif	proj == "Tactical_Axe_Thrown"		then	value = "bathit"			-- HEAVY WEIGHT
		elseif	proj == "RamboKnife_Thrown"			then	value = "bathit"			-- HEAVY WEIGHT
		elseif	proj == "KitchenKnife_Thrown"		then	value = "PZ_ChopTree1"		-- LIGHTER WEIGHT
		elseif	proj == "HuntingKnife_Thrown"		then	value = "PZ_WoodFoot_05"	-- MEDIUM WEIGHT
		elseif	proj == "ThrowingKnife_Thrown"		then	value = "PZ_MetalSnap"		-- ALL METAL ITEM
		elseif	proj == "NinjaStar"					then	value = "PZ_MetalSnap"		-- ALL METAL ITEM
		elseif	proj == "SpearCrafted_Thrown"		then	value = "Pole_Bounce"
		elseif	proj == "GardenFork_Thrown"			then	value = "foottile1"
		end
	end

	DebugSay(3,"Bounce Sound - "..tostring(proj))
	return	value
end


----------------------------------------------------------------------------------
--  GET STOP-POWER RETURNS A VALUE BASED ON BULLET TYPE FOR VANILLA FUNCTIONS	--
--  NOT SURE WHAT FUNCTIONS THEY MIGHT BE, BUT HERE IT IS ANYWAYS				--
----------------------------------------------------------------------------------
function getStoppingPower(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = 0

	if		ammo == "Base.BB177"				then	value = 0
	elseif	ammo == "Base.PB68"					then	value = 0
	elseif 	ammo == "Base.SlingShotAmmo_Rock"	then	value = 1
	elseif 	ammo == "Base.SlingShotAmmo_Marble" then	value = 1
	elseif 	ammo == "Base.Bolt_Bear"			then	value = 4
	elseif 	ammo == "Base.Arrow_Fiberglass"		then	value = 5
	elseif 	ammo == "Base.Bullets22"			then	value = 1
	elseif 	ammo == "Base.Bullets57"			then	value = 4
	elseif	ammo == "Base.Bullets380"			then	value = 3
	elseif	ammo == "Base.Bullets38"			then	value = 5	-- Vanilla says 5
	elseif	ammo == "Base.Bullets9mm"			then	value = 5	-- Vanilla says 5 Pistol1
	elseif	ammo == "Base.Bullets45"			then	value = 7	-- Vanilla says 9 RevMed 7 1911
	elseif	ammo == "Base.Bullets357"			then	value = 9
	elseif	ammo == "Base.Bullets45LC"			then	value = 10
	elseif	ammo == "Base.Bullets44"			then	value = 12	-- Vanilla says 12 RevLong 9 DE
	elseif	ammo == "Base.Bullets50MAG"			then	value = 18
	elseif	ammo == "Base.Bullets4570"			then	value = 20
	elseif	ammo == "Base.223Bullets"			then	value = 6	-- Vanilla says 15 for Varmint
	elseif	ammo == "Base.556Bullets"			then	value = 6	-- Vanilla says 2 for Assault2, 20 Hunting
	elseif	ammo == "Base.545x39Bullets"		then	value = 7
	elseif	ammo == "Base.762x39Bullets"		then	value = 8
	elseif	ammo == "Base.308Bullets"			then	value = 10	-- Vanilla says 2 for Assault2
	elseif	ammo == "Base.762x51Bullets"		then	value = 10
	elseif	ammo == "Base.762x54rBullets"		then	value = 11
	elseif	ammo == "Base.3006Bullets"			then	value = 12
	elseif	ammo == "Base.410gShotgunShells"	then	value = 12
	elseif	ammo == "Base.20gShotgunShells"		then	value = 16
	elseif	ammo == "Base.ShotgunShells"		then	value = 20	-- Vanilla says 20/40 for Double
	elseif	ammo == "Base.10gShotgunShells"		then	value = 24
	elseif	ammo == "Base.4gShotgunShells"		then	value = 30
	elseif	ammo == "Base.50BMGBullets"			then	value = 40
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET autoShootSpeed RETURNS A VALUE BASED ON BULLET TYPE FOR AUTO ROF		--
--  																			--
----------------------------------------------------------------------------------
function getROF(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = 0

	if		ammo == "Base.BB177"				then	value = 8
	elseif 	ammo == "Base.PB68"					then	value = 7
	elseif 	ammo == "Base.Bullets22"			then	value = 8
	elseif 	ammo == "Base.Bullets57"			then	value = 7
	elseif	ammo == "Base.Bullets380"			then	value = 7
	elseif	ammo == "Base.Bullets38"			then	value = 6
	elseif	ammo == "Base.Bullets9mm"			then	value = 6
	elseif	ammo == "Base.Bullets45"			then	value = 5
	elseif	ammo == "Base.Bullets357"			then	value = 5
	elseif	ammo == "Base.Bullets45LC"			then	value = 4
	elseif	ammo == "Base.Bullets44"			then	value = 4
	elseif	ammo == "Base.Bullets50MAG"			then	value = 4
	elseif	ammo == "Base.Bullets4570"			then	value = 4
	elseif	ammo == "Base.223Bullets"			then	value = 5
	elseif	ammo == "Base.556Bullets"			then	value = 5
	elseif	ammo == "Base.545x39Bullets"		then	value = 5
	elseif	ammo == "Base.762x39Bullets"		then	value = 4
	elseif	ammo == "Base.308Bullets"			then	value = 3
	elseif	ammo == "Base.762x51Bullets"		then	value = 3
	elseif	ammo == "Base.762x54rBullets"		then	value = 3
	elseif	ammo == "Base.3006Bullets"			then	value = 3
	elseif	ammo == "Base.410gShotgunShells"	then	value = 3
	elseif	ammo == "Base.20gShotgunShells"		then	value = 2
	elseif	ammo == "Base.ShotgunShells"		then	value = 2
	elseif	ammo == "Base.10gShotgunShells"		then	value = 1
	elseif	ammo == "Base.4gShotgunShells"		then	value = 1
	elseif	ammo == "Base.50BMGBullets"			then	value = 1
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET RECOIL SHOCK RETURNS A VALUE BASED ON TYPE OF BULLET FIRED FOR VARIOUS	--
--  FUNCTIONS SUCH AS ATTACHMENT BREAKAGE.										--
----------------------------------------------------------------------------------
function getShockValue(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = 0

	if		ammo == "Base.BB177"				then	value = 0
	elseif 	ammo == "Base.PB68"					then	value = 0
	elseif	ammo == "Base.Bullets22"			then	value = 1
	elseif	ammo == "Base.Bullets57"			then	value = 2
	elseif	ammo == "Base.Bullets380"			then	value = 2
	elseif	ammo == "Base.Bullets38"			then	value = 3
	elseif	ammo == "Base.Bullets9mm"			then	value = 3
	elseif	ammo == "Base.Bullets45"			then	value = 4
	elseif	ammo == "Base.Bullets357"			then	value = 5
	elseif	ammo == "Base.Bullets45LC"			then	value = 5.5
	elseif	ammo == "Base.Bullets44"			then	value = 6
	elseif	ammo == "Base.Bullets50MAG"			then	value = 6.3
	elseif	ammo == "Base.Bullets4570"			then	value = 6.5
	elseif	ammo == "Base.223Bullets"			then	value = 4
	elseif	ammo == "Base.556Bullets"			then	value = 4
	elseif	ammo == "Base.545x39Bullets"		then	value = 5
	elseif	ammo == "Base.762x39Bullets"		then	value = 6
	elseif	ammo == "Base.308Bullets"			then	value = 8
	elseif	ammo == "Base.762x51Bullets"		then	value = 8
	elseif	ammo == "Base.762x54rBullets"		then	value = 8
	elseif	ammo == "Base.3006Bullets"			then	value = 8.5
	elseif	ammo == "Base.410gShotgunShells"	then	value = 6.5
	elseif	ammo == "Base.20gShotgunShells"		then	value = 7.5
	elseif	ammo == "Base.ShotgunShells"		then	value = 8
	elseif	ammo == "Base.10gShotgunShells"		then	value = 9
	elseif	ammo == "Base.4gShotgunShells"		then	value = 10
	elseif	ammo == "Base.50BMGBullets"			then	value = 10
	elseif	ammo == "Base.SlingShotAmmo_Marble"	then	value = 0
	elseif	ammo == "Base.SlingShotAmmo_Rock"	then	value = 0
	elseif	ammo == "Base.Bolt_Bear"			then	value = 1
	elseif	ammo == "Base.Arrow_Fiberglass"		then	value = 1
	end
	return	value
end


----------------------------------------------------------------------------------
--  GET SUPPRESS FACTOR															--
----------------------------------------------------------------------------------
function getSuppressFactor(weapon)
	local 	canon = weapon:getCanon()
	local	ammo = weapon:getAmmoType()
	local	junk = 0
	local	value = 0

	if	(canon) then
		if	(string.find(canon:getType(), "Oil")) then junk = 0.1
		elseif	(string.find(canon:getType(), "Bottle")) then junk = 0.2
		elseif	(string.find(canon:getType(), "Linear")) then junk = 0.5
		end
	end

	if		ammo == "Base.BB177"				then	value = 0.35
	elseif 	ammo == "Base.PB68"					then	value = 0.35
	elseif 	ammo == "Base.Bullets22"			then	value = 0.4
	elseif 	ammo == "Base.Bullets57"			then	value = 0.4
	elseif	ammo == "Base.Bullets380"			then	value = 0.41
	elseif	ammo == "Base.Bullets38"			then	value = 0.42
	elseif	ammo == "Base.Bullets9mm"			then	value = 0.42
	elseif	ammo == "Base.Bullets45"			then	value = 0.44
	elseif	ammo == "Base.Bullets357"			then	value = 0.44
	elseif	ammo == "Base.Bullets45LC"			then	value = 0.45
	elseif	ammo == "Base.Bullets44"			then	value = 0.45
	elseif	ammo == "Base.Bullets50MAG"			then	value = 0.45
	elseif	ammo == "Base.Bullets4570"			then	value = 0.45
	elseif	ammo == "Base.223Bullets"			then	value = 0.4
	elseif	ammo == "Base.556Bullets"			then	value = 0.4
	elseif	ammo == "Base.545x39Bullets"		then	value = 0.4
	elseif	ammo == "Base.762x39Bullets"		then	value = 0.4
	elseif	ammo == "Base.308Bullets"			then	value = 0.4
	elseif	ammo == "Base.762x51Bullets"		then	value = 0.4
	elseif	ammo == "Base.762x54rBullets"		then	value = 0.4
	elseif	ammo == "Base.3006Bullets"			then	value = 0.4
	elseif	ammo == "Base.410gShotgunShells"	then	value = 0.4
	elseif	ammo == "Base.20gShotgunShells"		then	value = 0.4
	elseif	ammo == "Base.ShotgunShells"		then	value = 0.4
	elseif	ammo == "Base.10gShotgunShells"		then	value = 0.4
	elseif	ammo == "Base.4gShotgunShells"		then	value = 0.4
	elseif	ammo == "Base.50BMGBullets"			then	value = 0.25
	end
	return	value + junk
end

----------------------------------------------------------------------------------
--  GET AMMO NAME INSTEAD OF ITEM NAME											--
----------------------------------------------------------------------------------
function getAmmoName(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = "none"

	if		ammo == "Base.BB177"				then	value = ".177 bb"
	elseif 	ammo == "Base.PB68"					then	value = ".68 PB"	
	elseif 	ammo == "Base.Bullets22"			then	value = ".22 lr"
	elseif 	ammo == "Base.Bullets57"			then	value = "5.7x28mm"
	elseif	ammo == "Base.Bullets380"			then	value = ".380 ACP"
	elseif	ammo == "Base.Bullets38"			then	value = ".38 Spc"
	elseif	ammo == "Base.Bullets9mm"			then	value = "9x19mm"
	elseif	ammo == "Base.Bullets45"			then	value = ".45 ACP"
	elseif	ammo == "Base.Bullets357"			then	value = ".357 Mag"
	elseif	ammo == "Base.Bullets45LC"			then	value = ".45 LC"
	elseif	ammo == "Base.Bullets44"			then	value = ".44 Mag"
	elseif	ammo == "Base.Bullets50MAG"			then	value = ".50 Mag"
	elseif	ammo == "Base.Bullets4570"			then	value = ".45-70 Gov"
	elseif	ammo == "Base.223Bullets"			then	value = ".223 Rem"
	elseif	ammo == "Base.556Bullets"			then	value = "5.56x45mm"
	elseif	ammo == "Base.545x39Bullets"		then	value = "5.45x39mm"
	elseif	ammo == "Base.762x39Bullets"		then	value = "7,62x39mm"
	elseif	ammo == "Base.308Bullets"			then	value = ".308 Win"
	elseif	ammo == "Base.762x51Bullets"		then	value = "7.62x51mm"
	elseif	ammo == "Base.762x54rBullets"		then	value = "7.62x54mm R"
	elseif	ammo == "Base.3006Bullets"			then	value = ".30-06 Spg"
	elseif	ammo == "Base.410gShotgunShells"	then	value = "410g Shot"
	elseif	ammo == "Base.20gShotgunShells"		then	value = "20g Shot"
	elseif	ammo == "Base.ShotgunShells"		then	value = "12g Shot"
	elseif	ammo == "Base.10gShotgunShells"		then	value = "10g Shot"
	elseif	ammo == "Base.4gShotgunShells"		then	value = "4g Shot"
	elseif	ammo == "Base.50BMGBullets"			then	value = ".50 BMG"
	elseif	ammo == "Base.40HERound"			then	value = "HE-Round"
	elseif	ammo == "Base.40INCRound"			then	value = "INC-Round"
	elseif	ammo == "Base.Flare"				then	value = "Flare Round"
	elseif	ammo == "Base.SlingShotAmmo_Marble"	then	value = "Marble"
	elseif	ammo == "Base.SlingShotAmmo_Rock"	then	value = "Rock"
	elseif	ammo == "Base.Bolt_Bear"			then	value = "BearX Crossbow Bolt"
	elseif	ammo == "Base.Arrow_Fiberglass"		then	value = "Fiberglass Arrow"
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET AMMO CASE TYPE															--
----------------------------------------------------------------------------------
function getAmmoCase(ammo)
	local	value = "none"

	if		ammo == "Base.BB177"				then	value = nil
	elseif 	ammo == "Base.PB68"					then	value = nil
	elseif	ammo == "Base.Bullets22"			then	value = "Base.Brass22"
	elseif	ammo == "Base.Bullets57"			then	value = "Base.Brass57"	-- FIX FROM 57x28 typo
	elseif	ammo == "Base.Bullets380"			then	value = "Base.Brass380"
	elseif	ammo == "Base.Bullets38"			then	value = "Base.Brass38"
	elseif	ammo == "Base.Bullets9mm"			then	value = "Base.Brass9"
	elseif	ammo == "Base.Bullets45"			then	value = "Base.Brass45"
	elseif	ammo == "Base.Bullets357"			then	value = "Base.Brass357"
	elseif	ammo == "Base.Bullets45LC"			then	value = "Base.Brass45LC"
	elseif	ammo == "Base.Bullets44"			then	value = "Base.Brass44"
	elseif	ammo == "Base.Bullets50MAG"			then	value = "Base.Brass50MAG"
	elseif	ammo == "Base.Bullets4570"			then	value = "Base.Brass4570"
	elseif	ammo == "Base.223Bullets"			then	value = "Base.Brass223"
	elseif	ammo == "Base.556Bullets"			then	value = "Base.Brass556"
	elseif	ammo == "Base.545x39Bullets"		then	value = "Base.Brass545x39"
	elseif	ammo == "Base.762x39Bullets"		then	value = "Base.Brass762x39"
	elseif	ammo == "Base.308Bullets"			then	value = "Base.Brass308"
	elseif	ammo == "Base.762x51Bullets"		then	value = "Base.Brass762x51"
	elseif	ammo == "Base.762x54rBullets"		then	value = "Base.Brass762x54r"
	elseif	ammo == "Base.3006Bullets"			then	value = "Base.Brass3006"
	elseif	ammo == "Base.410gShotgunShells"	then	value = "Base.Hull410g"
	elseif	ammo == "Base.20gShotgunShells"		then	value = "Base.Hull20g"
	elseif	ammo == "Base.ShotgunShells"		then	value = "Base.Hull12g"
	elseif	ammo == "Base.10gShotgunShells"		then	value = "Base.Hull10g"
	elseif	ammo == "Base.4gShotgunShells"		then	value = "Base.Hull4g"
	elseif	ammo == "Base.50BMGBullets"			then	value = "Base.Brass50BMG"
	elseif	ammo == "Base.40HERound"			then	value = nil
	elseif	ammo == "Base.40INCRound"			then	value = nil
	elseif	ammo == "Base.Flare"				then	value = "Base.Hull12g"
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET AMMO PRIMER TYPE	SM - LG	- SG 										--
----------------------------------------------------------------------------------
function getAmmoPrimer(ammo)
	local	value = "none"

	if		ammo == "Base.BB177"				then	value = nil
	elseif 	ammo == "Base.PB68"					then	value = nil
	elseif	ammo == "Base.Bullets22"			then	value = nil
	elseif	ammo == "Base.Bullets57"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets380"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets38"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets9mm"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets45"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets357"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets45LC"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets44"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.Bullets50MAG"			then	value = "Base.PrimerLG"
	elseif	ammo == "Base.Bullets4570"			then	value = "Base.PrimerLG"
	elseif	ammo == "Base.223Bullets"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.556Bullets"			then	value = "Base.PrimerSM"
	elseif	ammo == "Base.545x39Bullets"		then	value = "Base.PrimerLG"
	elseif	ammo == "Base.762x39Bullets"		then	value = "Base.PrimerLG"
	elseif	ammo == "Base.308Bullets"			then	value = "Base.PrimerLG"
	elseif	ammo == "Base.762x51Bullets"		then	value = "Base.PrimerLG"
	elseif	ammo == "Base.762x54rBullets"		then	value = "Base.PrimerLG"
	elseif	ammo == "Base.3006Bullets"			then	value = "Base.PrimerLG"
	elseif	ammo == "Base.410gShotgunShells"	then	value = "Base.PrimerSG"
	elseif	ammo == "Base.20gShotgunShells"		then	value = "Base.PrimerSG"
	elseif	ammo == "Base.ShotgunShells"		then	value = "Base.PrimerSG"
	elseif	ammo == "Base.10gShotgunShells"		then	value = "Base.PrimerSG"
	elseif	ammo == "Base.4gShotgunShells"		then	value = "Base.PrimerSG"
	elseif	ammo == "Base.50BMGBullets"			then	value = "Base.PrimerLG"
	elseif	ammo == "Base.40HERound"			then	value = nil
	elseif	ammo == "Base.40INCRound"			then	value = nil
	elseif	ammo == "Base.Flare"				then	value = "Base.PrimerSG"
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET AMMO LEAD TYPE	57 - 38	- 9 - 45 - 44 etc								--
----------------------------------------------------------------------------------
function getAmmoLead(ammo)
	local	value = "none"

	if		ammo == "Base.Bullets22"			then	value = nil
	elseif 	ammo == "Base.PB68"					then	value = nil
	elseif	ammo == "Base.Bullets57"			then	value = "Base.Lead57"
	elseif	ammo == "Base.Bullets380"			then	value = "Base.Lead9"
	elseif	ammo == "Base.Bullets38"			then	value = "Base.Lead38"
	elseif	ammo == "Base.Bullets9mm"			then	value = "Base.Lead9"
	elseif	ammo == "Base.Bullets45"			then	value = "Base.Lead45"
	elseif	ammo == "Base.Bullets357"			then	value = "Base.Lead38"
	elseif	ammo == "Base.Bullets45LC"			then	value = "Base.Lead45"
	elseif	ammo == "Base.Bullets44"			then	value = "Base.Lead44"
	elseif	ammo == "Base.Bullets50MAG"			then	value = "Base.Lead50"
	elseif	ammo == "Base.Bullets4570"			then	value = "Base.Lead45"
	elseif	ammo == "Base.223Bullets"			then	value = "Base.Lead556"
	elseif	ammo == "Base.556Bullets"			then	value = "Base.Lead556"
	elseif	ammo == "Base.545x39Bullets"		then	value = "Base.Lead545"
	elseif	ammo == "Base.762x39Bullets"		then	value = "Base.Lead30"
	elseif	ammo == "Base.308Bullets"			then	value = "Base.Lead30"
	elseif	ammo == "Base.762x51Bullets"		then	value = "Base.Lead30"
	elseif	ammo == "Base.762x54rBullets"		then	value = "Base.Lead30"
	elseif	ammo == "Base.3006Bullets"			then	value = "Base.Lead30"
	elseif	ammo == "Base.410gShotgunShells"	then	value = "Base.Lead00Buck"
	elseif	ammo == "Base.20gShotgunShells"		then	value = "Base.Lead00Buck"
	elseif	ammo == "Base.ShotgunShells"		then	value = "Base.Lead00Buck"
	elseif	ammo == "Base.10gShotgunShells"		then	value = "Base.Lead00Buck"
	elseif	ammo == "Base.4gShotgunShells"		then	value = "Base.Lead00Buck"
	elseif	ammo == "Base.50BMGBullets"			then	value = "Base.Lead50"
	elseif	ammo == "Base.40HERound"			then	value = nil
	elseif	ammo == "Base.40INCRound"			then	value = nil
	elseif	ammo == "Base.Flare"				then	value = nil
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET AMMO SHOTSHELL PELLET AMOUNT											--
----------------------------------------------------------------------------------
function getAmmoLeadAmount(ammo)
	local	value = 1

	if		ammo == "Base.410gShotgunShells"	then	value = 5
	elseif	ammo == "Base.20gShotgunShells"		then	value = 7
	elseif	ammo == "Base.ShotgunShells"		then	value = 9
	elseif	ammo == "Base.10gShotgunShells"		then	value = 12
	elseif	ammo == "Base.4gShotgunShells"		then	value = 15
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET AMMO POWDER																--
----------------------------------------------------------------------------------
function getAmmoPowder(ammo)
	local	value = "none"

	if 		ammo == "Base.Bullets22"			then	value = 0.005
	elseif 	ammo == "Base.Bullets57"			then	value = 0.010
	elseif	ammo == "Base.Bullets380"			then	value = 0.010
	elseif	ammo == "Base.Bullets38"			then	value = 0.020
	elseif	ammo == "Base.Bullets9mm"			then	value = 0.015
	elseif	ammo == "Base.Bullets45"			then	value = 0.020
	elseif	ammo == "Base.Bullets357"			then	value = 0.025
	elseif	ammo == "Base.Bullets45LC"			then	value = 0.030
	elseif	ammo == "Base.Bullets44"			then	value = 0.030
	elseif	ammo == "Base.Bullets50MAG"			then	value = 0.035
	elseif	ammo == "Base.Bullets4570"			then	value = 0.035
	elseif	ammo == "Base.223Bullets"			then	value = 0.040
	elseif	ammo == "Base.556Bullets"			then	value = 0.040
	elseif	ammo == "Base.545x39Bullets"		then	value = 0.045
	elseif	ammo == "Base.762x39Bullets"		then	value = 0.045
	elseif	ammo == "Base.308Bullets"			then	value = 0.050
	elseif	ammo == "Base.762x51Bullets"		then	value = 0.050
	elseif	ammo == "Base.762x54rBullets"		then	value = 0.055
	elseif	ammo == "Base.3006Bullets"			then	value = 0.055
	elseif	ammo == "Base.410gShotgunShells"	then	value = 0.060
	elseif	ammo == "Base.20gShotgunShells"		then	value = 0.070
	elseif	ammo == "Base.ShotgunShells"		then	value = 0.080
	elseif	ammo == "Base.10gShotgunShells"		then	value = 0.090
	elseif	ammo == "Base.4gShotgunShells"		then	value = 0.110
	elseif	ammo == "Base.50BMGBullets"			then	value = 0.100
	elseif	ammo == "Base.40HERound"			then	value = nil
	elseif	ammo == "Base.40INCRound"			then	value = nil
	elseif	ammo == "Base.Flare"				then	value = 0.100	-- LOTS
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET BURST SOUND																--
----------------------------------------------------------------------------------
function getShotSound(weapon,round)
	local	ammo = weapon:getAmmoType()
	local	value = nil

	if	round == nil then
		round = 1
	end

--	if	isClient() then			-- ALLOW FOR SP ALSO
	----------------------------------------
	--  OPTIONS BOX 18 USE VANILLA SOUND  --
	----------------------------------------
	if (GUNFIGHTER.OPTIONS.options.box18 == true) then
		if	weapon:hasTag("ORSFX") then
					local count = getAltSoundCount(weapon)
				--	value = weapon:getScriptItem():getSwingSound()

					if		isCompensated(weapon) and weapon:getModData().AltCOMPSwingSound ~= nil then
							value = weapon:getModData().AltCOMPSwingSound
					elseif	isSuppressed(weapon)  and weapon:getModData().AltSDSwingSound ~= nil then
							value = weapon:getModData().AltSDSwingSound
					elseif	weapon:getModData().AltSwingSound1 ~= nil then
						if		ZombRand(count) == 0 then
								value = weapon:getModData().AltSwingSound1
						--		DebugSay(2,"Alt Sound 1")
						elseif	ZombRand(count) == 1 then
								value = weapon:getModData().AltSwingSound2
						--		DebugSay(2,"Alt Sound 2")
						elseif	ZombRand(count) == 2 then
								value = weapon:getModData().AltSwingSound3
						--		DebugSay(2,"Alt Sound 3")
						elseif	ZombRand(count) == 3 then
								value = weapon:getModData().AltSwingSound4
						--		DebugSay(2,"Alt Sound 4")
						elseif	ZombRand(count) == 4 then
								value = weapon:getModData().AltSwingSound5
						--		DebugSay(2,"Alt Sound 5")
						elseif	ZombRand(count) == 5 then
								value = weapon:getModData().AltSwingSound6
						--		DebugSay(2,"Alt Sound 6")
						else	value = weapon:getScriptItem():getSwingSound()
						--		DebugSay(2,"Std Sound 0")
						end
					else	value = weapon:getScriptItem():getSwingSound()
					--		DebugSay(2,"Std Sound 0")
					end
		----------------------------------------------------------
		--	CHECK COMP FIRST LINEAR IS BOTH BUT SOUND IS NOT	--
		----------------------------------------------------------
		elseif		isCompensated(weapon) then
			if 		ammo == "Base.BB177" then				value = nil
			elseif 	ammo == "Base.PB68" then				value = nil
			elseif 	ammo == "Base.Bullets22" then			value = "COMP[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "COMP[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "COMP[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "COMP[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "COMP[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "COMP[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "COMP[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "COMP[1]Shot_45LC"	-- copy of SD50MAG
			elseif	ammo == "Base.Bullets44" then			value = "COMP[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "COMP[1]Shot_50MAG"	-- copy of SD3006
			elseif	ammo == "Base.Bullets4570" then			value = "COMP[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "COMP[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "COMP[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "COMP[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "COMP[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "COMP[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "COMP[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "COMP[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "COMP[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.ShotgunShells" then		value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.50BMGBullets" then		value = "COMP[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = nil
			elseif	ammo == "Base.40INCRound" then			value = nll
			end
		elseif		isSuppressed(weapon) then
			if 		ammo == "Base.BB177" then				value = "SD[1]Shot_BB177"
			elseif 	ammo == "Base.PB68" then				value = "SD[1]Shot_BB177"	-- NEED SOUND
			elseif 	ammo == "Base.Bullets22" then			value = "SD[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "SD[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "SD[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "SD[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "SD[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "SD[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "SD[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "SD[1]Shot_45LC"	-- copy of SD50MAG
			elseif	ammo == "Base.Bullets44" then			value = "SD[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "SD[1]Shot_50MAG"	-- copy of SD3006
			elseif	ammo == "Base.Bullets4570" then			value = "SD[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "SD[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "SD[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "SD[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "SD[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "SD[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "SD[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.ShotgunShells" then		value = "SD[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "SD[1]Shot_12g"
			elseif	ammo == "Base.50BMGBullets" then		value = "SD[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = nil
			elseif	ammo == "Base.40INCRound" then			value = nll
			end
		elseif		(not isSuppressed(weapon)) then
			if		ammo == "Base.FlameFuel" then			value = "Flame_Fire"
			elseif	ammo == "Base.WaterAmmo" then			value = "waterSplash"
			elseif 	ammo == "Base.BB177" then				value = "UmbrellaHit"		--"[1]Shot_BB177"
			elseif 	ammo == "Base.PB68" then				value = "BallPeenHammerHit"	--"[1]Shot_PB68"
			elseif 	ammo == "Base.Bullets22" then			value = "BallPeenHammerHit"
			elseif 	ammo == "Base.Bullets57" then			value = "M36Shoot"		-- DEEP SUPPRESSED "SnowShovelHit"
			elseif	ammo == "Base.Bullets380" then			value = "M36Shoot"		--22 / SUPP PISTOL "BallPeenHammerHit" / "HammerHit"
			elseif	ammo == "Base.Bullets38" then			value = "M36Shoot"
			elseif	ammo == "Base.Bullets9mm" then			value = "M9Shoot"
			elseif	ammo == "Base.Bullets45" then			value = "M1911Shoot"
			elseif	ammo == "Base.Bullets357" then			value = "M625Shoot"			
			elseif	ammo == "Base.Bullets45LC" then			value = "MagnumShoot"
			elseif	ammo == "Base.Bullets44" then			value = "DesertEagleShoot"
			elseif	ammo == "Base.Bullets50MAG" then		value = "SniperRifleShoot"
			elseif	ammo == "Base.Bullets4570" then			value = "MSR700Shoot"
			elseif	ammo == "Base.223Bullets" then			value = "M16Shoot"
			elseif	ammo == "Base.556Bullets" then			value = "M16Shoot"					--"MetaAssaultRifle1" (MIXED NO GOOD)
			elseif	ammo == "Base.545x39Bullets" then		value = "M14Shoot"					--"MetaPistol1" (FADE INDOOR)
			elseif	ammo == "Base.762x39Bullets" then		value = "M14Shoot"					--"MetaPistol2" (FADE INDOOR)
			elseif	ammo == "Base.308Bullets" then			value = "SniperRifleShoot"				--"MetaShotgun1" (FADE INDOOR)
			elseif	ammo == "Base.762x51Bullets" then		value = "SniperRifleShoot"
			elseif	ammo == "Base.762x54rBullets" then		value = "MSR788Shoot"
			elseif	ammo == "Base.3006Bullets" then			value = "MSR788Shoot"
			elseif	ammo == "Base.410gShotgunShells" then	value = "JS2000ShotgunShoot"
			elseif	ammo == "Base.20gShotgunShells" then	value = "JS2000ShotgunShoot"
			elseif	ammo == "Base.ShotgunShells" then		value = "JS2000ShotgunShoot"				--"BreakObject" SD SHOTGUN
			elseif	ammo == "Base.10gShotgunShells" then	value = "SawnOffJS2000ShotgunShoot"
			elseif	ammo == "Base.4gShotgunShells" then		value = "DoubleBarrelShotgunShoot"
			elseif	ammo == "Base.50BMGBullets" then		value = "SawnOffDoubleBarrelShotgunShoot"		--"ClothingDryerFinished" (THUMP + CLACK AT END)
			elseif	ammo == "Base.40HERound" then			value = "ElectricBassHit"
			elseif	ammo == "Base.40INCRound" then			value = "ElectricBassHit"
			elseif	ammo == "Base.HERocket" then			value = "BurnedObjectExploded"
			else											value = weapon:getScriptItem():getSwingSound()
			end
		end
--[[		elseif	isSuppressed(weapon) then
			if 		ammo == "Base.BB177" then				value = "SD[1]Shot_BB177"
			elseif 	ammo == "Base.Bullets22" then			value = "UmbrellaHit"		--"SD[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "BallPeenHammerHit"	--"SD[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "BallPeenHammerHit"	--"SD[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "BallPeenHammerHit"	--"SD[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "BallPeenHammerHit"	--"SD[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "BallPeenHammerHit"	--"SD[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "BallPeenHammerHit"	--"SD[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "SnowShovelHit"		--"SD[1]Shot_45LC"	-- copy of SD50MAG
			elseif	ammo == "Base.Bullets44" then			value = "SnowShovelHit"		--"SD[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "SnowShovelHit"		--"SD[1]Shot_50MAG"	-- copy of SD3006
			elseif	ammo == "Base.Bullets4570" then			value = "SnowShovelHit"		--"SD[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "SnowShovelHit"		--"SD[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "SnowShovelHit"		--"SD[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "SnowShovelHit"		--"SD[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "SnowShovelHit"		--"SD[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "SnowShovelHit"		--"SD[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "SnowShovelHit"		--"SD[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "SnowShovelHit"		--"SD[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "SnowShovelHit"		--"SD[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SnowShovelHit"		--"SD[1]Shot_12g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SnowShovelHit"		--"SD[1]Shot_12g"
			elseif	ammo == "Base.ShotgunShells" then		value = "SnowShovelHit"		--"SD[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SnowShovelHit"		--"SD[1]Shot_12g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "SnowShovelHit"		--"SD[1]Shot_12g"
			elseif	ammo == "Base.50BMGBullets" then		value = "MSR700Shoot"		--"SD[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = nil
			elseif	ammo == "Base.40INCRound" then			value = nll
			end
		end
]]
	else
		if	weapon:hasTag("ORSFX") then
					local count = getAltSoundCount(weapon)
				--	value = weapon:getScriptItem():getSwingSound()

					if		isCompensated(weapon) and weapon:getModData().AltCOMPSwingSound ~= nil then
							value = weapon:getModData().AltCOMPSwingSound
					elseif	isSuppressed(weapon)  and weapon:getModData().AltSDSwingSound ~= nil then
							value = weapon:getModData().AltSDSwingSound
					elseif	weapon:getModData().AltSwingSound1 ~= nil then
						if		ZombRand(count) == 0 then
								value = weapon:getModData().AltSwingSound1
						--		DebugSay(2,"Alt Sound 1")
						elseif	ZombRand(count) == 1 then
								value = weapon:getModData().AltSwingSound2
						--		DebugSay(2,"Alt Sound 2")
						elseif	ZombRand(count) == 2 then
								value = weapon:getModData().AltSwingSound3
						--		DebugSay(2,"Alt Sound 3")
						elseif	ZombRand(count) == 3 then
								value = weapon:getModData().AltSwingSound4
						--		DebugSay(2,"Alt Sound 4")
						elseif	ZombRand(count) == 4 then
								value = weapon:getModData().AltSwingSound5
						--		DebugSay(2,"Alt Sound 5")
						elseif	ZombRand(count) == 5 then
								value = weapon:getModData().AltSwingSound6
						--		DebugSay(2,"Alt Sound 6")
						else	value = weapon:getScriptItem():getSwingSound()
						--		DebugSay(2,"Std Sound 0")
						end
					else	value = weapon:getScriptItem():getSwingSound()
					--		DebugSay(2,"Std Sound 0")
					end
		elseif	isCompensated(weapon) then
			if 		ammo == "Base.BB177" then				value = nil
			elseif 	ammo == "Base.PB68" then				value = nil
			elseif 	ammo == "Base.Bullets22" then			value = "COMP[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "COMP[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "COMP[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "COMP[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "COMP[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "COMP[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "COMP[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "COMP[1]Shot_45LC"	-- copy of SD50MAG
			elseif	ammo == "Base.Bullets44" then			value = "COMP[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "COMP[1]Shot_50MAG"	-- copy of SD3006
			elseif	ammo == "Base.Bullets4570" then			value = "COMP[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "COMP[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "COMP[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "COMP[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "COMP[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "COMP[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "COMP[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "COMP[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "COMP[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.ShotgunShells" then		value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "COMP[1]Shot_12g"
			elseif	ammo == "Base.50BMGBullets" then		value = "COMP[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = nil
			elseif	ammo == "Base.40INCRound" then			value = nll
			end
		elseif	isSuppressed(weapon) then
			if 		ammo == "Base.BB177" then				value = "SD[1]Shot_BB177"
			elseif 	ammo == "Base.PB68" then				value = "SD[1]Shot_BB177"	-- NEED SOUND
			elseif 	ammo == "Base.Bullets22" then			value = "SD[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "SD[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "SD[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "SD[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "SD[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "SD[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "SD[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "SD[1]Shot_45LC"	-- copy of SD50MAG
			elseif	ammo == "Base.Bullets44" then			value = "SD[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "SD[1]Shot_50MAG"	-- copy of SD3006
			elseif	ammo == "Base.Bullets4570" then			value = "SD[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "SD[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "SD[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "SD[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "SD[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "SD[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "SD[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.ShotgunShells" then		value = "SD[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[1]Shot_12g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "SD[1]Shot_12g"
			elseif	ammo == "Base.50BMGBullets" then		value = "SD[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = nil
			elseif	ammo == "Base.40INCRound" then			value = nll
			end
		elseif	(not isSuppressed(weapon)) then
			if		ammo == "Base.FlameFuel" then			value = "Flame_Fire"
			elseif	ammo == "Base.WaterAmmo" then			value = "waterSplash"
			elseif 	ammo == "Base.BB177" then				value = "[1]Shot_BB177"
			elseif 	ammo == "Base.PB68" then				value = "[1]Shot_PB68"		-- BAT HIT
			elseif 	ammo == "Base.Bullets22" then			value = "[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then			value = "[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then			value = "[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then			value = "[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then			value = "[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then			value = "[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then			value = "[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then			value = "[1]Shot_45LC"
			elseif	ammo == "Base.Bullets44" then			value = "[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then		value = "[1]Shot_50MAG"
			elseif	ammo == "Base.Bullets4570" then			value = "[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then			value = "[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then			value = "[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then		value = "[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then		value = "[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then			value = "[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then		value = "[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then		value = "[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then			value = "[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "[1]Shot_410g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "[1]Shot_20g"
			elseif	ammo == "Base.ShotgunShells" then		value = "[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "[1]Shot_10g"
			elseif	ammo == "Base.4gShotgunShells" then		value = "[1]Shot_4g"
			elseif	ammo == "Base.50BMGBullets" then		value = "[1]Shot_50"
			elseif	ammo == "Base.40HERound" then			value = "[1]Shot_40mm"
			elseif	ammo == "Base.40INCRound" then			value = "[1]Shot_40mm"
			elseif	ammo == "Base.HERocket" then			value = "[1]Shot_Rocket"
			else											value = weapon:getScriptItem():getSwingSound()
			end
		end
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET HOW MANY ALT SOUNDS														--
----------------------------------------------------------------------------------
function getAltSoundCount(weapon)
	local	result
	if		weapon:getModData().AltSwingSound6 ~= nil then
			result = 6
	elseif	weapon:getModData().AltSwingSound5 ~= nil then
			result = 5
	elseif	weapon:getModData().AltSwingSound4 ~= nil then
			result = 4
	elseif	weapon:getModData().AltSwingSound3 ~= nil then
			result = 3
	elseif	weapon:getModData().AltSwingSound2 ~= nil then
			result = 2
	elseif	weapon:getModData().AltSwingSound1 ~= nil then
			result = 1
	else		result = 1
	end
	return	result
end
----------------------------------------------------------------------------------
--  CHECK FOR PIERCING AMMO														--
----------------------------------------------------------------------------------
function isAmmoPiercing(ammo)
	local	value = false

	if 		ammo == "Base.BB177"				then	value = false
	elseif	ammo == "Base.PB68"					then	value = false
	elseif 	ammo == "Base.Bullets22"			then	value = false
	elseif 	ammo == "Base.Bullets57"			then	value = true
	elseif	ammo == "Base.Bullets380"			then	value = false
	elseif	ammo == "Base.Bullets38"			then	value = false
	elseif	ammo == "Base.Bullets9mm"			then	value = false
	elseif	ammo == "Base.Bullets45"			then	value = false
	elseif	ammo == "Base.Bullets357"			then	value = false
	elseif	ammo == "Base.Bullets45LC"			then	value = false
	elseif	ammo == "Base.Bullets44"			then	value = false
	elseif	ammo == "Base.Bullets50MAG"			then	value = true
	elseif	ammo == "Base.Bullets4570"			then	value = true
	elseif	ammo == "Base.223Bullets"			then	value = true
	elseif	ammo == "Base.556Bullets"			then	value = true
	elseif	ammo == "Base.545x39Bullets"		then	value = true
	elseif	ammo == "Base.762x39Bullets"		then	value = true
	elseif	ammo == "Base.308Bullets"			then	value = true
	elseif	ammo == "Base.762x51Bullets"		then	value = true
	elseif	ammo == "Base.762x54rBullets"		then	value = true
	elseif	ammo == "Base.3006Bullets"			then	value = true
	elseif	ammo == "Base.410gShotgunShells"	then	value = false
	elseif	ammo == "Base.20gShotgunShells"		then	value = false
	elseif	ammo == "Base.ShotgunShells"		then	value = false
	elseif	ammo == "Base.10gShotgunShells"		then	value = false
	elseif	ammo == "Base.4gShotgunShells"		then	value = false
	elseif	ammo == "Base.50BMGBullets"			then	value = true
	elseif	ammo == "Base.SlingShot_Marble"		then	value = false
	elseif	ammo == "Base.SlingShot_Rock"		then	value = false
	elseif	ammo == "Base.Arrow_Fiberglass"		then	value = false
	elseif	ammo == "Base.Bolt_Bear"			then	value = false
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET LOADED WEIGHT UTILITY BECAUSE GETWEIGHT DOES NOT INCLUDE AMMO & MAG.	--
--  SINCE AIM-TIME, RECOIL, AND HIT-CHANCE IS HIGHLY INFLUENCED BY WEIGHT,		--
--  THIS MOD USES THIS WEIGHT FUNCTION INSTEAD... ARSENAL[26]					--
----------------------------------------------------------------------------------
function getLoadedWeight(weapon)
	local	weight 	= weapon:getWeight()
	local	clip	= weapon:getClip()
	local	magWT	= 0
	local	ammoWT	= 0
	local	ammo	= weapon:getAmmoType()
	local	ammoCT	= weapon:getCurrentAmmoCount()

	if clip then
		if	(string.find(clip:getType(), "Extended_Mag")) then
			mag	= weapon:getModData().ExtMagType
		elseif	(string.find(clip:getType(), "Drum_Mag")) then
			mag	= weapon:getModData().DrumMagType
		elseif	(string.find(clip:getType(), "Standard_Mag")) then
			mag	= weapon:getMagazineType()
		end
		if mag then
			TempMag	= InventoryItemFactory.CreateItem(mag)
			magWT		= TempMag:getWeight()
		end
	end

	if ammo then
		TempAmmo		= InventoryItemFactory.CreateItem(ammo)
		ammoWT		= ammoCT * TempAmmo:getWeight()
	end

	weight = weight + ammoWT + magWT
	return weight
end


--------------------------------------------------------------------------
--  onPRESSRELOAD		EMERGENCY RELOAD (DROP MAG TO GROUND)			--
--------------------------------------------------------------------------
function emergencyReload(player, weapon)
	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local	player	= getSpecificPlayer(0)
	local	Gun		= player:getPrimaryHandItem()
	local	Drop	= 0
	local	drop	= nil
	local	Mode	= GUNFIGHTER.OPTIONS.options.dropdown134
	local	Mag		= Gun:getMagazineType()
	local	Clip	= Gun:getModData().ClipType

	if		Mode == 1 then					-- OFF
			Drop = 0
	elseif	Mag == nil or Mag == Clip then		-- OFF
			Drop = 0
	elseif	Mode == 2 and player:getVariableBoolean("isUnloading") then
			Drop = 1
	elseif	Mode == 3 and player:isRunning() then
			Drop = 1
	elseif	Mode == 4 and (player:getVariableBoolean("isUnloading") or player:isRunning()) then
			Drop = 1
	end

	if		Mag then
			drop = InventoryItemFactory.CreateItem(Mag)
			if	drop:hasTag("Clip") then
				Drop = 0
			end
			if	drop:hasTag("Fixed") then
				Drop = 0
			end
	elseif	Mag == nil then
			Drop = 0
	elseif	drop == nil then
			Drop = 0
	end

	if	Gun:getMagazineType() == Clip then
		drop = nil
	end

	if	Drop ~= 0 then
		if Gun:isContainsClip() == true then
			ISTimedActionQueue.clear(player);
			if drop ~= nil then
				Gun:setContainsClip(false)
				drop:setCurrentAmmoCount(Gun:getCurrentAmmoCount())
				player:getCurrentSquare():AddWorldInventoryItem(drop, 0.0, 0.0, 0.0)
				Gun:setCurrentAmmoCount(0)
				showMag(Gun)
				DebugSay(2,getText("ContextMenu_EmergencyReload"))
				Sound = player:getEmitter():playSound(Gun:getEjectAmmoSound())
				Sound = player:getEmitter():playSound("PZ_FootSteps_Concrete_03")
			end

			if (instanceof(Gun,"HandWeapon")) then
				ReEquipIt(player, Gun)
			end

		end

		------------------------------
		--	AUTO INSERT NEXT MAG	--
		------------------------------
		local mags = player:getInventory():getAllTypeRecurse(Gun:getMagazineType())
		local nextMag = nil
		for i=1,mags:size() do
			if	mags:get(i-1) and mags:get(i-1):getCurrentAmmoCount() > 0 then
				if nextMag == nil or ( nextMag ~= nil and nextMag:getCurrentAmmoCount() < mags:get(i-1):getCurrentAmmoCount() ) then
					nextMag = mags:get(i-1)
		--			DebugSay(2,"Found Best Mag ("..tostring(nextMag:getCurrentAmmoCount())..")")
				end
			end
		end
		if	nextMag ~= nil then
			player:getModData().emergencyReload = true
			ISTimedActionQueue.add(ISInsertMagazine:new(player, Gun, nextMag))
		--	DebugSay(2,"Auto Inserting")
		end


	else	DebugSay(3,"VOID DROP")
	end
end


--------------------------------------------------------------------------
--  onPRESSRELOAD		CHECK FOR MAGTYPE IF EMTPY						--
--------------------------------------------------------------------------
function getNextMagType(player, weapon)
	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if	(GUNFIGHTER.OPTIONS.options.dropdown132 == 1) then
		return
	end

	local	gun	= player:getPrimaryHandItem()

	if	(gun) and (instanceof(gun,"HandWeapon")) and (gun:isAimedFirearm()) and
		(gun:getMagazineType() ~= "Base.Fixed") and (gun:getMagazineType() ~= nil) and
		(gun:isContainsClip() == false) and									-- MUST BE EMPTY OR MAG WILL DUPE
		(not isLauncher(gun)) and (not isFlamer(gun)) and (not isBow(gun)) then

		local	result		=	InventoryItemFactory.CreateItem(gun:getType())
		local	Set			=	gun:getMagazineType()

		local	Std			=	result:getMagazineType()
		local	Clip		=	gun:getModData().ClipType
		local	Ext			=	gun:getModData().ExtMagType
		local	Drum		=	gun:getModData().DrumMagType

		local	inv			=	player:getInventory()
		local	mags		=	inv:getItems()
		local	next		=	nil
		local	TempPart	=	nil

	--	DebugSay(2,tostring(Std))
	--	DebugSay(2,tostring(Ext))
	--	DebugSay(2,tostring(Drum))

		--	CHECK FOR CURRENT TYPE
		if (mags) and (Set ~= Clip) then
			local	tempMag		= nil
			local	tempSet		= InventoryItemFactory.CreateItem(Set)
			local	tempStd		= InventoryItemFactory.CreateItem(Std)
			local	tempExt		= InventoryItemFactory.CreateItem(Ext)
			local	tempDrum	= InventoryItemFactory.CreateItem(Drum)
			if	(GUNFIGHTER.OPTIONS.options.dropdown132 == 3) then			-- LARGE FIRST
				if	(next == nil) and (Set) then						-- BUT ALWAYS OBEY SET FIRST
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempSet:getType()) then
									next = Set
								end
							end
						end
					end
				end
				if	(next == nil) and (Drum) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempDrum:getType()) then
									next = Drum
								end
							end
						end
					end
				end
				if	(next == nil) and (Ext) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempExt:getType()) then
									next = Ext
								end
							end
						end
					end
				end
				if	(next == nil) and (Std) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempStd:getType()) then
									next = Std
								end
							end
						end
					end
				end
			elseif	(GUNFIGHTER.OPTIONS.options.dropdown132 == 2) then		-- SMALL FIRST
				if	(next == nil) and (Set) then						-- BUT ALWAYS OBEY SET FIRST
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempSet:getType()) then
									next = Set
								end
							end
						end
					end
				end
				if	(next == nil) and (Std) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempStd:getType()) then
									next = Std
								end
							end
						end
					end
				end
				if	(next == nil) and (Ext) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempExt:getType()) then
									next = Ext
								end
							end
						end
					end
				end
				if	(next == nil) and (Drum) then
					for i=1, mags:size()-1 do
						if(mags:get(i)) then
							local mag = mags:get(i)
							if	isMagazine(mag) and (mag:getCurrentAmmoCount() > 0) then
								tempMag	= InventoryItemFactory.CreateItem(mag:getType())
								if	(tempMag:getType() == tempDrum:getType()) then
									next = Drum
								end
							end
						end
					end
				end
			end

			if	(next ~= nil)  and (tempMag:getType() ~= tempSet:getType()) then		-- DO NOTHING IF SAME TYPE
				TempPart = InventoryItemFactory.CreateItem(next);				-- JUST TO GET MAXAMMO
				gun:setMagazineType(next)
				gun:setMaxAmmo(TempPart:getMaxAmmo())
				DebugSay(2,getText("ContextMenu_AutoMag_Type").." - "..tostring(TempPart:getDisplayName()))
			end
		end
	end
end


--------------------------------------------------------------------------
--  MAGAZINE TOGGLE														--
--------------------------------------------------------------------------
local function FirearmMagazineToggle(keyNum)
	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local	player	= getSpecificPlayer(0)
	local	Gun		= player:getPrimaryHandItem()
	local	Second	= player:getSecondaryHandItem()

	if (keyNum == getCore():getKey("MAG_TYPE_1")) or (keyNum == getCore():getKey("MAG_TYPE_2")) then

		if	(Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			----------------------------------
			-- MAGAZINE TYPE				--
			----------------------------------
			local	result = InventoryItemFactory.CreateItem(Gun:getType());

			if (Gun:isContainsClip() == true) and (Gun:getMagazineType() ~= "Base.Fixed") then	-- FIRST PRESS EJECT IF NEEDED
			        ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
			else
				local	Set	= Gun:getMagazineType()		-- WHAT IT IS NOW
				local	Std	= result:getMagazineType()	-- FRESH DEFAULT STD MAGTYPE SINCE RESULT IS SPAWNED
				local	Tog	= nil					-- Gun:getMagazineType()		-- WHAT ITS TOGGLING TO
				local	Ext	= Gun:getModData().ExtMagType
				local	Drum	= Gun:getModData().DrumMagType

				if	(Ext == nil) and (Drum == nil) then
					DebugSay(2,getText("ContextMenu_NoFunction"))

				else	Sound = player:getEmitter():playSound("drawCard")

				--	======= TRANSFER LIGHT ON / OFF ========
					if	Gun:getModData().LightOn == true then
						result:getModData().LightOn = true
						DebugSay(3,"Lite Still ON")
					end

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
					result:setFireMode(Gun:getFireMode());
					result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

					if	(keyNum == getCore():getKey("MAG_TYPE_1")) then				-- AUTO MAG TYPE
						if		GUNFIGHTER.OPTIONS.options.dropdown132 == 1 then
								GUNFIGHTER.OPTIONS.options.dropdown132  = 2
								DebugSay(2,getText("ContextMenu_AutoMag_SML"))
						elseif	GUNFIGHTER.OPTIONS.options.dropdown132 == 2 then
								GUNFIGHTER.OPTIONS.options.dropdown132  = 3
								DebugSay(2,getText("ContextMenu_AutoMag_LRG"))
						elseif	GUNFIGHTER.OPTIONS.options.dropdown132 == 3 then
								GUNFIGHTER.OPTIONS.options.dropdown132  = 1
								DebugSay(2,getText("ContextMenu_AutoMag_OFF"))
						end
						return		-- EXIT 
					elseif (keyNum == getCore():getKey("MAG_TYPE_2")) then			-- MANUAL MAG TYPE
						Tog = Gun:getMagazineType()
						if	(Set == Std) then				-- USING STANDARD
							if		(Ext)  then	Tog = Ext	-- TOGGLE TO EXT
							elseif	(Drum) then	Tog = Drum	-- TOGGLE TO DRUM
							end
						elseif (Set == Ext) then			-- USING EXTENDED
							if		(Drum) then	Tog = Drum	-- TOGGLE TO DRUM
							elseif	(Std)  then	Tog = Std	-- TOGGLE TO STD
							end
						elseif (Set == Drum) then			-- USING DRUM
							if		(Std)  then	Tog = Std	-- TOGGLE TO STD
							elseif	(Ext)  then	Tog = Ext	-- TOGGLE TO EXT
							end
						end
					end

					if Tog then
						TempPart = InventoryItemFactory.CreateItem(Tog);	-- JUST TO GET MAXAMMO
						result:setMagazineType(Tog)
						result:setMaxAmmo(TempPart:getMaxAmmo())
						DebugSay(1,getText("ContextMenu_Selected") .. " " .. tostring(TempPart:getDisplayName()))
					end
				
					result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

					if	Gun:isRoundChambered() == true then
						result:setRoundChambered(true);
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
					end

				--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
					if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
						result:attachWeaponPart(Gun:getWeaponPart("Scope"))
						result:attachWeaponPart(Gun:getWeaponPart("Canon"))
					--	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
						result:attachWeaponPart(Gun:getWeaponPart("Stock"))
						result:attachWeaponPart(Gun:getWeaponPart("Sling"))
						result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
					end

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX

					if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip	= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered	= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
					end

					player:getInventory():AddItem(result);
					checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
					local inv = player:getInventory()
					inv:DoRemoveItem(Gun);

					if (instanceof(result,"HandWeapon")) then
						ReEquipIt(player, result)
					end
				end
			end

		elseif	(Gun) and (instanceof(Gun,"HandWeapon")) then	-- MELEE WEAPON W/MULTI GRIP
			----------------------------------
			-- MELEE GRIP					--
			----------------------------------
			local	grip	= nil
			local	Spear	= Gun:getModData().SpearGrip	-- MUST BE Base.XXX
			local	Close	= Gun:getModData().CloseGrip
			local	Wide	= Gun:getModData().WideGrip
			local	Normal	= Gun:getModData().NormalGrip
			local	Thrown	= Gun:getModData().ThrownGrip

			if	Gun:hasTag("CanIgnite") then
				if	(Second) and (Second:hasTag("StartFire")) then
					if 	Second:IsDrainable() then
						if	Second:getUsedDelta() > 0 then
							Second:setUsedDelta(Second:getUsedDelta() - 0.05)		-- USE 1/20TH
							player:getEmitter():playSound("stormyRevolverClick")
						else	DebugSay(2,getText("ContextMenu_IgnitionSourceEmpty"))
							return
						end
					end
					DebugSay(2,getText("ContextMenu_Igniting") .. " " .. tostring(Gun:getDisplayName()) .. " w/" .. tostring(Second:getDisplayName()))		-- MAYBE USE FOR FLAMING ARROWS LATER
				else	DebugSay(2,getText("ContextMenu_IgnitionSourceNone"))
					return
				end
			end

			if	(keyNum == getCore():getKey("MAG_TYPE_1")) then
				if		(Spear == nil)	and	(Wide)		then	grip = Wide
				elseif	(Close == nil)	and	(Spear)		then	grip = Spear
				elseif	(Wide == nil)	and	(Close)		then	grip = Close
				elseif	(Thrown == nil)	and	(Normal)	then	grip = Normal
				elseif	(Normal == nil)	and	(Thrown)	then	grip = Thrown
				end
			elseif	(keyNum == getCore():getKey("MAG_TYPE_2")) then
				if		(Spear == nil)	and	(Close)		then	grip = Close
				elseif	(Close == nil)	and	(Wide)		then	grip = Wide
				elseif	(Wide == nil)	and	(Spear)		then	grip = Spear
				elseif	(Normal == nil)	and	(Thrown)	then	grip = Thrown
				elseif	(Thrown == nil)	and	(Normal)	then	grip = Normal
				end
			else	grip = Gun:getType()	-- ERROR
			end

			if	grip == nil then
				DebugSay(2,getText("ContextMenu_NoFunction"))

			else	local sound = "batswing"
				local result = InventoryItemFactory.CreateItem(grip);
				if	Gun:getModData().GripSound ~= nil then
					sound = Gun:getModData().GripSound
				end
				player:getInventory():AddItem(result);
				player:getEmitter():playSound(sound)

			--	if	grip == Thrown then
			--		DebugSay(2,"Thrown")
			--	end

			--	======= TRANSFER LIGHT ON / OFF ========
				if	Gun:getModData().LightOn == true then
					result:getModData().LightOn = true
					DebugSay(3,"Lite Still ON")
				end

			--	======= TRANSFER CONDITION & MODE ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());

				player:getInventory():AddItem(result);
				checkHotbar(player, Gun, result, 20)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					ReEquipIt(player, result)
				--	player:setPrimaryHandItem(result)
				--	if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
				--		player:setSecondaryHandItem(result)
				--	elseif player:getSecondaryHandItem() == Gun then
				--		player:setSecondaryHandItem(nil)		-- DROP SECONDARY ONLY IF WAS ORIGINAL WEAPON TO CLEAR IT
				--	end
				end
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end

	elseif (keyNum == getCore():getKey("AMMO_TYPE_1")) or (keyNum == getCore():getKey("AMMO_TYPE_2")) then	-- [<] or [>]
		----------------------------------
		-- GRENADE TYPE					--
		----------------------------------
		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local	sling		= Gun:getSling()
			local	Melee		= Gun:getModData().Melee
			local	Integral	= Gun:getModData().Integral
			if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then

			        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
			--	DebugSay(3,"Has Launcher")

			--	if (string.find(Gun:getType(), "Melee")) then		-- NOT SURE TO RESTRICT FROM MELEE OR NOT
			--		DebugSay(3,"From Melee Mode")
			--	end

				local	HEMode = Gun:getModData().HEMode
				local	INCMode = Gun:getModData().INCMode
				local	launcher = nil

				if	Gun:getModData().TempContainsClip == true then		-- ALL LAUNCHER SHOULD USE THIS METHOD
					DebugSay(3,"Contains Clip")
					if 	Gun:getModData().TempAmmoType == 1 then
						DebugSay(3,"40HE - Code 1")
						launcher = HEMode
						DebugSay(2,getText("ContextMenu_LauncherHEMode"))
					elseif	Gun:getModData().TempAmmoType == 2 then
						DebugSay(3,"40INC - Code 2")
						launcher = INCMode
						DebugSay(2,getText("ContextMenu_LauncherINCMode"))
					else	DebugSay(3,"No Code")
						launcher = HEMode
						DebugSay(2,getText("ContextMenu_LauncherDefaultMode"))
					end
				elseif	(keyNum == getCore():getKey("AMMO_TYPE_1")) and (HEMode ~= nil) then
					launcher = HEMode
					DebugSay(2,getText("ContextMenu_LauncherHEMode"))
				elseif	(keyNum == getCore():getKey("AMMO_TYPE_2")) and (INCMode ~= nil) then
					launcher = INCMode
					DebugSay(2,getText("ContextMenu_LauncherINCMode"))
				end

				local result = InventoryItemFactory.CreateItem(launcher);

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- 	[GUN to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
				result:getModData().TempFireMode		= (Gun:getFireMode())		-- M203 SET TEMP for M16 SwitchBack
				result:getModData().TempContainsClip	= (Gun:isContainsClip())	
				result:getModData().TempRoundChambered	= (Gun:isRoundChambered())	
				result:getModData().TempCurrentAmmoCount 	= (Gun:getCurrentAmmoCount())	
				--------------------------------------
				--	TEST DUAL-MAG PORTION			--
				result:getModData().TempMagazineType	= (Gun:getMagazineType())
				result:getModData().TempStdMagType		= (Gun:getModData().MagType)
				result:getModData().TempExtMagType		= (Gun:getModData().ExtMagType)
				result:getModData().TempDrumMagType		= (Gun:getModData().DrumMagType)
				--------------------------------------


				if	(Gun:getModData().TempFireMode) ~= nil then
					result:setFireMode(Gun:getModData().TempFireMode)			-- M203 SET its own FROM M16 TEMP
				end
				if	(Gun:getModData().TempContainsClip) then
					result:setContainsClip(Gun:getModData().TempContainsClip)
				end
				if	(Gun:getModData().TempRoundChambered) then
					result:setRoundChambered(Gun:getModData().TempRoundChambered)
				end
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,getText("ContextMenu_Trajectory") .. " - " .. tostring(result:getModData().Trajectory))
				end

				local	Remove = Gun:getModData().TempCurrentAmmoCount				-- TEMP OF THE LAST LAUNCHER BECAUSE GUN IS M16 AMMO
				if	Gun:getModData().TempRoundChambered == true then				-- FOR PUMP LAUNCHERS WITH CHAMBER
					DebugSay(2,"Is Chambered")
					if		Remove and Remove > 0 then
							DebugSay(3,"Loaded Ammo "..tostring(Remove))
							Remove = Remove + 1
					else	Remove = 1				-- IF ONLY CHAMBERED !!!
							DebugSay(3,"Chambered Only "..tostring(Remove))
					end				
				end

				if	Gun:getModData().TempAmmoType == 1 and result:getAmmoType() == "Base.40INCRound" then	-- HE LOADED, [GUN to INC LAUNCHER]
					for i=1, Remove do
						player:getInventory():AddItem("Base.40HERound")					-- REMOVE HE, ADD TO INVENTORY
					end
					DebugSay(2,getText("ContextMenu_RemoveHERound") .. " ("..tostring(Remove)..")")
					result:setCurrentAmmoCount(0);
					result:setRoundChambered(false);
				elseif	Gun:getModData().TempAmmoType == 2 and result:getAmmoType() == "Base.40HERound" then	-- INC LOADED, [GUN to HE LAUNCHER]
					for i=1, Remove do
						player:getInventory():AddItem("Base.40INCRound")				-- REMOVE INC, ADD TO INVENTORY
					end
					DebugSay(2,getText("ContextMenu_RemoveINCRound") .. " ("..tostring(Remove)..")")
					result:setCurrentAmmoCount(0);
					result:setRoundChambered(false);
				elseif	(Gun:getModData().TempCurrentAmmoCount) then				-- NO CROSS SWITCH
					result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)		-- LEAVE LOADED
				end

				player:getInventory():AddItem(result);
				checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					ReEquipIt(player, result)
				end
			else	
				----------------------------------
				-- COMPATIBLE AMMO				--
				----------------------------------
				local	comp		= Gun:getModData().CompAmmo
				local	Integral	= Gun:getModData().Integral

				if		(comp) and (Gun:isContainsClip() == true) and (Gun:getMagazineType() ~= "Base.Fixed") then	-- FIRST PRESS EJECT IF NEEDED
						ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
						DebugSay(2,getText("ContextMenu_UnloadCurrentAmmo"))
				elseif	(comp) and (Gun:isRoundChambered() == true or Gun:getCurrentAmmoCount() > 0) then		-- FIRST UNLOAD OTHER AMMO
					--	ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
						DebugSay(2,getText("ContextMenu_UnloadCurrentAmmo"))
				elseif	(comp ~= nil) then
				      	Sound = player:getEmitter():playSound("drawCard")
						local result = InventoryItemFactory.CreateItem(comp);

						DebugSay(2,getText("ContextMenu_Selected").." "..getAmmoName(result))

				--	======= TRANSFER LIGHT ON / OFF ========
					if	Gun:getModData().LightOn == true then
						result:getModData().LightOn = true
						DebugSay(3,"Lite Still ON")
					end

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				--	result:setFireMode(Gun:getFireMode());		-- DISABLE TO ALLOW [H]ANIMSETS
					result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

				--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
					if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
						result:attachWeaponPart(Gun:getWeaponPart("Scope"))
						result:attachWeaponPart(Gun:getWeaponPart("Canon"))
						result:attachWeaponPart(Gun:getWeaponPart("Clip"))
						result:attachWeaponPart(Gun:getWeaponPart("Stock"))
						result:attachWeaponPart(Gun:getWeaponPart("Sling"))
						result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
					end

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
					if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip	= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered	= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
					end

					player:getInventory():AddItem(result);
					checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
					local inv = player:getInventory()
					inv:DoRemoveItem(Gun);

					if (instanceof(result,"HandWeapon")) then
						ReEquipIt(player, result)
					end
				else	DebugSay(2,getText("ContextMenu_NoFunction"))
				end
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end
	elseif (keyNum == getCore():getKey("TRAJECTORY_DOWN")) or (keyNum == getCore():getKey("TRAJECTORY_UP")) then	-- [-] or [+]
		----------------------------------
		-- GRENADE TRAJECTORY			--
		----------------------------------
	--	if	(Gun) and (isFlamer(Gun) or isLauncher(Gun) or Gun:hasTag("PCP")) and		-- ADD PAINTBALL GUN
		if	(Gun) and (isFlamer(Gun) or isLauncher(Gun)) and							-- CHANGED MY MIND
			(not string.find(Gun:getType(), "P21_Chainsaw")) and						-- EXCLUDE CHAINSAW
			(not string.find(Gun:getType(), "WD_Flame")) then							-- EXCLUDE IMPROVISED WD_FLAME

			if	(keyNum == getCore():getKey("TRAJECTORY_DOWN")) then	-- [-]
				if		(Gun:getModData().Trajectory == "Short") then
						Gun:getModData().Trajectory = "Long"
						DebugSay(1,getText("ContextMenu_FireMode_Long"))
				elseif	(Gun:getModData().Trajectory == "Medium") then
						Gun:getModData().Trajectory = "Short"
						DebugSay(1,getText("ContextMenu_FireMode_Short"))
				elseif	(Gun:getModData().Trajectory == "Long") then
						Gun:getModData().Trajectory = "Medium"
						DebugSay(1,getText("ContextMenu_FireMode_Medium"))
				else		Gun:getModData().Trajectory = "Medium"
				end
			elseif	(keyNum == getCore():getKey("TRAJECTORY_UP")) then	-- [+]
				if		(Gun:getModData().Trajectory == "Short") then
						Gun:getModData().Trajectory = "Medium"
						DebugSay(1,getText("ContextMenu_FireMode_Medium"))
				elseif	(Gun:getModData().Trajectory == "Medium") then
						Gun:getModData().Trajectory = "Long"
						DebugSay(1,getText("ContextMenu_FireMode_Long"))
				elseif	(Gun:getModData().Trajectory == "Long") then
						Gun:getModData().Trajectory = "Short"
						DebugSay(1,getText("ContextMenu_FireMode_Short"))
				else		Gun:getModData().Trajectory = "Medium"
				end
			end
		----------------------------------
		-- FORCE CQB MODE				--
		----------------------------------
		elseif	(Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local	scriptItem	= Gun:getScriptItem()
			local	baseRange	= scriptItem:getMaxRange()
			local	aim			= player:getPerkLevel(Perks.FromString("Aiming"))
			local	gunPerk		= Gun:getAimingPerkRangeModifier()
			local	extra		= aim * gunPerk / 2.5
			local	lvlRange	= baseRange + extra
			local	set			= baseRange - (lvlRange - 10)

		--	ADJUSTABLE SCOPE SECTION
		--	local scope		= Gun:getScope()
		--	if	(scope) then
		--		max		= scope:getMaxRange()
		--	end

			if	(keyNum == getCore():getKey("TRAJECTORY_DOWN")) then	-- [-]
				if	(Gun:getModData().Trajectory == "CQB") then
					Gun:getModData().Trajectory = nil
					Gun:setMaxRange(baseRange)
					DebugSay(1,getText("ContextMenu_CQB_OFF"))
					Gun:getModData().CQB	= nil
				end
			elseif	(keyNum == getCore():getKey("TRAJECTORY_UP")) then	-- [+]
				if	(Gun:getModData().Trajectory ~= "CQB") and (lvlRange > 10) then
					Gun:getModData().Trajectory = "CQB"
					DebugSay(1,getText("ContextMenu_CQB_ON"))
					Gun:setMaxRange(set)
					Gun:getModData().CQB	= lvlRange - 10
				else	DebugSay(1,getText("ContextMenu_CQB_NA"))
				end			
			end			
		end
	end
end

--------------------------------------------------------------------------
--  ALTERNATE LOADING METHOD TOGGLE										--
--------------------------------------------------------------------------
local function WeaponAltLoadToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local	player	= getSpecificPlayer(0)
	local	Gun		= player:getPrimaryHandItem()

	if (keyNum == getCore():getKey("ALT_LOAD")) then	-- [\]
		----------------------------------
		-- ALTERNATE LOADING			--
		----------------------------------
		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then

			local 	Clip	= Gun:getModData().ClipType
			local 	Mag	= Gun:getModData().MagType

		--	if	(Clip == nil) or (Mag == nil) or (Mag == "Base.SKSFixedBox") then	-- Preclude Fixed mag SKS
			if	(Clip == nil) or (Mag == nil and Gun:getWeaponReloadType() ~= "revolver") or (Mag == "Base.SKSFixedBox") then	-- Preclude Fixed mag SKS
				DebugSay(2,getText("ContextMenu_NoFunction"))
		--		if		GUNFIGHTER.OPTIONS.options.dropdown132 == 1 then
		--				GUNFIGHTER.OPTIONS.options.dropdown132  = 2
		--				DebugSay(2,"Auto-Mag(Sml)")
		--		elseif	GUNFIGHTER.OPTIONS.options.dropdown132 == 2 then
		--				GUNFIGHTER.OPTIONS.options.dropdown132  = 3
		--				DebugSay(2,"Auto-Mag(Lrg)")
		--		elseif	GUNFIGHTER.OPTIONS.options.dropdown132 == 3 then
		--				GUNFIGHTER.OPTIONS.options.dropdown132  = 1
		--				DebugSay(2,"Auto-Mag(Off)")
		--		end

			else	Sound = player:getEmitter():playSound("drawCard")

				local result = InventoryItemFactory.CreateItem(Gun:getType());

			--	======= TOGGLE MAGAZINE TYPE ======
				if		Gun:getWeaponReloadType() == "revolver" then
					if	Gun:getMagazineType() == Clip then
						result:setMagazineType(nil)
						DebugSay(2,getText("ContextMenu_ALTLoad_Single"))
					elseif Clip and Gun:getMagazineType() == nil then
						result:setMagazineType(Gun:getModData().ClipType)
						DebugSay(2,getText("ContextMenu_ALTLoad_Clip"))
					end
				elseif	Gun:isContainsClip() == true and (Gun:getMagazineType() == Gun:getModData().MagType or Gun:getMagazineType() == nil) then
						result:setMagazineType(Gun:getModData().ClipType)
						DebugSay(2,getText("ContextMenu_ALTLoad_Clip"))
					--	result:setContainsClip(false)		-- PREVENT EJECTING STRIPPER CLIP... LOST MAG WHEN USE BAYO
				elseif	Gun:getMagazineType() == Gun:getModData().ClipType then
						result:setMagazineType(Gun:getModData().MagType)
						DebugSay(2,getText("ContextMenu_ALTLoad_Mag"))
					--	result:setContainsClip(true)
				elseif	Gun:getMagazineType() == Gun:getModData().DrumMagType then
						DebugSay(2,getText("ContextMenu_ALTLoad_Drum"))
				else		DebugSay(2,getText("ContextMenu_ALTLoad_Need"))		-- NEED CONFIRM FOR TOGGLE NOT DEBUG
				end

			--	======= TRANSFER LIGHT ON / OFF ========
				if	Gun:getModData().LightOn == true then
					result:getModData().LightOn = true
					DebugSay(3,"Lite Still ON")
				end

			--	======= TRANSFER CONDITION & MODE ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				result:setFireMode(Gun:getFireMode());
				result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

			--	====== TRANSFER AMMO MAG & CHAMBER =====		-- JUST GIVE CLIP ALWAYS... DONT EJECT STRIPPER!!!
				if	Gun:isContainsClip() == true then
					result:setContainsClip(true);
				end

				result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

				if	Gun:isRoundChambered() == true then
					result:setRoundChambered(true);
				end

			--	====== TRANSFER WEAPON ATTACHMENTS
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))
				result:attachWeaponPart(Gun:getWeaponPart("Canon"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

				player:getInventory():AddItem(result);
				checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					ReEquipIt(player, result)
				end
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end

	elseif (keyNum == getCore():getKey("FOLD_STOCK")) then	-- [?]
		----------------------------------
		-- FOLDING STOCK				--
		----------------------------------
		local tog	= nil

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then

			local fold	= Gun:getModData().Fold

			if	fold ~= nil then

				Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				tog = fold

				if	(string.find(Gun:getType(), "Fold")) or (string.find(tog, "Stock")) then	-- SOME ITEM NAMES ARE NOT FORMATTED
					DebugSay(2,getText("ContextMenu_StockDeploy"))
				elseif	(string.find(Gun:getType(), "Stock")) or (string.find(tog, "Fold")) then
					DebugSay(2,getText("ContextMenu_StockFold"))
				end

				local result = InventoryItemFactory.CreateItem(tog);
				player:getInventory():AddItem(result);

			--	======= TRANSFER LIGHT ON / OFF ========
				if	Gun:getModData().LightOn == true then
					result:getModData().LightOn = true
					DebugSay(3,"Lite Still ON")
				end

			--	======= TRANSFER CONDITION & MODE ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				result:setFireMode(Gun:getFireMode());
				result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

			--	====== TRANSFER AMMO MAG & CHAMBER =====
				if	Gun:isContainsClip() == true then
					result:setContainsClip(true);
				end

			--	====== TRANSFER MAG-TYPE =====
				if	Gun:getMagazineType() == nil and Gun:getModData().ClipType ~= nil then
					result:setMagazineType(Gun:getModData().ClipType);
				elseif	result:getMagazineType() == Fixed then			-- FIXED MAG GUNS... SEEMS BACKWARDS ???
					DebugSay(3,"...")
				elseif	Gun:getMagazineType() ~= Fixed then			-- MAG FED GUNS
					result:setMagazineType(Gun:getMagazineType());
				end

				result:setMaxAmmo(Gun:getMaxAmmo());

				result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

				if	Gun:isRoundChambered() == true then
					result:setRoundChambered(true);
				end

			--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
				if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
					result:attachWeaponPart(Gun:getWeaponPart("Scope"))
					result:attachWeaponPart(Gun:getWeaponPart("Canon"))
					result:attachWeaponPart(Gun:getWeaponPart("Clip"))
					result:attachWeaponPart(Gun:getWeaponPart("Stock"))
					result:attachWeaponPart(Gun:getWeaponPart("Sling"))
					result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
				end

			-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
				local sling = Gun:getSling()
				if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
					( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
					result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
					result:getModData().TempContainsClip	= (Gun:getModData().TempContainsClip)
					result:getModData().TempRoundChambered	= (Gun:getModData().TempRoundChambered)
					result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
					result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
				end

				if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
					ReEquipIt(player, result)
					checkHotbar(player, Gun, result, 30)					-- (30) CHECK HOTBAR
					local inv = player:getInventory()
					inv:DoRemoveItem(Gun);
				end
			else	DebugSay(2,getText("ContextMenu_NoFunction"))
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end
	end
end


--------------------------------------------------------------------------
--  SELECTFIRE HOTKEY													--
--------------------------------------------------------------------------
local function WeaponSelectFire(keyNum)

--	local CORE = getCore()
--	if CORE then
--		local FPS = CORE:setFramerate(60)
--		if FPS then
--			DebugSay(2,"FPS : "..tostring(FPS))
--		end
--	end

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == getCore():getKey("SELECT_FIRE")) then	-- [BACKSPACE] key
		local player	= getSpecificPlayer(0)
		local Gun		= player:getPrimaryHandItem()
		local auto		= nil
		local single	= nil
		local burst2	= nil
		local burst3	= nil
		local set		= nil
		local setMsg	= nil

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local mode	= Gun:getFireMode()
			if Gun:getFireModePossibilities() then
				for i=0, Gun:getFireModePossibilities():size() - 1 do
					local firemode = Gun:getFireModePossibilities():get(i);
					if firemode == "Auto" then
						auto = firemode
					elseif firemode == "Single" then
						single = firemode
					elseif firemode == "[2]Burst" then
						burst2 = firemode
					elseif firemode == "[3]Burst" then
						burst3 = firemode
					elseif firemode == "Auto[H]" then
						auto = firemode
					elseif firemode == "Single[H]" then
						single = firemode
					elseif firemode == "[H2]Burst" then
						burst2 = firemode
					elseif firemode == "[H3]Burst" then
						burst3 = firemode
					elseif firemode == "Auto[L]" then
						auto = firemode
					elseif firemode == "Single[L]" then
						single = firemode
					elseif firemode == "[L2]Burst" then
						burst2 = firemode
					elseif firemode == "[L3]Burst" then
						burst3 = firemode
					end
				end

				----------------------------------
				--	TOGGLE ORDER				--
				--	SINGLE BURST AUTO			--
				----------------------------------
				if	(mode == single) and (burst2) then
					set = burst2
					setMsg = "--"
				elseif	(mode == single) and (burst3) then
					set = burst3
					setMsg = "---"
				elseif	(mode == single) and (auto) then
					set = auto
					setMsg = "----"

				elseif	(mode == burst2) and (burst3) then
					set = burst3
					setMsg = "---"
				elseif	(mode == burst2) and (auto) then
					set = auto
					setMsg = "----"
				elseif	(mode == burst2) and (single) then
					set = single
					setMsg = "-"

				elseif	(mode == burst3) and (auto) then
					set = auto
					setMsg = "----"
				elseif	(mode == burst3) and (single) then
					set = single
					setMsg = "-"
				elseif	(mode == burst3) and (burst2) then
					set = burst2
					setMsg = "--"

				elseif	(mode == auto) and (single) then
					set = single
					setMsg = "-"
				elseif	(mode == auto) and (burst2) then
					set = burst2
					setMsg = "--"
				elseif	(mode == auto) and (burst3) then
					set = burst3
					setMsg = "---"
				end

				if set ~= nil then
					Gun:setFireMode(set)
					player:playSound("weaponLight");
					DebugSay(2,setMsg)
				end
			else	DebugSay(2,getText("ContextMenu_NoFunction"))
			end
		----------------------------------
		--	TOGGLE THROWN WEAPON		--
		--	AUTO EQUIP [On/Off]			--
		----------------------------------
		elseif	(GUNFIGHTER.OPTIONS.options.box131 == true) then
			if	(Gun) and (Gun:hasTag("Thrown")) then
				if player:getModData().AutoThrow == nil then
					player:getModData().AutoThrow = 1
					DebugSay(2,getText("ContextMenu_AutoEquip_ON"))
				elseif player:getModData().AutoThrow ~= nil then
					player:getModData().AutoThrow = nil
					DebugSay(2,getText("ContextMenu_AutoEquip_OFF"))
				end
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end
	end
end

--------------------------------------------------------------------------
--  FAKE SWITCHER JUST A RELOADER TO GET SCRIPT VERSION					--
--------------------------------------------------------------------------
local function WeaponReloadScript(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == getCore():getKey("REFRESH_SCRIPT")) then
		local player	= getSpecificPlayer(0)
		local Gun		= player:getPrimaryHandItem()

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local clone		= Gun:getType()
			local result	= InventoryItemFactory.CreateItem(clone);
			player:getInventory():AddItem(result);

		--	======= TRANSFER LIGHT ON / OFF ========
			if	Gun:getModData().LightOn == true then
				result:getModData().LightOn = true
				DebugSay(3,"Lite Still ON")
			end

		--	======= TRANSFER CONDITION & MODE ======
			result:setCondition(Gun:getCondition());
			result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
			result:setFireMode(Gun:getFireMode());
			result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

		--	====== TRANSFER AMMO MAG & CHAMBER =====
			if	Gun:isContainsClip() == true then
				result:setContainsClip(true);
			end

		--	====== TRANSFER MAG-TYPE =====
			if	Gun:getMagazineType() == nil and Gun:getModData().ClipType ~= nil then
				result:setMagazineType(Gun:getModData().ClipType);
			elseif	result:getMagazineType() == Fixed then			-- FIXED MAG GUNS... SEEMS BACKWARDS ???
				DebugSay(3,"...")
			elseif	Gun:getMagazineType() ~= Fixed then			-- MAG FED GUNS
				result:setMagazineType(Gun:getMagazineType());
			end

			if result:getMagazineType() ~= nil then
					result:setMaxAmmo(InventoryItemFactory.CreateItem(result:getMagazineType()):getMaxAmmo())
			else	result:setMaxAmmo(Gun:getMaxAmmo())			-- PUMPS AND LEVER GUNS ETC
			end
			
			result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

			if	Gun:haveChamber() and Gun:isRoundChambered() == true then
				result:setRoundChambered(true);
			else	result:setRoundChambered(false);
			end

		--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
			if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))
				result:attachWeaponPart(Gun:getWeaponPart("Canon"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
			end

		-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
			local sling = Gun:getSling()
			if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
				result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
				result:getModData().TempContainsClip	= (Gun:getModData().TempContainsClip)
				result:getModData().TempRoundChambered	= (Gun:getModData().TempRoundChambered)
				result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
			end

			result:setSwingSound(sound)

			if	(instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
				ReEquipIt(player, result)
				checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);
			end
		end
	end
end

--------------------------------------------------------------------------
--  MELEE MODE TOGGLE													--
--------------------------------------------------------------------------
local function WeaponMeleeToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == getCore():getKey("MELEE_MODE")) then	-- [M]

		local tog		= nil
		local player	= getSpecificPlayer(0)
		local Gun		= player:getPrimaryHandItem()

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local Melee	= Gun:getModData().Melee
			local Integral	= Gun:getModData().Integral
			local sling	= Gun:getSling()
			--------------------------------------
			--	FOR INTEGRAL LAUNCHER TOGGLE	--
			--------------------------------------
			if	( (sling) and (string.find(sling:getType(), "Launcher")) and (isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (isLauncher(Gun)) ) then	-- EXIT LAUNCHER MODE
				Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				DebugSay(3,"EXIT Launcher Mode")

			--	if (string.find(Gun:getType(), "Melee")) then		-- NOT SURE TO RESTRICT FROM MELEE OR NOT
			--		DebugSay(3,"From Melee Mode")
			--	end

				if	Melee ~= nil then
					tog = Melee
				end

				if	tog == nil then
					DebugSay(2,getText("ContextMenu_NoFunction"))
				end

				local result = InventoryItemFactory.CreateItem(tog);

			--	======= TRANSFER LIGHT ON / OFF ========
				if	Gun:getModData().LightOn == true then
					result:getModData().LightOn = true
					DebugSay(3,"Lite Still ON")
				end

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- AMMO TYPE DATA
				result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
				result:getModData().TempContainsClip	= (Gun:isContainsClip())	
				result:getModData().TempRoundChambered	= (Gun:isRoundChambered())	
				result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)

				if	(Gun:getModData().TempFireMode) ~= nil then
					result:setFireMode(Gun:getModData().TempFireMode)			-- M16 SET its own FROM M203 TEMP
				end
				if	(Gun:getModData().TempContainsClip) then
					result:setContainsClip(Gun:getModData().TempContainsClip)
				end
				if	(Gun:getModData().TempRoundChambered) then
					result:setRoundChambered(Gun:getModData().TempRoundChambered)
				end
				if	(Gun:getModData().TempCurrentAmmoCount) then
					result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)
				end
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
				end

				if 	(Gun:getCurrentAmmoCount() > 0) or (Gun:isRoundChambered()) or (Gun:isContainsClip() == true) then						-- STORE GRENADE TYPE IN M16 TEMP
					if	Gun:getAmmoType() == "Base.40HERound" then		-- USE AMMOTYPE INSTEAD
						result:getModData().TempAmmoType	= 1			-- INCENDIARY
					else	result:getModData().TempAmmoType	= 2		-- EXPLOSIVE
					end
				end

				player:getInventory():AddItem(result);
				checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then						-- REMOVE isAimedFirearm() for BAYO (Mele)
					ReEquipIt(player, result)
				end

			--------------------------------------
			--	FOR ATTACHED LAUNCHER TOGGLE	--
			--------------------------------------
			elseif 	(isLauncher(Gun)) and
				(not string.find(Gun:getType(), "RPG_7")) and	-- NOT STAND ALONE
				(not string.find(Gun:getType(), "M72_LAW")) and	-- NOT STAND ALONE
				(not string.find(Gun:getType(), "EX41")) and
				(not string.find(Gun:getType(), "Federal")) and
				(not string.find(Gun:getType(), "GM94")) and
				(not string.find(Gun:getType(), "M32")) and		-- EXIT LAUNCHER MODE FOR UNINSTALLED LAUNCHER BUG
				(not string.find(Gun:getType(), "Soaker")) and
				(not string.find(Gun:getType(), "M2A1")) and
				(not string.find(Gun:getType(), "FlareGun")) and
				(not string.find(Gun:getType(), "Chainsaw")) then

		        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				DebugSay(3,"EXIT Launcher Mode")

				if	Melee ~= nil then
					tog = Melee
				end

				if	tog == nil then
					DebugSay(2,getText("ContextMenu_NoFunction"))
				end

				local result = InventoryItemFactory.CreateItem(tog);

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());
				result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
				result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- AMMO TYPE DATA
				result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
				result:getModData().TempContainsClip	= (Gun:isContainsClip())	
				result:getModData().TempRoundChambered	= (Gun:isRoundChambered())	
				result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)

				if	(Gun:getModData().TempFireMode) ~= nil then
					result:setFireMode(Gun:getModData().TempFireMode)			-- M16 SET its own FROM M203 TEMP
				end
				if	(Gun:getModData().TempContainsClip) then
					result:setContainsClip(Gun:getModData().TempContainsClip)
				end
				if	(Gun:getModData().TempRoundChambered) then
					result:setRoundChambered(Gun:getModData().TempRoundChambered)
				end
				if	(Gun:getModData().TempCurrentAmmoCount) then
					result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)
				end
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
				end

				if 	(Gun:getCurrentAmmoCount() > 0) or (Gun:isContainsClip() == true) then		-- STORE GRENADE TYPE IN M16 TEMP
					if	Gun:getAmmoType() == "Base.40HERound" then		-- USE AMMOTYPE INSTEAD
						result:getModData().TempAmmoType	= 1			-- INCENDIARY
					else	result:getModData().TempAmmoType	= 2		-- EXPLOSIVE
					end
				end

				player:getInventory():AddItem(result);
				checkHotbar(player, Gun, result, 1)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then		-- REMOVE isAimedFirearm() for BAYO (Mele)
					ReEquipIt(player, result)
				end

			--------------------------------------
			--	FOR NORMAL MELEE MODE TOGGLE	--
			--------------------------------------
			else

				if	Melee	~= nil then 
					tog	= Melee
				end

				if tog == nil then
					DebugSay(2,getText("ContextMenu_NoFunction"))

				else	Sound = player:getEmitter():playSound("batSwing")

					local result = InventoryItemFactory.CreateItem(tog);
					player:getInventory():AddItem(result);

				--	======= TRANSFER LIGHT ON / OFF ========
					if	Gun:getModData().LightOn == true then
						result:getModData().LightOn = true
						DebugSay(3,"Lite Still ON")
					end

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setHaveBeenRepaired(Gun:getHaveBeenRepaired());
					result:getModData().TriggerType = Gun:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP
					
				--	==== FIREMODE FROM MELEE NEEDS SAVE ====
					if		Gun:getFireMode() ~= nil then
							result:setFireMode(Gun:getFireMode())
							result:getModData().TempFireMode = Gun:getFireMode()
						--	DebugSay(2,"Regular FireMode / Temp Set")
					elseif	Gun:getModData().TempFireMode ~= nil then
							result:setFireMode(Gun:getModData().TempFireMode)
						--	DebugSay(2,"Temp FireMode Set")
					else	local scriptItem = result:getScriptItem()
							if scriptItem and scriptItem.FireMode ~= nil then
								result:setFireMode(scriptItem.FireMode)
						--		DebugSay(2,"Script FireMode Set")
							end
					end
					
					
				--	====== TRANSFER AMMO MAG & CHAMBER =====
					if	(Gun:isContainsClip() == true) and (result:getMagazineType() ~= nil) then
						result:setContainsClip(true);
					end

				--	====== TRANSFER MAG-TYPE =====
					if	Gun:getMagazineType() == nil and Gun:getModData().ClipType ~= nil then
						result:setMagazineType(Gun:getModData().ClipType);
					elseif	result:getMagazineType() == "Base.Fixed" then		-- FIXED MAG GUNS... SEEMS BACKWARDS ???
						result:setContainsClip(true);				-- ALWAYS TRUE
					elseif	Gun:getMagazineType() ~= "Base.Fixed" then		-- MAG FED GUNS
						result:setMagazineType(Gun:getMagazineType());
					end

					result:setMaxAmmo(Gun:getMaxAmmo());

					result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

					if	Gun:isRoundChambered() == true then
						result:setRoundChambered(true);
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
						DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
					end

				--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
					if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
						result:attachWeaponPart(Gun:getWeaponPart("Scope"))
						result:attachWeaponPart(Gun:getWeaponPart("Canon"))
						result:attachWeaponPart(Gun:getWeaponPart("Clip"))
						result:attachWeaponPart(Gun:getWeaponPart("Stock"))
						result:attachWeaponPart(Gun:getWeaponPart("Sling"))
						result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
					end

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
					if	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip	= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered	= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
					end

					local	scriptItem	= result:getScriptItem()
				--	local	maxDmg		= scriptItem:getMaxDamage()
				--	local	minDmg		= scriptItem:getMinDamage()
					local	maxRange	= scriptItem:getMaxRange()	-- USE NON-MODIFIED ONLY WHEN MELEE
			--		local	maxDmg		= result:getMaxDamage()		-- USE MODIFIED DAMAGE
			--		local	minDmg		= result:getMinDamage()		-- USE MODIFIED DAMAGE
					local	crit		= result:getCriticalChance()
					local	impact		= result:getImpactSound()
					local	canon		= result:getCanon()
					local	scope		= result:getScope()
					local	bayo		= 0

					if result:isAimedHandWeapon() then	-- DONT DO THIS GOING TO GUN MODE
						if canon then
							if string.find(canon:getType(), "Bayonet") then
					--			maxDmg	= 1.8
					--			minDmg	= 1.4
								crit	= 10
								bayo	= 0.4
								impact	= BladeHit
							end
						end
					--	if scope then
						local meleeRange = maxRange + bayo
						result:setMaxRange(meleeRange)
					--	end
					end

					if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
						ReEquipIt(player, result)
						checkHotbar(player, Gun, result, 10)				-- (30) CHECK HOTBAR
						local inv = player:getInventory()
						inv:DoRemoveItem(Gun);
					end

			--		result:setMaxDamage(maxDmg)
			--		result:setMinDamage(minDmg)
					result:setCriticalChance(crit)
					result:setImpactSound(impact)
					Damage_Multiplier(result)
				end
			end
		else	DebugSay(2,getText("ContextMenu_NoFunction"))
		end
	end
end


--------------------------------------------------------------------------
--	WEAPON MOUNTED NIGHT VISION TOGGLE									--
--------------------------------------------------------------------------
local function WeaponNightVisionToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local nvctrl = require "NVAPI/ctrl/instance"

	if	keyNum == getCore():getKey("WEAPON_NVG") and (nvctrl ~= nil) then
			nvctrl:toggle()
	else	DebugSay(3,"NV-API Not Found...")
	end
end

--------------------------------------------------------------------------
--	WEAPON MOUNTED NIGHT VISION OFF										--
--------------------------------------------------------------------------
function isWearingNightVision(player)
	local worn = nil
	if player then
		local inv = player:getInventory()
		local weapon = player:getPrimaryHandItem()
		local items = inv:getItems()

		if items then
			for i=1, items:size()-1 do
				local item = items:get(i)
					if	(item ~= nil) and (item:getCategory() == "Clothing") and
						(item:hasTag("NVITEM")) and (item ~= weapon) and
						(item:isEquipped()) and
						(not string.find(item:getType(), "NV_Control")) then
					DebugSay(3,"Is Wearing NV")
					worn = item
				else	DebugSay(3,"Item Not NV")
				end
			end
		else DebugSay(3,"Naked ???")
		end
	end

	if worn ~= nil then
		return true
	else	return false
	end
end


--------------------------------------------------------------------------
--	CHECK FOR WWEAPON NIGHT VISION										--
--------------------------------------------------------------------------
function isWeaponNightVision(weapon)
	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		scope	= weapon:getScope()
		if 	(scope) and (scope:hasTag("NVITEM")) then
			return true
		else	return false
		end
	else	return false
	end
end	


--------------------------------------------------------------------------
--	TOGGLE AUTO NIGHT VISION ACTIVATON									--
--------------------------------------------------------------------------
local function AutoNightVisionToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local attacker = getSpecificPlayer(0)
	local weapon = nil

	if	attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon = attacker:getPrimaryHandItem()
	end

	if (weapon) and isWeaponNightVision(weapon) and (not isWearingNightVision(attacker)) then
		if	keyNum == getCore():getKey("WEAPON_NVG") and (not attacker:isAiming()) then
			if		GUNFIGHTER.OPTIONS.options.dropdown133 == 2 then
					GUNFIGHTER.OPTIONS.options.dropdown133 = 3
					DebugSay(2,getText("ContextMenu_NV_AUTO"))
			elseif	GUNFIGHTER.OPTIONS.options.dropdown133 == 3 then
					GUNFIGHTER.OPTIONS.options.dropdown133 = 2
					DebugSay(2,getText("ContextMenu_NV_MANUAL"))
			else		DebugSay(2,getText("ContextMenu_NV_OFF"))
			end
		end
	end
end

--------------------------------------------------------------------------
--	WEAPON MOUNTED NIGHT VISION (NVAPI Mod) COMPATIBILITY				--
--	USING WEAPON OPTIC ATTACHMENT / CLOTHING WORK-AROUND 				--
--	WITH MODE-COLOR ILLUMINATED APERTURE, AND AIMED OPTION				--
--	CONTROLLED ACTIVATION... BY ARSENAL[26]								--
--------------------------------------------------------------------------
local function WeaponNightVision()

	local attacker	= getSpecificPlayer(0)

	local weapon	= nil
	if attacker		~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
		if isWearingNightVision(attacker) then
			DebugSay(3,"Wearing NV")
			return
		else	DebugSay(3,"Not Wearing NV")
		end
	end
	local inv	= attacker:getInventory()
	local items	= inv:getItems()
	local nv_Control
	local scope	= nil

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		scope	= weapon:getScope()
	end

	for i=1, items:size()-1 do
		local item = items:get(i)
		if item ~= nil and (item:getCategory() == "Clothing") and (string.find(item:getType(), "NV_Control")) then

			if	(weapon) and (item:getModData().WEAPON ~= weapon) then
				DebugSay(3,"WEAPON UPDATE DATA")
				item:getModData().NVAPI_CHARGE	= weapon:getModData().NVAPI_CHARGE
				item:getModData().NVAPI_FILTER	= weapon:getModData().NVAPI_FILTER
				item:getModData().NVAPI_BRIGHTNESS	= weapon:getModData().NVAPI_BRIGHTNESS
		--	elseif scope then
		--		DebugSay(2,"UPDATE SCOPE DATA")
		--		item:getModData().NVAPI_CHARGE	= scope:getModData().NVAPI_CHARGE
		--		item:getModData().NVAPI_FILTER	= scope:getModData().NVAPI_FILTER
		--		item:getModData().NVAPI_BRIGHTNESS	= scope:getModData().NVAPI_BRIGHTNESS
			end
			nv_Control = item
			nv_Control:getModData().WEAPON = weapon
			DebugSay(3,"NV-Control Found")
		else	DebugSay(3,"NV-Control Not Found")
		end
	end

	if 	(scope) and (scope:hasTag("NVITEM")) then
		DebugSay(3,"NV-Control Set")

		local	NV_Temp = InventoryItemFactory.CreateItem('NV_Control')
		if	scope:getModData().NVAPI_BRIGHTNESS then
			NV_Temp:getModData().NVAPI_BRIGHTNESS = scope:getModData().NVAPI_BRIGHTNESS
		end
		if	scope:getModData().NVAPI_FILTER then
			NV_Temp:getModData().NVAPI_FILTER = scope:getModData().NVAPI_FILTER
		end
		if	scope:getModData().NVAPI_CHARGE then
			NV_Temp:getModData().NVAPI_CHARGE = scope:getModData().NVAPI_CHARGE
		end

		if	nv_Control == nil then
			inv:AddItem(NV_Temp)				-- PUT INVENTORY TO CONTROL
			nv_Control = NV_Temp
		end

		nv_Control:getModData().WEAPON = weapon		-- ASSIGN CONTROL TO WEAPON

		--------------------------------------
		--	SET RETICLE COLOR EFFECT		--
		--------------------------------------
		local color	= ImmutableColor.new(1.0, 1.0, 1.0, 1)

		if		nv_Control:getModData().NVAPI_FILTER == "Noiseless" then
				color = ImmutableColor.new(0.8, 1.0, 0.6, 1)
		elseif	nv_Control:getModData().NVAPI_FILTER == "Linear Blur" then
				color = ImmutableColor.new(0.6, 0.9, 0.7, 1)
		elseif	nv_Control:getModData().NVAPI_FILTER == "Infrared" then
				color = ImmutableColor.new(1.0, 0.5, 0.5, 1)
		elseif	nv_Control:getModData().NVAPI_FILTER == "X-ray" then
				color = ImmutableColor.new(0.7, 0.9, 1.0, 1)
		end

		nv_Control:getVisual():setTint(color)			-- TEXTURE TINT
		color = Color.new(1, 1, 1, 1)
		nv_Control:setColor(color)					-- NO ICON COLOR CHANGE

		--------------------------------------
		--	EQUIP / UNEQUIP IF AIMING		--
		--------------------------------------
		if	nv_Control ~= nil then
			if	attacker:isAiming() then
				if 	not nv_Control:isEquipped() then
					attacker:setWornItem(nv_Control:getBodyLocation(), nv_Control)
					if (GUNFIGHTER.OPTIONS.options.dropdown133 == 3) then
						WeaponNightVisionToggle(getCore():getKey("WEAPON_NVG"))
					end

					--------------------------------------
					--	SET DEBUG DATA TO DISPLAY		--
					--------------------------------------
					local CHG = "Off"										-- DOESNT REGISTER UNTIL ACTIVATED
					if		nv_Control:getModData().NVAPI_CHARGE ~= nil then
							CHG = round(nv_Control:getModData().NVAPI_CHARGE * 100, 2)
					end
					local	BRT = "Min"
					if		nv_Control:getModData().NVAPI_BRIGHTNESS == 0.2 then
							BRT = "Min"
					elseif	nv_Control:getModData().NVAPI_BRIGHTNESS == 0.3 then
							BRT = "Med"
					elseif	nv_Control:getModData().NVAPI_BRIGHTNESS == 0.4 then
							BRT = "Max"
					end
					local	FIL = "NL"
					if		nv_Control:getModData().NVAPI_FILTER == "Noiseless" then
							FIL = "NL"
					elseif	nv_Control:getModData().NVAPI_FILTER == "Linear Blur" then
							FIL = "LB"
					elseif	nv_Control:getModData().NVAPI_FILTER == "Infrared" then
							FIL = "IR"
					elseif	nv_Control:getModData().NVAPI_FILTER == "X-ray" then
							FIL = "XR"
					end
				--	DebugSay(2,"NV-OPTIC - ["..tostring(FIL).."-"..tostring(BRT).."-".. tostring(CHG).."%]")
				end

			elseif	nv_Control:isEquipped() then
					attacker:setWornItem(nv_Control:getBodyLocation(), nil)
					scope:getModData().NVAPI_BRIGHTNESS	 = nv_Control:getModData().NVAPI_BRIGHTNESS
					scope:getModData().NVAPI_FILTER	 = nv_Control:getModData().NVAPI_FILTER
					scope:getModData().NVAPI_CHARGE	 = nv_Control:getModData().NVAPI_CHARGE
					weapon:getModData().NVAPI_BRIGHTNESS	 = nv_Control:getModData().NVAPI_BRIGHTNESS	-- STORE DATA IN WEAPON TOO
					weapon:getModData().NVAPI_FILTER	 = nv_Control:getModData().NVAPI_FILTER
					weapon:getModData().NVAPI_CHARGE	 = nv_Control:getModData().NVAPI_CHARGE
					WeaponNightVisionToggle(getCore():getKey("WEAPON_NVG"))
				--	WeaponNightVisionOFF()
					inv:DoRemoveItem(nv_Control)
					nv_Control = nil
					DebugSay(3,"NV-Control Removed")
			end
		end
	elseif	nv_Control ~= nil then
			inv:DoRemoveItem(nv_Control)
			nv_Control = nil
			DebugSay(3,"NV-Control Removed")
	end
end


--------------------------------------------------------------------------
--  WEAPON LIGHT SAVE / RESTORE CHARGE DATA								--
--	BECAUSE ATTACHMENT MODDATA IS NOT SAVED IF ATTACHED TO WEAPON		--
--	SO WE XFER PART CHARGE DATA TO WEAPON ON DRAIN, AND EQUIP			--
--------------------------------------------------------------------------
local function WeaponLightChargeData(player, weapon)

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and weapon:getModData().Charge ~= nil then
		local	stock = weapon:getStock()
		local	sling = weapon:getSling()
		----------------------------------
		--	FOR MAJORITY OF LIGHTS		--
		----------------------------------
		if		stock and ( stock:hasTag("Light") or stock:hasTag("Laser") ) then
				local	partCharge = stock:getModData().Charge
				local	saveCharge = weapon:getModData().Charge
				if		partCharge == nil then
						stock:getModData().Charge = saveCharge
			--			DebugSay(2,"Charge Data Transfered - "..tostring(round(stock:getModData().Charge,1) ) )
				elseif	partCharge ~= nil and saveCharge ~= nil and partCharge ~= saveCharge then
						weapon:getModData().Charge = partCharge
			--			DebugSay(2,"Charge Data Replaced - "..tostring(round(weapon:getModData().Charge,1) ) )
			--	else	DebugSay(2,"Charge Data Replaced - "..tostring(round(weapon:getModData().Charge,1) ) )
				end
		end
		----------------------------------
		--	FOR FOREGRIP / LIGHT COMBO	--
		----------------------------------
		if		sling and ( sling:hasTag("Light") or sling:hasTag("Laser") ) then
				local	partCharge = sling:getModData().Charge
				local	saveCharge = weapon:getModData().Charge2
				if		partCharge == nil then
						sling:getModData().Charge = saveCharge
			--			DebugSay(2,"Charge Data Transfered - "..tostring(round(stock:getModData().Charge,1) ) )
				elseif	partCharge ~= nil and saveCharge ~= nil and partCharge ~= saveCharge then
						weapon:getModData().Charge2 = partCharge
			--			DebugSay(2,"Charge Data Replaced - "..tostring(round(weapon:getModData().Charge,1) ) )
			--	else	DebugSay(2,"Charge Data Replaced - "..tostring(round(weapon:getModData().Charge,1) ) )
			end
		end
	end
end
	
Events.OnEquipPrimary.Add(WeaponLightChargeData)
--------------------------------------
-- INIT CHARGE on Game StartFire	--
--------------------------------------
Events.OnGameStart.Add(function()
	local player = getPlayer()
	WeaponLightChargeData(player, player:getPrimaryHandItem())
end)


--------------------------------------------------------------------------
--  WEAPON LIGHT TOGGLE													--
--------------------------------------------------------------------------
local function WeaponLightToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == getCore():getKey("WEAPON_LIGHT")) or (keyNum == getCore():getKey("WEAPON_BIPOD")) then
		local attacker	= getSpecificPlayer(0)
		local weapon	= attacker:getPrimaryHandItem()
		local stock		= nil
		local sling		= nil
		local togSling	= nil
		local togStock	= nil
		local hasLaser	= nil
		local hasLight	= nil
		local hasBipod	= nil
		local charge	= nil
		local fold2		= nil

		if	weapon then
			if weapon:getModData().LightOn == nil then
				weapon:getModData().LightOn = false
			end
			if weapon:getModData().LaserOn == nil then
				weapon:getModData().LaserOn = false
			end
		end

		if		(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
				stock	= weapon:getStock()
				sling	= weapon:getSling()

				if		(stock) and ( (string.find(stock:getType(), "Light")) or (stock:hasTag("Light")) ) then
						hasLight = stock
						if (stock:getModData().Charge and stock:getModData().Charge > 0) then
							charge = hasLight:getModData().Charge
						end
				end
				if		(stock) and ( (string.find(stock:getType(), "Laser")) or (stock:hasTag("Laser")) ) then
						hasLaser = stock
						if (stock:getModData().Charge and stock:getModData().Charge > 0) then
							charge = hasLaser:getModData().Charge
						end
				end
				------------------------------
				--	USE SLING IF INSTALLED	--
				------------------------------
				if		(sling) and ( (string.find(sling:getType(), "Light")) or (sling:hasTag("Light")) ) then
						hasLight = sling
						if (sling:getModData().Charge and sling:getModData().Charge > 0) then
							charge = hasLight:getModData().Charge
						end
				end
				if		(sling) and ( (string.find(sling:getType(), "Laser")) or (sling:hasTag("Laser")) ) then
						hasLaser = sling
						if (sling:getModData().Charge and sling:getModData().Charge > 0) then
							charge = hasLaser:getModData().Charge
						end
				end
				
				if		(sling) and (string.find(sling:getType(), "Bipod")) then
						hasBipod = sling
				end
				

				if stock ~= nil then
					togStock = InventoryItemFactory.CreateItem(stock:getModData().Mode_Toggle)
				end
				if sling ~= nil then
					togSling = InventoryItemFactory.CreateItem(sling:getModData().Mode_Toggle)
				end
		end

		if (keyNum == getCore():getKey("WEAPON_LIGHT")) then					-- CONDITION
		
		--	DebugSay(2,"part Laser TAG - "..tostring(stock:hasTag("Laser")))
		--	DebugSay(2,"part Light TAG - "..tostring(stock:hasTag("Light")))
		
			if	hasLight or hasLaser then
				if charge == nil then
					charge = 0
				end
				
		--		DebugSay(2,"Charge "..tostring(charge))
			
				if	(charge <= 0) then
					DebugSay(2,getText("ContextMenu_AttachmentCharge_NO"))
					return
				end
				attacker:playSound("weaponLight")
				----------------------------------------------
				--	MANUAL LASER ONLY WHEN AUTO NOT ENABLED	--
				----------------------------------------------
				if		attacker:isAiming() and hasLaser and (GUNFIGHTER.OPTIONS.options.dropdown144 <= 2) and charge and charge > 0 then
						if		weapon:getModData().LaserOn == true then
								weapon:getModData().LaserOn = false
								DebugSay(2,getText("ContextMenu_Laser_OFF"))
						elseif	weapon:getModData().LaserOn == false then
								weapon:getModData().LaserOn = true
								DebugSay(2,getText("ContextMenu_Laser_ON"))
						end
						
						if	(stock) and (togStock) and (
							( weapon:getModData().LaserOn == false and (string.find(stock:getType(), "_ON")) ) or
							( weapon:getModData().LaserOn == true  and (not string.find(stock:getType(), "_ON")) ) ) then
						--	DebugSay(2,"Toggling..."..tostring(togStock:getType()))
							----------------------
							--	TRANSFER CHARGE	--
							----------------------
							togStock:getModData().Charge = hasLaser:getModData().Charge
							togStock:setColorRed(hasLaser:getColorRed())
							togStock:setColorGreen(hasLaser:getColorGreen())
							togStock:setColorBlue(hasLaser:getColorBlue())
							weapon:attachWeaponPart(togStock)
							checkHotbar(attacker, weapon, weapon, 1)			-- (30) CHECK HOTBAR
						end
				else	-- NOT AIMING			
						if hasLight and charge and charge > 0 then
							if		weapon:getModData().LightOn == true then
									weapon:getModData().LightOn = false
									DebugSay(2,getText("ContextMenu_Light_OFF"))
							elseif	weapon:getModData().LightOn == false then
									weapon:getModData().LightOn = true
									DebugSay(2,getText("ContextMenu_Light_ON"))
							end
						end
				end
			end	
		elseif (keyNum == getCore():getKey("WEAPON_BIPOD")) then
		
			fold2 = weapon:getModData().Fold2
		
			if	hasBipod then
				attacker:playSound("stormyRifleInsertRound");
				------------------------------
				--	TEST ATTACHMENT SWAP	--
				------------------------------
				if togSling then
					weapon:attachWeaponPart(togSling)
					checkHotbar(attacker, weapon, weapon, 30)					-- (30) CHECK HOTBAR
				end
				
			------------------------------
			--	FOLD2 MEANS INTEGRAL	--
			------------------------------
			elseif	fold2 ~= nil then
			
			--	DebugSay(2,"INTEGRAL FOLD2")
				togSling = nil
				togStock = nil
				
				Sound = attacker:getEmitter():playSound("stormyRifleInsertRound")
				tog = fold2

				if	(string.find(tog, "Grip")) then	-- SOME ITEM NAMES ARE NOT FORMATTED
					DebugSay(2,getText("ContextMenu_GripDeploy"))
				elseif	(string.find(weapon:getType(), "Grip")) then
					DebugSay(2,getText("ContextMenu_GripFold"))
				end

				local result = InventoryItemFactory.CreateItem(tog);
				attacker:getInventory():AddItem(result);

			--	======= TRANSFER LIGHT ON / OFF ========
				if	weapon:getModData().LightOn == true then
					result:getModData().LightOn = true
					DebugSay(3,"Lite Still ON")
				end

			--	======= TRANSFER CONDITION & MODE ======
				result:setCondition(weapon:getCondition());
				result:setHaveBeenRepaired(weapon:getHaveBeenRepaired());
				result:setFireMode(weapon:getFireMode());
				result:getModData().TriggerType = weapon:getModData().TriggerType	-- TEST UPGRADE TRIGGER GROUP

			--	====== TRANSFER AMMO MAG & CHAMBER =====
				if	weapon:isContainsClip() == true then
					result:setContainsClip(true);
				end

			--	====== TRANSFER MAG-TYPE =====
				if	weapon:getMagazineType() == nil and weapon:getModData().ClipType ~= nil then
					result:setMagazineType(weapon:getModData().ClipType);
				elseif	result:getMagazineType() == Fixed then			-- FIXED MAG GUNS... SEEMS BACKWARDS ???
					DebugSay(3,"...")
				elseif	weapon:getMagazineType() ~= Fixed then			-- MAG FED GUNS
					result:setMagazineType(weapon:getMagazineType());
				end

				result:setMaxAmmo(weapon:getMaxAmmo());

				result:setCurrentAmmoCount(weapon:getCurrentAmmoCount());

				if	weapon:isRoundChambered() == true then
					result:setRoundChambered(true);
				end

			--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
				if 	(result:isAimedFirearm() and weapon:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
					result:attachWeaponPart(weapon:getWeaponPart("Scope"))
					result:attachWeaponPart(weapon:getWeaponPart("Canon"))
					result:attachWeaponPart(weapon:getWeaponPart("Clip"))
					result:attachWeaponPart(weapon:getWeaponPart("Stock"))
					result:attachWeaponPart(weapon:getWeaponPart("Sling"))
					result:attachWeaponPart(weapon:getWeaponPart("RecoilPad"))
				end

			-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
				local sling = weapon:getSling()
				if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(weapon)) ) or
					( (Integral) and (Integral == "Launcher") and (not isLauncher(weapon)) ) then
					result:getModData().TempFireMode		= (weapon:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
					result:getModData().TempContainsClip	= (weapon:getModData().TempContainsClip)
					result:getModData().TempRoundChambered	= (weapon:getModData().TempRoundChambered)
					result:getModData().TempCurrentAmmoCount	= (weapon:getModData().TempCurrentAmmoCount)
					result:getModData().TempAmmoType		= (weapon:getModData().TempAmmoType)
				end

				if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
					ReEquipIt(attacker, result)
					checkHotbar(attacker, weapon, result, 30)					-- (30) CHECK HOTBAR
					local inv = attacker:getInventory()
					inv:DoRemoveItem(weapon);
				end
		--	else	DebugSay(2,getText("ContextMenu_NoFunction"))
		--		end
			else	DebugSay(2,getText("ContextMenu_NoFunction"))
			------------------------------
			-- TRY FOLD2 END			--
			------------------------------	
			end		
		end
		
		if togStock or togSling then
			ReEquipIt(attacker, weapon)
		end
	end
end

--[[
--------------------------------------------------------------------------
--  WEAPON LIGHT RUNTIME FACTOR							MOVED TO SERVER	--
--------------------------------------------------------------------------
local function getWeaponLightRuntime()
	local	setting = (GUNFIGHTER.OPTIONS.options.dropdown145)
	if		setting == 1  then	return 0
	elseif	setting == 2  then	return 0.000001
	elseif	setting == 3  then	return 0.000005
	elseif	setting == 4  then	return 0.00001
	elseif	setting == 5  then	return 0.00005
	elseif	setting == 6  then	return 0.0001
	elseif	setting == 7  then	return 0.0005
	elseif	setting == 8  then	return 0.001
	elseif	setting == 9  then	return 0.005
	elseif	setting == 10 then	return 0.01
	else						return 0
	end
end
]]

--------------------------------------------------------------------------
--  WEAPON LIGHT DEACTIVATE IF ATTACHED									--
--	BECAUSE ATTACHED WEAPONS WILL NOT DRAIN								--
--------------------------------------------------------------------------
local function WeaponLightToggleAttached()
	
	local player = getSpecificPlayer(0)
	local items  = player:getAttachedItems()
	
	for i=0,items:size() - 1 do
		local item = items:get(i)
		if (item ~= nil) then
			if item:getItem():getModData().LightOn == true then
				if		player:getPrimaryHandItem() ~= item:getItem() then							-- IGNORE ATTACHED AUTO-OFF WHEN EQUIPPED
					--	DebugSay(2,"Turning Off - "..tostring(item:getItem():getDisplayName()))
						item:getItem():getModData().LightOn = false
						item:getItem():setTorchCone(false)
						item:getItem():setLightDistance(0)
						item:getItem():setLightStrength(0)
				end
			end
		end
	end
end

Events.OnEquipPrimary.Add(WeaponLightToggleAttached)

--[[
--------------------------------------------------------------------------
--  WEAPON LIGHT BEAM BEHAVIOR							MOVED TO SERVER	--
--------------------------------------------------------------------------
local function WeaponLightBeam()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker		~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
		second	= attacker:getSecondaryHandItem()
	end

	local stock	= nil
	local sling	= nil
	local scope	= nil
	local light = nil
	local laser = nil
	local Glow
	local Glow2
	local charge

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		stock	= weapon:getStock()
		sling	= weapon:getSling()
		scope	= weapon:getScope()
	end

	if		(stock) and ( (string.find(stock:getType(), "Light")) or (stock:hasTag("Light")) ) then
			light = stock
			charge = light:getModData().Charge
	end
	if		(stock) and ( (string.find(stock:getType(), "Laser")) or (stock:hasTag("Laser")) ) then
			laser = stock
			charge = laser:getModData().Charge
	end
	if		(sling) and ( (string.find(sling:getType(), "Light")) or (sling:hasTag("Light")) ) then
			light = sling
			charge = light:getModData().Charge
	end
	if		(sling) and ( (string.find(sling:getType(), "Laser")) or (sling:hasTag("Laser")) ) then
			laser = sling
			charge = laser:getModData().Charge
	end

--	if		(sling) and (string.find(sling:getType(), "Light") or string.find(sling:getType(), "Laser")) then
--			light = sling
--	elseif	(stock) and (string.find(stock:getType(), "Light") or string.find(stock:getType(), "Laser")) then
--			light = stock
--	end

	if		attacker:getModData().Glow ~= nil then		-- ALWAYS OFF FIRST
			getCell():removeLamppost(attacker:getModData().Glow)
			attacker:getModData().Glow = nil
	end
	if		attacker:getModData().Glow2 ~= nil then		-- ALWAYS OFF FIRST
			getCell():removeLamppost(attacker:getModData().Glow2)
			attacker:getModData().Glow2 = nil
	end

	--------------------------
	--	WEAPON LASER		--
	--------------------------
	if	(laser) then
		if stock ~= nil then
			togStock = InventoryItemFactory.CreateItem(stock:getModData().Mode_Toggle)
		end
		--------------------------
		--	SHUTDOWN IF EMPTY	--
		--------------------------		
		if	weapon:getModData().LaserOn == false and (string.find(stock:getType(), "_ON")) then
			weapon:attachWeaponPart(togStock)
			checkHotbar(attacker, weapon, weapon, 1)			-- (30) CHECK HOTBAR
			ReEquipIt(attacker, weapon)
			DebugSay(2,getText("ContextMenu_Laser_OFF"))
		end
		--------------------------
		--	AUTO WHEN AIM		--
		--------------------------
		if	(GUNFIGHTER.OPTIONS.options.dropdown144 >= 3) then
			local autotog = nil
			if weapon:getModData().LaserOn == nil then
				weapon:getModData().LaserOn = false
			end
			
			if		attacker:isAiming() and weapon:getModData().LaserOn == false and (not string.find(stock:getType(), "_ON")) and charge and charge > 0 then
					weapon:getModData().LaserOn = true
					autotog = true
					DebugSay(2,getText("ContextMenu_Laser_ON"))
			elseif	not attacker:isAiming() and weapon:getModData().LaserOn == true and (string.find(stock:getType(), "_ON")) then
					weapon:getModData().LaserOn = false
					autotog = true
					DebugSay(2,getText("ContextMenu_Laser_OFF"))
			end
			
			if	(stock) and (togStock) and (autotog == true) then
				attacker:playSound("weaponLight");
				----------------------
				--	TRANSFER CHARGE	--
				----------------------
				togStock:getModData().Charge = laser:getModData().Charge
				togStock:setColorRed(laser:getColorRed())
				togStock:setColorGreen(laser:getColorGreen())
				togStock:setColorBlue(laser:getColorBlue())
				weapon:attachWeaponPart(togStock)
				checkHotbar(attacker, weapon, weapon, 1)			-- (30) CHECK HOTBAR
				ReEquipIt(attacker, weapon)
			end
		end
		
		------------------------------
		--	OPTIONAL GLOW EFFECT	--
		------------------------------
		if	(GUNFIGHTER.OPTIONS.options.dropdown144 == 1) or (GUNFIGHTER.OPTIONS.options.dropdown144 == 3) then
			if	(weapon:getModData().LaserOn == true) then
				local	flicktime = 1
				if		ZombRand(1 + weapon:getCondition()) == 0 then
						flicktime = 0
				end
				
			--	DebugSay(2,"R - "..tostring(laser:getColorRed()).."/ G - "..tostring(laser:getColorGreen()).." / B - "..tostring(laser:getColorBlue()))
				
				if		(laser:getColorRed() == 1) and (laser:getColorGreen() == 1) and (laser:getColorBlue() == 1) then		-- HAS NO COLOR ASSIGNED (1) IS MAX BRIGHT
						DebugSay(2,"SCRIPT COLORS")
						Glow = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  laser:getR(), laser:getG(), laser:getB(), (flicktime))	-- SCRIPT COLOR
				else	Glow = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  laser:getColorRed(), laser:getColorGreen(), laser:getColorBlue(), (flicktime))
						DebugSay(2,"TOGGLE SET COLORS")
				end
				getCell():addLamppost(Glow)
				attacker:getModData().Glow = Glow
			end
		end
		
		--------------------------
		--	DRAIN BATTERY		--
		--------------------------
		if	weapon:getModData().LaserOn == true then
			charge = laser:getModData().Charge
			if	charge ~= nil then
				if	charge > 0 then
					laser:getModData().Charge = charge - (getWeaponLightRuntime() * laser:getModData().Runtime)
					weapon:getModData().Charge = laser:getModData().Charge
					DebugSay(2,"Laser Drain - "..tostring(round(getWeaponLightRuntime() * laser:getModData().Runtime * 10000,1) ) )
				elseif charge <= 0 then
					weapon:getModData().LaserOn = false
				end
			end
		end
	end

	--------------------------
	--	WEAPON LIGHT		--
	--------------------------
	if	(weapon) and (light) and (weapon:getModData().LightOn == true) then
		charge = light:getModData().Charge
		--------------------------
		--	DRAIN BATTERY		--
		--------------------------
		if	charge ~= nil then
			if	charge > 0 then
				light:getModData().Charge = charge - (getWeaponLightRuntime() * light:getModData().Runtime)
				weapon:getModData().Charge = light:getModData().Charge
		--		DebugSay(2,"Light Drain - "..tostring(round(getWeaponLightRuntime() * laser:getModData().Runtime * 10000,1) ) )
			elseif charge <= 0 then
				weapon:getModData().LightOn = false
			end
		end

		if	attacker:isAiming() then
			weapon:setTorchCone(true)						-- THROW PATTERN
			if		(string.find(light:getType(), "Small")) then
					weapon:setLightDistance(10)
					weapon:setLightStrength(1.5)
			elseif	(string.find(light:getType(), "Medium")) then
					weapon:setLightDistance(15)
					weapon:setLightStrength(1.25)
			elseif	(string.find(light:getType(), "Large")) then
					weapon:setLightDistance(20)
					weapon:setLightStrength(1)
			elseif	(string.find(light:getType(), "PEQ")) then		-- SMALL LESS THAN DVAL
					weapon:setLightDistance(10)
					weapon:setLightStrength(1.5)
			elseif	(string.find(light:getType(), "DVAL")) then
					weapon:setLightDistance(15)
					weapon:setLightStrength(1.25)
			end
		else	weapon:setTorchCone(false)						-- FLOOD PATTERN
			if		(string.find(light:getType(), "Small")) then
					weapon:setLightDistance(2.5)
					weapon:setLightStrength(0.5)
			elseif	(string.find(light:getType(), "Medium")) then
					weapon:setLightDistance(2.0)
					weapon:setLightStrength(1)
			elseif	(string.find(light:getType(), "Large")) then
					weapon:setLightDistance(1.5)
					weapon:setLightStrength(2)
			elseif	(string.find(light:getType(), "PEQ")) then		-- SMALL MORE THAN DVAL
					weapon:setLightDistance(2.5)
					weapon:setLightStrength(0.5)
			elseif	(string.find(light:getType(), "DVAL")) then
					weapon:setLightDistance(2.0)
					weapon:setLightStrength(1)
			end
		end
	--------------------------
	--	NIGHT VISION		--
	--------------------------
	elseif	(scope) and (scope:hasTag("NVITEM")) then				-- CHECK NV LAST SO LIGHT PREVAILS
			weapon:setTorchCone(false)
			if attacker:isAiming() then
				weapon:setLightDistance(0.01)
				weapon:setLightStrength(0.01)
			else
				weapon:setLightDistance(0)
				weapon:setLightStrength(0)
			end
	elseif	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then	-- FIX FOR NORMAL LIGHTS GETTING FORCED OFF
			weapon:setTorchCone(false)
			weapon:setLightDistance(0)
			weapon:setLightStrength(0)
	--------------------------
	--	LIGHT SABER	PRIMARY	--
	--------------------------
	elseif	(weapon) and (weapon:hasTag("LightSaber") or weapon:hasTag("Torch")) then
		if	(weapon:getCondition() >= 1) then
			local SpriteA	= weapon:getModData().SpriteA
			local SpriteB	= weapon:getModData().SpriteB
			local SpriteC	= weapon:getModData().SpriteC
			local SpriteD	= weapon:getModData().SpriteD
			local SpriteO	= weapon:getModData().SpriteOFF

			local Condition	= weapon:getCondition()
			if weapon:hasTag("LightSaber") then
				Condition = Condition / 10
			end

--			Glow = attacker:getModData().Glow
		--	if Glow ~= nil then
		--		getCell():removeLamppost(Glow)
		--		attacker:getModData().Glow = nil
		--	end

			if	ZombRand(1 + weapon:getCondition()) == 0 then	-- FLICKER
				Glow = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  weapon:getR(), weapon:getG(), weapon:getB(), (1 + Condition / 4))
			else
				Glow = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  weapon:getR(), weapon:getG(), weapon:getB(), (2 + Condition / 4))
			end
			getCell():addLamppost(Glow)
			attacker:getModData().Glow = Glow
			
		--	DebugSay(2,"RGB - "..tostring(weapon:getR()).."/"..tostring(weapon:getG()).."/"..tostring(weapon:getB()) )

			if	ZombRand(4) == 0 then
				if 		weapon:getWeaponSprite() == SpriteA then
						weapon:setWeaponSprite(SpriteB)
				elseif	weapon:getWeaponSprite() == SpriteB then
						weapon:setWeaponSprite(SpriteA)
				elseif	weapon:getWeaponSprite() == SpriteC then
						weapon:setWeaponSprite(SpriteD)
				elseif	weapon:getWeaponSprite() == SpriteD then
						weapon:setWeaponSprite(SpriteC)
				else	weapon:setWeaponSprite(SpriteO)
				end
				ReEquipIt(attacker,weapon)
		--		DebugSay(2,"CHANGE - "..tostring(weapon:getWeaponSprite()))
			end
		end
		if	(weapon:hasTag("Torch")) or (weapon:hasTag("LightSaber")) then
			TorchCondition(attacker, weapon)
		end
--	elseif	attacker:getModData().Glow ~= nil then		-- ALWAYS OFF IF NONE OF ABOVE
--			getCell():removeLamppost(attacker:getModData().Glow)
--			attacker:getModData().Glow = nil
	end

	------------------------------
	--	LIGHT SABER	SECONDARY	--
	------------------------------
	if	(second) and (second:hasTag("LightSaber") or second:hasTag("Torch")) then
		if	(second:getCondition() >= 1) then
			local SpriteA = second:getModData().SpriteNORM_S
			local SpriteB = second:getModData().SpriteB
			local SpriteE = second:getModData().SpriteREST_S
			local SpriteF = second:getModData().SpriteFLEX_S
			local SpriteO = second:getModData().SpriteOFF
			if not second:hasTag("Flex") then
				SpriteA = second:getModData().SpriteA
			end

			local Condition	= second:getCondition()
			if second:hasTag("LightSaber") then
				Condition = Condition / 10
			end

--			Glow2 = attacker:getModData().Glow2
		--	if Glow2 ~= nil then
		--		getCell():removeLamppost(Glow2)
		--		attacker:getModData().Glow2 = nil
		--	end
			if	ZombRand(1 + second:getCondition()) == 0 then	-- FLICKER
				Glow2 = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  second:getR(), second:getG(), second:getB(), (1 + Condition / 4))
			else
				Glow2 = IsoLightSource.new(attacker:getX(), attacker:getY(), attacker:getZ(),  second:getR(), second:getG(), second:getB(), (2 + Condition / 4))
			end
			getCell():addLamppost(Glow2)
			attacker:getModData().Glow2 = Glow2

		--	DebugSay(2,"RGB - "..tostring(second:getR()).."/"..tostring(second:getG()).."/"..tostring(second:getB()) )

			if	ZombRand(4) == 0 then
				if 		second:getWeaponSprite() == SpriteA then
						second:setWeaponSprite(SpriteB)
				elseif	second:getWeaponSprite() == SpriteB then
						second:setWeaponSprite(SpriteA)
				elseif	second:getWeaponSprite() == SpriteE then
						second:setWeaponSprite(SpriteF)
				elseif	second:getWeaponSprite() == SpriteF then
						second:setWeaponSprite(SpriteE)
				else	second:setWeaponSprite(SpriteO)
				end
				attacker:setSecondaryHandItem(second)
		--		DebugSay(2,"CHANGE - "..tostring(second:getWeaponSprite()))
			end
		end
		if	(second:hasTag("Torch")) or (second:hasTag("LightSaber")) then
			TorchCondition(attacker, second)
		end
--	elseif	attacker:getModData().Glow2 ~= nil then		-- ALWAYS OFF IF NONE OF ABOVE
--			getCell():removeLamppost(attacker:getModData().Glow2)
--			attacker:getModData().Glow2 = nil
	end
end
]]

--------------------------------------------------------------------------
--  TORCH CONDITION ON USE												--
--------------------------------------------------------------------------
function TorchCondition(player, weapon)
	local inv	= player:getInventory()
	local cond	= weapon:getCondition()
	local off	= weapon:getModData().WideGrip
	local sound	= weapon:getModData().GripSound
	local mult	= 1 + (GUNFIGHTER.OPTIONS.options.dropdown137)
	local roll	= ZombRand(cond * 50 * mult)
	if	roll	== 0 then
		weapon:setCondition(cond - 1)
	--	DebugSay(2,tostring(weapon:getDisplayName()).." - "..tostring(weapon:getCondition()) )
		if weapon:getCondition() <= 1 and off then	-- 1 SO NO DROP OR AUTO-BREAK
			player:playSound(sound)
			local tempOff = InventoryItemFactory.CreateItem(off)
			tempOff:setCondition(weapon:getCondition())
			inv:AddItem(tempOff)
			inv:DoRemoveItem(weapon)
			if player:getPrimaryHandItem() == weapon then
				player:setPrimaryHandItem(tempOff)
			elseif player:getSecondaryHandItem() == weapon then
				player:setSecondaryHandItem(tempOff)
			end
		end
	end
end

--------------------------------------------------------------------------
--  BREAK ATTACHMENT ON MELEE											--
--------------------------------------------------------------------------
function BreakAttachmentOnMelee(player, weapon)
	----------------------
	--  OPTIONS BOX 11  --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.dropdown11 < 5) then		-- 5 IS NEVER
--		local attacker	= getSpecificPlayer(0)
		local attacker	= player
		local weapon	= attacker:getPrimaryHandItem()
		local stock		= nil
		local scope		= nil
		local canon		= nil
		local option	= 1000 * GUNFIGHTER.OPTIONS.options.dropdown11

		if 	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedHandWeapon()) then
			stock	= weapon:getStock()
			scope	= weapon:getScope()
			canon	= weapon:getCanon()

			if	(scope) then
				chance	= 0
				sound	= nil
				if	(string.find(scope:getType(), "Scope")) then
					chance = 10
					sound = "bottlesmash"
				elseif	(string.find(scope:getType(), "Sight")) then
					chance = 5
					sound = "bottlesmash"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(scope)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_OPTIC").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)
				end
			end

			if	(canon) then
				chance	= 0
				sound	= nil
				if	(string.find(canon:getType(), "Suppressor")) then
					chance = 20
					sound = "PZ_MetalSnap"
				elseif	(string.find(canon:getType(), "Bayonet")) then
					chance = 1
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(canon)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_MUZZLE").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)
				end
			end

			if	(stock) then
				chance	= 0
				sound	= nil
				if	(string.find(stock:getType(), "Light")) then
					chance = 10
					sound = "PZ_MetalSnap"
				elseif	(string.find(stock:getType(), "Laser")) then
					chance = 5
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(stock)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_LIGHT").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)
				end
			end
		end
	end
end


--------------------------------------------------------------------------
--  BREAK ATTACHMENT ON FIRE											--
--------------------------------------------------------------------------
function BreakAttachmentOnFire(player, weapon)
	----------------------
	--  OPTIONS BOX 12  --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.dropdown12 < 5) then		-- 5 IS NEVER
--		local attacker	= getSpecificPlayer(0)
		local attacker	= player
		local weapon	= attacker:getPrimaryHandItem()
		local stock		= nil
		local scope		= nil
		local canon		= nil
		local option	= 10000 * GUNFIGHTER.OPTIONS.options.dropdown12

		if 	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
			stock	= weapon:getStock()
			scope	= weapon:getScope()
			canon	= weapon:getCanon()
			ammo	= weapon:getAmmoType()

			if	(scope) then
				chance	= 0
				sound	= nil
				if	(string.find(scope:getType(), "Scope")) then
					sound = "bottlesmash"
					chance = getShockValue(weapon) * 2

				elseif	(string.find(scope:getType(), "Sight")) then
					sound = "PZ_MetalSnap"
					chance = getShockValue(weapon)
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(scope)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_OPTIC").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)
				end
			end

			if	(canon) then
				chance	= 0
				sound	= nil
				if	(string.find(canon:getType(), "Oil")) then
					chance = getShockValue(weapon) * 10
						-- 22	IS 10
						-- 380	IS 20
						-- 38	IS 30
						-- 9mm	IS 30
						-- 45	IS 40
						-- 44	IS 50
					sound = "PZ_MetalSnap"
				elseif	(string.find(canon:getType(), "Bottle")) then
					chance = getShockValue(weapon) * 400
						-- 22	IS 400
						-- 380	IS 800
						-- 38	IS 1200
						-- 9mm	IS 1200
						-- 45	IS 1600
						-- 44	IS 2000
					sound = "windowclose"
				elseif	(string.find(canon:getType(), "Suppressor")) then
					chance = getShockValue(weapon)
						-- 22	IS 1
						-- 380	IS 2
						-- 38	IS 3
						-- 9mm	IS 3
						-- 45	IS 4
						-- 44	IS 5
						-- 223	IS 4
						-- 556	IS 4
						-- 762	IS 6
						-- 308	IS 8
						-- 12g	IS 8
						-- 50	IS 10
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(canon)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_MUZZLE").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)				
				end
			end

			if	(stock) then
				chance	= 0
				sound	= nil
				if	(string.find(stock:getType(), "Light")) then
					chance = getShockValue(weapon) * 2
					sound = "PZ_MetalSnap"
				elseif	(string.find(stock:getType(), "Laser")) then
					chance = getShockValue(weapon)
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(stock)
					attacker:playSound(sound)
					DebugSay(2, getText("ContextMenu_Broke_LIGHT").."...("..tostring(chance).."/"..tostring(option)..")")
					ReEquipIt(attacker, weapon)
				end
			end
		end
	end
end

--[[		DID IT CLEANER FROM TOOL-TIPS INSTEAD
--------------------------------------------------------------------------
--  SCAN INVENTORY TO REMOVE NULL ITEMS									--
--	PZ SPAWNS GUNS W/MAGAZINES RANDOMLY... THIS SECTION ALSO GENERATES	--
--	AND INSERTS MAGAZINE IF (PRE-ATTACH CODE) GIVES MAGAZINE UPGRADE	--
--------------------------------------------------------------------------
function GunFighterInventoryScan()
	
	local player = getSpecificPlayer(0)
	local inv = player:getInventory()
	local items = inv:getItems()

	if items then
		for i = 1, items:size()-1 do
			local item = items:get(i)
			if	(item ~= nil) then 
				if	(item:hasTag("Null")) then
					inv:DoRemoveItem(item)
				--	DebugSay(2,"REMOVING NULL ITEM - "..tostring(item:getDisplayName()))
				elseif (instanceof(item,"HandWeapon")) and (item:isAimedFirearm()) and (not isLauncher(item)) then
					------------------------------------------------------------------
					--	IF GAME DOES NOT GIVE MAG, BUT PRE-ATTACH UPGRADED MAG		--
					------------------------------------------------------------------
					if	item:isContainsClip() == false and item:getClip() ~= nil then
					--	DebugSay(2,"Insert Generated Mag...")
						item:setContainsClip(true)				-- INSERT ONE
					end
					------------------------------------------------------------------
					--	IF MAG IS INSERTED BUT CURRENT MAGTYPE SET DOES NOT MATCH	--
					------------------------------------------------------------------
					if	item:isContainsClip() and item:getClip() ~= nil then
						local	resetMag = nil
					--	if		(string.find(item:getClip():getType(), "Standard_Mag"))	and (item:getMagazineType() ~= nil) then
					--			resetMag = item:getMagazineType()
						if		(string.find(item:getClip():getType(), "Extended_Mag"))	and (item:getModData().ExtMagType ~= item:getMagazineType()) then
							--	DebugSay(2,"Extended Mag Detected...")
								resetMag = item:getModData().ExtMagType
						elseif	(string.find(item:getClip():getType(), "Drum_Mag"))		and (item:getModData().DrumMagType ~= item:getMagazineType()) then
							--	DebugSay(2,"Drum Mag Detected...")
								resetMag = item:getModData().DrumMagType
						end
						----------------------------------
						--	RESET IF NON-MATCH FOUND	--
						----------------------------------
						if resetMag ~= nil then
							--	DebugSay(2,"Update Mag Type...")
								item:setMagazineType(resetMag)	-- SET TO UPGRADED TYPE
						--		WeaponReloadScript(getCore():getKey("REFRESH_SCRIPT"))
						end
					end
				end
			end
		end
	end
end
-- Events.OnRefreshInventoryWindowContainers.Add(GunFighterInventoryScan)
-- Events.OnEquipPrimary.Add(GunFighterInventoryScan)


function GunFighterContainerFill(all, all, container)

	local items = container:getItems()

	if items then
		for i = 1, items:size()-1 do
			local item = items:get(i)
			if	(item ~= nil) then 
				if	(item:hasTag("Null")) then
					inv:DoRemoveItem(item)
					DebugSay(2,"REMOVING NULL ITEM - "..tostring(item:getDisplayName()))
				elseif (instanceof(item,"HandWeapon")) and (item:isAimedFirearm()) and (not isLauncher(item)) then
					------------------------------------------------------------------
					--	IF GAME DOES NOT GIVE MAG, BUT PRE-ATTACH UPGRADED MAG		--
					------------------------------------------------------------------
					if	item:isContainsClip() == false and item:getClip() ~= nil then
						DebugSay(2,"[CONTAINER ITEM] Insert Generated Mag...")
						item:setContainsClip(true)				-- INSERT ONE
					end
					------------------------------------------------------------------
					--	IF MAG IS INSERTED BUT CURRENT MAGTYPE SET DOES NOT MATCH	--
					------------------------------------------------------------------
					if	item:isContainsClip() and item:getClip() ~= nil then
						local	resetMag = item:getMagazineType()
					--	if		(string.find(item:getClip():getType(), "Standard_Mag"))	and (item:getMagazineType() ~= nil) then
					--			resetMag = item:getMagazineType()
						if		(string.find(item:getClip():getType(), "Extended_Mag"))	and (item:getModData().ExtMagType ~= nil) then
								DebugSay(2,"[CONTAINER ITEM] Extended Mag Detected...")
								resetMag = item:getModData().ExtMagType
						elseif	(string.find(item:getClip():getType(), "Drum_Mag"))		and (item:getModData().DrumMagType ~= nil) then
								DebugSay(2,"[CONTAINER ITEM] Drum Mag Detected...")
								resetMag = item:getModData().DrumMagType
						end
						----------------------------------
						--	RESET IF NON-MATCH FOUND	--
						----------------------------------
						if resetMag ~= nil then
							DebugSay(2,"[CONTAINER ITEM] Update Mag Type...")
							item:setMagazineType(resetMag)	-- SET TO UPGRADED TYPE
							if		item:getMagazineType() ~= nil then
									item:setMaxAmmo(InventoryItemFactory.CreateItem(item:getMagazineType()):getMaxAmmo())
							else	item:setMaxAmmo(item:getMaxAmmo())
							end						
						end
					end
				end
			end
		end
	end
end
-- Events.OnFillContainer.Add(GunFighterContainerFill)
]]

--------------------------------------------------------------------------
--  CHECK FOR FIXED WEAPON ON EQUIP AND MAYBE ON INVENTORY UPDATE		--
--------------------------------------------------------------------------
function CheckFixedWeapon()		-- (player, weapon)

	local player = getSpecificPlayer(0)

	if (GUNFIGHTER.OPTIONS.options.dropdown143 == 1) then
		return
	end

	if player:getModData().Fixed_Loc ~= nil then		-- JUST FIND IT ONCE
		return
	end
	
	local inv = player:getInventory()
	local items = inv:getItems()
	----------------------------------------------
	--	DETERMINE IF PLAYER HAS FIXED WEAPON	--
	----------------------------------------------
	if player:getModData().Fix_Loc == nil then		-- ONLY CHECK IF NOT FIXED

		local SlowFactor = 0

		for i = 1, items:size()-1 do
			local item = items:get(i)
			if (item ~= nil) and (item:hasTag("Fixed")) and (instanceof(item,"HandWeapon")) and (item:isAimedFirearm()) then
				player:getModData().Fix_Loc = player:getCurrentSquare()
				player:getModData().Fix_Item = item
				if player:getSlowFactor() == 0 then
					DebugSay(2, getText("ContextMenu_Fixed_MOUNT"))
				end
			----------------------
			-- WHEN FOLDED		--
			----------------------
			elseif (item:hasTag("Fixed_FOLD")) then
				SlowFactor = SlowFactor + getLoadedWeight(item)/100
			end
		end
		
		if	(GUNFIGHTER.OPTIONS.options.dropdown146 > 1) and (SlowFactor > 0) then
			----------------------
			-- OVERALL SPEED	--
			----------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown146 == 2) or (GUNFIGHTER.OPTIONS.options.dropdown146 == 6) then
					player:setSlowFactor(SlowFactor)
					player:setSlowTimer(5)
				--	DebugSay(2, "Move Speed"..round(tostring(player:getSlowFactor()),1))
			end
			----------------------
			-- WALK TO SNEAK	--
			----------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown146 >= 5) then
				if		not player:isSneaking() and SlowFactor > 0.18 then					-- 0.18 COVERS ANY TWO MINIGUNS OR ONE DSHK
						DebugSay(2, "Heavy Weapon - Affects Movement")
						player:setSneaking(true)
			--	elseif	player:isSneaking() and SlowFactor > 0 then							-- THIS WOULD PREVENT VOLUNTARY SNEAK
			--			player:setSneaking(false)
				end
			end
			----------------------
			-- LIMIT RUNNING	--
			----------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown146 >= 4) then
				if	player:isRunning() then
					DebugSay(2, "Heavy Weapon - Limits Running")
					player:setRunning(false)
				end
			end
			----------------------
			-- LINIT SPRINTING	--
			----------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown146 >= 3) then
				if	player:isSprinting() then
					DebugSay(2, "Heavy Weapon - Limits Sprinting")
					player:setSprinting(false)
				end
			end
		end
	end
end

Events.OnEquipPrimary.Add(CheckFixedWeapon)
-- Events.OnRefreshInventoryWindowContainers.Add(CheckFixedWeapon)
Events.OnPlayerMove.Add(CheckFixedWeapon)


--------------------------------------------------------------------------
--  TEST NO JAM OPTION													--
--------------------------------------------------------------------------
function WeaponStatus(player, weapon)

	local attacker	= player
--	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end	

	local Moving	= attacker:getBeenMovingFor()
	
	if (GUNFIGHTER.OPTIONS.options.dropdown143 > 1) then
		----------------------------------------------------------
		--  FIXED HEAVY WEAPONS	- CANT BE FIRED WITHOUT TRIPOD	--
		--	AUTO DROP FIXED WEAPON WHEN MOVING.					--
		--	DISABLE MOVEMENT WHEN AIMING / SHOOTING.			--
		--	COLLAPSE / FOLD TRIPOD TO TRANSPORT.				--
		----------------------------------------------------------
		local inv = attacker:getInventory()
		local items = inv:getItems()
		local Fix_Item = nil
		local Fix_Loc = nil
		local Fix_Exit = false
		local Fix_Offset = 0


--		----------------------------------------------
--		--	DETERMINE IF PLAYER HAS FIXED WEAPON	--
--		----------------------------------------------	
--		if attacker:getModData().Fix_Loc == nil then		-- ONLY CHECK IF NOT FIXED
--			for i = 1, items:size()-1 do
--				local item = items:get(i)
--				if (item ~= nil) and (item:hasTag("Fixed")) and (instanceof(item,"HandWeapon")) and (item:isAimedFirearm()) then
--					attacker:getModData().Fix_Loc = attacker:getCurrentSquare()
--					attacker:getModData().Fix_Item = item
--					DebugSay(2,"USING FIXED WEAPON...")
--				end
--			end
--		end	

	
		----------------------------------------------
		--	PUT FIXED WEAPON ITEM INTO VARIABLE		--
		----------------------------------------------
		if	attacker:getModData().Fix_Item ~= nil then
			Fix_Item = attacker:getModData().Fix_Item
		end
		----------------------------------------------
		--	PUT FIXED LOCATION INTO VARIABLE		--
		----------------------------------------------
		if	attacker:getModData().Fix_Loc ~= nil then	
			Fix_Loc = attacker:getModData().Fix_Loc
		end	
	
		if	(Fix_Loc ~= nil) and (Fix_Item ~= nil) then
		
			local REST = Fix_Item:getModData().SpriteREST
			local AIMED = Fix_Item:getModData().SpriteCLOSED

			if	inv:contains(Fix_Item) and (attacker:getPrimaryHandItem() == Fix_Item or attacker:getPrimaryHandItem() == nil) then
				if attacker:isAiming() then
					if Fix_Item:getWeaponSprite() == REST then
						attacker:setHideWeaponModel(true)
						attacker:getModData().HideTimer = 30
						Fix_Item:setWeaponSprite(AIMED)
				--		DebugSay(2,"AIM SPRITE")
						ReEquipIt(attacker, Fix_Item)
					end
				elseif Fix_Item:getWeaponSprite() ~= REST then
					attacker:setHideWeaponModel(true)
					attacker:getModData().HideTimer = 30
					Fix_Item:setWeaponSprite(REST)
				--	DebugSay(2,"REST SPRITE")
					ReEquipIt(attacker, Fix_Item)
				end
			end

	
			if	not inv:contains(Fix_Item) and attacker:getPrimaryHandItem() == Fix_Item then
				attacker:setPrimaryHandItem(nil)
				attacker:setSecondaryHandItem(nil)
			end	
	
			if	attacker:getModData().HideTimer ~= nil and attacker:getModData().HideTimer > 0 then
				attacker:getModData().HideTimer = attacker:getModData().HideTimer - 1
			--	DebugSay(2,"TRANSITION TIMER - "..tostring(attacker:getModData().HideTimer))
			else attacker:setHideWeaponModel(false)
			end

			------------------------------------------
			--	CROUCHING MESSES UP VISUALIZATION	--
			------------------------------------------
			if attacker:isSneaking() then
				attacker:setSneaking(false)
			end

			if (Fix_Item:isEquipped()) and attacker:isAiming() then
			
				----------------------------------------------
				--	PREVENT MOVEMENT TO SIMULATE FIXED GUN	--
				----------------------------------------------
				if	attacker:getSlowFactor() ~= 1 then
					attacker:setSlowFactor(1.0)
					attacker:setSlowTimer(5)
				--	DebugSay(2,"SLOW FACTOR - "..tostring(attacker:getSlowFactor()))
				end
			
--				if	not attacker:isIgnoreInputsForDirection() then
--					attacker:setIgnoreInputsForDirection(true)
--					attacker:setTurnDelta(10.0)				-- WORKS ONLY WHEN MOVE INPUT IS PRESSED 
--					DebugSay(2,"INPUT FOR DIRECTION LIMITED - "..tostring(attacker:isIgnoreInputsForDirection()))
--				end

		--		attacker:setSlowFactor(1.0)
		--		attacker:setSlowTimer(5)
		--		attacker:SetAnimVariable("IdleFixedWeapon", "true")
		--		setActionAnim("Bob_IdleAimRifle")
		--		attacker:setFallOnFront(true)
		--		attacker:setSneaking(true)
		--		attacker:setForceShove(true)
		--		attacker:setInitiateAttack(true)
		--		attacker:setIgnoreMovement(true)		FREEZED COMPLETELY
		--		attacker:setMoveSpeed(0.1)
		--		attacker:setToggleToAim(true)			NOT CHARACTER FUNCTION
		--		attacker:setMoving(true)
		--		attacker:PlayAnim("Idle");
		--		attacker:PlayAnim("Attack_Rifle");
		--		attacker:SetAnimFrame(0, false);
		--		attacker:getSpriteDef():setFrameSpeedPerFrame(0.1);
		--		attacker:setIgnoreAimingInput(true)
		--		attacker:setForceAim(true)
		--		attacker:setIsAiming(true)
		--		attacker:isAimControlActive(true)
		--		attacker:isAiming(true)
		--		attacker:setJoypadIgnoreAimUntilCentered(true)		-- THIS IS REALLY WEIRD...
		
		
				if	attacker:getModData().TempDir == nil then
					attacker:getModData().TempDir = attacker:getDir()
				end	
				----------------------------------------------
				--	ADJUST PIVOT POINT TO SIMULATE TRIPOD	--
				----------------------------------------------
				if attacker:getDir() ~= attacker:getModData().TempDir then
					if	Fix_Loc:isBlockedTo(attacker:getCurrentSquare()) or attacker:getPrimaryHandItem() ~= Fix_Item then
						DebugSay(2, getText("ContextMenu_Fixed_BLOCK"))
						Fix_Exit = true
					end

					if (GUNFIGHTER.OPTIONS.options.dropdown143 > 1) then
						Fix_Offset = ((GUNFIGHTER.OPTIONS.options.dropdown143 -1 ) / 10)
					end
				
					attacker:setX(Fix_Loc:getX() - Fix_Offset * math.cos(attacker:getForwardDirection():getDirection()))
					attacker:setY(Fix_Loc:getY() - Fix_Offset * math.sin(attacker:getForwardDirection():getDirection()))
					attacker:getModData().TempDir = attacker:getDir()
				--	DebugSay(2,"Rotating...")
				
				end	
			----------------------------------------------
			--	RE-ALLOW MOVEMENT AND RESET TURNSPEED	--
			----------------------------------------------
			else	-- DebugSay(2,"IDLE ON FIXED WEAPON...")
				if	attacker:getSlowFactor() == 1 then
					attacker:setSlowFactor(0)
					attacker:setSlowTimer(0)
				--	DebugSay(2,"SLOW FACTOR - "..tostring(attacker:getSlowFactor()))
				
--				if	attacker:isIgnoreInputsForDirection() then
--					attacker:setIgnoreInputsForDirection(false)
--					attacker:setTurnDelta(1.0)
--					DebugSay(2,"MOVEMENT RESTORED...")
				end
			
				if	(attacker:isPlayerMoving() == true or attacker:getPrimaryHandItem() ~= Fix_Item) and Fix_Loc ~= nil then
					Fix_Exit = true	
				end	
			end
				
			if	attacker:isDoShove() or attacker:isSitOnGround() or Fix_Exit == true then
				----------------------------------------------
				--	RESET WEAPON SPRITE						--
				----------------------------------------------		
				Fix_Item:setWeaponSprite(AIMED)
				----------------------------------------------
				--	PUT PLAYER BACK IN ORIGINAL SPOT		--
				----------------------------------------------
				attacker:setX(Fix_Loc:getX())
				attacker:setY(Fix_Loc:getY())
				attacker:getModData().Fix_Loc = nil		-- RESET Fix_Loc CHECK
				----------------------------------------------
				--	AUTO-DROP WEAPON BECAUSE ITS FIXED		--
				--	EMPTY HANDS								--
				--	CORRECT SPRITE							--
				--	PLACE ITEM , REMOVE INVENTORY			--
				----------------------------------------------			
				if Fix_Item:isEquipped() then
					attacker:setPrimaryHandItem(nil)
					attacker:setSecondaryHandItem(nil)
				end
			
				if 	inv:contains(Fix_Item) then
					Fix_Loc:AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)

--[[				if attacker:getCurrentSquare():getTileInDirection(attacker:getDir()):isBlockedTo(attacker:getCurrentSquare()) then
							attacker:getCurrentSquare():AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)												--TRY THIS... NO, THIS PUTS IT THRU WALL ON BLOCK
							DebugSay(2,"Player LOC")
					else	Fix_Loc:AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)
							DebugSay(2,"Pivot LOC")
				--	else	attacker:getCurrentSquare():getTileInDirection(attacker:getDir()):AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)		--TRY THIS
				--			DebugSay(2,"Forward LOC")
					end
]]

					
			--		Fix_Item:setPlaceDir(attacker:getDir())
			--		attacker:getCurrentSquare():AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)
			--		attacker:getCurrentSquare():getTileInDirection(attacker:getDir()):AddWorldInventoryItem(Fix_Item, 0.0, 0.0, 0.0)
					inv:DoRemoveItem(Fix_Item)
					if	Fix_Item:getWeaponSprite() == REST then
						Fix_Item:setWeaponSprite(AIMED)
					end
				end

				attacker:getModData().Fix_Item = nil
				attacker:getModData().Fix_Loc = nil
				DebugSay(2, getText("ContextMenu_Fixed_EXIT"))
				----------------------------------------------
				--	RE-ALLOW MOVEMENT AND RESET TURNSPEED	--
				----------------------------------------------
				if	attacker:getSlowFactor() == 1 then
					attacker:setSlowFactor(0)
					attacker:setSlowTimer(0)
				--	DebugSay(2,"SLOW FACTOR - "..tostring(attacker:getSlowFactor()))			
			
--				if	attacker:isIgnoreInputsForDirection() then
--					attacker:setIgnoreInputsForDirection(false)
--					attacker:setTurnDelta(1.0)
--					DebugSay(2,"MOVEMENT RESTORED...")
				end
			end
		else
			----------------------------------------------
			--	RE-ALLOW MOVEMENT AND RESET TURNSPEED	--
			----------------------------------------------
			if	attacker:getSlowFactor() == 1 then
				attacker:setSlowFactor(0)
				attacker:setSlowTimer(0)
			--	DebugSay(2,"SLOW FACTOR - "..tostring(attacker:getSlowFactor()))		
		
--			if attacker:isIgnoreInputsForDirection() then
--				attacker:setIgnoreInputsForDirection(false)
--				attacker:setTurnDelta(1.0)
--				DebugSay(2,"MOVEMENT RESTORED...")
			end
		end
	
		if	( attacker:getModData().Fix_Item == nil or attacker:getModData().Fix_Loc == nil or not attacker:getPrimaryHandItem():hasTag("Fixed") ) then
			if	attacker:getSlowFactor() == 1 then
				attacker:setSlowFactor(0)
				attacker:setSlowTimer(0)
			--	DebugSay(2,"SLOW FACTOR - "..tostring(attacker:getSlowFactor()))	

--			if attacker:isIgnoreInputsForDirection() then
--				attacker:setIgnoreInputsForDirection(false)
--				attacker:setTurnDelta(1.0)
--				DebugSay(2,"MOVEMENT RESTORED...")
			end
		end
	end


	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and attacker:isAiming() and (not isFlamer(weapon)) then
		---------------------------
		--  OPTIONS DROPDOWN 9   --
		---------------------------
		if (GUNFIGHTER.OPTIONS.options.dropdown9 > 1) then
			local cycle = attacker:getModData().JamCycle
			if cycle == nil then cycle = 0 end
			if weapon:isJammed() and (cycle) and (cycle ~= weapon:getCurrentAmmoCount()) then
				local chance = GUNFIGHTER.OPTIONS.options.dropdown9
				local roll = ZombRand(4)+2
				if roll <= chance then		-- 0 DEFAULT 5 NEVERJAM
					DebugSay(3,"Jam Averted ("..tostring(roll)..")")
					weapon:setJammed(false)
				else
					DebugSay(3,"Jam Not Averted ("..tostring(roll)..")")
					attacker:getModData().JamCycle = weapon:getCurrentAmmoCount()
				end
			end
		end
		----------------------
		--  OPTIONS BOX 10  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box10 == true) then
			weapon:setCondition(weapon:getConditionMax())
		end

		----------------------
		--  OPTIONS BOX 16  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box16 == true) then
			local	penalized = weapon:getModData().aimingpenalized		-- MAKE SURE ONLY APPLIED ONCE
			local	penalty = 0
			local	aim	= weapon:getAimingTime()
			local	weight	= round(weapon:getWeight(),2)
			local	length = weapon:getModData().OAL
			if	length == nil then
				length = 0
			end

			penalty = (weight/2) + ( ((1+length)*(1+length)*(1+length)*(1+length)*(1+length)*(1+length)) / 250 )	-- BASIC PENALTY BY LENGTH

			if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then	-- ADDITIONAL MODIFIER FOR CONVERSION
				if	(string.find(weapon:getType(), "Fold")) then
					penalty = penalty - 12				-- FOLDED RIFLE
			--	elseif	(string.find(weapon:getType(), "Sawed")) then
			--		penalty = penalty - 13				-- SAWED W/STOCK
				elseif	(string.find(weapon:getType(), "Pistol")) then
					penalty = penalty - 12				-- PISTOL CONVERSION
				end
			elseif	(string.find(weapon:getType(), "Stock")) then
					penalty = penalty + 12				-- PISTOL WITH STOCK
			end

--[[			if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
				if	(string.find(weapon:getType(), "Fold")) then
					penalty = 10 + weight				-- FOLDED RIFLE
				elseif	(string.find(weapon:getType(), "Sawed")) then
					penalty = 15 + weight				-- SAWED W/STOCK
				elseif	(string.find(weapon:getType(), "Bull")) then
					penalty = 10 + weight				-- BULLPUP
				elseif	(string.find(weapon:getType(), "Pistol")) then
					penalty = 5 + weight				-- PISTOL CONVERSION
				else	penalty = 25 + weight				-- FULL RIFLE
				end
			else		penalty = weight				-- NON-TWOHANDED FIREARMS
			end
]]

			if	(attacker:getVehicle()) and (penalized == nil) then
				DebugSay(3,"Vehicle AimTime Penalty "..tostring(round(penalty), 2).."Length "..tostring(length))
				weapon:setAimingTime(aim - penalty)
				weapon:getModData().aimingpenalized = penalty
			elseif	(attacker:getVehicle() == nil) and (penalized ~= nil) then
				weapon:setAimingTime(aim + penalized)
				weapon:getModData().aimingpenalized = nil


--[[	THIS WAY SUCKS		local size = getLoadedWeight(weapon) / 100
				if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
					if	(string.find(weapon:getType(), "Fold")) then
						attacker:setBeenMovingFor(Moving + size * 1.25)	-- RIFLES FOLDED
						DebugSay(3,"Folded AimTime Penalty "..tostring(round(size * 125), 2))
					elseif	(string.find(weapon:getType(), "Sawed")) then
						attacker:setBeenMovingFor(Moving + size * 2)	-- RIFLES SAWED
						DebugSay(3,"Sawed AimTime Penalty "..tostring(round(size * 200), 2))
					elseif	(string.find(weapon:getType(), "Pistol")) then
						attacker:setBeenMovingFor(Moving + size)	-- RIFLES PISTOL CONVERSION
						DebugSay(3,"Converted AimTime Penalty "..tostring(round(size * 100), 2))
					else	attacker:setBeenMovingFor(Moving + 0.3 + size * 2)	-- RIFLES NOT FOLDED or SAWED
						DebugSay(3,"Rifle AimTime Penalty "..tostring(round(size * 100 + 30), 2))
					end
				else		attacker:setBeenMovingFor(Moving + size)	-- NON-TWOHANDED FIREARMS
						DebugSay(3,"Pistol AimTime Penalty "..tostring(round(size * 100), 2))
				end
]]
			end
		end



--		attacker:Say(tostring(attacker:getBeenMovingFor()))		TESTING FOR SLOW ROF

	end
	
	if		weapon and weapon:getModData().TriggerType == 0 then
			weapon:setJammed(true)
	elseif	weapon and weapon:hasTag("PCP") then
			if		(weapon:getModData().Air == nil or weapon:getModData().Air <= 0) then
					weapon:setJammed(true)
			elseif	weapon:getWeaponPart("RecoilPad") == nil and weapon:getModData().Air > 0 then		-- IN CASE REMOVED AS ATTACHMENT
					DebugSay(2, getText("ContextMenu_Air_Remove_ERROR"))
					Sound = player:getEmitter():playSound("OverFill")
					weapon:getModData().Air = 0
			end
	end
	
end

--------------------------------------------------------------------------
--  CALCULATES RECOIL DELAY FROM SCRATCH								--
--------------------------------------------------------------------------
function calcRecoilDelay(player, weapon)

	weapon:getModData().TempScope	= weapon:getWeaponPart("Scope")
	weapon:getModData().TempCanon	= weapon:getWeaponPart("Canon")
	weapon:getModData().TempClip	= weapon:getWeaponPart("Clip")
	weapon:getModData().TempStock	= weapon:getWeaponPart("Stock")
	weapon:getModData().TempSling	= weapon:getWeaponPart("Sling")
	weapon:getModData().TempRecoil	= weapon:getWeaponPart("RecoilPad")

	weapon:detachWeaponPart(weapon:getModData().TempScope)
	weapon:detachWeaponPart(weapon:getModData().TempCanon)
	weapon:detachWeaponPart(weapon:getModData().TempClip)
	weapon:detachWeaponPart(weapon:getModData().TempStock)
	weapon:detachWeaponPart(weapon:getModData().TempSling)
	weapon:detachWeaponPart(weapon:getModData().TempRecoil)

	local calc	= 0
	local base	= 30
	if weapon:isTwoHandWeapon() then	-- SLOW DOWN PISTOLS
		base 	= 30
	end
	local recoil	= 0
	local weight 	= getLoadedWeight(weapon)
	local stock		= 0
	local level		= player:getPerkLevel(Perks.Aiming) * 1				-- APPLY 1 PART AIM LEVEL BACK TO SLOW IT BACK DOWN AT HIGH LEVEL
--	local level		= getSpecificPlayer(0):getPerkLevel(Perks.Aiming) * 1		-- APPLY 1 PART AIM LEVEL BACK TO SLOW IT BACK DOWN AT HIGH LEVEL
	local reducer	= 0.5

	if		player:getVehicle()						then	stock	= 0	-- NO STOCK BUFF IN VEHICLE
--	if		getSpecificPlayer(0):getVehicle()		then	stock	= 0	-- NO STOCK BUFF IN VEHICLE
	elseif	string.find(weapon:getType(), "Fold")	then	stock	= 0	-- NO STOCK BUFF FOLDED
	elseif	string.find(weapon:getType(), "Pistol") then	stock	= 0	-- NO STOCK BUFF SAWED
	elseif	string.find(weapon:getType(), "Stock")	then	stock	= 6
	elseif	weapon:getSwingAnim() == "Rifle"		then	stock	= 6	-- LAST CUZ SOME RIFLES CAN FOLD
	end

	if weapon:isRanged() then
		local 	ammo = weapon:getAmmoType()
		if		ammo	== "Base.BB177"				then	recoil	= -10	-- 0
		elseif	ammo	== "Base.PB68"				then	recoil	= -10	-- 0
		elseif	ammo	== "Base.Bullets22"			then	recoil	= -4	-- 0.5 * 2 USED TO BE 1
		elseif	ammo	== "Base.Bullets57"			then	recoil	= -2	-- TEST AT -2
		elseif	ammo	== "Base.Bullets380"		then	recoil	= 1		-- 1.0 * 2 USED TO BE 2
		elseif	ammo	== "Base.Bullets38"			then	recoil	= 3		-- 1.5 * 2
		elseif	ammo	== "Base.Bullets9mm"		then	recoil	= 4		-- 2.0 * 2
		elseif	ammo	== "Base.Bullets45"			then	recoil	= 6		-- 3.0 * 2
		elseif	ammo	== "Base.Bullets357"		then	recoil	= 8		-- 4.0 * 2
		elseif	ammo 	== "Base.Bullets45LC"		then	recoil	= 10	-- TEST
		elseif	ammo	== "Base.Bullets44"			then	recoil	= 12	-- 6.0 * 2
		elseif	ammo	== "Base.Bullets50MAG"		then	recoil	= 16	-- TEST
		elseif	ammo	== "Base.Bullets4570"		then	recoil	= 18	-- TEST		WAS 16
		elseif	ammo	== "Base.223Bullets"		then	recoil	= 13	-- 6.5 * 2
		elseif	ammo	== "Base.556Bullets"		then	recoil	= 14	-- 7.0 * 2
		elseif	ammo	== "Base.545x39Bullets"		then	recoil	= 15	-- 8.0 * 2
		elseif	ammo	== "Base.762x39Bullets"		then	recoil	= 16	-- 8.0 * 2
		elseif	ammo	== "Base.308Bullets"		then	recoil	= 20	-- 10.0 * 2
		elseif	ammo 	== "Base.762x51Bullets"		then	recoil	= 20	-- TEST
		elseif	ammo	== "Base.762x54rBullets"	then	recoil	= 21	-- TEST
		elseif	ammo	== "Base.3006Bullets"		then	recoil	= 22	-- TEST
		elseif	ammo	== "Base.410gShotgunShells"	then	recoil	= 18	-- TEST
		elseif	ammo	== "Base.20gShotgunShells"	then	recoil	= 24	-- TEST
		elseif	ammo	== "Base.ShotgunShells"		then	recoil	= 26	-- 12.0 * 2
		elseif	ammo	== "Base.10gShotgunShells"	then	recoil	= 30	-- TEST
		elseif	ammo	== "Base.4gShotgunShells"	then	recoil	= 40	-- TEST AT 40
		elseif	ammo	== "Base.50BMGBullets"		then	recoil	= 56	-- 14.0 * 2 = 28 CHEAT IT HIGHER FOR WEIGHT
		end

		if		weapon:getFireMode() == "[6]Rotary" then	-- GIVE MINIGUNS STABILITY BUFF
				recoil	= (recoil + 40)  / 4				-- RECOIL MATTER WAY LESS
				weight	= (weight + 200) / 20				-- WEIGHT MATTER LESS
				base	= 22
		elseif	weapon:hasTag("Fixed") then					-- GIVE FIXED GUNS STABILITY BUFF
				recoil	= (recoil + 50)  / 5				-- RECOIL MATTER WAY LESS
				weight	= (weight + 300) / 20				-- WEIGHT MATTER LESS
				base	= 20
		end

		if	weapon:hasTag("Grip") then	recoil = recoil - 2 end				-- SCRIPTED INTEGRAL FOREGRIP
		if	weapon:hasTag("Comp") then	recoil = recoil - 2 end				-- SCRIPTED INTEGRAL FOREGRIP

		calc = ((base + recoil - weight - stock) * reducer)		-- REMOVE LEVEL ELEMENT AFFECTS RECOIL STAT
	--	calc = ((base + recoil - weight - stock + level) * reducer)	-- THIS IS ACTUAL DELAY

		if		ammo	== "Base.FlameFuel" then	calc	= 0
		elseif	ammo	== "Base.WaterAmmo" then	calc	= 0
		end


		weapon:setRecoilDelay(calc)

		weapon:attachWeaponPart(weapon:getModData().TempScope)
		weapon:attachWeaponPart(weapon:getModData().TempCanon)
		weapon:attachWeaponPart(weapon:getModData().TempClip)
		weapon:attachWeaponPart(weapon:getModData().TempStock)
		weapon:attachWeaponPart(weapon:getModData().TempSling)
		weapon:attachWeaponPart(weapon:getModData().TempRecoil)

		local factor	= weapon:getRecoilDelay()
		local multi	= factor * 2 - (level * 0.5)			-- REMOVE LEVEL ELEMENT
	--	local multi	= factor * 2 - (level)				-- COMPENSATE FOR LEVEL APPLIED ON ACTUAL DELAY
		weapon:getModData().TempRecoilDelay = multi		-- USE MULTIPLIER TO OVERTAKE TIME... THIS IS APPLIED RECOIL NOT DELAY
	end
end

--------------------------------------------------------------------------
--  AIMTIME vs MOVETIME DISPLAY, SHOT SPREAD VISUALIZATION, SHOW AMMO	--
--------------------------------------------------------------------------
local function HeadsUpDisplay()
	local attacker	= getSpecificPlayer(0)			-- ONPLAYERUPDATE
	local weapon	= nil

	if attacker ~= nil then						-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end


-- TEST LAST SPOTTED
	--	local target	= attacker:getTargetAlpha()
	--	local Tloc		= target:getCurrentSquare()
	--	local Tloc		= attacker:getAttackTargetSquare()
	--	local Aloc		= attacker:getCurrentSquare()
	--	local Dist		= getDistanceBetween(Tloc,Aloc)

	--	if attacker.JustMoved == true then
	--		attacker:Say("moved")
	--	end

		if weapon ~= nil and (instanceof(weapon,"HandWeapon")) and (weapon:isRanged() or weapon:hasTag("Thrown")) then

		----------------------
		--  OPTIONS BOX 4  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box4 == true) and (weapon:getAmmoType() ~= nil) then
			local r2 = 0.8
			local g2 = 0.8
			local b2 = 0.8
			local chamber = weapon:isRoundChambered()
			local ammo = weapon:getCurrentAmmoCount()
			if chamber then
				ammo = ammo + 1
			end
			local rounds = " "

			if weapon:isJammed() then rounds = "    JAM"
				r2 = 1.0
				g2 = 0.0
				b2 = 0.0
			elseif	ammo == 1 then rounds	= "                       |"
			elseif	ammo == 2 then rounds	= "                       ||"
			elseif	ammo == 3 then rounds	= "                       |||"
			elseif	ammo == 4 then rounds	= "                       ||||"
			elseif	ammo == 5 then rounds	= "                       |||||"
			elseif	ammo == 6 then rounds	= "                       ||||||"
			elseif	ammo == 7 then rounds	= "                       |||||||"
			elseif	ammo == 8 then rounds	= "                       ||||||||"
			elseif	ammo == 9 then rounds	= "                       |||||||||"
			elseif	ammo == 10 then rounds	= "                       ||||||||||"
			elseif	ammo == 11 then rounds	= "                       |||||||||||"
			elseif	ammo == 12 then rounds	= "                       ||||||||||||"
			elseif	ammo == 13 then rounds	= "                       |||||||||||||"
			elseif	ammo == 14 then rounds	= "                       ||||||||||||||"
			elseif	ammo == 15 then rounds	= "                       |||||||||||||||"
			elseif	ammo == 16 then rounds	= "                       ||||||||||||||||"
			elseif	ammo == 17 then rounds	= "                       |||||||||||||||||"
			elseif	ammo == 18 then rounds	= "                       ||||||||||||||||||"
			elseif	ammo == 19 then rounds	= "                       |||||||||||||||||||"
			elseif	ammo == 20 then rounds	= "                       ||||||||||||||||||||"
			elseif	ammo == 21 then rounds	= "                       |||||||||||||||||||||"
			elseif	ammo == 22 then rounds	= "                       ||||||||||||||||||||||"
			elseif	ammo == 23 then rounds	= "                       |||||||||||||||||||||||"
			elseif	ammo == 24 then rounds	= "                       ||||||||||||||||||||||||"
			elseif	ammo == 25 then rounds	= "                       |||||||||||||||||||||||||"
			elseif	ammo == 26 then rounds	= "                       ||||||||||||||||||||||||||"
			elseif	ammo == 27 then rounds	= "                       |||||||||||||||||||||||||||"
			elseif	ammo == 28 then rounds	= "                       ||||||||||||||||||||||||||||"
			elseif	ammo == 29 then rounds	= "                       |||||||||||||||||||||||||||||"
			elseif	ammo == 30 then rounds	= "                       ||||||||||||||||||||||||||||||"
			elseif	ammo >= 91 then	rounds	= "                       ||||||||||||||||||||||||||||||+++++++"
			elseif	ammo >= 81 then	rounds	= "                       ||||||||||||||||||||||||||||||++++++"
			elseif	ammo >= 71 then	rounds	= "                       ||||||||||||||||||||||||||||||+++++"
			elseif	ammo >= 61 then	rounds	= "                       ||||||||||||||||||||||||||||||++++"
			elseif	ammo >= 51 then	rounds	= "                       ||||||||||||||||||||||||||||||+++"
			elseif	ammo >= 41 then	rounds	= "                       ||||||||||||||||||||||||||||||++"
			elseif	ammo >= 31 then rounds	= "                       ||||||||||||||||||||||||||||||+"
			else	rounds	= "EMPTY "
				r2 = 0.0
				g2 = 1.0
				b2 = 0.0
			end
			getTextManager():DrawString(UIFont.Small, 16, 25, rounds, r2, g2, b2, 1.0);
		end


		----------------------
		--  OPTIONS BOX 5  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box5 == true) then
			local Moving	= attacker:getBeenMovingFor()
			local AimTime	= 0
			local AimLevel	= attacker:getPerkLevel(Perks.Aiming)

			AimTime = weapon:getAimingTime()
	
			local MoveTime
			if	Moving > (AimTime + AimLevel) then
				MoveTime = Moving - (AimTime + AimLevel)
			else	MoveTime = 0
			end

		--	if	Moving < (AimTime + AimLevel) then
		--		MoveTime = 0
		--	else	MoveTime = Moving - (AimTime + AimLevel)
		--	end

			if attacker:isAiming() then

				local data1 = "            +"
				local r = 0.0
				local g = 1.0
				local b = 0.0
				local zoom = getCore():getZoom(0)
				local height
				----------------------------------
				--	FOR RESOLUTION ADJ			--
				----------------------------------
				local sx = IsoUtils.XToScreen(attacker:getX(), attacker:getY(), attacker:getZ(), 0);
				local sy = IsoUtils.YToScreen(attacker:getX(), attacker:getY(), attacker:getZ(), 0);
				sx = sx - IsoCamera.getOffX() - attacker:getOffsetX();
				sy = sy - IsoCamera.getOffY() - attacker:getOffsetY();
				sy = sy - 82
				sx = sx / zoom - 40
				sy = sy / zoom

			--	DebugSay(3,"X "..tostring(sx).." Y"..tostring(sy).."ZM "..tostring(zoom))

				if		zoom <= 0.25	then	height = 60		-- 24
				elseif	zoom <= 0.375	then	height = 36		-- 10
				elseif	zoom <= 0.5		then	height = 24		-- 8
				elseif	zoom <= 0.625	then	height = 16		-- 4
				elseif	zoom <= 0.75	then	height = 12		-- 4
				elseif	zoom <= 0.875	then	height = 8		-- 2
				elseif	zoom <= 1.0		then	height = 6		-- 2
				elseif	zoom <= 1.125	then	height = 4		-- 2
				elseif	zoom <= 1.25	then	height = 2		-- 0
				else				height = 0
				end

				if	MoveTime > 65 then data1 = "-                        -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 60 then data1 = " -                      -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 55 then data1 = "  -                    -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 50 then data1 = "   -                  -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 45 then data1 = "    -                -"
					r = 1.0
					g = 0.2
					b = 0.0
				elseif	MoveTime > 40 then data1 = "     -              -"
					r = 1.0
					g = 0.4
					b = 0.0
				elseif	MoveTime > 35 then data1 = "     -             -"
					r = 1.0
					g = 0.6
					b = 0.0
				elseif	MoveTime > 30 then data1 = "      -           -"
					r = 1.0
					g = 0.8
					b = 0.0
				elseif	MoveTime > 25 then data1 = "       -         -"
					r = 1.0
					g = 1.0
					b = 0.0
				elseif	MoveTime > 20 then data1 = "        -       -"
					r = 0.8
					g = 1.0
					b = 0.0
				elseif	MoveTime > 15 then data1 = "         -     -"
					r = 0.6
					g = 1.0
					b = 0.0
				elseif	MoveTime > 10 then data1 = "          -   -"
					r = 0.4
					g = 1.0
					b = 0.0
				elseif	MoveTime > 5  then data1 = "           - -"
					r = 0.2
					g = 1.0
					b = 0.0
				elseif	MoveTime > 0  then data1 = "            -"
					r = 0.0
					g = 1.0
					b = 0.0
					color = "0.0, 1.0, 0.0"
				elseif	Moving == 0   then data1 = "            +"
					r = 0.0
					g = 1.0
					b = 0.0
				end

				if weapon:isJammed() then
					r = 1.0
					g = 0.0
					b = 0.0
				elseif (not weapon:hasTag("Thrown")) and ( (weapon:haveChamber() == false and weapon:getCurrentAmmoCount() == 0) or (weapon:haveChamber() ~= false and weapon:isRoundChambered() == false) ) then
					r = 1.0
					g = 1.0
					b = 1.0
				end

				getTextManager():DrawString(UIFont.Medium, sx, sy + height, data1, r, g, b, 1.0);
	--			getTextManager():DrawString(UIFont.Medium, sx, sy, data1, r, g, b, 1.0);
	-- FIX FOR RESOLUTION	getTextManager():DrawString(UIFont.Medium, 600, height, data1, r, g, b, 1.0);
	-- TESTED SMALL		getTextManager():DrawString(UIFont.Small, 610, height, data1, r, g, b, 1.0);
	-- TEST			attacker:Say(tostring(zoom))
			end
		end
	end
end

Events.OnGameStart.Add(function()
	Events.OnPostUIDraw.Add(HeadsUpDisplay);
end);



--------------------------------------------------------------------------
--  EJECT BRASS															--
--------------------------------------------------------------------------
local function ejectBrass(player, weapon)

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and player:isAiming() and
--		(not isFlamer(weapon)) and (not isBBGun(weapon)) and (not isBow(weapon)) and (not isLauncher(weapon)) then
--		(not isFlamer(weapon)) and (not isBBGun(weapon)) and (not isBow(weapon)) then
		(not isFlamer(weapon)) and (not isBBGun(weapon)) then
	
		-----------------------
		--  OPTIONS BOX 19   --
		-----------------------
		if (GUNFIGHTER.OPTIONS.options.dropdown19 > 1) then		-- 1 EQUALS NO BRASS EJECTION

			local attacker	= player;
			local weapon 	= weapon;
			local name		= weapon:getType();
			local ammo		= weapon:getAmmoType();
			local type		= weapon:getWeaponReloadType();
			local inv		= player:getInventory();
			local ejected	= nil
			local spent		= weapon:getModData().spentammo
			if	spent		==  nil then
				spent		= 0
			end
			local catch		= nil
			if	weapon:getWeaponPart("RecoilPad") and weapon:getWeaponPart("RecoilPad"):hasTag("Brass_Catch") then
				DebugSay(3,"Has Brass Catch")
				catch = true
			end

			if		ammo 	== "Base.Bullets22"			then	ejected	= "Brass22"
			elseif 	ammo	== "Base.Bullets57"			then	ejected	= "Brass57"
			elseif	ammo	== "Base.Bullets380"		then	ejected	= "Brass380"
			elseif	ammo	== "Base.Bullets38"			then	ejected	= "Brass38"
			elseif	ammo	== "Base.Bullets9mm"		then	ejected	= "Brass9"
			elseif	ammo	== "Base.Bullets45"			then	ejected	= "Brass45"
			elseif	ammo	== "Base.Bullets357"		then	ejected	= "Brass357"
			elseif	ammo	== "Base.Bullets45LC"		then	ejected	= "Brass45LC"
			elseif	ammo	== "Base.Bullets44"			then	ejected	= "Brass44"
			elseif	ammo	== "Base.Bullets50MAG"		then	ejected = "Brass50MAG"
			elseif	ammo	== "Base.Bullets4570"		then	ejected	= "Brass4570"
			elseif	ammo	== "Base.223Bullets"		then	ejected	= "Brass223"
			elseif	ammo	== "Base.556Bullets"		then	ejected	= "Brass556"
			elseif	ammo	== "Base.545x39Bullets"		then	ejected	= "Brass545x39"
			elseif	ammo	== "Base.762x39Bullets"		then	ejected	= "Brass762x39"
			elseif	ammo	== "Base.308Bullets"		then	ejected	= "Brass308"
			elseif	ammo	== "Base.762x51Bullets"		then	ejected	= "Brass762x51"
			elseif	ammo	== "Base.762x54rBullets"	then	ejected	= "Brass762x54r"
			elseif	ammo	== "Base.3006Bullets"		then	ejected	= "Brass3006"
			elseif	ammo	== "Base.410gShotgunShells"	then	ejected	= "Hull410g"
			elseif	ammo	== "Base.20gShotgunShells"	then	ejected	= "Hull20g"
			elseif	ammo	== "Base.ShotgunShells"		then	ejected	= "Hull12g"
			elseif	ammo	== "Base.10gShotgunShells"	then	ejected	= "Hull10g"
			elseif	ammo	== "Base.4gShotgunShells"	then	ejected	= "Hull4g"
			elseif	ammo	== "Base.50BMGBullets"		then	ejected	= "Brass50BMG"
			elseif	ammo	== "Base.Flare"				then	ejected	= "Hull12g"

			end

			if	(GUNFIGHTER.OPTIONS.options.dropdown19 < 12) and (catch ~= true) and	-- EJECT TO INVENTORY OPTION
				(type	== "handgun" or 
				type	== "boltaction" or 
				type	== "leveraction" or
				type	== "boltactionnomag" or
				type	== "shotgun") then		-- YES EJECT

				if ZombRand(11) < (GUNFIGHTER.OPTIONS.options.dropdown19) then
					if ejected ~= nil then
						player:getCurrentSquare():AddWorldInventoryItem(ejected, 0.0, 0.0, 0.0);
						DebugSay(3,"Brass Ejected")
					else	DebugSay(3,"Not Usable")
					end
				end
			
			else			-- NOT EJECT

			--	weapon:getModData().spentammo = spent + 1
			--	DebugSay(3,tostring(spent+1).."spent shells in gun")

				if ejected ~= nil then
					inv:AddItem(ejected);
					DebugSay(3,"Brass to Inventory")
				end
			end
		end
	end
end


--------------------------------------------------------------------------
--  Pre-Charged Pnuematic (PaintBall)	DEPLETE AIR						--
--------------------------------------------------------------------------
--[[
local function rangePCP(player, target, weapon, damage)

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and player:isAiming() and
		(weapon:hasTag("PCP")) then

		target:setNoDamage(true)		-- STAGGER, NO DAMAGE
		
		local range = getDistanceBetween(player,target)
		if		range <= 6 then
				weapon:getModData().Trajectory = "Short"
		elseif	range <= 12 then
				weapon:getModData().Trajectory = "Medium"
		else	weapon:getModData().Trajectory = "Long"
		end

		DebugSay(2,"TRAJECTORY - "..tostring(weapon:getModData().Trajectory).." RANGE - "..tostring(range))
	end
end
]]
local function checkPCP(player, weapon)

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and player:isAiming() and
		(weapon:hasTag("PCP")) then
		local Air = weapon:getModData().Air
		if	Air ~= nil and Air > 0 then
			weapon:setTriggerExplosionTimer(0)
			weapon:getModData().Air = round(weapon:getModData().Air - 0.2,1)		-- 500 SHOTS PER FULL TANK
			DebugSay(2,getText("ContextMenu_AttachmentCharge") .. " - (".. tostring(weapon:getModData().Air)..")")
		end
	end
end
-- Events.OnWeaponHitCharacter.Add(rangePCP)
Events.OnPlayerAttackFinished.Add(checkPCP)

		
--------------------------------------------------------------------------
--  SET TARGET ON FIRE WITH TORCH										--
--------------------------------------------------------------------------
local function setOnFire(player, target, weapon, damage)
	if	(weapon) and (weapon:hasTag("Torch")) and (GUNFIGHTER.OPTIONS.options.dropdown138 ~= 0) then
		local	roll = ZombRand(11 - GUNFIGHTER.OPTIONS.options.dropdown138)
		if	roll == 0 then
		--	DebugSay(2,"TARGET - BURNING")
			target:SetOnFire()
		end
	end
end


--------------------------------------------------------------------------
--  STUCK PROJECTILE ON HIT AMMO TO BE STUCK OR BOUNCE [ONHITZOMBIE]	--
--------------------------------------------------------------------------
local function setStuckProjectile(target, player, BodyPart, weapon)

	local bodypart = BodyPart
	local penetration = 2

	if	(bodypart ~= nil)  and (weapon ~= nil) then
		if		tostring(bodypart) == "Head" then		-- VANILLA CRITICAL HIT
				DebugSay(3,"BASE CRIT")
		elseif	(GUNFIGHTER.OPTIONS.options.box140 == true) then
				DebugSay(3,"RANDOM PART")
				bodypart = getFullBodyLocation(player,weapon)
		end
	end

	if	target:getModData().Armored ~= nil or target:isReanimatedPlayer() then
		penetration = Zombie_Armor_Check(target, player, bodypart, weapon)
	end

	player:getModData().ProjectileHit = 1				-- SHOVE DOES NOT REGISTER HERE... WTF!

	if	(weapon) and ( weapon:hasTag("XBow") or weapon:hasTag("Thrown") ) then	-- NOT FIREARMS

		local attacker	= player;
		local Gun	 	= weapon;
		local gun		= weapon:getType();
		local bp		= tostring(bodypart)
		local cond		= nil;
		local ammo		= weapon:getAmmoType();
		local stuck		= nil
		local zombie	= target
		local inv		= zombie:getInventory();	-- for inserting arrows in zombie
		local back		= isFacingAway(player,target)
	--	local back		= true				-- TEST BACK STICK LOCATIONS

		if	ammo then
			stuck = ammo					-- AMMO IS weapon:getType()
		else	stuck = gun						-- LOWER CASE IS Gun:getType()
			cond = Gun:getCondition()
		end

		local bounce	= getBounce(stuck)
		DebugSay(3,"PROJECTILE - "..tostring(stuck).." / BOUNCE - "..tostring(bounce))

		local	projectile = InventoryItemFactory.CreateItem(stuck);
		if	cond then
			projectile:setCondition(cond)
		end

		local	bust = (GUNFIGHTER.OPTIONS.options.dropdown135 * 2)			-- 1 IS NEVER / 10 MEANS 10%
		if	(stuck == ammo) and (ZombRand(bust) == 2) then				-- ROLL 10 to 100
			if (projectile:getModData().Break) ~= nil then				-- AMMO MUST HAVE BROKEN STAT
				projectile = InventoryItemFactory.CreateItem(projectile:getModData().Break);
			end
		end


		if	(bp == "Head") or (bp == "Neck") then
			if	penetration > 1 or penetration < 0 then		-- NO ARMOR / FAILED PROTECTIN
				zombie:setHealth(0)
			end
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_Head01 == nil then
						zombie:setAttachedItem("Back Head01", projectile);
						zombie:getModData().back_Head01 = 1;
				elseif	zombie:getModData().back_Head02 == nil then
						zombie:setAttachedItem("Back Head02", projectile);
						zombie:getModData().back_Head02 = 1;
				elseif	zombie:getModData().back_Head03 == nil then
						zombie:setAttachedItem("Back Head03", projectile);
						zombie:getModData().back_Head03 = 1;
				elseif	zombie:getModData().back_Head04 == nil then
						zombie:setAttachedItem("Back Head04", projectile);
						zombie:getModData().back_Head04 = 1;
				elseif	zombie:getModData().back_Head05 == nil then
						zombie:setAttachedItem("Back Head05", projectile);
						zombie:getModData().back_Head05 = 1;
				elseif	zombie:getModData().back_Head06 == nil then
						zombie:setAttachedItem("Back Head06", projectile);
						zombie:getModData().back_Head06 = 1;
				else		DebugSay(3,"HEAD BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_Head01 == nil then
						zombie:setAttachedItem("Stuck Head01", projectile);
						zombie:getModData().stuck_Head01 = 1;
				elseif	zombie:getModData().stuck_Head02 == nil then
						zombie:setAttachedItem("Stuck Head02", projectile);
						zombie:getModData().stuck_Head02 = 1;
				elseif	zombie:getModData().stuck_Head03 == nil then
						zombie:setAttachedItem("Stuck Head03", projectile);
						zombie:getModData().stuck_Head03 = 1;
				elseif	zombie:getModData().stuck_Head04 == nil then
						zombie:setAttachedItem("Stuck Head04", projectile);
						zombie:getModData().stuck_Head04 = 1;
				elseif	zombie:getModData().stuck_Head05 == nil then
						zombie:setAttachedItem("Stuck Head05", projectile);
						zombie:getModData().stuck_Head05 = 1;
				elseif	zombie:getModData().stuck_Head06 == nil then
						zombie:setAttachedItem("Stuck Head06", projectile);
						zombie:getModData().stuck_Head06 = 1;
				else	DebugSay(3,"HEAD BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (bp == "Torso_Upper") or (bp == "Torso_Lower") or (bp == "Groin") then
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				DebugSay(3,"BACK")
				if		zombie:getModData().stuck_Back01 == nil then
						zombie:setAttachedItem("Stuck Back01", projectile);
						zombie:getModData().stuck_Back01 = 1;
				elseif	zombie:getModData().stuck_Back02 == nil then
						zombie:setAttachedItem("Stuck Back02", projectile);
						zombie:getModData().stuck_Back02 = 1;
				elseif	zombie:getModData().stuck_Back03 == nil then
						zombie:setAttachedItem("Stuck Back03", projectile);
						zombie:getModData().stuck_Back03 = 1;
				elseif	zombie:getModData().stuck_Back04 == nil then
						zombie:setAttachedItem("Stuck Back04", projectile);
						zombie:getModData().stuck_Back04 = 1;
				elseif	zombie:getModData().stuck_Back05 == nil then
						zombie:setAttachedItem("Stuck Back05", projectile);
						zombie:getModData().stuck_Back05 = 1;
				elseif	zombie:getModData().stuck_Back06 == nil then
						zombie:setAttachedItem("Stuck Back06", projectile);
						zombie:getModData().stuck_Back06 = 1;
				else	DebugSay(3,"BACK BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				DebugSay(3,"BODY")
				if		zombie:getModData().stuck_Body01 == nil then
						zombie:setAttachedItem("Stuck Body01", projectile);
						zombie:getModData().stuck_Body01 = 1;
				elseif	zombie:getModData().stuck_Body02 == nil then
						zombie:setAttachedItem("Stuck Body02", projectile);
						zombie:getModData().stuck_Body02 = 1;
				elseif	zombie:getModData().stuck_Body03 == nil then
						zombie:setAttachedItem("Stuck Body03", projectile);
						zombie:getModData().stuck_Body03 = 1;
				elseif	zombie:getModData().stuck_Body04 == nil then
						zombie:setAttachedItem("Stuck Body04", projectile);
						zombie:getModData().stuck_Body04 = 1;
				elseif	zombie:getModData().stuck_Body05 == nil then
						zombie:setAttachedItem("Stuck Body05", projectile);
						zombie:getModData().stuck_Body05 = 1;
				elseif	zombie:getModData().stuck_Body06 == nil then
						zombie:setAttachedItem("Stuck Body06", projectile);
						zombie:getModData().stuck_Body06 = 1;
				else	DebugSay(3,"BODY BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (bp == "UpperLeg_L") or (bp == "LowerLeg_L") or (bp == "Foot_L") then
			DebugSay(3,"LEFT LEG")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_LeftLeg01 == nil then
						zombie:setAttachedItem("Back LeftLeg01", projectile);
						zombie:getModData().back_LeftLeg01 = 1;
				elseif	zombie:getModData().back_LeftLeg02 == nil then
						zombie:setAttachedItem("Back LeftLeg02", projectile);
						zombie:getModData().back_LeftLeg02 = 1;
				elseif	zombie:getModData().back_LeftLeg03 == nil then
						zombie:setAttachedItem("Back LeftLeg03", projectile);
						zombie:getModData().back_LeftLeg03 = 1;
				elseif	zombie:getModData().back_LeftLeg04 == nil then
						zombie:setAttachedItem("Back LeftLeg04", projectile);
						zombie:getModData().back_LeftLeg04 = 1;
				else	DebugSay(3,"LEFT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_LeftLeg01 == nil then
						zombie:setAttachedItem("Stuck LeftLeg01", projectile);
						zombie:getModData().stuck_LeftLeg01 = 1;
				elseif	zombie:getModData().stuck_LeftLeg02 == nil then
						zombie:setAttachedItem("Stuck LeftLeg02", projectile);
						zombie:getModData().stuck_LeftLeg02 = 1;
				elseif	zombie:getModData().stuck_LeftLeg03 == nil then
						zombie:setAttachedItem("Stuck LeftLeg03", projectile);
						zombie:getModData().stuck_LeftLeg03 = 1;
				elseif	zombie:getModData().stuck_LeftLeg04 == nil then
						zombie:setAttachedItem("Stuck LeftLeg04", projectile);
						zombie:getModData().stuck_LeftLeg04 = 1;
				else	DebugSay(3,"LEFT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (bp == "UpperLeg_R") or (bp == "LowerLeg_R") or (bp == "Foot_R") then
			DebugSay(3,"RIGHT LEG")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_RightLeg01 == nil then
						zombie:setAttachedItem("Back RightLeg01", projectile);
						zombie:getModData().back_RightLeg01 = 1;
				elseif	zombie:getModData().back_RightLeg02 == nil then
						zombie:setAttachedItem("Back RightLeg02", projectile);
						zombie:getModData().back_RightLeg02 = 1;
				elseif	zombie:getModData().back_RightLeg03 == nil then
						zombie:setAttachedItem("Back RightLeg03", projectile);
						zombie:getModData().back_RightLeg03 = 1;
				elseif	zombie:getModData().back_RightLeg04 == nil then
						zombie:setAttachedItem("Back RightLeg04", projectile);
						zombie:getModData().back_RightLeg04 = 1;
				else	DebugSay(3,"RIGHT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_RightLeg01 == nil then
						zombie:setAttachedItem("Stuck RightLeg01", projectile);
						zombie:getModData().stuck_RightLeg01 = 1;
				elseif	zombie:getModData().stuck_RightLeg02 == nil then
						zombie:setAttachedItem("Stuck RightLeg02", projectile);
						zombie:getModData().stuck_RightLeg02 = 1;
				elseif	zombie:getModData().stuck_RightLeg03 == nil then
						zombie:setAttachedItem("Stuck RightLeg03", projectile);
						zombie:getModData().stuck_RightLeg03 = 1;
				elseif	zombie:getModData().stuck_RightLeg04 == nil then
						zombie:setAttachedItem("Stuck RightLeg04", projectile);
						zombie:getModData().stuck_RightLeg04 = 1;
				else	DebugSay(3,"RIGHT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (bp == "UpperArm_L") or (bp == "ForeArm_L") or (bp == "Hand_L") then
			DebugSay(3,"LEFT SHOULDER")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_LeftShoulder01 == nil then
						zombie:setAttachedItem("Back LeftShoulder01", projectile);
						zombie:getModData().back_LeftShoulder01 = 1;
				elseif	zombie:getModData().back_LeftShoulder02 == nil then
						zombie:setAttachedItem("Back LeftShoulder02", projectile);
						zombie:getModData().back_LeftShoulder02 = 1;
				elseif	zombie:getModData().back_LeftShoulder03 == nil then
						zombie:setAttachedItem("Back LeftShoulder03", projectile);
						zombie:getModData().back_LeftShoulder03 = 1;
				elseif	zombie:getModData().back_LeftShoulder04 == nil then
						zombie:setAttachedItem("Back LeftShoulder04", projectile);
						zombie:getModData().back_LeftShoulder04 = 1;
				else	DebugSay(3,"LEFT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_LeftShoulder01 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder01", projectile);
						zombie:getModData().stuck_LeftShoulder01 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder02 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder02", projectile);
						zombie:getModData().stuck_LeftShoulder02 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder03 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder03", projectile);
						zombie:getModData().stuck_LeftShoulder03 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder04 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder04", projectile);
						zombie:getModData().stuck_LeftShoulder04 = 1;
				else	DebugSay(3,"LEFT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (bp == "UpperArm_R") or (bp == "ForeArm_R") or (bp == "Hand_R") then
			DebugSay(3,"RIGHT SHOULDER")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_RightShoulder01 == nil then
						zombie:setAttachedItem("Back RightShoulder01", projectile);
						zombie:getModData().back_RightShoulder01 = 1;
				elseif	zombie:getModData().back_RightShoulder02 == nil then
						zombie:setAttachedItem("Back RightShoulder02", projectile);
						zombie:getModData().back_RightShoulder02 = 1;
				elseif	zombie:getModData().back_RightShoulder03 == nil then
						zombie:setAttachedItem("Back RightShoulder03", projectile);
						zombie:getModData().back_RightShoulder03 = 1;
				elseif	zombie:getModData().back_RightShoulder04 == nil then
						zombie:setAttachedItem("Back RightShoulder04", projectile);
						zombie:getModData().back_RightShoulder04 = 1;
				else	DebugSay(3,"RIGHT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_RightShoulder01 == nil then
						zombie:setAttachedItem("Stuck RightShoulder01", projectile);
						zombie:getModData().stuck_RightShoulder01 = 1;
				elseif	zombie:getModData().stuck_RightShoulder02 == nil then
						zombie:setAttachedItem("Stuck RightShoulder02", projectile);
						zombie:getModData().stuck_RightShoulder02 = 1;
				elseif	zombie:getModData().stuck_RightShoulder03 == nil then
						zombie:setAttachedItem("Stuck RightShoulder03", projectile);
						zombie:getModData().stuck_RightShoulder03 = 1;
				elseif	zombie:getModData().stuck_RightShoulder04 == nil then
						zombie:setAttachedItem("Stuck RightShoulder04", projectile);
						zombie:getModData().stuck_RightShoulder04 = 1;
				else	DebugSay(3,"RIGHT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		else	DebugSay(3,"Projectile Bouce")
			Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
			zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
		end
	end
end



------------------------------------------------------------------
--  VANILLA JUST PICKS HEAD OR CHEST...							--
--  WAR-DROBE MOD BODY PART HIT SYSTEM OPENS THE REST TO ATTACK	--
--  CHEST AND HEAD DO PRIMARY DAMAGE, EXTREMTIES REDUCE HEALTH	--
--  BY RATIO, BUT NEVER KILLS ZOMBIE... AS YOU WOULD EXPECT		--
------------------------------------------------------------------
function getFullBodyLocation(player,weapon)
	local lvl	= 0
	local mult	= 10

	if	weapon:isAimedFirearm() then
		lvl =	player:getPerkLevel(Perks.FromString("Aiming")) * mult
	elseif weapon:getCategories():contains("Axe") then
		lvl =	player:getPerkLevel(Perks.Axe)					* mult
	elseif weapon:getCategories():contains("SmallBlade") then
		lvl =	player:getPerkLevel(Perks.SmallBlade)			* mult
	elseif weapon:getCategories():contains("LongBlade") then
		lvl = player:getPerkLevel(Perks.LongBlade)				* mult
	elseif weapon:getCategories():contains("Spear") then
		lvl =	player:getPerkLevel(Perks.Spear)				* mult
	elseif weapon:getCategories():contains("SmallBlunt") then
		lvl =	player:getPerkLevel(Perks.SmallBlunt)			* mult
	elseif weapon:getCategories():contains("Blunt") then
		lvl =	player:getPerkLevel(Perks.Blunt)				* mult
	end

	local part	= ZombRand(1,100 + lvl)		-- INCREASING FROM 100 GIVES MORE CHANCE TO POINT OF AIM (CHEST/HEAD)
	local crit	= ZombRand(1,10)

--	DebugSay(2,"Roll - "..tostring(part).." Lvl - "..tostring(lvl))

	----------------------------------------------------------
	-- FIREARMS TARGET FAVOR CENTER MASS, LOW LIMB CHANCE	--
	-- MOVEMENT AFFECTS SHOT PLACEMENT AWAY FROM POA		--
	----------------------------------------------------------
	if	weapon:isAimedFirearm() then
		if		part <= 1 then	bodypart = "Foot_R"		-- 1	FURTHEST FROM POA
		elseif	part <= 2 then	bodypart = "Foot_L"		-- 1
		elseif	part <= 3 then	bodypart = "Hand_R"		-- 1
		elseif	part <= 4 then	bodypart = "Hand_L"		-- 1
		elseif	part <= 6 then	bodypart = "LowerLeg_R"	-- 2
		elseif	part <= 8 then	bodypart = "LowerLeg_L"	-- 2
		elseif	part <= 14 then	bodypart = "UpperLeg_R"	-- 6
		elseif	part <= 20 then	bodypart = "UpperLeg_L"	-- 6
		elseif	part <= 22 then	bodypart = "ForeArm_R"	-- 2
		elseif	part <= 24 then	bodypart = "ForeArm_L"	-- 2
		elseif	part <= 30 then	bodypart = "UpperArm_R"	-- 6
		elseif	part <= 36 then	bodypart = "UpperArm_L"	-- 6
		elseif	part <= 44 then	bodypart = "Groin"		-- 8
		else		-- DebugSay(2,"POA")								-- LEVEL GETS YOU IN THIS ZONE
				if		crit <= 1	then	bodypart = "Neck"			-- 10%
				elseif	crit <= 6	then	bodypart = "Torso_Upper"	-- 50%
				elseif	crit <= 7	then	bodypart = "Torso_Lower"	-- 20%
				else						bodypart = "Head"			-- 20%
				end
		end
	----------------------------------------------------------
	-- MELEE FAVORS UPPER BODY AND ARMS, LOW LEG CHANCE 	--
	-- NOT AFFECTED BY MOVING... MELEE INVOLVES MOVING		--
	----------------------------------------------------------
	else	DebugSay(3,"MELEE BODY STRIKES")
		if		part <= 1 then	bodypart = "Foot_R"		-- 1	FURTHEST FROM POA
		elseif	part <= 2 then	bodypart = "Foot_L"		-- 1
		elseif	part <= 4 then	bodypart = "LowerLeg_R"	-- 2
		elseif	part <= 6 then	bodypart = "LowerLeg_L"	-- 2
		elseif	part <= 10 then	bodypart = "UpperLeg_R"	-- 4
		elseif	part <= 14 then	bodypart = "UpperLeg_L"	-- 4
		elseif	part <= 18 then	bodypart = "Hand_R"		-- 4
		elseif	part <= 22 then	bodypart = "Hand_L"		-- 4
		elseif	part <= 28 then	bodypart = "ForeArm_R"	-- 6
		elseif	part <= 34 then	bodypart = "ForeArm_L"	-- 6
		elseif	part <= 40 then	bodypart = "UpperArm_R"	-- 6
		elseif	part <= 46 then	bodypart = "UpperArm_L"	-- 6
		elseif	part <= 52 then	bodypart = "Groin"		-- 6
		elseif	part <= 60 then	bodypart = "Torso_Lower"-- 8
		else		-- DebugSay(2,"POA")								-- LEVEL GETS YOU IN THIS ZONE
				if		crit <= 1	then	bodypart = "Neck"			-- 10%
				elseif	crit <= 6	then	bodypart = "Torso_Upper"	-- 50%
				else						bodypart = "Head"			-- 40%
				end
		end
	end
	return bodypart
end


--------------------------------------------------------------------------
--  onZOMBIEDEAD		RESET ALL STUCK PROJECTILE (ATTACHMENT) POINTS	--
--------------------------------------------------------------------------
local function resetStuckProjectile(zombie)
	local zData	= zombie:getModData();

	zData.stuck_Head01		= nil;
	zData.stuck_Head02		= nil;
	zData.stuck_Head03		= nil;
	zData.stuck_Head04		= nil;
	zData.stuck_Head05		= nil;
	zData.stuck_Head06		= nil;
	zData.back_Head01		= nil;
	zData.back_Head02		= nil;
	zData.back_Head03		= nil;
	zData.back_Head04		= nil;
	zData.back_Head05		= nil;
	zData.back_Head06		= nil;

	zData.stuck_Body01		= nil;
	zData.stuck_Body02		= nil;
	zData.stuck_Body03		= nil;
	zData.stuck_Body04		= nil;
	zData.stuck_Body05		= nil;
	zData.stuck_Body06		= nil;
	zData.stuck_Back01		= nil;
	zData.stuck_Back02		= nil;
	zData.stuck_Back03		= nil;
	zData.stuck_Back04		= nil;
	zData.stuck_Back05		= nil;
	zData.stuck_Back06		= nil;

	zData.stuck_LeftLeg01	= nil;
	zData.stuck_LeftLeg02	= nil;
	zData.stuck_LeftLeg03	= nil;
	zData.stuck_LeftLeg04	= nil;
	zData.back_LeftLeg01	= nil;
	zData.back_LeftLeg02	= nil;
	zData.back_LeftLeg03	= nil;
	zData.back_LeftLeg04	= nil;

	zData.stuck_RightLeg01	= nil;
	zData.stuck_RightLeg02	= nil;
	zData.stuck_RightLeg03	= nil;
	zData.stuck_RightLeg04	= nil;
	zData.back_RightLeg01	= nil;
	zData.back_RightLeg02	= nil;
	zData.back_RightLeg03	= nil;
	zData.back_RightLeg04	= nil;

	zData.stuck_LeftShoulder01	= nil;
	zData.stuck_LeftShoulder02	= nil;
	zData.stuck_LeftShoulder03	= nil;
	zData.stuck_LeftShoulder04	= nil;
	zData.back_LeftShoulder01	= nil;
	zData.back_LeftShoulder02	= nil;
	zData.back_LeftShoulder03	= nil;
	zData.back_LeftShoulder04	= nil;

	zData.stuck_RightShoulder01	= nil;
	zData.stuck_RightShoulder02	= nil;
	zData.stuck_RightShoulder03	= nil;
	zData.stuck_RightShoulder04	= nil;
	zData.back_RightShoulder01	= nil;
	zData.back_RightShoulder02	= nil;
	zData.back_RightShoulder03	= nil;
	zData.back_RightShoulder04	= nil;
end

--------------------------------------------------------------------------
--  onWEAPONSWING		START TIMER	AND ASSIGN TROWN ITEM TO MODDATA	--
--------------------------------------------------------------------------
local function startProjectileTimer(player, weapon)

	if	(weapon) and (weapon:hasTag("XBow") or weapon:hasTag("Thrown")) then

		--	LEAVE THIS IN JUST IN CASE SOMEHOW GETS BRICKED
		local	scriptitem	= weapon:getScriptItem()
		weapon:setMaxHitCount(scriptitem:getMaxHitCount())

		if weapon:hasTag("XBow") and weapon:getCurrentAmmoCount() > 0 then
			player:getModData().TempThrown = weapon:getAmmoType()
		elseif weapon:hasTag("Thrown") then
			player:getModData().TempThrown = weapon

			------------------------------
			--	HIT / MISS CODE			--
			------------------------------
			local	roll	= ZombRand(30)	-- MAX CHANCE 30/35
			local	aim		= player:getPerkLevel(Perks.FromString("Aiming"))
			local	str		= player:getPerkLevel(Perks.Strength)
			local	axe		= player:getPerkLevel(Perks.Axe)
			local	knife	= player:getPerkLevel(Perks.SmallBlade)
			local	blade	= player:getPerkLevel(Perks.LongBlade)
			local	spear	= player:getPerkLevel(Perks.Spear)
			local	skill	= 0
			local	move	= round(player:getBeenMovingFor() / 10)						-- PENALTY (7)
		--	local	endur	= player:getMoodles():getMoodleLevel(MoodleType.Endurance)	-- PENALTY (4)
		--	local	pain	= player:getMoodles():getMoodleLevel(MoodleType.Pain)		-- PENALTY (4)
		--	local	panic	= player:getMoodles():getMoodleLevel(MoodleType.Panic)		-- PENALTY (4)
			local	endur	= round( (1 - (player:getStats():getEndurance()) ) * 10 )	-- PENALTY (10)
			local	pain	= round(player:getStats():getPain() / 10)					-- PENALTY (10)
			local	panic	= round(player:getStats():getPanic() /10)					-- PENALTY (10)
			local	drunk	= round(player:getStats():getDrunkenness() / 5)				-- PENALTY (20)
			local	tohit	= 0
		
			if		string.find(weapon:getType(), "Machete") then
					skill	= blade
			elseif	string.find(weapon:getType(), "Knife") then
					skill	= knife
			elseif	string.find(weapon:getType(), "Star") then
					skill = knife
			elseif	string.find(weapon:getType(), "Axe") then
					skill = axe
			elseif	string.find(weapon:getType(), "Spear") then
					skill = spear
			elseif	string.find(weapon:getType(), "Fork") then
					skill = spear
			end

			tohit		=	aim	+str	+skill-move	-endur-pain	-panic - drunk
			--			10	+10	+10	-4	-4	-4	-4	= 6 (MAX ALL)
			percent	= round(tohit / 30 * 100,1)

		--	DebugSay(2,"HIT%("..tostring(percent)..") AIM("..tostring(aim)..") STR("..tostring(str)..") SKILL("..tostring(skill)..") MOVE("..tostring(move)..") ENDUR("..tostring(endur)..") PAIN("..tostring(pain)..") PANIC("..tostring(panic)..") DRUNK("..tostring(drunk)..")" )

			if 	roll <= tohit then
				DebugSay(3,"ROLL - HIT")
			else	DebugSay(3,"ROLL - MISS")
				weapon:setMaxHitCount(0)
			end

			local	rollC	= ZombRand(weapon:getConditionLowerChance() + skill)
			if	rollC == 0 then
				weapon:setCondition(weapon:getCondition() - 1)
		--		DebugSay(2,"Condition Lowered")
			end

		end
	
		player:getModData().ProjectileHit = 0

		player:getModData().ProjectileTimer = getTimestamp() + 2.0		-- TRY TIME STAMP FOR REAL TIME INSTEAD OF TICKS 1.0 FAILS AT HIGH FPS
	--	player:getModData().ProjectileTimer = 30		-- IDEAL FOR 60~FPS
	--	player:getModData().ProjectileTimer = 120		-- FOR FASTER FPS BUT HUGE AIR TIME BUT SEEMS TO WORK AT 400+FPS
	--	DebugSay(2,"Timer Started / Attack-Type = "..tostring(player:getAttackType()))
	else	player:getModData().ProjectileTimer = 0
	end


end

--------------------------------------------------------------------------
--  onWEAPONSWING		CHECK FOR NEXT THROWN WEAPON TO EQUIP			--
--------------------------------------------------------------------------
function getNextThrown(player, weapon)

	if weapon and weapon:hasTag("Thrown") and player:getModData().AutoThrow ~= nil then		-- ONLY DO IF THROWN IS USED
		local inv		= player:getInventory()
		local sec		= player:getSecondaryHandItem()
		local items		= inv:getItems()
		local equip		= 0
		local throw		= nil
		local Second	= nil
		local LBelt		= nil
		local RBelt		= nil
		local Back		= nil
		local Same		= nil
		local Next		= nil

--		if	(weapon) and (weapon:hasTag("Thrown")) and	-- SEC BACK INVENTORY
--			(sec) and (sec:hasTag("Thrown")) then		-- BUT ONLY IF THROWING
--			player:setSecondaryHandItem(nil)
--		end

		if (items) then
			if	(throw == nil) then
				for i=1, items:size()-1 do				-- SECONDARY HAND FIRST
					if(items:get(i)) then
						local item = items:get(i)
			--			if		(throw == nil) and (sec) and (item:getType() == sec:getType()) and (item:hasTag("Thrown")) then
						if		(throw == nil) and (sec) and (item == sec) and (item:hasTag("Thrown")) then
								equip = 10
							--	throw = item
								Second = item
						end
					end
				end
			end
			if	(throw == nil) then
				for i=1, items:size()-1 do
					if(items:get(i)) then
						local item = items:get(i)
						if		(throw == nil) and (item:getAttachedSlot() == 3) and (item:hasTag("Thrown")) then
								equip = 15
							--	throw = item
								RBelt = item
						end
					end
				end
			end
			if	(throw == nil) then
				for i=1, items:size()-1 do
					if(items:get(i)) then
						local item = items:get(i)
						if		(throw == nil) and (item:getAttachedSlot() == 2) and (item:hasTag("Thrown")) then
								equip = 20
							--	throw = item
								LBelt = item
						end
					end
				end
			end
			if	(throw == nil) then
				for i=1, items:size()-1 do
					if(items:get(i)) then
						local item = items:get(i)
						if		(throw == nil) and (item:getAttachedSlot() == 1) and (item:hasTag("Thrown")) then
								equip = 25
							--	throw = item
								Back = item
						end
					end
				end
			end
			if	(throw == nil) then
				for i=1, items:size()-1 do
					if(items:get(i)) then
						local item = items:get(i)
						if		(throw == nil) and (item:getType() == weapon:getType()) then
								equip = 40
							--	throw = item
								Same = item
						end
					end
				end
			end
			if	(throw == nil) then			-- THEN LOOK FOR ANY THROWN
				for i=1, items:size()-1 do
					if(items:get(i)) then
						local item = items:get(i)
						if		(throw == nil) and (item:hasTag("Thrown")) then
								equip = 80
							--	throw = item
								Next = item
						end
					end
				end
			end

			if		Second ~= nil then
					throw = Second
					DebugSay(2, getText("ContextMenu_AutoEquip_SECOND"))
			elseif	RBelt ~= nil then
					throw = RBelt
					DebugSay(2, getText("ContextMenu_AutoEquip_RBELT"))
			elseif	LBelt ~= nil then
					throw = LBelt
					DebugSay(2, getText("ContextMenu_AutoEquip_LBELT"))
			elseif	Back ~= nil	then
					throw = Back
					DebugSay(2, getText("ContextMenu_AutoEquip_BACK"))
			elseif	Same ~= nil	then
					throw = Same
					DebugSay(2, getText("ContextMenu_AutoEquip_SAME"))
			elseif	Next ~= nil	then
					throw = Next
					DebugSay(2, getText("ContextMenu_AutoEquip_NEXT"))
			end
		
			if (throw) and (equip > 0) then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(player, throw, equip, true, false))	-- (character, item, time, primary, twoHands)
				player:removeAttachedItem(throw)
				throw = nil
				player:setBeenMovingFor(equip + 20)
			else	DebugSay(2, getText("ContextMenu_AutoEquip_NONE"))
			end		
		end

		throw = nil		-- RESET IT
	end
end

--------------------------------------------------------------------------
--  onPLAYERUPDATE	CHECK FOR HIT OR BLOCKED THEN STICK OR GROUND		--
--------------------------------------------------------------------------
local function checkProjectileTimer(player)
	local	weapon	= player:getPrimaryHandItem()
	local	projectile	= player:getModData().TempThrown
	local	range		= 1

	if		weapon and (weapon:hasTag("Thrown") or weapon:hasTag("XBow")) and weapon:getMaxRange() then
			range = weapon:getMaxRange()
	elseif	projectile and projectile:getMaxRange() then
			range = projectile:getMaxRange()
	end

	if	player:getModData().ProjectileTimer == nil then
		player:getModData().ProjectileTimer = 0
	end
	if	player:getModData().ProjectileHit == nil then
		player:getModData().ProjectileHit = 0
	end

--	if		(player:getModData().ProjectileTimer > 0) and (player:getModData().ProjectileHit == 0) then
	--		player:getModData().ProjectileTimer = player:getModData().ProjectileTimer - 1
	--		DebugSay(3,"Timer - "..tostring(player:getModData().ProjectileTimer))
--	elseif	(player:getModData().ProjectileTimer == 0) and (player:getModData().ProjectileHit == 0) then
	if	(player:getModData().ProjectileTimer <= getTimestamp()) and (player:getModData().ProjectileHit == 0) then
			DebugSay(3,"Hit Nothing")
			if projectile then
				local cur	= player:getCurrentSquare()
				local fwd	= nil --	cur:getTileInDirection(player:getDir())
				local obj	= nil
				local stop	= 0
				local sound	= nil

				local cobj = cur:getObjects()
				if (cobj) then
					for i=1, cobj:size()-1 do
						if(cobj:get(i)) then
							local cobj = cobj:get(i)
							local block = getBlockProjectile(cobj)
							if block > 0 then
								DebugSay(3,"CUR - "..tostring(cobj:getType()))
								stop = cur
								sound = getBounceSound(projectile)
								break
							end
						end
					end
				end

				for i=1, range do
					if stop == 0 then
						fwd	= cur:getTileInDirection(player:getDir())
						obj	= fwd:getObjects()
						mobj	= fwd:getMovingObjects()
						if(obj) then
							for i=1, obj:size()-1 do
								if(obj:get(i)) then
									local obj = obj:get(i)
									local block = getBlockProjectile(obj)
									if block > 0 then
										DebugSay(3,"FWD - "..tostring(obj:getType()))
										stop = cur
										sound = getBounceSound(projectile)
										break
									end
								end
							end
						end
						if(mobj) then
							for i=1, mobj:size()-1 do
								if(mobj:get(i)) then
									local mobj = mobj:get(i)
								--	local block = getBlockProjectile(mobj)
								--	if block > 0 then
										DebugSay(3,"FWD - "..tostring(mobj:getType()))
										stop = cur
										sound = getBounceSound(projectile)
										break
								--	end
								end
							end
						end
						cur	= fwd
					end
				end
				if	stop == 0 then
					stop = fwd
				--	stop = cur
				end

		--		PUT IN TRANSFORM ON EQUIP INSTEAD MAKE SURE ITEM NOT BRICKED FROM MISS CODE
		--		if	(projectile) and projectile:hasTag("Thrown") and (projectile:getMaxHitCount() == 0) then
		--			local	projectilescript = projectile:getScriptItem()
		--			projectile:setMaxHitCount(projectilescript:getMaxHitCount())
		--		end

				--------------------------
				--	ARROW/BOLT BREAK	--
				--------------------------
				local	bust = (GUNFIGHTER.OPTIONS.options.dropdown135 * 2)		-- 1 IS NEVER / 10 MEANS 10%
				if	(stop ~= fwd) and (ZombRand(bust) == 2) and (weapon) and (weapon:hasTag("XBow")) then	-- WHEN THROWN, THERES NO WEAPON!!!
					local Broken = InventoryItemFactory.CreateItem(projectile)
					if Broken:getModData().Break ~= nil then
						projectile = Broken:getModData().Break
						sound = getBounceSound(projectile)		-- ADJUST FOR BREAK SOUND
					end
				end					

				stop:AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				if sound then
					Sound = player:getEmitter():playSound(sound)
				end
			end
			player:getModData().ProjectileHit = 1
			player:getModData().ProjectileTimer = -1
			player:getModData().TempThrown = nil
	elseif	(player:getModData().ProjectileTimer > 0) and (player:getModData().ProjectileHit == 1) then
			DebugSay(3,"Hit Something")
			player:getModData().ProjectileHit = 0
			player:getModData().ProjectileTimer = -1
			player:getModData().TempThrown = nil
	end
end


function getBlockProjectile(obj)
	if (tostring(obj:getType())	== "wall")		then	return 1
	elseif (obj:getObjectName()	== "Tree")		then	return 1
	elseif (obj:getObjectName()	== "Window")	then	return 1
	elseif (obj:getObjectName()	== "Door")		then	return 1
	elseif (obj:getObjectName()	== "Counter")	then	return 0
	elseif (obj:getObjectName()	== "IsoObject")	then	return 0
	else												return 0
	end
end


--------------------------------------------------------------------------
--  TEST LAUNCHER AIM AUTO TRANSFORM									--
--------------------------------------------------------------------------
function AutoTransform(player)

	local attacker = player
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
		second	= attacker:getSecondaryHandItem()
	end

	if		(player:getModData().TimeSprite) and (player:getModData().TimeSprite > 0) then
			player:getModData().TimeSprite = player:getModData().TimeSprite - 1
	end

	--------------------------------------
	--	RESTORE ATTACHED SPRITE HACK	--
	--------------------------------------
	if	(player:getModData().TimeSprite) and (player:getModData().TimeSprite <= 0) and (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:getWeaponSprite() == "null") and player:getModData().TempSprite ~= nil then
	
		--------------------------------------
		-- 	MAKE SURE IT RENDERS			--
		--------------------------------------
		if (instanceof(weapon,"HandWeapon")) then
			ReEquipIt(player, weapon)
			weapon:setWeaponSprite(player:getModData().TempSprite)
			player:getModData().TempSprite = nil
			player:getModData().TimeSprite = 0
		end
	elseif	(player:getModData().TimeSprite == nil) then
			player:getModData().TimeSprite = 0
	end

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		local	scriptItem = weapon:getScriptItem()
		local	scope = weapon:getScope()

		--------------------------------------
		--  ELIMINATE AUTO 1st SHOT LAG		--
		--------------------------------------
		if	(weapon:getFireMode() == "Auto" or weapon:getFireMode() == "Auto[L]" or weapon:getFireMode() == "Auto[H]" or weapon:getFireMode() == "[6]Rotary") and weapon:getRecoilDelay() ~= 0 then
			weapon:setRecoilDelay(0)
			DebugSay(3,"Delay 0")
		end

		--------------------------------------
		--  LIMIT SHOTGUN RANGE VS SCOPE	--
		--------------------------------------
		if	(scope ~= nil) then
			local	maxRange = weapon:getMaxRange()
			local	scopeRange = scope:getMaxRange()
			local	scriptRange = scriptItem:getMaxRange()
			if	(isShotgun(weapon)) and (maxRange ~= scriptRange) then		-- NERF SHOTGUN RANGE
				weapon:setMaxRange(scriptRange)
				DebugSay(3,"Scope Disabled "..tostring(weapon:getMaxRange()))
		--	elseif	(not isShotgun(weapon)) and (maxRange < scriptRange) then	-- RETURN IF RIFLE
			elseif	(not isShotgun(weapon)) and (maxRange < scriptRange) and (weapon:getModData().Trajectory ~= "CQB") then	-- RETURN IF RIFLE, ADD CQB CHECK
				weapon:setMaxRange(scriptRange)
				DebugSay(3,"Scope Restored "..tostring(weapon:getMaxRange()))
			end
		elseif	(scope == nil) and (isShotgun(weapon)) then				-- RETURN SHOTGUN IF NO SCOPE
			local	maxRange = weapon:getMaxRange()
			local	scriptRange = scriptItem:getMaxRange()
			if	maxRange < scriptRange then
				WeaponReloadScript(44)
				DebugSay(3,"Reload Script")
			end
		end


		----------------------------------
		--  ROCKET ARMED			 	--
		----------------------------------
		if	isRocket(weapon) then
			Loaded	= weapon:getCurrentAmmoCount()
			Armed	= weapon:getClip()
			if	(Loaded == 0 and Armed ~= nil) or (Loaded > 0 and Armed == nil) then
				ReEquipIt(attacker,weapon)
			end
		end

		----------------------------------
		--  LAUNCHER PROJECTILE			--
		----------------------------------
		if 	(not weapon:isAimedHandWeapon()) and 
			(isLauncher(weapon) or
			isFlamer(weapon) or
			isBow(weapon) or
			isExtinguisher(weapon)) then

	--		local sling		= weapon:getSling()
	--		local Integral	= weapon:getModData().Integral
	--		Loaded		= weapon:getCurrentAmmoCount()

	--		if	( (sling) and (string.find(sling:getType(), "Launcher")) ) or
	--			( (Integral) and (Integral == "Launcher") ) then
	--			DebugSay(4,"Attachment... No Transform")
			----------------------------------
			--  ARCHERY MODEL ANIMATE		--
			----------------------------------
			if		weapon:hasTag("XBow") then
	--		elseif	weapon:hasTag("XBow") then
					if		(weapon:getCurrentAmmoCount()  > 0)	and (weapon:getWeaponSprite() == (weapon:getModData().SpriteNORM)) then	-- IS LOADED
							weapon:setWeaponSprite(weapon:getModData().SpriteFIRE)
							ReEquipIt(attacker,weapon)
					elseif	(weapon:getCurrentAmmoCount() == 0)	and (weapon:getWeaponSprite() == (weapon:getModData().SpriteFIRE)) then	-- NOT LOADED
							weapon:setWeaponSprite(weapon:getModData().SpriteNORM)
							ReEquipIt(attacker,weapon)
					end


			--------------------------------------------------
			--  ALL OTHER ICON SWITCH TYPE					--
			--------------------------------------------------
			elseif	isFlamer(weapon) or isExtinguisher(weapon) or isRocket(weapon) or isLauncher(weapon) then
				----------------------
				--	AIMING			--
				----------------------
				if	attacker:isAiming() then
					local ammo = weapon:getAmmoType()
					local proj = nil
					if ammo then
						local tempAmmo = InventoryItemFactory.CreateItem(ammo)
						if tempAmmo then
							------------------------------
							-- AMMO WITH SWITCH TYPES	--
							------------------------------
							if	tempAmmo:getModData().Fired then
								local firedAmmo = InventoryItemFactory.CreateItem(tempAmmo:getModData().Fired)
								if firedAmmo then
									proj = firedAmmo:getTexture()
								end
							------------------------------
							-- AMMO THAT SHOOTS ITESELF	--
							------------------------------
							else	proj = tempAmmo:getTexture()
							end
						end
					end
			--		DebugSay(2,"Proj - "..tostring(proj))
					weapon:setTexture(proj)
				----------------------
				--	NOT AIMING		--
				----------------------
				else	local revert = InventoryItemFactory.CreateItem(weapon:getType())
					local icon = revert:getTexture()
					weapon:setTexture(icon)
				end
			end

		----------------------------------
		--  NEW R4R BURST CODE CREATED  --
		--  FOR ROUND FOR ROUND MODE	--
		--  I CANT BELIEVE THIS WORKS	--
		----------------------------------
		elseif	(not weapon:isAimedHandWeapon()) and (not isShotgun(weapon)) and (not isBow(weapon)) then
			local	mode = weapon:getFireMode()
			local	current = weapon:getCurrentAmmoCount()
			if attacker:isAiming() then
				if	(mode) and (mode == "[2]Burst" or mode == "[3]Burst" or mode == "[L2]Burst" or mode == "[L3]Burst" or mode == "[H2]Burst" or mode == "[H3]Burst") then
					local BurstStop = 0
					local BurstShots = 0
					if	(mode == "[2]Burst" or mode == "[H2]Burst") then
						BurstShots = 2
						BurstStop = current - BurstShots
						if	attacker:getModData().BurstStop == current or attacker:getModData().BurstStop == nil then
							attacker:getModData().BurstStop = BurstStop	-- END OF BURST DELAY
							DebugSay(3,"BurstStop")
							calcRecoilDelay(attacker, weapon)
					--	else	weapon:setRecoilDelay(0)			-- KEEP BURSTING
						end
					elseif	(mode == "[3]Burst" or mode == "[L3]Burst" or mode == "[H3]Burst") then
						BurstShots = 3
						BurstStop = current - BurstShots
						if	attacker:getModData().BurstStop == current or attacker:getModData().BurstStop == nil then
							attacker:getModData().BurstStop = BurstStop	-- END OF BURST DELAY
							DebugSay(3,"BurstStop")
							calcRecoilDelay(attacker, weapon)
					--	else	weapon:setRecoilDelay(0)			-- KEEP BURSTING
						end
					end
					local	count = attacker:getModData().BurstStop

					if	(count >= 0) and (current > 0) and (BurstShots == 3 and count + BurstShots <= current + 1) or (BurstShots == 2 and count + BurstShots <= current) then
						weapon:setRecoilDelay(0)
--					elseif	(current <= 1) or (count + BurstShots < current) or (current < count) or (count == current) then
					elseif	(current <= 1) or (current < count) or (count == current) then
						attacker:getModData().BurstStop = nil
						calcRecoilDelay(attacker, weapon)
					else
						calcRecoilDelay(attacker, weapon)
					end
					DebugSay(3,"CUR-"..tostring(current).." / STOP-"..tostring(count).." / REC-"..tostring(weapon:getRecoilDelay()))
				else	DebugSay(4, "NOT BURST")
				end
			else	local	count = attacker:getModData().BurstStop
				if (count) and (count <= 0 or count < current or current < count) then		-- NOT AIMING GET FULL BURST
					attacker:getModData().BurstStop = nil
					calcRecoilDelay(attacker, weapon)
				end
			end
		end
	----------------------------------
	--	FLEX WEAPON AUTOTRANSFORM	--
	--	WHEN AIMING OR NORMAL		--
	----------------------------------
	elseif (weapon and not weapon:isBroken() and weapon:hasTag("Flex")) then		-- ONLY FLEX WEAPONS HERE
		local grip		= nil
		local Rest		= weapon:getModData().SpriteREST
		local Normal	= weapon:getModData().SpriteNORM
		local Flex		= weapon:getModData().SpriteFLEX

		if	(attacker:isRunning() or attacker:isSprinting()) and (weapon:getWeaponSprite() == Rest) then	-- NORMAL GRIP RUNNING
			grip = Normal
			DebugSay(3,"Running - NORMAL GRIP")
		elseif (not attacker:isAttacking()) and (weapon:getWeaponSprite() == Flex) then				-- PREVENT FLEX MANUAL
			grip = Normal
			DebugSay(3,"Running - CANCEL FLEX")
		elseif (not attacker:isRunning() and not attacker:isSprinting()) then
			if	(attacker:isAiming() and weapon:getWeaponSprite() == Rest) then					-- NORMAL AIMING
				grip = Normal
				DebugSay(3,"Aiming - NORMAL GRIP")
			elseif (not attacker:isAiming()) and (weapon:getWeaponSprite() ~= Rest) and				-- REST GRIP NOT AIMING
				(weapon:getWeaponSprite() ~= "null") then									-- PREVENT FLASH ON GRIP CHANGE
				grip = Rest
				DebugSay(3,"Not Aiming - REST GRIP")
			else	grip = nil
			end
		else	grip = nil
		end

		if	(grip ~= nil) then
			weapon:setWeaponSprite(grip)
		end

		ReEquipIt(attacker,weapon)
	end

	if (second and not second:isBroken() and second:hasTag("Flex")) then		-- ONLY FLEX WEAPONS HERE
		local grip		= nil
		local Rest		= second:getModData().SpriteREST_S
		local Normal	= second:getModData().SpriteNORM_S
		local Flex		= second:getModData().SpriteFLEX_S

		if	(attacker:isRunning() or attacker:isSprinting()) and (second:getWeaponSprite() == Rest) then	-- NORMAL GRIP RUNNING
			grip = Normal
			DebugSay(3,"Running - NORMAL GRIP")
		elseif (not attacker:isAttacking()) and (second:getWeaponSprite() == Flex) then				-- PREVENT FLEX MANUAL
			grip = Normal
			DebugSay(3,"Running - CANCEL FLEX")
		elseif (not attacker:isRunning() and not attacker:isSprinting()) then
			if	(attacker:isAiming() and second:getWeaponSprite() == Rest) then					-- NORMAL AIMING
				grip = Normal
				DebugSay(3,"Aiming - NORMAL GRIP")
			elseif (not attacker:isAiming()) and (second:getWeaponSprite() ~= Rest) and				-- REST GRIP NOT AIMING
				(second:getWeaponSprite() ~= "null") then									-- PREVENT FLASH ON GRIP CHANGE
				grip = Rest
				DebugSay(3,"Not Aiming - REST GRIP")
			else	grip = nil
			end
		else	grip = nil
		end

		if	(grip ~= nil) then
			second:setWeaponSprite(grip)
		end
		attacker:setSecondaryHandItem(second)
	end

end

--------------------------------------------------------------------------
--  REEQUIP CALL										--
--------------------------------------------------------------------------
function ReEquipIt(player, weapon)
	player:setPrimaryHandItem(weapon) 
	if		(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
			player:setSecondaryHandItem(weapon)
--	elseif	player:getSecondaryHandItem() == weapon then
	else	player:setSecondaryHandItem(nil)
	end
end

--------------------------------------------------------------------------
--  FLEX MELEE SWING TRANSFORM	onWeaponSwing							--
--------------------------------------------------------------------------
function MeleeFlexTransform(player)

	local attacker	= player
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end

	if (weapon) and (instanceof(weapon,"HandWeapon")) then
		if	weapon:hasTag("Flex") then										-- CHECK IF WEAPON IS FLEX
			local		Flex = weapon:getModData().SpriteFLEX						-- USE SAME DATA PARAM FOR FLEX/RETURN

			if		(not attacker:isAiming()) and (weapon:getWeaponSprite() == Flex) then	-- GO BACK TO REST
					weapon:setWeaponSprite(Flex)
			end

			if		(weapon:getWeaponSprite() ~= Flex) then						-- WERE SWINGING SO FLEX IT
					weapon:setWeaponSprite(Flex)
			end

			ReEquipIt(attacker,weapon)
		elseif weapon:hasTag("Flip") then										-- DEPLOY ON SWING LIKE ASP, ETC.
			FirearmMagazineToggle(getCore():getKey("MAG_TYPE_1"))
		end
	end
end
------------------------------------------------------------------------------------------
--  FLEX MELEE RETURN TRANSFORM	OnPlayerAttackFinished / HitPoint / HitCharacter		--
------------------------------------------------------------------------------------------
function MeleeRestTransform(player)

	local attacker	= player
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon =	attacker:getPrimaryHandItem()
		if		attacker:isRunning() then
		   		DebugSay(3,"SKIP SHOVE BREAK...")
		elseif	attacker:isDoShove() then
				DebugSay(3,"SHOVING...")
				return
		end
	end

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and weapon:hasTag("Flex") then		-- CHECK IF WEAPON IS FLEX
		local	Flex = weapon:getModData().Flex								-- USE SAME DATA PARAM FOR FLEX/RETURN

		if	(weapon:getWeaponSprite() ~= weapon:getModData().SpriteFLEX) then						-- FINISHED SO REST IT
			weapon:setWeaponSprite(weapon:getModData().SpriteREST)
		end
	end

	ReEquipIt(attacker,weapon)
end
------------------------------------------------------------------------------
--	OBSOLETE FLEX CODE DOES NOT REGISTER CONDITION	onWeaponHitCharacter	--
------------------------------------------------------------------------------
--[[
function FlexWeaponCondition(player)

	local attacker	= player
	local weapon	= nil

	if 	attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end

	if (weapon) and (instanceof(weapon,"HandWeapon")) and weapon:hasTag("Flex") then		-- CHECK IF WEAPON IS FLEX

		if	attacker:isDoShove() then
			DebugSay(2,"Shove... No Wear")
			return
		else	local	roll	= ZombRand(weapon:getConditionLowerChance())
			if	roll == 0 then
				weapon:setCondition(weapon:getCondition() - 1)
				DebugSay(2,"(-) Condition")
			end
		end
	end
end
]]
------------------------------------------------------------------------------
--  CONTROLLER MELEE GRIP		OnPressRackButton							--
------------------------------------------------------------------------------
--[[
function ControllerMeleeGrip(player, hand)
	DebugSay(2,"BUTTON PRESSED")
	
	local attacker	= player
	local weapon	= hand

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon =	attacker:getPrimaryHandItem()
		if		attacker:isRunning() or attacker:isDoShove() or weapon:hasTag("Flex") then
				DebugSay(3,"SKIP...")
				return
		end
	end

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (not attacker:isAiming()) then
		local	Wide	= weapon:getModData().WideGrip
		local	Close	= weapon:getModData().CloseGrip
		local	Spear	= weapon:getModData().SpearGrip
		local	Normal	= weapon:getModData().NormalGrip
		local	Thrown	= weapon:getModData().ThrownGrip

		if	(Wide) or (Close) or (Spear) or (Normal) or (Thrown) then
			FirearmMagazineToggle(getCore():getKey("MAG_TYPE_1"))
		end
	end
end
]]

--------------------------------------------------------------------------
--  CYCLE ACTION TEST			onWeaponSwing							--
--------------------------------------------------------------------------
function CycleActionFire(player)

	if	(GUNFIGHTER.OPTIONS.options.box136 == false) then
		return
	end

	local attacker 	= player
	local weapon	= nil
	local delay		= 5

	if	attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
		if attacker:getModData().CycleAction == nil then
			attacker:getModData().CycleAction = 0
		end
	end

	if	(weapon) and (instanceof(weapon,"HandWeapon")) then
		if		weapon:isRackAfterShoot() and (attacker:getModData().DelayAction == 0) then
				return
		elseif	not weapon:isRackAfterShoot() and attacker:getModData().CycleAction == 0 then
				attacker:getModData().CycleAction = delay
		end
	end

	if	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		local Open		= weapon:getModData().SpriteOPEN
		local Closed	= weapon:getModData().SpriteCLOSED
		if	(Open ~= nil) and (Closed ~= nil) then
			if		( weapon:haveChamber() and weapon:isRoundChambered() ) or 
					( not weapon:haveChamber() and weapon:getCurrentAmmoCount() > 0 ) then
	--				DebugSay(2,"CYCLE - AMMO")
				if	(weapon:getWeaponSprite() == Closed) then
					weapon:setWeaponSprite(Open)
					ReEquipIt(attacker,weapon)
	--				DebugSay(2,"CYCLE - OPEN")
				end
			end
		end
	end

	attacker:getModData().DelayAction = 0

end

--------------------------------------------------------------------------
--  CYCLE ACTION TEST			onAttackFinished						--
--------------------------------------------------------------------------
function CycleActionEnd(player)

	if	(GUNFIGHTER.OPTIONS.options.box136 == false) then
		return
	end

	local attacker 	= player
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		local Open		= weapon:getModData().SpriteOPEN
		local Closed	= weapon:getModData().SpriteCLOSED
		if	(Open ~= nil) and (Closed ~= nil) then
			if		( weapon:haveChamber() and weapon:isRoundChambered() ) or
					( not weapon:haveChamber() and weapon:getCurrentAmmoCount() > 0 ) then
		--			DebugSay(2,"CYCLE - NEXT ROUND")
				if	(weapon:getWeaponSprite() == Open) then
					weapon:setWeaponSprite(Closed)
					ReEquipIt(attacker,weapon)
		--			DebugSay(2,"CYCLE - CLOSE")
				end
			elseif	( weapon:haveChamber() and not weapon:isRoundChambered() ) or
					( not weapon:haveChamber() and weapon:getCurrentAmmoCount() > 0 ) then
		--			DebugSay(2,"CYCLE - NO AMMO")
				if	(weapon:getWeaponSprite() == Closed) then
					weapon:setWeaponSprite(Open)
					ReEquipIt(attacker,weapon)
		--			DebugSay(2,"CYCLE - LOCK")
				end
			else		weapon:setWeaponSprite(Closed)
					ReEquipIt(attacker,weapon)
		--			DebugSay(2,"CYCLE - END")
			end
		end
	end

	attacker:getModData().CycleAction = 0

end


--------------------------------------------------------------------------
--  PROCESS RECOIL DELAY TO ALLOW FULL AUTO WEAPONS TO ACTUALLY HAVE A	--
--  RECOIL STAT... THIS ALLOWS SINGLE SHOT MODE TO BE SLOW AND AUTO TO  --
--  BE RAPID. ADDS DYNAMIC RECOIL TAG TO APPLY (OnPlayerUpdate)			--
--------------------------------------------------------------------------
local function SendHit(attacker,weapon)

	------------------------------------
	--  FULL AUTO / RECOIL DELAY FIX  --
	------------------------------------
	if (weapon:isAimedFirearm()) and (not weapon:isAimedHandWeapon()) then
--		if	weapon:getFireMode() == "FullAuto" or		-- WTF ?
--			weapon:getFireMode() == "Auto" or
--			weapon:getFireMode() == "Auto[L]" or
--			weapon:getFireMode() == "Auto[H]" or
--			weapon:getFireMode() == "Burst" or		-- OBSOLETE
--			weapon:getFireMode() == "[2]Burst" or
--			weapon:getFireMode() == "[3]Burst" or
--			weapon:getFireMode() == "[L2]Burst" or
--			weapon:getFireMode() == "[L3]Burst" or
--			weapon:getFireMode() == "[H2]Burst" or
--			weapon:getFireMode() == "[H3]Burst" or
--			weapon:getFireMode() == "[3]Rotary" or		-- NOT USED MAYBE
--			weapon:getFireMode() == "[6]Rotary" then
--			weapon:setRecoilDelay(0)
--		else	
			calcRecoilDelay(attacker, weapon)
--		end
	end

	---------------------
	--  OPTIONS BOX 6  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box6 == true) then
		if	weapon:getCurrentAmmoCount() > 0 then
			attacker:getModData().CheckFired = weapon:getCurrentAmmoCount()
		elseif	weapon:isRoundChambered() then
			attacker:getModData().CheckFired = 1
		else	attacker:getModData().CheckFired = nil
		end
	end

	--------------------
	--  LAUNCHER FIRE --
	--------------------

	--------------------------
	--  3 ROUND BURST		--
	--  CALC AMMO ON PRESS	--
	--------------------------
--	if 	(weapon:isAimedFirearm()) and (not weapon:isAimedHandWeapon()) and (not isShotgun(weapon)) and
--		((weapon:haveChamber() ~= false and weapon:isRoundChambered() == true) or (weapon:haveChamber() == false)) then		-- NO DEDUCT IF NO AMMO
--		local current = weapon:getCurrentAmmoCount()
--		local fired = 0

--		if	(weapon:getFireMode() == "[2]Burst") then
--			fired = 1
--		elseif	(weapon:getFireMode() == "[3]Burst") then
--			fired = 2
--		elseif	(weapon:getFireMode() == "[3]Rotary") then
--			fired = 2
--		elseif	(weapon:getFireMode() == "[6]Rotary") then
--			fired = 5
--		elseif	(weapon:getFireMode() == "Auto") then
--			fired = 2
--		end

--		if 	(current < fired) then
--			fired = current			-- PREVENT NEGATIVE AMMO
--		end
--		weapon:setCurrentAmmoCount(current-fired)

	--	if	(fired ~= 0) and (weapon:getModData().AutoReload == 1) then
	--		WeaponReloadScript(44)
	--		weapon:getModData().AutoReload = 0
	--	end

--	end
end


--------------------------------------------------------------------------
--  PROCESSED BY (OnPlayerUpdate) APPLYING RECOIL TO (BeenMovingFor)	--
--  TO SIMULATE MUZZLE CLIMB, PENALIZING RAPID SUCCESSIVE SHOTS...		--
--------------------------------------------------------------------------
local function ApplyRecoil()
	local attacker	= getSpecificPlayer(0)			-- ONPLAYERUPDATE
	local check		= attacker:getModData().CheckFired
	local gun		= attacker:getPrimaryHandItem()
	local Moving	= attacker:getBeenMovingFor()
	local aimtime	= 0
	if	(instanceof(gun,"HandWeapon")) and gun:isAimedFirearm() then
		aimtime		= gun:getAimingTime()
	end
	local	support		= attacker:getSecondaryHandItem()

	if (attacker:isAiming()) then
		if gun ~= nil and (instanceof(gun,"HandWeapon")) then
			if	(gun:isAimedFirearm()) and (gun:isRanged()) then
				local ammo	= gun:getCurrentAmmoCount()
				local mode	= gun:getFireMode()
			--	if	(check) and (ammo == (check - 1)) then
				if	((check) and (ammo == (check - 1) or not gun:isRoundChambered())) or
					((check) and (mode == "Auto" or mode == "[3]Burst" or mode == "[2]Burst") and (ammo <= (check - 2) or not gun:isRoundChambered())) then
					local AimLevel	= attacker:getPerkLevel(Perks.Aiming)		-- ONLY 1x LEVEL APPLIED RECOIL.. TOO EASY
					local Delay 	= gun:getModData().TempRecoilDelay - (AimLevel)
			--		local AimLevel	= 0						-- DONT LEVEL APPLIED RECOIL.. TOO EASY
			--		local Delay 	= gun:getModData().TempRecoilDelay - (AimLevel * 2)
					if (support) and (gun ~= support) then
						Delay = Delay * 2
					end
					if mode == "[2]Burst" then Delay = Delay * 1.25
					elseif mode == "[3]Burst" then Delay = Delay * 1.5
					elseif mode == "Auto" then Delay = Delay * 1.5
					end

					attacker:setBeenMovingFor(Moving + Delay)
			--		attacker:getModData().CheckFired = gun:getCurrentAmmoCount()
					attacker:getModData().CheckFired = nil
				----------------------
				--  OPTIONS BOX 8  --
				----------------------
				elseif (GUNFIGHTER.OPTIONS.options.box8 == true) and ((attacker:getVariableBoolean("isLoading")) or (attacker:getVariableBoolean("isRacking")) or (attacker:getVariableBoolean("isUnloading"))) then
					if (Moving < 70 - aimtime) then
						attacker:setBeenMovingFor(70 - aimtime)
					end
				end
			end
		end
	----------------------
	--  OPTIONS BOX 8	--
	----------------------
	elseif (GUNFIGHTER.OPTIONS.options.box8 == true) then
		if (Moving < 70 - aimtime) then
			attacker:setBeenMovingFor(70 - aimtime)
		end
	end

	------------------------------------
	--  TIK COUNTER FOR CYCLE ACTION  --
	------------------------------------
	if	(GUNFIGHTER.OPTIONS.options.box136 == true) then
		if	(attacker:getModData().CycleAction) and (attacker:getModData().CycleAction > 0) then
		--	DebugSay(2,"CYCLE - "..tostring(attacker:getModData().CycleAction))
			attacker:getModData().CycleAction = (attacker:getModData().CycleAction - 1)
			if attacker:getModData().CycleAction == 0 then
				attacker:getModData().DelayAction = 0
				CycleActionEnd(attacker)
			end
		end
		if	(attacker:getModData().DelayAction) and (attacker:getModData().DelayAction > 0) then
		--	DebugSay(2,"DELAY - "..tostring(attacker:getModData().DelayAction))
			attacker:getModData().DelayAction = (attacker:getModData().DelayAction - 1)
			if attacker:getModData().DelayAction == 1 then
		--		attacker:getModData().CycleAction = 0
				CycleActionFire(attacker)
			end
		end
	end
end


--------------------------------------------------------------------------
--  PROCESS HIT CHANCE FOR DISPLAY PURPOSES, THEN FILTER MISSES IF		--
--  DYNAMIC RANGE IS ENABLED. ALSO TOGGLES RECOIL DELAY FROM 0 TO TEMP	--
--  FOR WORKING FIREMODE.												--
--------------------------------------------------------------------------
local function DynamicRangeModifier(attacker, target, weapon, damage)

	---------------------
	--  OPTIONS BOX 2  --
	--  OPTIONS BOX 7  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box2 == true) or (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
		if weapon:isAimedFirearm() and not weapon:isAimedHandWeapon() and not isLauncher(weapon) then
			------------------------------------------
			--  START WITH FRESH HITCHANCE VARIABLE	--
			------------------------------------------
			local	NewCalc = 0
			local	DFactor	= 0

			---------------------
			--  OPTIONS BOX 7  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
				local scriptItem = weapon:getScriptItem()
				if	weapon:getFireMode() == "Auto" or
					weapon:getFireMode() == "Auto[L]" or
					weapon:getFireMode() == "Auto[H]" or
					weapon:getFireMode() == "Burst" or			-- OBSOLETE
					weapon:getFireMode() == "[2]Burst" or
					weapon:getFireMode() == "[3]Burst" or
					weapon:getFireMode() == "[L2]Burst" or
					weapon:getFireMode() == "[L3]Burst" or
					weapon:getFireMode() == "[H2]Burst" or
					weapon:getFireMode() == "[H3]Burst" or
					weapon:getFireMode() == "[3]Rotary" or		-- NOT USED MAYBE
					weapon:getFireMode() == "[6]Rotary" then
					weapon:setRecoilDelay(0)
				else	calcRecoilDelay(attacker, weapon)
				end
				---------------------
				--  DYNAMIC FACTOR --
				---------------------
				if		(GUNFIGHTER.OPTIONS.options.dropdown7 == 2) then DFactor = 2.5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 3) then DFactor = 5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 4) then DFactor = 7.5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 5) then DFactor = 10
				end
			end

			NewCalc	= weapon:getHitChance()
			
			local AimLevel	= attacker:getPerkLevel(Perks.Aiming)
			local AimMod	= weapon:getAimingPerkHitChanceModifier()
			local AimTime	= weapon:getAimingTime()
			local Moving	= attacker:getBeenMovingFor()
		--	local MoveTime
		--	if	Moving - AimTime <= 0 then
		--		MoveTime = 0
		--	else	MoveTime = Moving - AimTime
		--	end

			local CQB = 0
			if weapon:getModData().CQB ~= nil then
				CQB = weapon:getModData().CQB
			end

			local Max		= weapon:getMaxRange() + CQB
			local Min		= weapon:getMinRange()
			local RangeMod	= weapon:getAimingPerkRangeModifier()
			local Effective	= (RangeMod * AimLevel / 2.5) + Max
			local Tloc		= target:getCurrentSquare()
			local Aloc		= attacker:getCurrentSquare()
			local Dist		= getDistanceBetween(Tloc,Aloc)
		--	local Factor	= (10-(Dist-Min)/Effective * 7.5) * 10		-- WHOLE NUMBER 100
		--	local Factor	= (10-(Dist-Min)/Effective * 10) * 10		-- WHOLE NUMBER 100
			local Factor	= (10-(Dist-Min)/Effective * DFactor) * 10	-- WHOLE NUMBER 100
			local Roll		= 0

			------------------------------------------
			--  CLONE OF VANILLA JAVA CALCULATIONS	--
			------------------------------------------
			NewCalc = NewCalc + ((AimMod / 2) * AimLevel)			-- AIM PERK LEVEL

			if attacker:HasTrait("Marksman") then				-- MARKSMAN TRAIT
				NewCalc = NewCalc + 20
			end

			if weapon:isRanged() then
				if	weapon:getMinRangeRanged() > 0 then		-- SCOPE MIN RANGE PENALTY
					if Dist < weapon:getMinRangeRanged() then
						NewCalc = NewCalc - 50
			--		elseif	Dist < Min then
			--			NewCalc = NewCalc - 50			-- I DID THIS WRONG
					end
				elseif	Dist < 1.5 then					-- POINT BLANK BONUS
					NewCalc = NewCalc + 15
				end
				if	Moving > (AimTime + AimLevel) then				-- MOVING PENALTY
			--		NewCalc = NewCalc - (Moving - (AimTime + AimLevel))		-- CLEARLY JAVA TAKES LESS NOW
					NewCalc = NewCalc - ( (Moving - (AimTime + AimLevel)) * 0.75)	-- HALF SEEMS CLOSER
				end
				if	NewCalc < 0 then				-- MIN IS ZERO, NOT 10
					NewCalc = 0
				end
				if	NewCalc > 100 then
					NewCalc = 100
				end
			end
											-- DO BODYPART PAIN CALC HERE

			---------------------------------------------------------------------------
			--  APPLY NEW RANGE PENALTY BASED ON (Factor) TO RE-CALCULATED HITCHANCE --
			---------------------------------------------------------------------------

			---------------------
			--  OPTIONS BOX 7  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
				NewCalc = (Factor) * (NewCalc/100)

				if weapon:isRanged() then
					Roll = ZombRand(100)
					if 	Roll > Factor then			-- NO 200% SEND DONT USE (NewCalc)
						target:setAvoidDamage(true)		-- NO HIT, NO DAMAGE
						--target:setNoDamage(true)		-- TAKES HIT, NO DAMAGE
						---------------------
						--  OPTIONS BOX 2  --
						---------------------
						if (GUNFIGHTER.OPTIONS.options.box2 == true) then
				--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..") - Calculated Miss", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
							DebugSay(1,"["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..") - Calculated Miss", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
						end
						return
					end
				end
			end
			---------------------
			--  OPTIONS BOX 2  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.box2 == true) then
	--			attacker:Say("")
	--			attacker:Say("")
	--			attacker:Say("")
	--			attacker:Say("")
	--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(Factor, 1)).."%", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
	--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."%", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
	--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..")", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
				DebugSay(1,"["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..")", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
			end
		end
	end
end


--------------------------------------------------------------------------
--  SHOW DAMAGE ON HITS ONLY, BASED ON ZED HEALTH MOD by TommySticks	--
--  THIS DISPLAYS WEAPON DAMAGE, NOT TARGET HEALTH BECAUSE THERE MAY	--
--  BE SCALED (VELOCITY/DAMAGE LOSS) IMPLEMENTED AT A LATER TIME...		--
--------------------------------------------------------------------------
function ShowDamage()
	---------------------
	--  OPTIONS BOX 1  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box1 == true) and (zTarget) and (zTarget ~= getSpecificPlayer(0)) then
--	if (getSpecificPlayer(0):getModData().ShowDamage == true) and (zTarget) and (getSpecificPlayer(0):canSee(zTarget)) then		TESTING ONLY
		if zedDown > 0 then
			zedDown = zedDown - 1;
			print(zedDown);
		end
		if zedDown == 2 then
			zhealth = zrnd(zTarget:getHealth());
			zhpmx = zrnd(zTarget:getModData().mHealth) * 0.01;
			if zhealth >= -666 then
				damage = zhealth - zTarget:getModData().newHealth;
				if damage < 0 then 
					damage = damage * -1		-- DONT CALL RANGE CALC MISSES
					if damage ~= 0 then
		--				zTarget:Say(tostring(damage), 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
						zTarget:addLineChatElement(tostring(damage), 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
					end
				end
			end
			if zhealth < -666 then
		--		zTarget:Say("!!!", 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
				zTarget:addLineChatElement("!!!", 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
			end
		end	
	end
end

function TargetInfo(attacker, target, weapon, damage)
	if (GUNFIGHTER.OPTIONS.options.box1 == true) then
		zedDown = 4;
		zTarget = target;
		zTarget:getModData().newHealth = zrnd(zTarget:getHealth());
	end
end

local function ZombieHealth(zombie)
	if (GUNFIGHTER.OPTIONS.options.box1 == true) then		-- PREVENT FLASHING ??
		zMod = zombie:getModData();
		if zMod.hTag ~= true then
			zMod.hTag = true;
		zMod.mHealth = tostring(zrnd(zombie:getHealth()));
		end
	end
end

function zrnd(num)
	local number = num
	if number == nil then				-- SuperSurvivor Compat
		return 0
	else
		return math.floor(num * 100 + 0.5);
	end
end

zedDown = 0;


Events.OnZombieUpdate.Add(ZombieHealth)
Events.OnPlayerUpdate.Add(ApplyRecoil)
Events.OnPlayerUpdate.Add(ShowDamage)
Events.OnPlayerUpdate.Add(HeadsUpDisplay)
-- Events.OnPlayerUpdate.Add(WeaponLightBeam)		-- MOVED TO SERVER FOLDER
Events.OnPlayerUpdate.Add(WeaponNightVision)
Events.OnKeyPressed.Add(WeaponLightToggle)
Events.OnKeyPressed.Add(WeaponNightVisionToggle)
Events.OnKeyPressed.Add(AutoNightVisionToggle)
Events.OnKeyPressed.Add(WeaponMeleeToggle)
Events.OnKeyPressed.Add(FirearmMagazineToggle)
Events.OnKeyPressed.Add(WeaponAltLoadToggle)
Events.OnKeyPressed.Add(WeaponSelectFire)

Events.OnKeyPressed.Add(WeaponReloadScript)

Events.OnWeaponSwing.Add(SendHit)
Events.OnWeaponHitCharacter.Add(TargetInfo)
Events.OnWeaponHitCharacter.Add(DynamicRangeModifier)

Events.OnWeaponSwing.Add(BreakAttachmentOnFire)
Events.OnWeaponHitCharacter.Add(BreakAttachmentOnMelee)
Events.OnPlayerUpdate.Add(WeaponStatus)					-- THIS WORKS BETTER, BUT CONSTANT SCAN
Events.OnPlayerUpdate.Add(AutoTransform)

Events.OnPlayerAttackFinished.Add(ejectBrass)

Events.OnWeaponHitCharacter.Add(setOnFire)

Events.OnHitZombie.Add(setStuckProjectile)
--Events.OnWeaponHitCharacter.Add(setStuckProjectile)
Events.OnZombieDead.Add(resetStuckProjectile)
Events.OnWeaponSwing.Add(startProjectileTimer)
Events.OnPlayerUpdate.Add(checkProjectileTimer)
Events.OnPlayerAttackFinished.Add(getNextThrown)
Events.OnPressReloadButton.Add(getNextMagType)
Events.OnPressReloadButton.Add(emergencyReload)
-- Events.OnPressRackButton.Add(ControllerMeleeGrip)
Events.OnWeaponSwing.Add(CycleActionFire)
-- Events.OnWeaponSwingHitPoint.Add(CycleActionFire)
-- Events.OnWeaponSwingHitPoint.Add(CycleActionEnd)
-- Events.OnPlayerAttackFinished.Add(CycleActionEnd)

-- Events.OnPressReloadButton.Add(CycleActionFire)
-- Events.OnPressRackButton.Add(CycleActionEnd)


Events.OnWeaponSwing.Add(MeleeFlexTransform)
-- Events.OnWeaponSwingHitPoint.Add(MeleeRestTransform)		-- SWING TOO FAST
-- Events.OnPlayerAttackFinished.Add(MeleeRestTransform)
-- Events.OnWeaponHitCharacter.Add(MeleeFlexTransform)		-- NO NEED
-- Events.OnWeaponHitCharacter.Add(MeleeRestTransform)		-- NO NEED
-- Events.OnWeaponHitCharacter.Add(FlexWeaponCondition)		-- NO NEED


-- Events.OnWeaponSwingHitPoint.Add(BreakAttachmentOnMelee)
-- Events.OnWeaponSwing.Add(WeaponStatus)				-- MOMENTARY JAM
-- Events.OnWeaponHitCharacter.Add()
-- Events.OnWeaponSwingHitPoint.Add()
-- Events.OnWeaponSwing.Add();
-- Events.OnZombieUpdate.Add();
-- Events.OnPlayerUpdate.Add()





--[[
--------------------------------------------------------------------------
--  STUCK PROJECTILE ON HIT SET AMMO TO BE STUCK OR BOUNCE				--
--  BACKUP SAVE OF NON-GETBODYTLOCATION (RANDOM) METHOD					--
--------------------------------------------------------------------------
local function setStuckProjectile(player, target, weapon, damage)

	player:getModData().ProjectileHit = 1				-- SHOVE DOES NOT REGISTER HERE... WTF!

	if	(weapon) and ( weapon:hasTag("XBow") or weapon:hasTag("Thrown") ) then	-- NOT FIREARMS

		local attacker	= player;
		local Gun	 	= weapon;
		local gun		= weapon:getType();
		local cond		= nil;
		local ammo		= weapon:getAmmoType();
		local stuck		= nil
		local zombie	= target
		local inv		= zombie:getInventory();	-- for inserting arrows in zombie
		local	back		= isFacingAway(player,target)
	--	local	back		= true				-- TEST BACK STICK LOCATIONS

		if	ammo then
			stuck = ammo					-- AMMO IS weapon:getType()
		else	stuck = gun						-- LOWER CASE IS Gun:getType()
			cond = Gun:getCondition()
		end

		local bounce	= getBounce(stuck)
		DebugSay(3,"PROJECTILE - "..tostring(stuck).." / BOUNCE - "..tostring(bounce))

		local	projectile = InventoryItemFactory.CreateItem(stuck);
		if	cond then
			projectile:setCondition(cond)
		end

		local	bust = (GUNFIGHTER.OPTIONS.options.dropdown135 * 2)			-- 1 IS NEVER / 10 MEANS 10%
		if	(stuck == ammo) and (ZombRand(bust) == 2) then				-- ROLL 10 to 100
			if (projectile:getModData().Break) ~= nil then				-- AMMO MUST HAVE BROKEN STAT
				projectile = InventoryItemFactory.CreateItem(projectile:getModData().Break);
			end
		end

		local	roll		= ZombRand(6 + bounce)		-- 6 TOTAL ZONES + ADD CHANCE OF BOUNCE DEPENDING ON PROJECTILE
	--	local	roll		= ZombRand(6)			-- NO BOUNCE TEST

		if	stuck == gun then	-- THROWN WEAPON IS ITSELF
			local crit		= weapon:getCriticalChance() + (weapon:getAimingPerkCritModifier() * player:getPerkLevel(Perks.Aiming))
			local critRoll	= ZombRand(100)
			DebugSay(3,"Crit - "..tostring(critRoll).." / "..tostring(crit))
		end

		if (critRoll and critRoll < crit) or (roll == 0) then	-- ONLY DO IF THROWN WEAPON, FIREARM DOES CRIT ALREADY
		--	zombie:setHealth(zombie:getHealth()/2 - 0.2)
			zombie:setHealth(0)
			DebugSay(3,"CRIT ROLL")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_Head01 == nil then
						zombie:setAttachedItem("Back Head01", projectile);
						zombie:getModData().back_Head01 = 1;
				elseif	zombie:getModData().back_Head02 == nil then
						zombie:setAttachedItem("Back Head02", projectile);
						zombie:getModData().back_Head02 = 1;
				elseif	zombie:getModData().back_Head03 == nil then
						zombie:setAttachedItem("Back Head03", projectile);
						zombie:getModData().back_Head03 = 1;
				elseif	zombie:getModData().back_Head04 == nil then
						zombie:setAttachedItem("Back Head04", projectile);
						zombie:getModData().back_Head04 = 1;
				elseif	zombie:getModData().back_Head05 == nil then
						zombie:setAttachedItem("Back Head05", projectile);
						zombie:getModData().back_Head05 = 1;
				elseif	zombie:getModData().back_Head06 == nil then
						zombie:setAttachedItem("Back Head06", projectile);
						zombie:getModData().back_Head06 = 1;
				else		DebugSay(3,"HEAD BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_Head01 == nil then
						zombie:setAttachedItem("Stuck Head01", projectile);
						zombie:getModData().stuck_Head01 = 1;
				elseif	zombie:getModData().stuck_Head02 == nil then
						zombie:setAttachedItem("Stuck Head02", projectile);
						zombie:getModData().stuck_Head02 = 1;
				elseif	zombie:getModData().stuck_Head03 == nil then
						zombie:setAttachedItem("Stuck Head03", projectile);
						zombie:getModData().stuck_Head03 = 1;
				elseif	zombie:getModData().stuck_Head04 == nil then
						zombie:setAttachedItem("Stuck Head04", projectile);
						zombie:getModData().stuck_Head04 = 1;
				elseif	zombie:getModData().stuck_Head05 == nil then
						zombie:setAttachedItem("Stuck Head05", projectile);
						zombie:getModData().stuck_Head05 = 1;
				elseif	zombie:getModData().stuck_Head06 == nil then
						zombie:setAttachedItem("Stuck Head06", projectile);
						zombie:getModData().stuck_Head06 = 1;
				else		DebugSay(3,"HEAD BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif (roll == 1) or (roll == 2) then
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				DebugSay(3,"BACK")
				if		zombie:getModData().stuck_Back01 == nil then
						zombie:setAttachedItem("Stuck Back01", projectile);
						zombie:getModData().stuck_Back01 = 1;
				elseif	zombie:getModData().stuck_Back02 == nil then
						zombie:setAttachedItem("Stuck Back02", projectile);
						zombie:getModData().stuck_Back02 = 1;
				elseif	zombie:getModData().stuck_Back03 == nil then
						zombie:setAttachedItem("Stuck Back03", projectile);
						zombie:getModData().stuck_Back03 = 1;
				elseif	zombie:getModData().stuck_Back04 == nil then
						zombie:setAttachedItem("Stuck Back04", projectile);
						zombie:getModData().stuck_Back04 = 1;
				elseif	zombie:getModData().stuck_Back05 == nil then
						zombie:setAttachedItem("Stuck Back05", projectile);
						zombie:getModData().stuck_Back05 = 1;
				elseif	zombie:getModData().stuck_Back06 == nil then
						zombie:setAttachedItem("Stuck Back06", projectile);
						zombie:getModData().stuck_Back06 = 1;
				else		DebugSay(3,"BACK BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				DebugSay(3,"BODY")
				if		zombie:getModData().stuck_Body01 == nil then
						zombie:setAttachedItem("Stuck Body01", projectile);
						zombie:getModData().stuck_Body01 = 1;
				elseif	zombie:getModData().stuck_Body02 == nil then
						zombie:setAttachedItem("Stuck Body02", projectile);
						zombie:getModData().stuck_Body02 = 1;
				elseif	zombie:getModData().stuck_Body03 == nil then
						zombie:setAttachedItem("Stuck Body03", projectile);
						zombie:getModData().stuck_Body03 = 1;
				elseif	zombie:getModData().stuck_Body04 == nil then
						zombie:setAttachedItem("Stuck Body04", projectile);
						zombie:getModData().stuck_Body04 = 1;
				elseif	zombie:getModData().stuck_Body05 == nil then
						zombie:setAttachedItem("Stuck Body05", projectile);
						zombie:getModData().stuck_Body05 = 1;
				elseif	zombie:getModData().stuck_Body06 == nil then
						zombie:setAttachedItem("Stuck Body06", projectile);
						zombie:getModData().stuck_Body06 = 1;
				else		DebugSay(3,"BODY BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif roll == 3 then
			DebugSay(3,"LEFT LEG")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_LeftLeg01 == nil then
						zombie:setAttachedItem("Back LeftLeg01", projectile);
						zombie:getModData().back_LeftLeg01 = 1;
				elseif	zombie:getModData().back_LeftLeg02 == nil then
						zombie:setAttachedItem("Back LeftLeg02", projectile);
						zombie:getModData().back_LeftLeg02 = 1;
				elseif	zombie:getModData().back_LeftLeg03 == nil then
						zombie:setAttachedItem("Back LeftLeg03", projectile);
						zombie:getModData().back_LeftLeg03 = 1;
				elseif	zombie:getModData().back_LeftLeg04 == nil then
						zombie:setAttachedItem("Back LeftLeg04", projectile);
						zombie:getModData().back_LeftLeg04 = 1;
				else		DebugSay(3,"LEFT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_LeftLeg01 == nil then
						zombie:setAttachedItem("Stuck LeftLeg01", projectile);
						zombie:getModData().stuck_LeftLeg01 = 1;
				elseif	zombie:getModData().stuck_LeftLeg02 == nil then
						zombie:setAttachedItem("Stuck LeftLeg02", projectile);
						zombie:getModData().stuck_LeftLeg02 = 1;
				elseif	zombie:getModData().stuck_LeftLeg03 == nil then
						zombie:setAttachedItem("Stuck LeftLeg03", projectile);
						zombie:getModData().stuck_LeftLeg03 = 1;
				elseif	zombie:getModData().stuck_LeftLeg04 == nil then
						zombie:setAttachedItem("Stuck LeftLeg04", projectile);
						zombie:getModData().stuck_LeftLeg04 = 1;
				else		DebugSay(3,"LEFT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif roll == 4 then
			DebugSay(3,"RIGHT LEG")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_RightLeg01 == nil then
						zombie:setAttachedItem("Back RightLeg01", projectile);
						zombie:getModData().back_RightLeg01 = 1;
				elseif	zombie:getModData().back_RightLeg02 == nil then
						zombie:setAttachedItem("Back RightLeg02", projectile);
						zombie:getModData().back_RightLeg02 = 1;
				elseif	zombie:getModData().back_RightLeg03 == nil then
						zombie:setAttachedItem("Back RightLeg03", projectile);
						zombie:getModData().back_RightLeg03 = 1;
				elseif	zombie:getModData().back_RightLeg04 == nil then
						zombie:setAttachedItem("Back RightLeg04", projectile);
						zombie:getModData().back_RightLeg04 = 1;
				else		DebugSay(3,"RIGHT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_RightLeg01 == nil then
						zombie:setAttachedItem("Stuck RightLeg01", projectile);
						zombie:getModData().stuck_RightLeg01 = 1;
				elseif	zombie:getModData().stuck_RightLeg02 == nil then
						zombie:setAttachedItem("Stuck RightLeg02", projectile);
						zombie:getModData().stuck_RightLeg02 = 1;
				elseif	zombie:getModData().stuck_RightLeg03 == nil then
						zombie:setAttachedItem("Stuck RightLeg03", projectile);
						zombie:getModData().stuck_RightLeg03 = 1;
				elseif	zombie:getModData().stuck_RightLeg04 == nil then
						zombie:setAttachedItem("Stuck RightLeg04", projectile);
						zombie:getModData().stuck_RightLeg04 = 1;
				else		DebugSay(3,"RIGHT LEG BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif roll == 5 then
			DebugSay(3,"LEFT SHOULDER")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_LeftShoulder01 == nil then
						zombie:setAttachedItem("Back LeftShoulder01", projectile);
						zombie:getModData().back_LeftShoulder01 = 1;
				elseif	zombie:getModData().back_LeftShoulder02 == nil then
						zombie:setAttachedItem("Back LeftShoulder02", projectile);
						zombie:getModData().back_LeftShoulder02 = 1;
				elseif	zombie:getModData().back_LeftShoulder03 == nil then
						zombie:setAttachedItem("Back LeftShoulder03", projectile);
						zombie:getModData().back_LeftShoulder03 = 1;
				elseif	zombie:getModData().back_LeftShoulder04 == nil then
						zombie:setAttachedItem("Back LeftShoulder04", projectile);
						zombie:getModData().back_LeftShoulder04 = 1;
				else		DebugSay(3,"LEFT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_LeftShoulder01 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder01", projectile);
						zombie:getModData().stuck_LeftShoulder01 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder02 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder02", projectile);
						zombie:getModData().stuck_LeftShoulder02 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder03 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder03", projectile);
						zombie:getModData().stuck_LeftShoulder03 = 1;
				elseif	zombie:getModData().stuck_LeftShoulder04 == nil then
						zombie:setAttachedItem("Stuck LeftShoulder04", projectile);
						zombie:getModData().stuck_LeftShoulder04 = 1;
				else		DebugSay(3,"LEFT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		elseif roll == 6 then
			DebugSay(3,"RIGHT SHOULDER")
			if		(Gun:hasTag("Spear") and back == false) or (not Gun:hasTag("Spear") and back == true) then
				if		zombie:getModData().back_RightShoulder01 == nil then
						zombie:setAttachedItem("Back RightShoulder01", projectile);
						zombie:getModData().back_RightShoulder01 = 1;
				elseif	zombie:getModData().back_RightShoulder02 == nil then
						zombie:setAttachedItem("Back RightShoulder02", projectile);
						zombie:getModData().back_RightShoulder02 = 1;
				elseif	zombie:getModData().back_RightShoulder03 == nil then
						zombie:setAttachedItem("Back RightShoulder03", projectile);
						zombie:getModData().back_RightShoulder03 = 1;
				elseif	zombie:getModData().back_RightShoulder04 == nil then
						zombie:setAttachedItem("Back RightShoulder04", projectile);
						zombie:getModData().back_RightShoulder04 = 1;
				else		DebugSay(3,"RIGHT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			else
				if		zombie:getModData().stuck_RightShoulder01 == nil then
						zombie:setAttachedItem("Stuck RightShoulder01", projectile);
						zombie:getModData().stuck_RightShoulder01 = 1;
				elseif	zombie:getModData().stuck_RightShoulder02 == nil then
						zombie:setAttachedItem("Stuck RightShoulder02", projectile);
						zombie:getModData().stuck_RightShoulder02 = 1;
				elseif	zombie:getModData().stuck_RightShoulder03 == nil then
						zombie:setAttachedItem("Stuck RightShoulder03", projectile);
						zombie:getModData().stuck_RightShoulder03 = 1;
				elseif	zombie:getModData().stuck_RightShoulder04 == nil then
						zombie:setAttachedItem("Stuck RightShoulder04", projectile);
						zombie:getModData().stuck_RightShoulder04 = 1;
				else		DebugSay(3,"RIGHT SHOULDER BLOCKED")
						Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
						zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
				end
			end
		else	DebugSay(3,"Projectile Bouce")
			Sound = zombie:getEmitter():playSound(getBounceSound(projectile))
			zombie:getCurrentSquare():AddWorldInventoryItem(projectile, 0.0, 0.0, 0.0)
		end
	end
end
]]










--[[	FIRST ATTEMPT FOR REFERENCE... NOT USED
------------------------------------------------------------------
--  DYNAMIC HITCHANCE CALCULATION USING SPECS IN WEAPON SCRIPT	--
------------------------------------------------------------------
local function ReCalculateHitChance(attacker, weapon)
	local Radius	= 0
	local Zoom	= 0
	local Stock	= 0
	local Spread	= 0
	local Recoil	= 0
	local Grip	= 0
	local Mass	= weapon:getWeight()

	if weapon:getModData().SightRadius ~= nil then
		Radius = weapon:getModData().SightRadius
	end
	if weapon:getModData().Magnification ~= nil then
		Zoom = weapon:getModData().Magnification
	end
	if weapon:getModData().StockBonus ~= nil then
		Stock = weapon:getModData().StockBonus
	end
	if weapon:getModData().SpreadBonus ~= nil then
		Spread = weapon:getModData().SpreadBonus
	end
	if weapon:getModData().CartridgeRecoil ~= nil then
		Recoil = weapon:getModData().CartridgeRecoil
	end
	if weapon:getModData().GripStability ~= nil then
		Grip = weapon:getModData().GripStability
	end

	local BaseHitChance = (15 + Radius + Zoom + Stock + Spread - (Recoil - (Mass * Grip))) * 1.5

	---------- TEST REVERSE MOVE AIM TIME PENALTY TO CALCULATE DIFFERENTLY -----------
	local Moving	= attacker:getBeenMovingFor()
	local AimTime	= weapon:getAimingTime()
	local AimLevel	= attacker:getPerkLevel(Perks.Aiming)
	local AimEffect	= weapon:getAimingPerkHitChanceModifier()

	if weapon:isRanged() and Moving > (AimTime + AimLevel) then
		BaseHitChance = BaseHitChance + (Moving - (AimTime + AimLevel))
	end

	----------- RE-APPLY NEW AIM TIME MOVEMENT PENALTY ---------------------
	if weapon:isRanged() and Moving > (AimTime + AimLevel) then		-- LOW AIMTIME = EASILY DISTURBED
		BaseHitChance = BaseHitChance - (Moving - (AimTime + AimLevel) * (AimEffect*3)/AimLevel)	-- HIGH AIMTIME = 
	end
	weapon:setHitChance(BaseHitChance)		-- LEVEL PERK IS DONE IN JAVA EACH SHOT
end
]]


--[[
function SteamCheck(Player, Weapon)

	local players = getOnlinePlayers()
	if players ~= nil then
		for i = 0, players:size() - 1 do
			DebugSay(2,"Name - "..tostring(players:get(i):getUsername()))
		end
	end

--	local player	= Player
--	local id		= player:getSteamIDUser()
--	DebugSay(2,"ID - "..tostring(id))
end

-- Events.OnPlayerUpdate.Add(SteamCheck)
Events.OnWeaponSwing.Add(SteamCheck)
]]

--[[
--------------------------------------------------------------------------
--  ARSENAL[26] SHIELD DAMAGE CODE USING ON OnCharacterCollide EVENT	--
--------------------------------------------------------------------------
function A26_Collide(P0, P1)
	if(P0 ~= nil) and (P1 ~= nil) then
		if P0 == getSpecificPlayer(0) then
	--		DebugSay(2,"Player Bumped")
			local shield	= nil
			local inv		= P0:getInventory()
			local	items		= inv:getItems()
			local back		= false

			for i = 1, items:size()-1 do
				local item = items:get(i)
				if item ~= nil and (item:getCategory() == "Clothing") and (item:isEquipped() == true) then
					if item:hasTag("Shield") then
						shield = item
						if shield:getBodyLocation() == "Shield_Back" then
							back = true
						end
					end
				end
			end

			if shield ~= nil then
				local	sound = nil
				if shield:getModData().BlockSound ~= nil then
					sound = shield:getModData().BlockSound
				end
				local	condition = shield:getCondition()
				local	chance = shield:getConditionLowerChance()
				local	roll = ZombRand(chance)
				if	roll == 0 then
					shield:setCondition(condition - 1)
					DebugSay(2,"Contact - "..tostring(shield:getDisplayName().." ("..tostring(shield:getCondition())..")"))
				end

				if sound ~= nil then
					if back == true and isFacingAway(P1,P0) then
						P0:getEmitter():playSound(sound)
					elseif back == false and not isFacingAway(P1,P0) then
						P0:getEmitter():playSound(sound)
					end
				end
			end
		end
	end
end

Events.OnCharacterCollide.Add(A26_Collide)
-- Events.OnHitZombie.Add(A26_HitByZombie)
]]




--[[	JAVA
      if (weapon.getMinRangeRanged() > 0.0F)
      {
        if (dist < weapon.getMinRangeRanged()) {
          hitChance -= 50;
        }
      }
      else if ((dist < 1.5D) && (weapon.isRanged())) {
        hitChance += 15;
      }


      float armsPain = 0.0F;
      for (int x = BodyPartType.ToIndex(BodyPartType.Hand_L); x <= BodyPartType.ToIndex(BodyPartType.UpperArm_R); x++) {
        armsPain += ((BodyPart)owner.getBodyDamage().getBodyParts().get(x)).getPain();
      }
      if (armsPain > 0.0F) {
        hitChance = (int)(hitChance - armsPain / 10.0F);
      }
      if (hitChance <= 10) {
        hitChance = 10;
      }
      if ((hitChance > 100) || (!weapon.isRanged())) {
        hitChance = 100;
      }
]]
Events.OnNewGame.Add(function(player, square)

Seeds = {
    "farming.BroccoliBagSeed",
    "farming.CabbageBagSeed",
    "farming.CarrotBagSeed",
    "farming.PotatoBagSeed",
    "farming.RedRadishBagSeed",
    "farming.StrewberrieBagSeed",
    "farming.TomatoBagSeed"
}
PoliceGun = {
	"Base.Revolver",
	"Base.Revolver_Short",
	"Base.Pistol",
	"Base.Revolver_Long"
}
FarmerTools = {
    "Base.Shovel",
    "Base.Shovel2",
    "Base.GardenHoe",
    "Base.GardenFork"
}
Tackle = {
	"Base.FishingTackle",
	"Base.FishingTackle2",
	"Base.Worm",
	"Base.BaitFish"
}
Herbs = {
	"Base.BlackSage",
	"Base.Comfrey",
	"Base.CommonMallow",
	"Base.Ginseng",
	"Base.LemonGrass",
	"Base.Plantain",
	"Base.WildGarlic"
}
Maps = {
	"Base.MarchRidgeMap",
	"Base.MuldraughMap",
	"Base.RiversideMap",
	"Base.RosewoodMap",
	"Base.WestpointMap"
}
Glasses = {
	"Base.Glasses",
	"Base.Glasses2"
}
Male = {
	"Base.Wallet",
	"Base.Wallet3",
	"Base.Wallet4",
	"Base.DigitalWatch2",
	"Base.Earbuds",
	"Base.Cologne",
	"Base.Comb",
	"Base.CreditCard",
	"Base.CardDeck",
	"Base.Locket",
	"Base.Ring"
}
Female = {
	"Base.Wallet2",
	"Base.DigitalWatch2",
	"Base.Purse",
	"Base.Earrings",
	"Base.Earbuds",
	"Base.MakeupEyeshadow",
	"Base.MakeupFoundation",
	"Base.Comb",
	"Base.CreditCard",
	"Base.Lipstick",
	"Base.Locket",
	"Base.Necklacepearl",
	"Base.Perfume",
	"Base.Ring"
}
Lighter = {
	"Base.Lighter",
	"Base.Matches"
}
Pills = {
	"Base.Pills",
	"Base.PillsAntiDep",
	"Base.PillsBeta",
	"Base.PillsSleepingTablets",
	"Base.PillsVitamins",
	"Base.Antibiotics"
}

--Find location For Map
local 	MapX = player:getX();
local 	MapY = player:getY();
local	CellX = MapX / 300;
local	CellY = MapY / 300;
local	Location = 0;
-------------------------------------------------Muldraugh
		if CellX > 34 and CellX < 37 and CellY > 29 and CellY < 36 then
			Location = 1
		end
-------------------------------------------------Westpoint
		if CellX > 35 and CellX < 41 and CellY > 21 and CellY < 24 then
			Location = 2
		end
-------------------------------------------------Riverside
		if CellX > 19 and CellX < 22 and CellY > 16 and CellY < 20 then
			Location = 3
		end
-------------------------------------------------Rosewood
		if CellX > 26 and CellX < 28 and CellY > 37 and CellY < 40 then
			Location = 4
		end
-------------------------------------------------March Ridge
		if CellX > 32 and CellX < 35 and CellY > 42 and CellY < 44 then
			Location = 5
		end
---------------------------------------------------------	

function getRandomStringFromTable(table)
    local count = 0;
    for _ in pairs(table) do count = count + 1 end
    local randomstring = ZombRand(count)
    if randomstring == 0 then randomstring = 1 end
    return table[randomstring];
end

    local prof = player:getDescriptor():getProfession()
    
    if prof == "unemployed" then
        player:getInventory():AddItem("Radio.CDplayer")
        player:getInventory():AddItem("Base.VideoGame")
    end
    if prof == "fireofficer" then
        player:getInventory():AddItem("Base.Axe")
        player:getInventory():AddItem("Base.Extinguisher")
		player:getInventory():AddItem("Base.Hat_GasMask")
		player:getInventory():AddItem("Radio.WalkieTalkie4")
    end
    if prof == "policeofficer" then
		player:getInventory():AddItem("Base.HolsterSimple")
		player:getInventory():AddItem("Radio.WalkieTalkie4")
		player:getInventory():AddItem("Base.DoughnutFrosted")
		local policeGun = getRandomStringFromTable(PoliceGun)
		player:getInventory():AddItem(policeGun)
        if policeGun == "Base.Revolver" then
			player:getInventory():AddItem("Base.Bullets45Box")
		end
		if policeGun == "Base.Revolver_Short" then
			player:getInventory():AddItem("Base.Bullets38Box")
		end
		if policeGun == "Base.Revolver_Long" then
			player:getInventory():AddItem("Base.Bullets44Box")
		end
		if policeGun == "Base.Pistol" then
			player:getInventory():AddItem("Base.Bullets9mmBox")
			player:getInventory():AddItem("Base.9mmClip")
		end
    end
    if prof == "parkranger" then
        player:getInventory():AddItem("Base.HuntingKnife")
        player:getInventory():AddItem("Base.HandAxe")
        player:getInventory():AddItem("camping.CampingTentKit")
		player:getInventory():AddItem("Radio.WalkieTalkie4")
		player:getInventory():AddItem("Base.TrapBox")
    end
    if prof == "constructionworker" then
        player:getInventory():AddItem("Base.PickAxe")
		player:getInventory():AddItem("Base.Hammer")
		player:getInventory():AddItem("Base.NailsBox")
    end
    if prof == "securityguard" then
        player:getInventory():AddItem("Base.Nightstick")
        player:getInventory():AddItem("Base.HandTorch")
		player:getInventory():AddItem("Radio.WalkieTalkie4")
    end
    if prof == "carpenter" then
        player:getInventory():AddItem("Base.Hammer")
		player:getInventory():AddItem("Base.Screwdriver")
        player:getInventory():AddItem("Base.Saw")
        player:getInventory():AddItem("Base.NailsBox")
    end
    if prof == "burglar" then
		player:getInventory():AddItem("Base.Bag_DuffelBag")
        player:getInventory():AddItem("Base.Crowbar")
        player:getInventory():AddItem("Base.Torch")
		player:getInventory():AddItems("Base.Paperclip", 5)
		player:getInventory():AddItem("Base.Hat_BalaclavaFull")
    end
    if prof == "chef" then
        player:getInventory():AddItem("Base.KitchenKnife")
        player:getInventory():AddItem("Base.Pan")
		player:getInventory():AddItem("Base.Pot")
		player:getInventory():AddItem("Base.Bowl")
		player:getInventory():AddItem("Base.BakingPan")
		player:getInventory():AddItem("Base.RoastingPan")
		player:getInventory():AddItem("Base.Sandwich")
    end
    if prof == "repairman" then
        player:getInventory():AddItem("Base.PipeWrench")
		player:getInventory():AddItem("Base.Screwdriver")
        player:getInventory():AddItems("Base.DuctTape", 2)
		player:getInventory():AddItem("Base.Bag_DuffelBag")
    end
    if prof == "farmer" then
        player:getInventory():AddItem("farming.HandShovel")
        player:getInventory():AddItem(getRandomStringFromTable(FarmerTools))
        player:getInventory():AddItem("Base.EmptySandbag")
        local bag = player:getInventory():AddItem("Base.SeedBag")
        bag:getInventory():AddItem(getRandomStringFromTable(Seeds))
        bag:getInventory():AddItem(getRandomStringFromTable(Seeds))
    end
    if prof == "fisherman" then
        player:getInventory():AddItem("Base.FishingRod")
        player:getInventory():AddItems("Base.FishingLine", 2)
        player:getInventory():AddItem("Base.Paperclip")
        player:getInventory():AddItem(getRandomStringFromTable(Tackle))
        player:getInventory():AddItem(getRandomStringFromTable(Tackle))
    end
    if prof == "doctor" then
        player:getInventory():AddItem("Base.Scalpel")
        player:getInventory():AddItem("Base.Tweezers")
		player:getInventory():AddItem("Base.Hat_SurgicalMask_Blue")
        player:getInventory():AddItem(getRandomStringFromTable(Pills))
        player:getInventory():AddItem(getRandomStringFromTable(Pills))
        player:getInventory():AddItem(getRandomStringFromTable(Pills))
        player:getInventory():AddItems("Base.Bandage", 3)
		player:getInventory():AddItem("Base.SutureNeedle")
		player:getInventory():AddItem("Base.SutureNeedleHolder")
		player:getInventory():AddItem("Base.Disinfectant")
    end
    if prof == "veteran" then
		player:getInventory():AddItem("Base.HolsterSimple")
        player:getInventory():AddItem("Base.Pistol2")
		player:getInventory():AddItem("Base.45Clip")
        player:getInventory():AddItems("Base.Bullets45Box", 3)
    end
    if prof == "nurse" then
        player:getInventory():AddItem("Base.Pills")
        player:getInventory():AddItem("Base.PillsAntiDep")
        player:getInventory():AddItem("Base.PillsBeta")
        player:getInventory():AddItem("Base.PillsSleepingTablets")
        player:getInventory():AddItem("Base.PillsVitamins")
        player:getInventory():AddItem("Base.Antibiotics")
		player:getInventory():AddItem("Base.Disinfectant")
		player:getInventory():AddItem("Base.Hat_SurgicalMask_Green")
    end
    if prof == "lumberjack" then
        player:getInventory():AddItem("Base.WoodAxe")
        player:getInventory():AddItem("Base.Saw")
    end
    if prof == "fitnessInstructor" then
		local bellBag = player:getInventory():AddItem("Base.Bag_DuffelBag")
        bellBag:getInventory():AddItem("Base.BarBell")
		bellBag:getInventory():AddItems("Base.DumbBell", 2)
    end
    if prof == "burgerflipper" then
        player:getInventory():AddItem("Base.GridlePan")
		player:getInventory():AddItem("Base.KitchenKnife")
        player:getInventory():AddItems("Base.BurgerRecipe", 3)
    end
    if prof == "electrician" then
        player:getInventory():AddItem("Base.Screwdriver")
        player:getInventory():AddItem("Radio.ElectricWire")
		player:getInventory():AddItem("Base.Battery")
        player:getInventory():AddItems("Base.ElectronicsScrap", 4)
    end
    if prof == "engineer" then
        player:getInventory():AddItems("Base.Sparklers", 3)
        player:getInventory():AddItem("Base.Aluminum")
		player:getInventory():AddItem("Base.Coldpack")
		player:getInventory():AddItem("Base.GunPowder")
		player:getInventory():AddItem("Radio.WalkieTalkieMakeShift")
    end
    if prof == "metalworker" then
        player:getInventory():AddItem("Base.BlowTorch");
		player:getInventory():AddItem("Base.WeldingMask");
		player:getInventory():AddItems("Base.WeldingRods", 4);
    end
    if prof == "mechanics" then
        player:getInventory():AddItem("Base.Wrench");
		player:getInventory():AddItem("Base.Screwdriver");
		player:getInventory():AddItem("Base.Jack");
		player:getInventory():AddItem("Base.LugWrench");
    end
    --Trait Items
    if player:HasTrait("Athletic") then
    	player:getInventory():AddItem("Base.WaterBottleFull");
    end
	if player:HasTrait("Tailor") then
    	local sewkit = player:getInventory():AddItem("Base.SewingKit");
		sewkit:getInventory():AddItem("Base.Needle");
		sewkit:getInventory():AddItems("Base.Thread", 5);
    end
    if player:HasTrait("Fit") then
    	player:getInventory():AddItem("Base.WaterBottleFull");
    end
    if player:HasTrait("NeedsLessSleep") then
    	player:getInventory():AddItem("Base.PillsSleepingTablets");
    end
    if player:HasTrait("Mechanics") then
    	if player:getInventory():getNumberOfItem("Base.Wrench") == 0 then
    		player:getInventory():AddItem("Base.Wrench");
    	end
    end
    if player:HasTrait("Fishing") then
    	if player:getInventory():getNumberOfItem("Base.FishingRod") == 0 then
    		player:getInventory():AddItem("Base.FishingRod");
    	end
    	player:getInventory():AddItem(getRandomStringFromTable(Tackle))
    	player:getInventory():AddItem(getRandomStringFromTable(Tackle))
    end
    if player:HasTrait("BaseballPlayer") then
    	player:getInventory():AddItem("Base.BaseballBat");
    	player:getInventory():AddItem("Base.Baseball")
    end
    if player:HasTrait("FirstAid") then
    	local kit = player:getInventory():AddItem("Base.FirstAidKit");
    	kit:getInventory():AddItem("Base.AlcoholWipes")
    	kit:getInventory():AddItem("Base.Antibiotics")
    	kit:getInventory():AddItem("Base.Bandage")
    	kit:getInventory():AddItem("Base.Bandaid")
    	kit:getInventory():AddItem("Base.Disinfectant")
    	kit:getInventory():AddItem("Base.Pills")
    	kit:getInventory():AddItem("Base.SutureNeedle")
    	kit:getInventory():AddItem("Base.Tweezers")
    end
    if player:HasTrait("Gardener") then
    	if player:getInventory():getNumberOfItem("farming.HandShovel") == 0 then
    		player:getInventory():AddItem("farming.HandShovel");
    	end
    	player:getInventory():AddItem(getRandomStringFromTable(Seeds))
    end
    if player:HasTrait("Handy") then
    	if player:getInventory():getNumberOfItem("Base.Hammer") == 0 then
    		player:getInventory():AddItem("Base.Hammer");
    	end
    	player:getInventory():AddItems("Base.Nails", 4)
    end
    if player:HasTrait("Herbalist") then
    	player:getInventory():AddItem("Base.MortarPestle");
    	player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    	player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    	player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    end
    if player:HasTrait("Hiker") then
    	if player:getInventory():getNumberOfItem("Base.Bag_DuffelBag") == 1 then
    		player:getInventory():RemoveOneOf("Base.Bag_DuffelBag")
    	end
    	player:getInventory():AddItem("Base.Bag_NormalHikingBag");
    	if Location == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Maps))
    	end
    	if Location == 1 then
    		player:getInventory():AddItem("Base.MuldraughMap");
    	end
    	if Location == 2 then
    		player:getInventory():AddItem("Base.WestpointMap");
    	end
    	if Location == 3 then
    		player:getInventory():AddItem("Base.RiversideMap");
    	end
    	if Location == 4 then
    		player:getInventory():AddItem("Base.RosewoodMap");
    	end
    	if Location == 5 then
    		player:getInventory():AddItem("Base.MarchRidgeMap");
    	end
    end
    if player:HasTrait("Hunter") then
    	if player:getInventory():getNumberOfItem("Base.HuntingKnife") == 0 then
    		player:getInventory():AddItem("Base.HuntingKnife");
    	end
    end
    if player:HasTrait("Cowardly") then
    	player:getInventory():AddItem("Base.PillsBeta");
    end
    if player:HasTrait("HighThirst") then
    	player:getInventory():AddItem("Base.WaterBottleEmpty");
    end
    if player:HasTrait("NeedsMoreSleep") then
    	player:getInventory():AddItem("Base.PillsVitamins");
    end
    if player:HasTrait("Insomniac") then
    	player:getInventory():AddItem("Base.PillsSleepingTablets");
    end
    if player:HasTrait("Smoker") then
    	player:getInventory():AddItem("Base.Cigarettes");
    	player:getInventory():AddItem(getRandomStringFromTable(Lighter));
    end
    if player:HasTrait("Thinskinned") then
    	player:getInventory():AddItems("Base.Bandaid", 4);
    end
    --Gender Items
    if player:isFemale() then
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    else
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    end
end)
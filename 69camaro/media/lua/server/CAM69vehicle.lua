--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

CAM69 = {
	parts = {
		FrontBumperSS = {
			CAM69FrontBumper = {
				FrontBumper0 = "69camaroFrontBumper0",
				FrontBumper1 = "69camaroFrontBumper1",
				FrontBumperA = "69camaroFrontBumperA",
				FrontBumperB = "69camaroFrontBumperB",
			},
			default = "first",
		},
		FrontBumperRS = {
			CAM69FrontBumper = {
				FrontBumper1 = "69camaroFrontBumper1",
				FrontBumper0 = "69camaroFrontBumper0",
				FrontBumperA = "69camaroFrontBumperA",
				FrontBumperB = "69camaroFrontBumperB",
			},
			default = "first",
		},
		WindshieldArmor = {
			CAM69WindshieldArmor = {
				CAM69winda = "69camaroWindshieldArmor",
			},
		},
		WindowLeftArmor = {
			CAM69WindowLeftArmor = {
				CAM69leftwindowa = "69camaroWindowArmor",
			},
		},
		WindowRightArmor = {
			CAM69WindowRightArmor = {
				CAM69rightwindowa = "69camaroWindowArmor",
			},
		},
		
		WindshieldRearArmor = {
			CAM69WindshieldRearArmor = {
				CAM69windra = "69camaroWindshieldRearArmor",
			},
		},
		RearBumper = {
			CAM69RearBumper = {
				RearBumper0 = "69camaroRearBumper0",
				RearBumperA = "69camaroRearBumperA",
				RearBumperB = "69camaroRearBumperB",
			},
			default = "first",
		},
		Spoiler = {
			CAM69Spoiler = {
				spoiler0 = "69camaroSpoiler0",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		SpareTire = {
			CAM69SpareTire = {
				CAM69SpareTire0 = "CamaroSStire3",
				CAM69SpareTire1 = "CUDAtire3",
				CAM69SpareTire2 = "DodgeRTtire3",
			},
			default = "trve_random",
			noPartChance = 25,
		},
	},
};

KI5:createVehicleConfig(CAM69);
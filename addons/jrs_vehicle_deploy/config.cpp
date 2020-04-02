class CfgPatches {
	class JRS_Vehicle_Deploy {
		name = "Vehicle deploy framework";
		description = "An open source and free use framework to deploy objects from vehicles";
		author = "JoyRide Soft";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.81;
		requiredAddons[] = { "A3_Weapons_F" };
		version = "0.0.1";
	};
};

class JRS_UserActions {
	class Vehicle_Deploy {
		class Camp_Deploy {
			priority = 0;
			showWindow = "false";
			displayText = "Deploy the camp";
			selection = "";
			radius = 5;
		};
		class Camp_Pack : Camp_Deploy {
			displayText = "Pack the camp";
		};
	};
};

class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	class JRS_CampItem : ItemCore {
		scope = 2;
		_generalMacro = "JRS_CampItem";
		displayName = "Vehicle's object to deploy";
		class ItemInfo : InventoryItem_Base_F {
			// scope = 2;
			mass = 50;
			type = 301;
		};
		picture = "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_b_assaultpack_cbr_ca.paa";
	};
};

#include "config\CfgFunctions.hpp"

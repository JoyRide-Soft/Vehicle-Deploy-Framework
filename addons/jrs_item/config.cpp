class CfgPatches {
	class JRS_Item {
		name = "Items for JRS_Vehicle_Deploy framework";
		requiredVersion = 1.0;
		requiredAddons[] = { "A3_Weapons_F" };
		units[] = { };
		weapons[] = { "JRS_CampItem" };
		version = "0.0.1";
		author = "JoyRide Software";
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

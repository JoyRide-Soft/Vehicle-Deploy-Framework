class CfgPatches {
    class JRS_Vehicle_Deploy {
		name = "Vehicle deploy framework";
		description = "An open source and free use framework to deploy objects from vehicles";
		author = "JoyRide Scripting";
		units[] = {};
		weapons = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class JRS {
		file = "\JRS_vehicle_deploy\functions";
		class Vehicle {
			class deployObjects { };
		};
		class Utils {
			class createObject { };
		};
	};
};

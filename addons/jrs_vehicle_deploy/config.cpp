class CfgPatches {
	class JRS_Vehicle_Deploy {
		name = "Vehicle deploy framework";
		description = "An open source and free use framework to deploy objects from vehicles";
		author = "JoyRide Soft";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.81;
		requiredAddons[] = {};
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

#include "config\CfgFunctions.hpp"

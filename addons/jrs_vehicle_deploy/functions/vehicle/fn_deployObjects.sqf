/**
 * _vehicle call TFC_fnc_createTents;
 *
 * _vehcle (Object): The vehicle reference to create the objects
 * 
 */

params ["_vehicle"];

private ["_deployed", "_camp", "_items"];
_deployed = _vehicle getVariable "JRS_Camp_DeployState";
_items = _vehicle getVariable "JRS_config";

// Only execute if items are defined in the « JRS_DeployItems » class.
if (count _items > 0) then {
	switch (_deployed) do {
		case 0: {
			systemChat "Deploying Camp";

			// Remove CampItem from vehicle's inventory
			private _cargo = itemCargo _vehicle;
			_cargo deleteAt (_cargo find "JRS_CampItem");
			clearItemCargo _vehicle;
			{
				_vehicle addItemCargo [_x, 1];
			} forEach _cargo;

			// Set « In progress » state.
			_vehicle setVariable ["JRS_Camp_DeployState", 0.5];

			_camp = [];

			// Create an object of a type, position and orientation specified in each classes under the JRS_DeployItem class.
			{
				private ["_type", "_spawnPos", "_heading", "_object"];
				sleep getNumber (_x >> "deployTime");
				_spawnPos = _vehicle modelToWorldVisual getArray (_x >> "position");
				_heading = direction _vehicle + getNumber (_x >> "direction");
				_type = getText (_x >> "type");
				_object = [_type, _heading, _spawnPos] call JRS_fnc_createObject;
				_camp pushBack [getNumber (_x >> "packTime"), _object];
			} forEach _items;

			// Add a reference of every object created of deletion.
			_vehicle setVariable ["JRS_Camp", _camp, true];
			// Set « Deployed » state.
			_vehicle setVariable ["JRS_Camp_DeployState", 1, true];

			systemChat "Camp Deployed";
		};
		case 1: {
			systemChat "Removing Camp";

			_camp = _vehicle getVariable "JRS_Camp";

			// Check if the objects were created.
			if (count _camp < 1) then { systemChat "Something went wrong :("; };
			// Set « In progress » state.
			_vehicle setVariable ["JRS_Camp_DeployState", 0.5];

			// Delete every object deployed.
			{
				sleep (_x select 0);
				deleteVehicle (_x select 1);
			} forEach _camp;

			// Set the « Packed » state.
			_vehicle setVariable ["JRS_Camp_DeployState", 0];

			// Add CampItem to vehicle's inventory.
			_vehicle addItemCargo ["JRS_CampItem", 1];

			systemChat "Camp Removed";
		};
		default { };
	};
};

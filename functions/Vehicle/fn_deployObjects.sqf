/**
 * _vehicle call TFC_fnc_createTents;
 *
 * _vehcle (Object): The vehicle reference to create the objects
 * 
 */

params ["_vehicle"];

private ["_deployed", "_camp", "_items"];
_deployed = _vehicle getVariable ["TFC_Camp_DeployState", 0];
_vehicle setVariable ["TFC_Camp_DeployState", _deployed, true];

if (_deployed == 0) then {
	systemChat "Deploying Camp";

	// Set 
	_vehicle setVariable ["TFC_Camp_DeployState", 0.5];

	_camp = [];
	_items = "true" configClasses (configFile >> "CfgVehicles" >> typeOf _vehicle >> "TFC_DeployItems");
	{
		private ["_type", "_spawnPos", "_heading", "_object"];
		sleep 2;
		_spawnPos = _vehicle modelToWorldVisual getArray (_x >> "position");
		_heading = direction _vehicle + getNumber (_x >> "direction");
		_type = getText (_x >> "type");
		_object = [_type, _heading, _spawnPos] call TFC_fnc_createObject;
		_camp pushBack _object;
	} forEach _items;
	
	_vehicle setVariable ["TFC_Camp", _camp, true];
	_vehicle setVariable ["TFC_Camp_Deployed", 1, true];
	systemChat "Camp Deployed";
} else if (deployed == 1) {
	systemChat "Removing Camp";
	if (count (_vehicle getVariable "TFC_Camp") < 1) then { systemChat "Something went wrong :("; };
	_vehicle setVariable ["TFC_Camp_DeployState", 0.5];

	_camp = _vehicle getVariable "TFC_Camp";
	{
		sleep 2;
		deleteVehicle _x;
	} forEach _camp;
	_vehicle setVariable ["TFC_Camp_DeployState", 0];
	systemChat "Camp Removed";
};

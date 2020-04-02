/**
	[_vehicle] call JRS_fnc_initVehicle
 */

params ["_vehicle"];

// Set the camp variables.
_vehicle setVariable ["JRS_Camp", [], true];
_vehicle setVariable ["JRS_Camp_DeployState", 0, true];


// Get the config for the action.
private ["_deployAction", "_packAction"];
_deployAction = [
	configFile >> "JRS_UserActions" >> "Vehicle_Deploy" >> "Camp_Deploy",
	configFile >> "CfgVehicles" >> typeOf _vehicle >> "JRS_UserActions" >> "Vehicle_Deploy" >> "Camp_Deploy"
];
_packAction = [
	configFile >> "JRS_UserActions" >> "Vehicle_Deploy" >> "Camp_Pack",
	configFile >> "CfgVehicles" >> typeOf _vehicle >> "JRS_UserActions" >> "Vehicle_Deploy" >> "Camp_Pack"
];

// Get the action's variables.
private ["_priority", "_showWindow", "_displayText", "_selection", "_radius"];
{
	private ["_pri", "_sho", "_dis", "_sel", "_rad"];
	_pri = if (isNumber (_x >> "priority")) then { getNumber (_x >> "priority") } else { nil };
	_sho = if (isText (_x >> "showWindow")) then {
		switch (getText (_x >> "showWindow")) do {
			case "true": { true };
			case "false";
			default { false };
		}
	} else { nil };
	_dis = if (isText (_x >> "displayText")) then { getText (_x >> "displayText") } else { nil };
	_sel = if (isText (_x >> "selection")) then { getText (_x >> "selection") } else { nil };
	_rad = if (isNumber (_x >> "radius")) then { getNumber (_x >> "radius") } else { nil };
	if (!(isNil "_pri")) then { _priority = _pri; };
	if (!(isNil "_sho")) then { _showWindow = _sho; };
	if (!(isNil "_dis")) then { _displayText = _dis; };
	if (!(isNil "_sel")) then { _selection = _sel; };
	if (!(isNil "_rad")) then { _radius = _rad; };
} forEach _deployAction;
_deploy = _vehicle addAction [_displayText, "(_this select 0) call JRS_fnc_deployObjects", nil, _priority, _showWindow, true, "", "_target getVariable 'JRS_Camp_DeployState' == 0 && 'JRS_CampItem' in itemCargo _target", _radius, false, _selection];

{
	private ["_pri", "_sho", "_dis", "_sel", "_rad"];
	_pri = if (isNumber (_x >> "priority")) then { getNumber (_x >> "priority") } else { nil };
	_sho = if (isText (_x >> "showWindow")) then {
		switch (getText (_x >> "showWindow")) do {
			case "true": { true };
			case "false";
			default { false };
		}
	} else { nil };
	_dis = if (isText (_x >> "displayText")) then { getText (_x >> "displayText") } else { nil };
	_sel = if (isText (_x >> "selection")) then { getText (_x >> "selection") } else { nil };
	_rad = if (isNumber (_x >> "radius")) then { getNumber (_x >> "radius") } else { nil };
	if (!(isNil "_pri")) then { _priority = _pri; };
	if (!(isNil "_sho")) then { _showWindow = _sho; };
	if (!(isNil "_dis")) then { _displayText = _dis; };
	if (!(isNil "_sel")) then { _selection = _sel; };
	if (!(isNil "_rad")) then { _radius = _rad; };
} forEach _packAction;
_pack = _vehicle addAction [_displayText, "(_this select 0) call JRS_fnc_deployObjects", nil, _priority, _showWindow, true, "", "_target getVariable 'JRS_Camp_DeployState' == 1", _radius, false, _selection];

_vehicle addItemCargo ["JRS_CampItem", 1];

private _objectsClasses = "true" configClasses (configFile >> "CfgVehicles" >> typeOf _vehicle >> "JRS_DeployItems");
_vehicle setVariable ["JRS_config", _objectsClasses, true];

/**
[_type, _heading, _position] call TFC_fnc_createObject;

Returns The created object
 */

params ["_type", "_heading", "_position"];


private _obj = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
_obj setDir _heading;

_obj;

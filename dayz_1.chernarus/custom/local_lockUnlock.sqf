private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
		_vehicle setVariable ["R3F_LOG_disabled",true,true];
		vehicle_handleDamage = {};
    vehicle_handleKilled = {};
    (vehicle player) allowDamage false;
    {_x allowdamage false } foreach (nearestObjects [player,['building','LandVehicle','Air'], 400]);
	} else {
		_vehicle setVehicleLock "UNLOCKED";
		_vehicle setVariable ["R3F_LOG_disabled",false,true];
		vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
    (vehicle player) allowDamage true;
	};
};
/* 	
	Written by OtterNas3
	January, 11, 2014
*/

private ["_itemsPlayer","_cntMax","_cnt","_targetKey","_targetKeyName","_actionArray","_targetVehicle","_targetVehicleID","_targetVehicleUID","_playerKeys","_targetVehicleKey","_playerKeysDisplayName","_targetVehicleKeyName","_targetVehicleKeyDB","_targetVehicleClassname","_targetVehiclePos","_targetVehicleDir","_itemKeyName"];

player removeAction s_player_copyToKey;
s_player_copyToKey = 0;

_actionArray = _this select 3;
_targetVehicle = _actionArray select 0;

_targetVehicleID = _targetVehicle getVariable ["ObjectID","0"];
_targetVehicleUID = _targetVehicle getVariable ["ObjectUID","0"];
if (_targetVehicleID == "0" && _targetVehicleUID == "0") exitWith {s_player_copyToKey = -1;};

_playerKeys = _actionArray select 1;
_targetVehicleKey = _actionArray select 2;
_playerKeysDisplayName = _actionArray select 3;
_targetVehicleKeyName = _actionArray select 4;
_itemKeyName = _actionArray select 5;
_targetVehicleKeyDB = _targetVehicle getVariable ["CharacterID","0"];
_targetVehicleClassname = typeOf _targetVehicle;
_targetVehiclePos = getPosATL _targetVehicle;
_targetVehicleDir = getDir _targetVehicle;

keyNameList = [];
for "_i" from 0 to (count _playerKeysDisplayName) -1 do {
	keyNameList set [(count keyNameList), _playerKeysDisplayName select _i];
};
keyNumberList = [];
for "_i" from 0 to (count _playerKeys) -1 do {
	keyNumberList set [(count keyNumberList), _playerKeys select _i];
};

keyNameSelect = "";
exitscript = true;
snext = false;

copyMenu =
{
	private ["_keyMenu"];
	_keyMenu = [["",true], ["Change Vehicle to Key:", [-1], "", -5, [["expression", ""]], "1", "0"]];
	for "_i" from (_this select 0) to (_this select 1) do
	{
		_keyArray = [format['%1', keyNameList select (_i)], [_i - (_this select 0) + 2], "", -5, [["expression", format ["keyNameSelect = keyNameList select %1; keyNumberSelect = keyNumberList select %1", _i]]], "1", "1"];
		_keyMenu set [_i + 2, _keyArray];
	};
	_keyMenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	if (count keyNameList > (_this select 1)) then
	{
		_keyMenu set [(_this select 1) + 3, ["Next", [12], "", -5, [["expression", "snext = true;"]], "1", "1"]];
	} else {
		_keyMenu set [(_this select 1) + 3, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	};
	_keyMenu set [(_this select 1) + 4, ["Exit", [13], "", -5, [["expression", "keyNameSelect = 'exitscript';"]], "1", "1"]];
	showCommandingMenu "#USER:_keyMenu";
};

_j = 0;
_max = 10;
if (_max > 9) then {_max = 10;};

while {keyNameSelect == ""} do {
	[_j, (_j + _max) min (count keyNameList)] call copyMenu;
	_j = _j + _max;
	waitUntil {keyNameSelect != "" || snext};
	snext = false;
};

if (keyNameSelect != "exitscript") then {
	_targetVehicle setVehicleLock "LOCKED";
	player playActionNow "Medic";
	[player, _itemKeyName, 1] call BIS_fnc_invRemove;
	(unitBackpack (vehicle player)) addWeaponCargoGlobal [_itemKeyName, 1];
	PVDZE_veh_Upgrade = [_targetVehicle,[_targetVehicleDir,_targetVehiclePos],_targetVehicleClassname,true,keyNumberSelect,player];
	publicVariableServer  "PVDZE_veh_Upgrade";

	systemChat (format["Changed Vehicle Key to %1", keyNameSelect]);
	systemChat (format["%1 has been moved to your Backpack", _targetVehicleKeyName]);
	systemChat (format["Please check Vehicle function with %1 before you throw away %2!", keyNameSelect, _targetVehicleKeyName]);
};


s_player_copyToKey = -1;

private ["_itemsPlayer","_temp_Keys","_temp_keysDisplayName","_temp_keysDisplayNameParse","_key_colors","_ownerKeyId","_carKey","_hasKey","_cTarget","_keyName","_carKeyName","_hasKeyKit","_targetVehicleKey"];
waitUntil {!isNil "dayz_animalCheck"};
while{true} do {
	sleep 3;
	if (speed player <= 1 && (vehicle player) == player && !isEngineOn cursorTarget && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship")) then {
		_cTarget = cursorTarget;
		_carKey = _cTarget getVariable ["CharacterID","0"];
		if (_carKey != "0") then {
			_itemsPlayer = items player;
			_hasKeyKit = "ItemKeyKit" in _itemsPlayer;
			_temp_keys = [];
			_temp_keysDisplayName = [];
			_temp_keysDisplayNameParse = [];
			_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
			{
				if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _key_colors) then {
					_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
					_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
					_temp_keysDisplayName set [count _temp_keysDisplayName,_keyName];
					_temp_keysDisplayNameParse set [_ownerKeyId,_keyName];
					_temp_keys set [count _temp_keys,str(_ownerKeyId)];
					_targetVehicleKey = _x;
				};
			} forEach _itemsPlayer;
			_hasKey = _carKey in _temp_keys;
			if (_hasKey && _hasKeyKit && (count _temp_keys) > 1 && (_ctarget distance player) <= 10) then {
				_carKeyName = (_temp_keysDisplayNameParse select (parseNumber _carKey));
				_temp_keys = _temp_keys - [_carKey];
                _temp_keysDisplayName = _temp_keysDisplayName - [_carKeyName];
				if (s_player_copyToKey < 0) then {
					s_player_copyToKey = player addAction [("<t color=""#0000FF"">" + ("Change Vehicle Key") + "</t>"),"scripts\VehicleKeyChanger.sqf",[_cTarget, _temp_keys, _carKey, _temp_keysDisplayName, _carKeyName, _targetVehicleKey],-1,false,false,"",""];
				};
			} else {
				player removeAction s_player_copyToKey;
				s_player_copyToKey = -1;
			};
		} else {
			player removeAction s_player_copyToKey;
			s_player_copyToKey = -1;
		};
	} else {
		player removeAction s_player_copyToKey;
		s_player_copyToKey = -1;
	};
};

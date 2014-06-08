#include "=BTC=_functions.sqf"
BTC_fast_rope_h = 15;
BTC_AI_fast_rope_on_deploy = 1;
BTC_roping_chopper = ["CH47_base_EP1","MV22_DZ","BAF_Merlin_HC3_D","Mi24_Base","Mi17_base","UH60_Base","UH1_Base","AW159_Lynx_BAF","UH1H_base"];
{
	_rope = _x addaction [("<t color=""#ED2744"">") + ("Deploy rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[],BTC_deploy_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"];
	_rope = _x addaction [("<t color=""#ED2744"">") + ("Cut rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
	_out  = _x addaction [("<t color=""#ED2744"">") + ("Fast rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[player],BTC_fast_rope],7,true,false,"","player in (assignedCargo _target) && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
} foreach (nearestObjects [player, BTC_roping_chopper, 50000]);
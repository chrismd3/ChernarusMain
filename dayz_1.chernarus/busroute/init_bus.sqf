	private ["_axeBusUnit","_firstRun","_dir","_axWPZ","_unitpos","_rndLOut","_ailoadout","_aiwep","_aiammo","_axeBus","_axeBusGroup","_axeBuspawnpos","_axeBusWPradius","_axeBusWPIndex","_axeBusFirstWayPoint","_axeBusWP","_axeBusRouteWaypoints","_axeBusDriver","_axeBusLogicGroup","_axeBusLogicCenter"];
	axeBusUnit = objNull;
_axeBusGroup = createGroup WEST;
_axeBuspawnpos = [4118.96,2603.22,0];
_unitpos = [4125.47,2601.65,0];
_axeBusWPradius = 2;//waypoint radius
	
	_axeBusDriver = objNull;
	
	//Set Sides
	_firstRun = _this select 0;
	if(_firstRun)then{
	createCenter RESISTANCE;
	RESISTANCE setFriend [WEST,1];//Like Survivors..
	RESISTANCE setFriend [EAST,0];//Don't like banditos !
	WEST setFriend [RESISTANCE,1];
	EAST setFriend [RESISTANCE,0];
	};
	
	//Load Bus Route
	_axWPZ=0;
	_axeBusWPIndex = 2;
	_axeBusFirstWayPoint = [4479.4,2459.74,_axWPZ];
	_axeBusWP = _axeBusGroup addWaypoint [_axeBusFirstWayPoint, _axeBusWPradius,_axeBusWPIndex];
	_axeBusWP setWaypointType "MOVE";
	_axeBusRouteWaypoints =  [[4817.51,2502.58,_axWPZ],[6714.84,2977.89,_axWPZ],[10441.3,2273.36,_axWPZ],[13088.3,3863.68,_axWPZ],[13412.6,6608.52,_axWPZ],[12106.8,9063.96,_axWPZ],[12476.3,12525.3,_axWPZ],[6268.52,7824.41,_axWPZ],[4130.15,11163.3,_axWPZ],[2665.94,5610.17,_axWPZ],[2017.94,2248.53,_axWPZ],[3560.56,2443.72,_axWPZ],[4115.76,2605.03,_axWPZ]];
	
	{
	_axeBusWPIndex=_axeBusWPIndex+1;
	_axeBusWP = _axeBusGroup addWaypoint [_x, _axeBusWPradius,_axeBusWPIndex];
	_axeBusWP setWaypointType "MOVE";
	_axeBusWP setWaypointTimeout [20, 30, 35];
	diag_log format ["BUS:Waypoint Added: %2 at %1",_x,_axeBusWP];
	} forEach _axeBusRouteWaypoints;
	
	//Create Loop Waypoint
	_axeBusWP = _axeBusGroup addWaypoint [_axeBusFirstWayPoint, _axeBusWPradius,_axeBusWPIndex+1];
	_axeBusWP setWaypointType "CYCLE";
	
	//Create Bus
	_dir = 244;
	_axeBus = "AAV" createVehicle _axeBuspawnpos;
	_axeBus setDir _dir;
    _axeBus setPos getPos _axeBus;
	_axeBus setVariable ["Sarge",1,true];
    _axeBus setVariable ["ObjectID", [_dir,getPos _axeBus] call dayz_objectUID2, true];
    _axeBus setFuel .8;
	_axeBus allowDammage false;
	//Uncomment for normal dayZ
	//dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_axeBus];
	//For Epoch - Comment out for normal dayZ | Credit to Flenz
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_axeBus];
	[_axeBus,"AAV"] spawn server_updateObject;
	
	//Make Permanent on some builds.. No Need really,
	//dayzSaveVehicle = _axeBus;
	//publicVariable "dayzSaveVehicle";
	
	_axeBus addEventHandler ["HandleDamage", {false}];	
	_axeBus setVariable ["axBusGroup",_axeBusGroup,true];
	_axeBus setVariable ["isAxeAIBus",1,true];
	
		//Create Driver and Drivers Mate
	for [{ x=1 },{ x <5 },{ x = x + 1; }] do {
		_rndLOut=floor(random 4);
		_ailoadout=
		switch (_rndLOut) do 
		{ 
		  case 0: {["MG36_camo","100Rnd_556x45_BetaCMag"]}; 
		  case 1: {["SCAR_L_STD_EGLM_RCO","100Rnd_556x45_BetaCMag","1Rnd_HE_M203","1Rnd_HE_M203"]}; 
		  case 2: {["AA12_PMC","20Rnd_B_AA12_HE"]}; 
		  case 3: {["M32_EP1","6Rnd_HE_M203","6Rnd_HE_M203"]};
		};
		
		"BAF_Soldier_L_DDPM" createUnit [_unitpos, _axeBusGroup, "_axeBusUnit=this;",0.6,"Private"];
		
		_axeBusUnit enableAI "TARGET";
		_axeBusUnit enableAI "AUTOTARGET";
		_axeBusUnit enableAI "MOVE";
		_axeBusUnit enableAI "ANIM";
		_axeBusUnit enableAI "FSM";
		_axeBusUnit allowDammage true;

		_axeBusUnit setCombatMode "WHITE";
		_axeBusUnit setBehaviour "AWARE";
		//clear default weapons / ammo
		removeAllWeapons _axeBusUnit;
		//add random selection
		_aiwep = _ailoadout select 0;
		_aiammo = _ailoadout select 1;
		_axeBusUnit addweapon _aiwep;
		_axeBusUnit addMagazine _aiammo;
		_axeBusUnit addMagazine _aiammo;
		_axeBusUnit addMagazine _aiammo;
		

		//set skills
		_axeBusUnit setSkill ["aimingAccuracy",1];
		_axeBusUnit setSkill ["aimingShake",1];
		_axeBusUnit setSkill ["aimingSpeed",1];
		_axeBusUnit setSkill ["endurance",1];
		_axeBusUnit setSkill ["spotDistance",0.6];
		_axeBusUnit setSkill ["spotTime",1];
		_axeBusUnit setSkill ["courage",1];
		_axeBusUnit setSkill ["reloadSpeed",1];
		_axeBusUnit setSkill ["commanding",1];
		_axeBusUnit setSkill ["general",1];
	    
      if(x==1)then{
        _axeBusUnit assignAsCommander _axeBus;
        _axeBusUnit moveInCommander _axeBus;
        _axeBusUnit addEventHandler ["HandleDamage", {false}];
        };
        if(x==2)then{
        _axeBusUnit assignAsCargo _axeBus;
        _axeBusUnit moveInCargo _axeBus;
        _axeBusUnit addEventHandler ["HandleDamage", {false}];
        };
        if(x==3)then{
        _axeBusUnit assignAsGunner _axeBus;
        _axeBusUnit moveInGunner _axeBus;
        _axeBusUnit addEventHandler ["HandleDamage", {false}];
        };
        if(x==4)then{
        _axeBusGroup selectLeader _axeBusUnit;
        _axeBusDriver = _axeBusUnit;
        _axeBusDriver addEventHandler ["HandleDamage", {false}];
        _axeBus addEventHandler ["killed", {[false] execVM "busroute\init_bus.sqf"}];//Shouldn't be required
        _axeBusUnit assignAsDriver _axeBus;
        _axeBusUnit moveInDriver _axeBus;
		sleep 8;
        };
    };
	
    _axeBus lockDriver true;
	_axeBus lockTurret [[0,0] true]; 
	_axeBus lockTurret [[0] true];
	
	
	waitUntil{!isNull _axeBus};
	//diag_log format ["AXLOG:BUS: Bus Spawned:%1 | Group:%2",_axeBus,_axeBusGroup];
	
	
	//Monitor Bus
	while {alive _axeBus} do {
	//diag_log format ["AXLOG:BUS: Tick:%1",time];
		//Fuel Bus
		if(fuel _axeBus < 0.2)then{
		_axeBus setFuel 0.8;
		//diag_log format ["AXLOG:BUS: Fuelling Bus:%1 | Group:%2",_axeBus,_axeBusGroup];
		};
		
		//Keep Bus Alive - Shouldn't be required.
		if(damage _axeBus>0.4)then{
		_axeBus setDamage 0;
		//diag_log format ["AXLOG:BUS: Repairing Bus:%1 | Group:%2",_axeBus,_axeBusGroup];
		};
		
		//Monitor Driver
		if((driver _axeBus != _axeBusDriver)||(driver _axeBus != _axeBusUnit))then{
		//diag_log format ["AXLOG:BUS: Driver Required:%1",driver _axeBus];
		units _axeBusGroup select 0 assignAsDriver _axeBus;
		units _axeBusGroup select 0 moveInDriver _axeBus;
		};

	sleep 3;
	};
	
	
	
	

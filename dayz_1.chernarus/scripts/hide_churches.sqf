private ["_pos","_radius","_church1","_church2"];
 
while {alive player} do {
 
_pos = position player;
_radius = 1500; // meters
 
_church1 = (_pos nearObjects ["Land_Church_02", _radius]);
_church2 = (_pos nearObjects ["Land_Church_02a", _radius]);
{
    _x hideObject true;
} forEach _church1,_church2; 
};
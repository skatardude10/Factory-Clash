private ["_unit","_shooter","_position","_directHit"];
_unit = _this select 0 select 0;
_shooter = _this select 0 select 1; 
//_position = _this select 3;
//_directHit = _this select 10;


if (isPlayer _shooter) then {
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sounds\hit.ogg";
	playSound3D [_soundToPlay, _shooter, false, getPosASL _shooter, 1000, 3.5, 3];
	_spr = "Sign_Sphere25cm_F" createVehicle [0,0,0]; 
	_spr setPosASL (_this select 0 select 3); 
	sleep 0.15;
	deleteVehicle _spr;
};



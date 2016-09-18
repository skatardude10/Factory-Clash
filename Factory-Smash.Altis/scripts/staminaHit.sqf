private ["_dmg","_newStamina","_unit"];
	_unit = _this select 0;
if (isPlayer _unit) exitWith {};
if !(alive _unit) exitWith {};
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sounds\grunt.ogg";
	_stamina = getStamina _unit; 
	_newStamina = _stamina - 25; 
	_unit setStamina _newStamina; 
	[_unit] spawn {_this select 0 forceWalk true; sleep random [1,4,5]; _this select 0 forceWalk false;};
	_dmg = Damage _unit;
	playSound3D [_soundToPlay, _unit, false, getPosASL _unit, (4 + (_dmg * 4)), (random [0.75,0.95,1.1]), 50];
while {alive _unit} do {
	_dmg = Damage _unit;
	if (alive _unit && _dmg <= 0.25) then {
	_exitWaitUntil = false;
	_unit setAnimSpeedCoef (1 - _dmg);
	if ((Damage _unit) > 0.1) then {_unit setCustomAimCoef (_dmg * 15);};
	 sleep 1.75;
	} 
	else {	
		_dmg = Damage _unit;
		_unit setAnimSpeedCoef 0.7;
		_unit setCustomAimCoef (_dmg * 45);
		sleep (random 1.75);
	};
};
waitUntil {!alive _unit};


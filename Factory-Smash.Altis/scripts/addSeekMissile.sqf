_unit = _this select 0;
if ((paramsArray select 21) isEqualTo 1) then {
	if (!isPlayer _unit) then {
		sleep (random [10,60,120]);
		if (!alive _unit) exitWith {};
		{_unit reveal [_x, 4]} forEach playableUnits;
		_enemy = _unit findNearestEnemy _unit; 
		_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		_soundToPlay = _soundPath + "sounds\lock.ogg";
		playSound3D [_soundToPlay, _unit, false, getPosASL _unit, 7, 1, 200];	
		sleep 4;
		if (!alive _unit) exitWith {};
		[_enemy, [(getpos _unit) select 0, (getpos _unit) select 1, (((getpos _unit) select 2) + 5)],"M_Titan_AP",175,[6265,16112,0]] execVM "scripts\seekMissile.sqf";
	} else {
	_unit addAction ["Launch Missile", {
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sounds\lock.ogg";
	playSound3D [_soundToPlay, player, false, getPosASL player, 7, 1, 200];	
	sleep 4;
	if (!alive player) exitWith {};
	player execVM "scripts\seekMissilePlayer.sqf";
	player removeAction (_this select 2);
	}];
	};
};

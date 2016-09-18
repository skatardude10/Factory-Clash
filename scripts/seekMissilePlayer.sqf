_unit = player;
{_unit reveal [_x, 4]} forEach playableUnits;
_lookPos = screenToWorld [0.5,0.5];
_enemy = _unit findNearestEnemy _lookPos; 
_startPos = getPos _unit; 

_primaryTarget = _enemy; //target for the missile
_missileStart = [(_startPos select 0),(_startPos select 1),((_startPos select 2) + 5)]; //position where te missile will be spawned
_missileType = "M_Titan_AP"; //type of the missile
_missileSpeed = 175; //speed of the missile
_defaultTargetPos = [6265,16112,0]; //default position where unguided missiles will fly [8340.718750,3074.914795,0];


if (isNull _primarytarget) exitWith {};
_flyup = 0;
_perSecondChecks = 15; //direction checks per second
_randomCount = 0;
_randomX = random [-25,0,25];
_randomY = random [-25,0,25];
_getPrimaryTarget = {if (typeName _primaryTarget == typename {}) then {call _primaryTarget} else {_primaryTarget}}; //code can be used for laser dots
_target = call _getPrimaryTarget;

_missile = _missileType createVehicle _missileStart;
_missile setPos _missileStart;

_guidedRandomly = FALSE;

//procedure for guiding the missile
_homeMissile = {
private ["_velocityX", "_velocityY", "_velocityZ", "_target"];
if (!(_guidedRandomly) && _missile distance _target > _missileSpeed * 1.5) then {
_guidedRandomly = TRUE;
_dispersion = (_missile distance _defaultTargetPos) / 20;
_dispersionMin = _dispersion / 10;
_target setPos [(_defaultTargetPos select 0) + _dispersionMin - (_dispersion / 2) + random _dispersion + random [-18,0,18], (_defaultTargetPos select 1) + _dispersionMin - (_dispersion / 2) + random _dispersion + random [-18,0,18], 0];
};
if (!(isNull (call _getPrimaryTarget))) then {_target = call _getPrimaryTarget; _defaultTargetPos = position _target; _guidedRandomly = FALSE};

//altering the direction, pitch and trajectory of the missile
if (_missile distance _target > (_missileSpeed / 20)) then {
_travelTime = (_target distance _missile) / _missileSpeed;
_steps = floor (_travelTime * _perSecondChecks);

_relDirHor = [_missile, _target] call BIS_fnc_DirTo;
_missile setDir _relDirHor;

_relDirVer = asin ((((getPosASL _missile) select 2) - ((getPosASL _target) select 2)) / (_target distance _missile));
_relDirVer = (_relDirVer * -1);
[_missile, _relDirVer, 1] call BIS_fnc_setPitchBank;

if (_randomCount > 40) then {
_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _travelTime + _randomX;
_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _travelTime + _randomY;
_randomCount = 0;
_randomX = random [-25,0,25];
_randomY = random [-25,0,25];
} else {
_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _travelTime + _randomX;
_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _travelTime + _randomY;
};


_flyup = _flyup + 1;
if (_flyup > 45) then {_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _missile) select 2)) / _travelTime;} else {_velocityZ = _missileSpeed;};


};

[_velocityX, _velocityY, _velocityZ]
};

call _homeMissile;

//fuel burning should illuminate the landscape
_fireLight = "#lightpoint" createVehicle position _missile;
_fireLight setLightBrightness 0.5;
_fireLight setLightAmbient [1.0, 1.0, 1.0];
_fireLight setLightColor [1.0, 1.0, 1.0];
_fireLight lightAttachObject [_missile, [0, -0.5, 0]];

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\launch.wav";
playSound3D [_soundToPlay, _missile, false, getPosASL _missile, 2, (random [0.8,1,1.2]), 1750];

//missile flying
while {alive _missile} do {
_velocityForCheck = call _homeMissile;
if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_missile setVelocity _velocityForCheck};
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlayFly = _soundPath + "sounds\rocketfly.ogg";
playSound3D [_soundToPlayFly, _missile, false, getPosASL _missile, 1, (random [0.3,0.7,1.4]), 350];
sleep (1 / _perSecondChecks)
};

deleteVehicle _fireLight;
//deleteVehicle _secondaryTarget;
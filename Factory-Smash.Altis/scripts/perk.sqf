private ["_unit","_stimAction"];
_unit = _this select 0;
_unit removeaction (_this select 2);
_unit playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon";
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\grunt.ogg";
playSound3D [_soundToPlay, _unit, false, getPosASL _unit, 2, (random [0.75,0.95,1.1]), 10];
[50] call BIS_fnc_bloodEffect;
_unit forceWalk false;
_unit allowSprint True;
_speedStart = getAnimSpeedCoef _unit;
_aimStart = getAnimAimPrecision _unit;
_unit setAnimSpeedCoef 1.11;
_unit setCustomAimCoef (_aimStart / 2);
_damageStart = Damage _unit;
_randomDamage = random [0.27,0.35,0.39];
if ((damage _unit) > 0.4) then {_unit setDamage _randomDamage;};
for "_i" from 1 to 12 do {
if (!alive _unit) exitWith {};
if ((getAnimSpeedCoef _unit) < 1.1) then { 
	_unit setAnimSpeedCoef ((getAnimSpeedCoef _unit) + 0.1);
	};
if ((getAnimAimPrecision _unit) > 2) then {
	_unit setCustomAimCoef ((getAnimAimPrecision _unit) -1);
	};
_unit setStamina ((getStamina _unit) + 1);
sleep 1;
};
if (!alive _unit) exitWith {};
_damageEnd = Damage _unit;
if (_randomDamage isEqualTo _damageEnd) then {_unit setDamage _damageStart;};
_unit setAnimSpeedCoef _speedStart;
_unit setCustomAimCoef _aimStart;
True
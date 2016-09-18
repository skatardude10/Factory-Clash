private ["_dmg","_newStamina","_unit"];
	_unit = _this select 0;
if (isPlayer _unit) exitWith {};
if !(alive _unit) exitWith {};
	_sounds = ["grunt.ogg","grunt2.ogg","grunt3.ogg","grunt4.ogg","grunt5.ogg","grunt6.ogg","grunt7.ogg"];
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
    _soundToPlay = _sounds select (floor (random (count _sounds)));
	_finalSound = _soundPath + "sounds\" + _soundToPlay;
	_stamina = getStamina _unit; 
	_newStamina = _stamina - 25; 
	_unit setStamina _newStamina; 
	[_unit] spawn {_this select 0 forceWalk true; sleep random [1,4,5]; _this select 0 forceWalk false;};
	_dmg = Damage _unit;
	_hitDmg = _this select 2;
	if ((_hitDmg > 0.2) && ((random 10) > 3.5)) then  
	{
		_reset = getAnimSpeedCoef _unit;
		_unit setAnimSpeedCoef 1.4;
		_hitAnims = ["AmovPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon","AmovPknlMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft","AmovPknlMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"];
		_hitAnimsUp = ["AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon","AadjPpneMstpSrasWrflDright_AmovPknlMstpSrasWrflDnon","AadjPpneMstpSrasWrflDleft_AmovPknlMstpSrasWrflDnon"];
		_randomAnim = _hitAnims select (floor (random (count _hitAnims)));
		_randomAnimUp = _hitAnimsUp select (floor (random (count _hitAnimsUp)));
		_unit playMoveNow _randomAnim;
		_unit playMove _randomAnimUp;
	};
	if ((random 10) > 4) then 
	{
		playSound3D [_finalSound, _unit, false, getPosASL _unit, (4 + (_dmg * 4)), (random [0.75,0.95,1.1]), 50];
	};
while {alive _unit} do {
	_dmg = Damage _unit;
	if (alive _unit && _dmg <= 0.25) then {
	_exitWaitUntil = false;
	if ((Damage _unit) > 0.1) then {_unit setCustomAimCoef (_dmg * 15);};
	 sleep 1.75;
	 _unit setAnimSpeedCoef (1 - _dmg);
	} 
	else {	
		_dmg = Damage _unit;
		sleep (random 1.75);
		_unit setAnimSpeedCoef 0.7;
		_unit setCustomAimCoef (_dmg * 45);
	};
};
waitUntil {!alive _unit};


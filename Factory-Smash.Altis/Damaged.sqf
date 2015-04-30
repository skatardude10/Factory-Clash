private ["_hndl","_hndl2","_hndl3","_dmg","_newFatigue","_unit"];
	_unit = _this select 0;
if !(isPlayer _unit) exitWith {};
if !(alive _unit) exitWith {};
	[100] call BIS_fnc_bloodEffect;
	call BIS_fnc_fatigueEffect;
	_newFatigue = ((getFatigue _unit) + 1 )  / 2;
	_unit setFatigue _newFatigue;
	//_hndl = ppEffectCreate ["dynamicBlur", 2];  
	_hndl2 = ppEffectCreate ["ColorCorrections", 200];    
	_hndl3 = ppEffectCreate ["ChromAberration", 100];
	//_hndl ppEffectEnable true;       
	_hndl2 ppEffectEnable true;     
	_hndl3 ppEffectEnable true;  
	_dmg = Damage _unit;
while {alive _unit} do {
	_dmg = Damage _unit;
	if (alive _unit && _dmg <= 0.26) then {
	_exitWaitUntil = false;
	_hndl2 ppEffectAdjust [1, (1 - (_dmg / 2)), 0, [(_dmg / 3.5),0,0,(_dmg / 4)], [0,0,0,1], [0,0,0,1]];      
	_hndl2 ppEffectCommit 1; 
	_hndl3 ppEffectCommit 1;
	_hndl3 ppEffectAdjust [(_dmg / (16 + (random 4))),(_dmg / (16 + (random 4))),true]; 
	 sleep 1.5;
	} 
	else {	
		_dmg = Damage _unit;
		addCamShake [(_dmg * 1.25), 3, (_dmg * (10 + (random 19)))];   
		_hndl2 ppEffectAdjust [1, (1 - (_dmg / 1.5)), 0, [(_dmg / 1.5),0,0,(((random _dmg) + (_dmg / 1.5)) / 2)], [0,0,0,1], [0,0,0,1]];      
		_hndl2 ppEffectCommit 1; 
		_hndl3 ppEffectCommit 1;
		_hndl3 ppEffectAdjust [(_dmg / (8 + (random 4))),(_dmg / (8 + (random 4))),true]; 
		sleep (random 1.5);
	};
};
waitUntil {!alive _unit};
//_hndl ppEffectEnable false;       
_hndl2 ppEffectEnable false;     
_hndl3 ppEffectEnable false;
//ppEffectDestroy _hndl;
ppEffectDestroy _hndl2;
ppEffectDestroy _hndl3;


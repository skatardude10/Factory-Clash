private ["_hndl1","_hndl2","_hndl3","_dmg","_newFatigue","_unit"];
	_unit = _this select 0;
if !(isPlayer _unit) exitWith {};
if !(alive _unit) exitWith {};
	[100] call BIS_fnc_bloodEffect;
	call BIS_fnc_fatigueEffect;
	_newFatigue = ((getFatigue _unit) + 1 )  / 2;
	_unit setFatigue _newFatigue;
	_hndl1 = ppEffectCreate ["RadialBlur", 100];  
	_hndl2 = ppEffectCreate ["ColorCorrections", 200];    
	_hndl3 = ppEffectCreate ["ChromAberration", 300];
	_hndl1 ppEffectEnable true;       
	_hndl2 ppEffectEnable true;     
	_hndl3 ppEffectEnable true;  
	_dmg = Damage _unit;
while {alive _unit} do {
	_dmg = Damage _unit;
	_pwr = ((_dmg ^ 3) * 0.3);
	_offsetsmall = (-((_dmg ^ 1.5) * 0.6 )  + 0.6);
	if (alive _unit && _dmg <= 0.25) then {
	_exitWaitUntil = false;
	_hndl1 ppEffectAdjust [_pwr,_pwr,_offsetsmall,_offsetsmall];      
	_hndl1 ppEffectCommit 1; 
	_hndl2 ppEffectAdjust [1, (1 - (_dmg / 2)), 0, [(_dmg / 3.5),0,0,(_dmg / 4)], [0,0,0,1], [0,0,0,1]];      
	_hndl2 ppEffectCommit 1; 
	_hndl3 ppEffectCommit 1;
	_hndl3 ppEffectAdjust [(_dmg / (16 + (random 4))),(_dmg / (16 + (random 4))),true]; 
	 sleep 1.5;
	} 
	else {	
		_dmg = Damage _unit;
		_offsetlarge = (-((_dmg ^ 0.2) * 1 )  + 0.96);
		if (_offsetlarge < 0) then {_offsetlarge = 0};
		addCamShake [(_dmg * 1.25), 3, (_dmg * (10 + (random 19)))];   
		_hndl1 ppEffectAdjust [_pwr,_pwr,_offsetlarge,_offsetlarge];       
		_hndl1 ppEffectCommit 1; 
		_hndl2 ppEffectAdjust [1, (1 - (_dmg / 1.5)), 0, [(_dmg / 1.5),0,0,(((random _dmg) + (_dmg / 1.5)) / 2)], [0,0,0,1], [0,0,0,1]];      
		_hndl2 ppEffectCommit 1; 
		_hndl3 ppEffectCommit 1;
		_hndl3 ppEffectAdjust [(_dmg / (8 + (random 4))),(_dmg / (8 + (random 4))),true]; 
		sleep (random 1.5);
	};
};
waitUntil {!alive _unit};
_hndl1 ppEffectEnable false;       
_hndl2 ppEffectEnable false;     
_hndl3 ppEffectEnable false;
ppEffectDestroy _hndl1;
ppEffectDestroy _hndl2;
ppEffectDestroy _hndl3;


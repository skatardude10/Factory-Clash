_JIPplayer = _this select 0;
if ((paramsArray select 6) == 1) then {nul = [] execVM "intro.sqf"};
if ((paramsArray select 14) == 1) then {_JIPplayer addEventHandler ["Hit", {0 = _this execVM "Damaged.sqf"}]};
_JIPplayer addeventhandler ["respawn","0 = _this execVM 'respawndirstart.sqf'"];
if ((paramsArray select 9) == 0) then {enableRadio false;};
if ((paramsArray select 11) == 0) then {deleteMarker "IEDMARKER";};

if ((paramsArray select 8) == 1) then {call compile preprocessFile "UI\HUD.sqf"; [] spawn ICE_HUD;};
if ((paramsArray select 7) == 1) then {nul = [] execVM "IntelLines.sqf"};
if ((paramsArray select 2) == 1) then {nul = [] execVM "playertracker.sqf"};

if ((paramsArray select 15) == 1) then 
	{
	_JIPplayer addEventHandler ["FiredNear",{
	_calcDist = (_this select 0) distance (_this select 1);
	if (_calcDist > 50) then {} else {
		_Distance = _this select 2;
		if (_Distance < 50) then {
		_Bullet = _this select 6;
		_Caliber = (configfile >> "CfgAmmo" >> _bullet >> "Hit") call BIS_fnc_getCfgData;
		if (_Caliber < 60) then 
			{
			_Caliber = _Caliber / 11;
			_Power = (1/(1+((1.5^-5)*_Distance)) * 2.5) * _Caliber; 
			addCamShake [_Power, ((_Power + 3) / 14), (20 / (_Caliber + 1))];
				if ((paramsArray select 16) == 1) then {
					[_Power,_Caliber,_Distance] spawn {
								_Power = _this select 0;
								_Distance = (_this select 2) + 1;
								_BlurPwr = (_Power / 2);
								_time = _power * 0.1;
								_pwr = ((-((((_Power - 4) ^ 3) * 0.05) / 5 ) + 0.25) / 10) / _Distance;
								_offsetsmall = (-((_Power * 1.5) * 0.07 )  + 0.6) / 2;
								_radialPower = [_pwr,_pwr,_offsetsmall,_offsetsmall]; 
								if (_Power > 0.5) then
								{
									_dBlur = ppEffectCreate ["DynamicBlur", 50];
									_dBlur2 = ppEffectCreate ["RadialBlur", 100]; 
									_dBlur ppeffectenable true;
									_dBlur2 ppeffectenable true;
									_dBlur ppeffectadjust [_BlurPwr];
									_dBlur2 ppeffectadjust [_radialPower];
									_dBlur ppeffectcommit 0;
									_dBlur2 ppeffectcommit 0;
									_dBlur ppeffectadjust [0];
									_dBlur2 ppeffectadjust [0, 0, 1, 1];
									_dBlur ppeffectcommit _time;
									_dBlur2 ppeffectcommit _time;
									sleep 0.5;
									ppEffectDestroy _dBlur;
									ppEffectDestroy _dBlur2;
								};
							};
						};
					};
				};
			};
		}];
	};

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
		/*_JIPplayer addEventHandler ["FiredNear",{
		_Distance = _this select 2;
		_Caliber = 1;
		_LargeCaliber = ["B_762x51_Ball","B_338_Ball","B_93x64_Ball","B_338_NM_Ball","B_127x54_Ball","B_762x54_Tracer_Green"];
		_SmallCaliber = ["B_45ACP_Ball","B_9x21_Ball"];
		if ((_this select 6) in _LargeCaliber) then {_Caliber = 1.25;} else {if ((_this select 6) in _SmallCaliber) then {_Caliber = 0.75;} else {_Caliber = 1;};};
		_Power = (1/(1+((1.5^-5)*_Distance)) * 2.5) * _Caliber; addCamShake [_power, 0.3, 10];
		//hint format ["Ammo Used: %1, %2",_this select 6, _this select 3];
	if ((paramsArray select 16) == 1) then {
		[_Power,_Caliber] spawn {
					_Power = _this select 0;
					_time = _power * 0.1;
					if (_Power > 0.5) then
					{
						//_blurStrength = (0.45 + (_caliber * 0.03)) * _Power;
						_dBlur = ppEffectCreate ["DynamicBlur", 50];
						_dBlur ppeffectenable true;
						_dBlur ppeffectadjust [_power];
						_dBlur ppeffectcommit 0;
						_dBlur ppeffectadjust [0];
						_dBlur ppeffectcommit _time;
						sleep 0.5;
						ppEffectDestroy _dBlur;
					};
				};
			};
		}];  */
		
	_JIPplayer addEventHandler ["FiredNear",{
	_Distance = _this select 2;
	_Bullet = _this select 6;
	_Caliber = (configfile >> "CfgAmmo" >> _bullet >> "Hit") call BIS_fnc_getCfgData;
	_Caliber = _Caliber / 13;
	_Power = (1/(1+((1.5^-5)*_Distance)) * 2.5) * _Caliber; 
	addCamShake [_Power, ((_Power + 3) / 14), (20 / (_Caliber + 1))];
	//hint format ["Power: %1\n Caliber: %2 \n Distance: %3",_Power,_Caliber,_Distance];
	if ((paramsArray select 16) == 1) then {
		[_Power,_Caliber] spawn {
					_Power = _this select 0;
					_time = _power * 0.1;
					if (_Power > 0.5) then
					{
						//_blurStrength = (0.45 + (_caliber * 0.03)) * _Power;
						_dBlur = ppEffectCreate ["DynamicBlur", 50];
						_dBlur ppeffectenable true;
						_dBlur ppeffectadjust [_power];
						_dBlur ppeffectcommit 0;
						_dBlur ppeffectadjust [0];
						_dBlur ppeffectcommit _time;
						sleep 0.5;
						ppEffectDestroy _dBlur;
					};
				};
			};
		}];
	};

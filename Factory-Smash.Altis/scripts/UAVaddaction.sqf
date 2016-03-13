_target = _this select 0;
if ((paramsArray select 18) == 1 && (!isPlayer _target)) then {0 = [_target] execVM "scripts\AIUAVBombs.sqf";} else {};
if (player == _target) then {
_target addAction ["Launch UAV", {player execVM "scripts\UAVplayer.sqf"; 
		player removeAction 0; 
		}
	];
} else {};
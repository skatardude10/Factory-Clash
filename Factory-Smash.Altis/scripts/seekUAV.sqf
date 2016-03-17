_uav = _this select 3 select 0;
_unit = _this select 3 select 1;
_unit removeaction (_this select 2);
[] call BIS_fnc_liveFeedTerminate;
{_uav reveal [_x, 4]} forEach playableUnits;
_enemy = _uav findNearestEnemy _uav; 
_enemyCompare = _enemy;
while {alive _uav} do {
	_uav setBehaviour "CARELESS";
	_uav setSpeedMode "FULL";
	{_uav reveal [_x, 4]} forEach playableUnits;
	_enemyCompare = _enemy;
	_enemy = _uav findNearestEnemy _uav; 
	if (_enemyCompare isEqualTo _enemy) then {} else {_enemyCompare = _enemy; [] call BIS_fnc_liveFeedTerminate; [_uav, _enemy, _unit, 2] execVM "scripts\fnc_livefeed_skat.sqf";};
	if (isNull _enemy) then {sleep 2;} else {
		_enemyPos = getPos _enemy;
		_uav lockCameraTo [_enemy, [0]];
		_uav doMove _enemyPos;
		_uav flyInHeight 10;
		_distEnemy = _uav distance2D _enemy;
		if (_distEnemy < 125) then {_uav flyInHeight 4; 
				if (_distEnemy < 15) then {
				_uav doMove _enemyPos; sleep 2;
				_uav land "LAND"; sleep 1;
				_bomb = "IEDLandBig_Remote_Ammo" createVehicle (getpos _uav); 
				_bomb setDamage 1;
				deletevehicle _uav;
				sleep 3; [] call BIS_fnc_liveFeedTerminate;
				} else {};
				} else {	
				if (!alive _uav) then {
				_bomb = "IEDLandBig_Remote_Ammo" createVehicle (getpos _uav); 
				_bomb setDamage 1;
				deletevehicle _uav; [] call BIS_fnc_liveFeedTerminate;
					} else {
				};
			};
		sleep 2;
	};
};	

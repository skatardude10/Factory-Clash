if (!isServer && (player != player)) then { waitUntil {player isEqualTo player}; waitUntil {time > 10}; };
_bb = _this;
if (player isEqualTo _bb) then {
    _color=switch (side player) do {case west: {"B_UAV_01_F"}; case east: {"O_UAV_01_F"}; case resistance: {"I_UAV_01_F"}; };
	_uav = createVehicle [_color, getPos _bb, [], 0, "FLY"];
	createVehicleCrew _uav;
	_uav flyInHeight 15;
	_uav addEventHandler ["HandleDamage",{damage (_this select 0)+((_this select 2)/10)}];
	[_uav, _bb, _bb, 2] execVM "scripts\fnc_livefeed_skat.sqf"; 
	_bb addAction ["Destroy UAV / Feed",{
						_uav = ((_this select 3) select 0);
						if (alive _uav) then {
							_bomb = "IEDLandSmall_Remote_Ammo" createVehicle getpos ((_this select 3) select 0); 
							_bomb setDamage 1;
							((_this select 3) select 1) removeAction 1;
							deletevehicle _uav;
							[] call BIS_fnc_liveFeedTerminate;
							} else {};
						}, [_uav,_bb]
					];
	_bb addAction ["UAV Bomb Nearest Enemy",{
						_uav = ((_this select 3) select 0);
						_player = ((_this select 3) select 1);
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
							if (_enemyCompare isEqualTo _enemy) then {} else {_enemyCompare = _enemy; [] call BIS_fnc_liveFeedTerminate; [_uav, _enemy, _player, 2] execVM "scripts\fnc_livefeed_skat.sqf";};
							if (isNull _enemy) then {sleep 2;} else {
								_enemyPos = getPos _enemy;
								_uav lockCameraTo [_enemy, [0]];
								_uav doMove _enemyPos;
								_uav flyInHeight 10;
								_distEnemy = _uav distance2D _enemy;
								if (_distEnemy < 85) then {_uav flyInHeight 4; 
															if (_distEnemy < 10) then {
															_uav doMove _enemyPos; sleep 4;
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
															} else {};
															};
									sleep 2;
								};
							};	
							((_this select 3) select 1) removeAction 1;
							((_this select 3) select 1) removeAction 2;
						}, [_uav,_bb]
					];
	while {alive _uav} do {sleep 5};
	if (!alive _uav) then {
	_bomb = "IEDLandBig_Remote_Ammo" createVehicle (getpos _uav); 
	_bomb setDamage 1;
	deletevehicle _uav; [] call BIS_fnc_liveFeedTerminate;
	} else {};
} else {};

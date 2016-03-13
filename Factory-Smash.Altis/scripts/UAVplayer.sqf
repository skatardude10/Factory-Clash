if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; };
_bb = _this;
if (player == _bb) then {

    _color=switch (side player) do {case west: {"B_UAV_01_F"}; case east: {"O_UAV_01_F"}; case resistance: {"I_UAV_01_F"}; };

	_uav = createVehicle [_color, getPos _bb, [], 0, "FLY"];
	_uav allowDamage false;
	_uav setCaptive true;
	createVehicleCrew _uav;
	_uav lockCameraTo [_bb, [0]];
	_uav flyInHeight 35;
	_wp = group _uav addWaypoint [position _bb, 0];
	_wp setWaypointType "LOITER";
	_wp setWaypointLoiterType "CIRCLE_L";
	_wp setWaypointLoiterRadius 35;
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
						{_uav reveal [_x, 4]} forEach playableUnits;
						while {alive _uav} do {
							_uav lockCameraTo [objNull, [0]];
							_enemy = _uav findNearestEnemy _uav; 
							if (isNull _enemy) then {sleep 2;} else {
								_enemyPos = getPos _enemy;
								_uav lockCameraTo [_enemy, [0]];
								_uav doMove _enemyPos;
								_uav flyInHeight 3;
								_distEnemy = _uav distance2D _enemy;
								if (_distEnemy < 10) then {_bomb = "IEDLandSmall_Remote_Ammo" createVehicle getpos ((_this select 3) select 0); 
															_bomb setDamage 1;
															deletevehicle _uav;
															[] call BIS_fnc_liveFeedTerminate;
															} else {};
									sleep 2;
								};
							};	
							((_this select 3) select 1) removeAction 2;
						}, [_uav,_bb]
					];
	while {alive _bb && alive _uav} do {_wp = group _uav addWaypoint [position _bb, 0]; sleep 15; if ((_uav distance2D _bb) > 100) then {_uav lockCameraTo [objNull,[0]];} else {sleep 5;} };
	if (alive _uav) then {
	_bomb = "IEDLandSmall_Remote_Ammo" createVehicle getpos _uav; 
	_bomb setDamage 1;
	deletevehicle _uav; [] call BIS_fnc_liveFeedTerminate;
	} else {};
} else {};

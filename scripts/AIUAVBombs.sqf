
		_target = _this select 0;
		waitUntil {alive _target};
		sleep random [30,55,120];
		if !(alive _target) exitWith {};
		_color = "B_UAV_01_F";
		_color=switch (side _target) do {case west: {"B_UAV_01_F"}; case east: {"O_UAV_01_F"}; case resistance: {"I_UAV_01_F"}; default {"B_UAV_01_F"}; };
		_uav = createVehicle [_color, [0,0,0], [], 0, "FLY"];
		_uav setPosATL [getPos _target select 0, getPos _target select 1, (getPos _target select 2) + 2];
		_uav addEventHandler ["HandleDamage",{damage (_this select 0)+((_this select 2)/10)}];
		createVehicleCrew _uav;
		_uav flyInHeight 10;
	while {alive _uav} do {
		{_uav reveal [_x, 4]} forEach playableUnits;
		_enemy = _uav findNearestEnemy _uav; 
		if (isNull _enemy) then {sleep 4;} else {
			for [{private _i = 0}, {_i < 70}, {_i = _i + 1}] do {
				{_uav reveal [_x, 4]} forEach playableUnits;
				_uav setBehaviour "CARELESS";
				_uav setSpeedMode "FULL";
				_enemy = _uav findNearestEnemy _uav; 
				_enemyPos = getPos _enemy;
				_uav lockCameraTo [_enemy, [0]];
				_uav doMove _enemyPos;
				_uav flyInHeight 10;
				_distEnemy = _uav distance2D _enemy;
				if (_distEnemy < 125) then {_uav flyInHeight 4; 
											if (_distEnemy < 15) then {_uav doMove _enemyPos; sleep 2; _uav land "LAND"; sleep 1; _bomb = "IEDLandBig_Remote_Ammo" createVehicle getpos _uav; 
											_bomb setDamage 1;
											deletevehicle _uav;} else {};
				} else {};
				if (!alive _uav) exitWith {_bomb = "IEDLandSmall_Remote_Ammo" createVehicle getpos _uav; 
											_bomb setDamage 1;
											deletevehicle _uav};
				sleep 4;
			};
		};
	};
	if (!alive _target || !alive _uav) then {
		_bomb = "IEDLandBig_Remote_Ammo" createVehicle getpos _uav; 
		_bomb setDamage 1;
		deletevehicle _uav;
	};



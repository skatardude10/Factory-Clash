if (!isServer && (player != player)) then { waitUntil {player isEqualTo player}; waitUntil {time > 10}; };
_unit = _this;
if (player isEqualTo _unit) then {
    _color=switch (side player) do {case west: {"B_uav_01_F"}; case east: {"O_uav_01_F"}; case resistance: {"I_uav_01_F"}; };
	_uav = createVehicle [_color, [0,0,0], [], 0, "FLY"];
	_uav setPosATL [getPos _unit select 0, getPos _unit select 1, (getPos _unit select 2) + 2];
	createVehicleCrew _uav;
	_uav flyInHeight 10;
	_uav addEventHandler ["HandleDamage",{damage (_this select 0)+((_this select 2)/10)}];
	[_uav, _unit, _unit, 2] execVM "scripts\fnc_livefeed_skat.sqf"; 
	_unit addAction ["Destroy UAV / Feed",{_this execVM "scripts\destroyUAV.sqf"}, [_uav,_unit]];
	_unit addAction ["UAV Bomb Nearest Enemy",{_this execVM "scripts\seekUAV.sqf"}, [_uav,_unit]];
	while {alive _uav} do {sleep 5};
	if (!alive _uav) then {
	_bomb = "IEDLandBig_Remote_Ammo" createVehicle (getpos _uav); 
	_bomb setDamage 1;
	deletevehicle _uav; [] call BIS_fnc_liveFeedTerminate;
	} else {};
} else {};

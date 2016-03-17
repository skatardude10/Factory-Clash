_uav = _this select 3 select 0;
_unit = _this select 3 select 1;
if (alive _uav) then {
	_bomb = "IEDLandSmall_Remote_Ammo" createVehicle getpos _uav;
	_bomb setDamage 1;
	_unit removeAction (_this select 2);
	deletevehicle _uav;
	[] call BIS_fnc_liveFeedTerminate;
} else {};

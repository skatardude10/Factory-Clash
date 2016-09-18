{
	if (_x in BoostGuyArray) then {
	if ((side _x) isEqualTo resistance) then {_x doMove (getMarkerPos "indfor-extract-marker"); _x setBehaviour "AWARE"; _x setSpeedMode "FULL"; _x allowFleeing 0; _x setskill ["courage",1]} else {
		if ((side _x) isEqualTo west ) then {_x doMove (getMarkerPos "blufor-extract-marker"); _x setBehaviour "AWARE"; _x setSpeedMode "FULL"; _x allowFleeing 0; _x setskill ["courage",1]} else {
			if ((side _x) isEqualTo east ) then {_x doMove (getMarkerPos "opfor-extract-marker"); _x setBehaviour "AWARE"; _x setSpeedMode "FULL"; _x allowFleeing 0; _x setskill ["courage",1]} else {
			};
		};
	};
	} else {
		_x doMove (getPosATL Radio);
	};
	_distance2DX = vehicle _x distance backpackObj;
	_PosX = getPos _x;
	_vehicle = nearestObjects [_PosX, ["Car","Truck","Helicopter"], 100];
	_enemiesNear = _x findNearestEnemy _PosX;
	
	if (isNull objectParent _x) then {
		_x setBehaviour "AWARE"; _x setSpeedMode "FULL";
		if (((isNull _enemiesNear) && ((count _vehicle) > 0)) && !(((behaviour _x) isEqualTo "COMBAT") && (_distance2DX > 200))) then {_x assignAsDriver (_vehicle select 0); [_x] orderGetIn true;};
	} else {
		if (((behaviour _x) isEqualTo "COMBAT") && !(_x isEqualTo player)) then {doStop _x; sleep 1.5; [_x] orderGetIn false; unassignVehicle _x; if ((getPosATL _x) select 2 < 1.5) then {_x action["Eject", vehicle _x]} else {_x land "LAND"};};
		if ((_distance2DX < 175) && !(_x isEqualTo player)) then {doStop _x; sleep 1.5; [_x] orderGetIn false; unassignVehicle _x; if ((getPosATL _x) select 2 < 1.5) then {_x action["Eject", vehicle _x]} else {_x land "LAND"}; _x setBehaviour "COMBAT";};
		if (!(isNull _enemiesNear) && !(_x isEqualTo player)) then {doStop _x; sleep 1.5; [_x] orderGetIn false; unassignVehicle _x; if ((getPosATL _x) select 2 < 1.5) then {_x action["Eject", vehicle _x]} else {_x land "LAND"}; _x setBehaviour "COMBAT";};
	};
	_nearest=objNull;
	_nearestdist=50;
	_dist=vehicle _x distance backpackObj;
	if (_dist<_nearestdist) then {
		_nearest=_x;
		_nearestdist=_dist;
	};
	if (!isNull _nearest) then {backpackObj doMove getPos _nearest}; backpackObj setBehaviour "AWARE"; backpackObj setSpeedMode "FULL"; backpackObj allowFleeing 0; backpackObj setskill ["courage",1];
	if ((behaviour _x) isEqualTo "COMBAT") then {_x setBehaviour "AWARE"; _x setSpeedMode "FULL";};
} forEach playableUnits;
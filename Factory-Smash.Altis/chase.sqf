_null = [] spawn {
	while {true} do { 
		{
		_x doMove (getPosATL Radio);
		_distance2DX = vehicle _x distance backpackObj;
		_PosX = getPos _x;
		_vehicle = nearestObjects [_PosX, ["Car","Truck"], 100];
		if (vehicle _x == _x) then {
			_x setBehaviour "AWARE"; _x setSpeedMode "FULL";
			if (((count _vehicle) > 0) && !(((behaviour _x) == "COMBAT") && (_distance2DX > 200))) then {_x assignAsDriver (_vehicle select 0); [_x] orderGetIn true;};
		} else {
			if ((behaviour _x) == "COMBAT") then {[_x] orderGetIn false; unassignVehicle _x; _x action["Eject", vehicle _x];};
			if (_distance2DX < 175) then {doStop _x; sleep 3; [_x] orderGetIn false; unassignVehicle _x; _x action["Eject", vehicle _x];};
		};
		_nearest=objNull;
		_nearestdist=50;
		_dist=vehicle _x distance backpackObj;
		if (_dist<_nearestdist) then {
			_nearest=_x;
			_nearestdist=_dist;
		};
		if (!isNull _nearest) then {backpackObj doMove getPos _nearest}; backpackObj setBehaviour "AWARE"; backpackObj setSpeedMode "FULL"; backpackObj allowFleeing 0; backpackObj setskill ["courage",1];
		if ((side _nearest) == resistance) then {_nearest doMove (getMarkerPos "indfor-extract-marker"); _nearest setBehaviour "AWARE"; _nearest setSpeedMode "FULL"; _nearest allowFleeing 0; _nearest setskill ["courage",1]} else {
			if ((side _nearest) == west ) then {_nearest doMove (getMarkerPos "blufor-extract-marker"); _nearest setBehaviour "AWARE"; _nearest setSpeedMode "FULL"; _nearest allowFleeing 0; _nearest setskill ["courage",1]} else {
				if ((side _nearest) == east ) then {_nearest doMove (getMarkerPos "opfor-extract-marker"); _nearest setBehaviour "AWARE"; _nearest setSpeedMode "FULL"; _nearest allowFleeing 0; _nearest setskill ["courage",1]} else {
				};
			};
		};
		
		} forEach playableUnits;
		sleep 7;
	};
};

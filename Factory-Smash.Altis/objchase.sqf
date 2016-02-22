_null = [] spawn {
	while {true} do {
      	_nearest=objNull;
		_nearestdist=50;
		{
			_dist=vehicle _x distance backpackObj;
			if (_dist<_nearestdist) then {
				_nearest=_x;
				_nearestdist=_dist;
			};
		} forEach playableUnits;
		if (!isNull _nearest) then {backpackObj doMove getPos BoostGuyUnit}; backpackObj setBehaviour "AWARE"; backpackObj setSpeedMode "FULL"; backpackObj allowFleeing 0; backpackObj setskill ["courage",1];
	sleep 3;
	};
};  


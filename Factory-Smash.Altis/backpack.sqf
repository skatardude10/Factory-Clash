Radio attachTo [backpackObj,[0,0,1.25]];
["PackTracker","onEachFrame",
{
	_flip = 180;
	if (NearIntel) then {_flip = 0};
	_size = 1;
	if (NearIntel) then {_size = 1.5};
	_sideColor = [1,1,1,0.3];
	_distanceBetween = round (player distance Radio);
	if ((side BoostGuyUnit) == west) then {
		_sideColor = [0,0,1,0.3];
		} else {
			if ((side BoostGuyUnit) == east) then {
				_sideColor = [1,0,0,0.3];
				} else {
					if ((side BoostGuyUnit) == resistance) then {
						_sideColor = [0,1,0,0.3];
						} else {
							_sideColor = [1,1,1,0.3];
							_size = 1;
								}
							};
						};
	BoostGuyUnit setFatigue 0;
	drawIcon3D ["\a3\ui_f\data\map\Markers\Military\triangle_ca.paa",_sideColor,[(visiblePosition Radio) select 0,(visiblePosition Radio) select 1, ((getPos Radio) select 2)],_size,_size,_flip,format["Intel - %1 meters",_distanceBetween],0,0.04];
}] call BIS_fnc_addStackedEventHandler; 
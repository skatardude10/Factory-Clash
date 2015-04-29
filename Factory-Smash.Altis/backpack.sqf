Radio attachTo [backpackObj,[0,0,1.25]];
["PackTracker","onEachFrame",
{
	_radioPos = getPosATL Radio;
	_BoostGuy = _radioPos nearEntities ["Man",3]; 
	_unit = (_boostGuy select 0);
	_flip = 180;
	if (count _BoostGuy > 0) then {_flip = 0};
	_size = 1;
	if (count _BoostGuy > 0) then {_size = 1.5};
	_sideColor = [1,1,1,0.3];
	_distanceBetween = round (player distance Radio);
	if ((side _unit) == west) then {
		_sideColor = [0,0,1,0.3];
		} else {
			if ((side _unit) == east) then {
				_sideColor = [1,0,0,0.3];
				} else {
					if ((side _unit) == resistance) then {
						_sideColor = [0,1,0,0.3];
						} else {
							_sideColor = [1,1,1,0.3];
							_size = 1;
								}
							};
						};
	(_BoostGuy select 0) setFatigue 0;
	drawIcon3D ["\a3\ui_f\data\map\Markers\Military\triangle_ca.paa",_sideColor,[(visiblePosition Radio) select 0,(visiblePosition Radio) select 1, _radioPos select 2],_size,_size,_flip,format["Intel - %1 meters",_distanceBetween],0,0.04];
}] call BIS_fnc_addStackedEventHandler; 
["IntelLinesTracker","onEachFrame",
	{
	if (NearIntel) then {
								{
									if (BoostGuyUnit != _x) then {
									_playerPosition = eyePos BoostGuyUnit;
									_playerX = _playerPosition select 0;
									_playerY = _playerPosition select 1;
									_sideColor = [1,1,1,0.8];
									_distance = [_playerPosition,_x] call BIS_fnc_distance2D;
									_distance2 = _distance / 200 + 0.75;
									_distSize = (1/(1+((1.9^-4)*_distance))) * 2 + 0.25;
									_direction = [_playerPosition,_x] call BIS_fnc_dirTo;
									_PosATLRadio = getPosATL Radio;
									_PosATLRadio set [0,_playerX];
									_PosATLRadio set [1,_playerY];
									_Xpos = [_PosATLRadio, _Distance2, _direction] call BIS_fnc_relPos;
									_dam = Damage _x;
									_redMod = (1 - _dam);
									_yelMod = 1/(1+((0.5^-5)*_dam));
									drawLine3d [_PosATLRadio, _Xpos, [1,_redMod,_yelMod,1]];
									if ((side _x) == west) then {
										_sideColor = [0,0,1,0.45];
										} else {
											if ((side _x) == east) then {
												_sideColor = [1,0,0,0.45];
												} else {
													if ((side _x) == resistance) then {
														_sideColor = [0,1,0,0.45];
														} else {
															_sideColor = [1,1,1,0.45];
																}
															};
														};
												drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", _sidecolor, [_Xpos select 0, _Xpos select 1, _XPos select 2], _distSize, _distSize, 1,"",0.5,0.035];
												}
								} forEach playableUnits
								} else {};
}] call BIS_fnc_addStackedEventHandler; 
["IntelLinesTracker","onEachFrame", 
{
	if (NearIntel) then 
	{
		_playerPosition = eyePos BoostGuyUnit;
		_unitPos = eyePos player;
		_distance = [_playerPosition,_unitpos] call BIS_fnc_distance2D;
		if (_distance < 20) then
		{
			{
			if !((side _x) isEqualTo (side BoostGuyUnit)) then
				{
				if (BoostGuyUnit != _x) then 
					{
					_distance = [_playerPosition,_x] call BIS_fnc_distance2D;
					_playerX = _playerPosition select 0;
					_playerY = _playerPosition select 1;
					_distFloor = floor _Distance;
					_distance2 = _distance / 300 + 1;
					_distSize = (1/(1+((1.9^-4)*_distance))) * 2 + 0.75;
					_direction = [_playerPosition,_x] call BIS_fnc_dirTo;
					_PosATLRadio = getPosATL Radio;
					_PosATLRadio set [0,_playerX];
					_PosATLRadio set [1,_playerY];
					_Xpos = [_PosATLRadio, _Distance2, _direction] call BIS_fnc_relPos;
					_distance3 =  ([_playerPosition,_Xpos] call BIS_fnc_distance2D) - 0.85;
					_Direction2 = [_x,_playerPosition] call BIS_fnc_dirTo;
					_CirclePos = [_Xpos, _distance3, _direction2] call BIS_fnc_relPos;
					_dam = Damage _x;
					_redMod = (1 - _dam);
					_yelMod = 1/(1+((0.5^-5)*_dam));
					_distBetween = [player,BoostGuyUnit] call BIS_fnc_distance2D;
					_alphaMod = 0.1/(0.1+((7^-1)*_distBetween));
					_sideColor = [1,1,1,_alphaMod];
					if (_alphaMod < 0.03) then {_alphaMod = 0};
					if ((side _x) isEqualTo west) then {
					_sideColor = [0,0,1,_alphaMod];
					} else {
						if ((side _x) isEqualTo east) then {
							_sideColor = [1,0,0,_alphaMod];
						} else {
							if ((side _x) isEqualTo resistance) then {
								_sideColor = [0,1,0,_alphaMod];
							} else {
								_sideColor = [1,1,1,_alphaMod];
							}
						};
					};
					drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", [1,_redMod,_yelMod,_alphaMod], _CirclePos, 0.5, 0.5, 1,"",1,0.02,"puristaMedium"];
					drawLine3d [_CirclePos, _Xpos, _sideColor];
					_position = eyePos BoostGuyUnit;
					//_position = ASLToATL _position;
					_eyePosX = eyePos _x;
					//_eyePosX = ASLToATL _eyePosX;
					_objVis = lineIntersects [_playerPosition, _eyePosX,BoostGuyUnit, _x];
					_terVis = terrainIntersect [_playerPosition, _eyePosX];
					_seenSize = _distSize * 0.75;
					if !(_objVis || _terVis || (_distance > 300)) then {
						if (vehicle _x != _x) then 
						{
						drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\c_car.paa", _sidecolor, [_Xpos select 0, _Xpos select 1, _XPos select 2], (_distSize / 2), (_distSize / 2), 1,format["%1",_distFloor],1,0.03];
						} else {
						drawIcon3D ["\A3\ui_f\data\map\Markers\Military\warning_ca.paa", [1,_redMod,_yelMod,_alphaMod], _CirclePos, _seenSize, _seenSize, 1,"",1,0.02,"puristaMedium","",True];
						drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", _sidecolor, [_Xpos select 0, _Xpos select 1, _XPos select 2], _distSize, _distSize, 1,format["%1",_distFloor],1,0.03];
							}
						} else 
							{
							if (vehicle _x != _x) then {
								drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\c_car.paa", _sidecolor, [_Xpos select 0, _Xpos select 1, _XPos select 2], (_distSize / 2), (_distSize / 2), 1,format["%1",_distFloor],1,0.03];
							} else {
								drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", _sidecolor, [_Xpos select 0, _Xpos select 1, _XPos select 2], _distSize, _distSize, 1,format["%1",_distFloor],1,0.03];
								};
							};
						
					};
				} else {};
			} forEach playableUnits; 
		};
	};
}
] call BIS_fnc_addStackedEventHandler;
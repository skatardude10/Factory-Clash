["PlayerTracker","onEachFrame",
{
    {
	if(((_x != player) && (player distance _x < 300)) || ((side _x == side player) && (_x != player))) then {
		_dam = damage _x;
		_position = eyePos _x;
		_position = ASLToATL _position;
		//_position = getPos _x;
		//_positionHeight = _position set [2,1.6];
		_playerPosition = eyePos player;
		_playerPosition = ASLToATL _playerPosition;
		_redMod = (1 - _dam);
		_yelMod = 1/(1+((0.5^-5)*_dam));
		_distBetween = _playerPosition distance _position;
		_distFloor = floor _distBetween;
		_distSize = (1/(1+((1.9^-4)*_distFloor))) * 2 + 0.5;
		_profileName =  name _x;
		_alphaMod = 1/(1+((2.9^-3)*_distBetween)); 
		_friendAlpha = (_alphaMod * 4);
		if (_friendAlpha > 0.75) then {_friendAlpha = 0.75};
		_friendMod = 1;
		if (side _x == side player) then [{_friendMod = 0},{_friendMod = 1}];
		_color = [_friendMod, _redMod, _yelMod, _alphaMod];
		if(_dam > 0.51) 
		then
			{
			drawIcon3D ["\A3\ui_f\data\map\Markers\Military\warning_ca.paa", _color, [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], _distSize, _distSize, 1,"",0.5,0.035,"puristaMedium","",True];
			_x setFatigue 0.65;
			}
		else 
			{ 
			if (side _x == side player) then {
				if (vehicle _x != _x) then {
					drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\c_car.paa", [_friendMod, _redMod, _yelMod, _friendAlpha], [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], _distSize, _distSize, 1,format["%1",_profileName],_distSize,0.02,"puristaMedium","Center",True];
				} else 
				{
					drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", [_friendMod, _redMod, _yelMod, _friendAlpha], [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], _distSize, _distSize, 1,format["%1",_profileName],_distSize,0.02,"puristaMedium","Center",True];
				};
			}
				else {
				_objVis = lineIntersects [eyePos player, eyePos _x,player, _x];
				_terVis = terrainIntersect [_playerPosition, _position];
					if(!_objVis && !_terVis) then
					{
						drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", _color, [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], _distSize, _distSize, 1,"",_distSize,0.035,"puristaMedium","",True];
					};
				};
			};
		};   
    } foreach playableUnits;
}] call BIS_fnc_addStackedEventHandler;
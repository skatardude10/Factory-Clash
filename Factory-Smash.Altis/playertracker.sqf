["PlayerTracker","onEachFrame",
{
    {
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
	_alphaMod = 1/(1+((2.9^-3)*_distBetween)); 
	_friendMod = 1;
	if (side _x == side player) then [{_friendMod = 0},{_friendMod = 1}];
	_color = [_friendMod, _redMod, _yelMod, _alphaMod];
        if( _x != player && player distance _x < 2500) then
		{ 
			if(_dam > 0.51) 
			then
				{
                drawIcon3D ["\A3\ui_f\data\map\Markers\Military\warning_ca.paa", _color, [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], 0.5, 0.5, 1,name _x,0.5,0.035];
				_x setFatigue 0.65;
				}
			else 
			{ 
			_objVis = lineIntersects [eyePos player, eyePos _x,player, _x];
			_terVis = terrainIntersect [_playerPosition, _position];
				if(!_objVis && !_terVis) then
				{
				drawIcon3D ["\A3\ui_f\data\map\Markers\Military\dot_ca.paa", _color, [(visiblePosition _x) select 0, (visiblePosition _x) select 1, _position select 2], 1, 1, 1,"",0.5,0.035];
				};
			};
        };
    } foreach allUnits;
}] call BIS_fnc_addStackedEventHandler;
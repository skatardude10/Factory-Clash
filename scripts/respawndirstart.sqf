_target = _this select 0;
waitUntil {alive _target};
_target setDir ([_target, Radio] call BIS_fnc_dirTo);
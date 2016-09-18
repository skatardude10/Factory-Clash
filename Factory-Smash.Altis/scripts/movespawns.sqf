_spawns = [
	["blufor_respawn_move","refB"],
	["respawn_west_1","refB_1"],
	["respawn_west_2","refB_2"],
	["respawn_west_3","refB_3"],
	["respawn_west_4","refB_4"],
	["respawn_east_1","refO_1"],
	["respawn_east_2","refO_2"],
	["respawn_east_3","refO_3"],
	["respawn_east_4","refO_4"],
	["opfor_respawn_move","refO"],
	["respawn_guerrila_1","refI_1"],
	["respawn_guerrila_2","refI_2"],
	["respawn_guerrila_3","refI_3"],
	["respawn_guerrila_4","refI_4"],
	["indfor_respawn_move","refI"]
];

while {true} do {
{
_spawn = _x select 0;
_ref = _x select 1;
_refPos = getMarkerPos _ref;
_dist = _refPos distance backpackObj;
_newDist = ( -_dist / 100 * ( _dist ^ 0.4 ) ) + 460;
if (_newDist > 350) then {_newDist = 350};
_dir = backpackObj getDir (getMarkerPos _ref);
_newPos = [backpackObj, _newDist, _dir] call BIS_fnc_relPos;
_spawn setMarkerPos _newPos;
} forEach _spawns;
sleep 10;
};
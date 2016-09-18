_refs = ["refB", "refB_1", "refB_2", "refB_3", "refB_4", "refO_1", "refO_2", "refO_3", "refO_4", "refO", "refI_1", "refI_2", "refI_3", "refI_4", "refI"];

{
_refPos = getMarkerPos _x;
_dir = backpackObj getDir _refPos;
_newPos = [backpackObj, 1000, _dir] call BIS_fnc_relPos;
_x setMarkerPos _newPos;
} forEach _refs;


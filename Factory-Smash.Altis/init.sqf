//Functions
C_fnc_RespawnDir = compile preprocessFileLineNumbers "scripts\respawnDir.sqf";
car_chase_fnc = compile preprocessFileLineNumbers "functions\car_chase_fnc.sqf";
fn_netSay3D = compile preprocessFileLineNumbers "scripts\fn_netSay3D.sqf";
Tag_FNC_Winner = {["end1",True,5] call BIS_fnc_endMission;hint "Your team successfully extracted the HVT!";}; 
Tag_FNC_loser = {["end2",false,5] call BIS_fnc_endMission;hint "Your team failed to extract the HVT :-(";}; 
C_fnc_BoostGuy = 	{
	BoostGuyArray = backpackObj nearEntities ["Man",30];
	_playableXunits = playableUnits;
	_BoostGuyLess = BoostGuyArray arrayIntersect _playableXunits;
	if (count _BoostGuyLess > 0) then {NearIntel = True; BoostGuyUnit = (_BoostGuyLess select 0);} else {NearIntel = False; BoostGuyUnit = (_BoostGuyLess select 0);};
	publicVariable "BoostGuyUnit"; publicVariable "NearIntel"; publicVariable "BoostGuyArray";
};
if (isNil "PVEH_netSay3D") then {PVEH_NetSay3D = [objNull,0];};
"PVEH_netSay3D" addPublicVariableEventHandler {private["_array"]; _array = _this select 1; (_array select 0) say3D (_array select 1);};
fnc_resizePIP = {
	_dispPos = [ _this, 0, [ 0, 0 ], [ [] ], [ 2 ] ] call BIS_fnc_param;
	_scale = [ _this, 1, 1, [ 0 ] ] call BIS_fnc_param;
	_display = uiNamespace getVariable "BIS_fnc_PIP_RscPIP";
	_basePos = ctrlPosition ( _display displayCtrl 2300 );
	_baseScale = ctrlScale ( _display displayCtrl 2300 );
	_scaleDiff = _scale / _baseScale;
	{
		_ctrl = _x;
		_pos = ctrlPosition _ctrl;
		_pos resize 2;
		{
			_diff = _x - ( _basePos select _forEachIndex );
			_newpos = ( _dispPos select _forEachIndex ) + ( _diff * _scaleDiff );
			_pos set [ _forEachIndex, _newpos ];
		}forEach _pos;
		_ctrl ctrlSetPosition _pos;
		_ctrl ctrlSetScale _scale;
		_ctrl ctrlCommit 0;
	}forEach allControls _display;
};

//Gamestate - Checked at the end... ends when GameState = True;

GameFinished = false;
if(!isServer) then {waitUntil{!isNull player}};

//Scoreboard spawned for all units if Enabled//
if ((paramsArray select 13) isEqualTo 1) then {
	h = [] spawn {
		while {!(GameFinished)} do {
			hintSilent parseText format["<t size='1.25'>Score Limit: %4</t><br /><t size='1.5' color='#0000ff'>Blufor = %1</t>
										<br /><t size='1.5' color='#ff0000'>Opfor = %2</t>
										<br /><t size='1.5' color='#00ff00'>Indfor = %3</t>",
										scoreSide west,
										scoreSide east, scoreSide
										resistance,
										(paramsArray select 0)];
			sleep 10;
		};
	};
};
//Client scripts\/
{if (_x iskindof "Building") then {_x allowDamage false}} forEach ((position ref1) nearObjects 500);
BoostGuyUnit = nil;
NearIntel = False;
nul = [] execVM "scripts\backpack.sqf";

//Server scripts//
if (isServer) then {  
nul = [] execVM "scripts\CallFunctionsObj.sqf";
nul = [] execVM "scripts\score.sqf";
nul = [] execVM "scripts\markers.sqf";
nul = [] execVM "scripts\chase.sqf";
nul = [] execVM "scripts\movespawns.sqf"; 
{_x addEventHandler ["Hit", {0 = _this execVM "scripts\staminaHit.sqf"}]} forEach playableUnits;

//Parameters to select - ref in description.ext//
if ((paramsArray select 2) isEqualTo 0) then {skipTime 0};
if ((paramsArray select 2) isEqualTo 1) then {skipTime 4};
if ((paramsArray select 2) isEqualTo 2) then {skipTime 8};
if ((paramsArray select 2) isEqualTo 3) then {skipTime 12};
if ((paramsArray select 2) isEqualTo 4) then {skipTime 16};
if ((paramsArray select 2) isEqualTo 5) then {skipTime 18};
if ((paramsArray select 2) isEqualTo 6) then {skipTime 20};
if ((paramsArray select 2) isEqualTo 7) then {_time = random 24;_minute = random 1;skipTime (_time + _minute)};
if ((paramsArray select 3) isEqualTo 0) then {[0] call BIS_fnc_setOvercast};
if ((paramsArray select 3) isEqualTo 1) then {[0.25] call BIS_fnc_setOvercast};
if ((paramsArray select 3) isEqualTo 2) then {[0.5] call BIS_fnc_setOvercast};
if ((paramsArray select 3) isEqualTo 3) then {[0.75] call BIS_fnc_setOvercast};
if ((paramsArray select 3) isEqualTo 4) then {[1] call BIS_fnc_setOvercast};
if ((paramsArray select 3) isEqualTo 5) then {_overCast = random 1;[_overCast] call BIS_fnc_setOvercast};
if ((paramsArray select 4) isEqualTo 0) then {[0.15, 0.05, 48] call BIS_fnc_setFog};
if ((paramsArray select 4) isEqualTo 1) then {[0.4, 0.05, 50] call BIS_fnc_setFog};
if ((paramsArray select 4) isEqualTo 2) then {[0.85, 0.05, 65] call BIS_fnc_setFog};
if ((paramsArray select 4) isEqualTo 3) then {_Fog = random [0.1,0.3,0.9]; _Dens = random [0.01,0.09,0.18]; _elev = (random [1,10,15]) + 39; [_Fog, _Dens, _elev] call BIS_fnc_setFog};
if ((paramsArray select 4) isEqualTo 4) then {[0, 0, 0] call BIS_fnc_setFog};
if ((paramsArray select 8) isEqualTo 1) then {nul = [] execVM "scripts\radiosounds.sqf"};
if ((paramsArray select 14) isEqualTo 1) then {
									independent setFriend [west, 1];
									west setFriend [independent, 1];
									};
if ((paramsArray select 15) isEqualTo 1) then {
									independent setFriend [east, 1];
									east setFriend [independent, 1];
									};
{_x setDamage 1} forEach playableUnits;	

//Wait to end game untill...///	
waituntil {((scoreSide west) >= (paramsArray select 0)) || ((scoreSide east) >= (paramsArray select 0)) || ((scoreSide resistance) >= (paramsArray select 0))}; 
if (scoreSide West >= (paramsArray select 0)) Then {  
playMusic  ["LeadTrack02_F_EPC",50];
titleCut ["", "BLACK OUT", 10];  	
[[], "TAG_FNC_Winner", west, false] spawn BIS_fnc_MP; 
[[], "TAG_FNC_loser", east, false] spawn BIS_fnc_MP; 
[[], "TAG_FNC_loser", resistance, false] spawn BIS_fnc_MP; 
} else {  
	if (scoreSide East >= (paramsArray select 0)) Then {
		playMusic  ["LeadTrack02_F_EPC",50]; 
		titleCut ["", "BLACK OUT", 10];  			
		[[], "TAG_FNC_Winner", east, false] spawn BIS_fnc_MP; 
		[[], "TAG_FNC_loser", west, false] spawn BIS_fnc_MP;  
		[[], "TAG_FNC_loser", resistance, false] spawn BIS_fnc_MP; 	 
	} else 	{
			playMusic  ["LeadTrack02_F_EPC",50]; 
			titleCut ["", "BLACK OUT", 10]; 
			[[], "TAG_FNC_Winner", resistance, false] spawn BIS_fnc_MP; 
			[[], "TAG_FNC_loser", west, false] spawn BIS_fnc_MP; 
			[[], "TAG_FNC_loser", east, false] spawn BIS_fnc_MP;  
			}
};   
GameFinished = true;  
};
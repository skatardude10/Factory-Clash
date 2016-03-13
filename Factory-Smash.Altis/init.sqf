//Functions
C_fnc_RespawnDir = compile preprocessFileLineNumbers "scripts\respawnDir.sqf";
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

//Gamestate - Checked at the end... ends when GameState = True;

GameFinished = false;
if(!isServer) then {waitUntil{!isNull player}};

//Scoreboard spawned for all units if Enabled//
if ((paramsArray select 13) == 1) then {
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

//Server scripts\/
if (isServer) then {  
nul = [] execVM "scripts\CallFunctionsObj.sqf";
nul = [] execVM "scripts\score.sqf";
nul = [] execVM "scripts\markers.sqf";
nul = [] execVM "scripts\chase.sqf";

//Parameters to select - ref in description.ext
if ((paramsArray select 2) == 0) then {skipTime 4};
if ((paramsArray select 2) == 1) then {skipTime 8};
if ((paramsArray select 2) == 2) then {skipTime 12};
if ((paramsArray select 2) == 3) then {skipTime 16};
if ((paramsArray select 2) == 4) then {skipTime 18};
if ((paramsArray select 2) == 5) then {skipTime 20};
if ((paramsArray select 2) == 6) then {_time = random 24;_minute = random 1;skipTime (_time + _minute)};
if ((paramsArray select 3) == 0) then {[0] call BIS_fnc_setOvercast};
if ((paramsArray select 3) == 1) then {[0.25] call BIS_fnc_setOvercast};
if ((paramsArray select 3) == 2) then {[0.5] call BIS_fnc_setOvercast};
if ((paramsArray select 3) == 3) then {[0.75] call BIS_fnc_setOvercast};
if ((paramsArray select 3) == 4) then {[1] call BIS_fnc_setOvercast};
if ((paramsArray select 3) == 5) then {_overCast = random 1;[_overCast] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 0) then {[0.2, 0.1, 43] call BIS_fnc_setFog};
if ((paramsArray select 4) == 1) then {[0.4, 0.15, 44] call BIS_fnc_setFog};
if ((paramsArray select 4) == 2) then {[0.8, 0.16, 45] call BIS_fnc_setFog};
if ((paramsArray select 4) == 3) then {_Fog = random 0.9; _Dens = random 0.3; _elev = (random 10) + 39; [_Fog, _Dens, _elev] call BIS_fnc_setFog};
if ((paramsArray select 8) == 1) then {nul = [] execVM "scripts\radiosounds.sqf"};
if ((paramsArray select 14) == 1) then {
									independent setFriend [west, 1];
									west setFriend [independent, 1];
									};
if ((paramsArray select 15) == 1) then {
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

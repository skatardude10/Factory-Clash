//Functions
C_fnc_RespawnDir = compile preprocessFileLineNumbers "respawnDir.sqf";
fn_netSay3D = compile preprocessFileLineNumbers "fn_netSay3D.sqf";
Tag_FNC_Winner = {["end1",True,5] call BIS_fnc_endMission;hint "Your team won!";}; 
Tag_FNC_loser = {["end2",false,5] call BIS_fnc_endMission;hint "Your team lost!";}; 

C_fnc_BoostGuy = 	{
	_BoostGuyArray = backpackObj nearEntities ["Man",35];
	_playableXunits = playableUnits;
	_BoostGuyLess = _BoostGuyArray arrayIntersect _playableXunits;
	if (count _BoostGuyLess > 0) then {NearIntel = True; BoostGuyUnit = (_BoostGuyLess select 0);} else {NearIntel = False; BoostGuyUnit = (_BoostGuyLess select 0);};
	publicVariable "BoostGuyUnit";
	publicVariable "NearIntel";
};
	
if (isNil "PVEH_netSay3D") then {
    PVEH_NetSay3D = [objNull,0];
};
"PVEH_netSay3D" addPublicVariableEventHandler {
      private["_array"];
      _array = _this select 1;
     (_array select 0) say3D (_array select 1);
};


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
//Client Scripts//
//Make all buildings invincible
BoostGuyUnit = nil;
NearIntel = False;

{if (_x iskindof "Building") then {_x allowDamage false}} forEach ((position ref1) nearObjects 500);

nul = [] execVM "backpack.sqf";
//if ((paramsArray select 14) == 1) then {{_x addMPEventHandler ["MPHit", {_this execVM "Damaged.sqf"}]} forEach playableUnits}; -- Moved toInitPlayerLocal for JIP
//if ((paramsArray select 1) == 1) then {nul = [] execVM "tracer.sqf"; {_x addeventhandler ["respawn"," 0 = [_x] execVM 'tracer2.sqf'"]} forEach playableUnits;}; --Removed due to performance and bugs

//Server Scripts//
if (isServer) then {  
nul = [] execVM "CallFunctionsObj.sqf";
nul = [] execVM "score.sqf";
//nul = [] execVM "objchase.sqf";
//Parameters to select - ref in description.ext
if ((paramsArray select 3) == 0) then {skipTime 4};
if ((paramsArray select 3) == 1) then {skipTime 8};
if ((paramsArray select 3) == 2) then {skipTime 12};
if ((paramsArray select 3) == 3) then {skipTime 16};
if ((paramsArray select 3) == 4) then {skipTime 18};
if ((paramsArray select 3) == 5) then {skipTime 20};
if ((paramsArray select 3) == 6) then {_time = random 24;_minute = random 1;skipTime (_time + _minute)};
if ((paramsArray select 4) == 0) then {[0] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 1) then {[0.25] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 2) then {[0.5] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 3) then {[0.75] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 4) then {[1] call BIS_fnc_setOvercast};
if ((paramsArray select 4) == 5) then {_overCast = random 1;[_overCast] call BIS_fnc_setOvercast};
if ((paramsArray select 5) == 0) then {[0.2, 0.1, 43] call BIS_fnc_setFog};
if ((paramsArray select 5) == 1) then {[0.4, 0.15, 44] call BIS_fnc_setFog};
if ((paramsArray select 5) == 2) then {[0.8, 0.16, 45] call BIS_fnc_setFog};
if ((paramsArray select 5) == 3) then {_Fog = random 0.9; _Dens = random 0.3; _elev = (random 10) + 39; [_Fog, _Dens, _elev] call BIS_fnc_setFog};
if ((paramsArray select 11) == 1) then {[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf"}};
if ((paramsArray select 11) == 0) then {deleteMarker "IEDMARKER";};
if ((paramsArray select 12) == 1) then {nul = [] execVM "radiosounds.sqf"};
if ((paramsArray select 18) == 1) then {
									independent setFriend [west, 1];
									west setFriend [independent, 1];
									};
if ((paramsArray select 19) == 1) then {
									independent setFriend [east, 1];
									east setFriend [independent, 1];
									};

{_x setDamage 1} forEach playableUnits;									

nul = [] execVM "chase.sqf";
[
		60, // seconds to delete dead bodies (0 means don't delete) 
		0, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		5*60, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'repetitive_cleanup.sqf';
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

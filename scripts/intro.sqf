waitUntil {!alive player};
waitUntil {alive player};
playMusic  ["LeadTrack02_F_EPC",50];
    titleCut ["", "BLACK FADED", 222]; 
    [] Spawn { 
[
	[
		["Factory Clash","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["Capture and Extract the Intelligence Officer","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
	]
] spawn BIS_fnc_typeText;
    titleCut ["", "BLACK IN", 5]; 
	"dynamicBlur" ppEffectEnable true;    
    "dynamicBlur" ppEffectAdjust [6];    
    "dynamicBlur" ppEffectCommit 0;      
    "dynamicBlur" ppEffectAdjust [0.0];   
    "dynamicBlur" ppEffectCommit 5;   
    sleep 5; 
    [str ("NW Altis"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText; 


    };
	
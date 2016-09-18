_respawnGuy = _this select 0;
_Direction = ([Center, _respawnGuy] call BIS_fnc_dirTo) + random 75 - random 75;
_Distance = (random 25) + 25;
_respawnGuy setPos ([_respawnGuy, _Distance, _Direction] call BIS_fnc_relPos);
_respawnGuy setAnimSpeedCoef 1.11;
_respawnGuy setCustomAimCoef 0.5;
if (isPlayer _respawnGuy) then {
_stimAction = _respawnGuy addAction ["<t color='#B7FF00'>Stimulant Shot</t> <t color='#FF0000'>(Emergency-Use)</t>", {0 = _this execVM "scripts\perk.sqf";}, nil, 0];
};
waitUntil {alive _respawnGuy};
5 fadeSound 1;
5 fadeMusic 1;
5 fadeSpeech 1;
5 fadeRadio 1;
titleText["", "PLAIN", 5];
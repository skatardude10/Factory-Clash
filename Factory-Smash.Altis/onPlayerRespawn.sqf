_respawnGuy = _this select 0;
_Direction = ([Center, _respawnGuy] call BIS_fnc_dirTo) + random 75 - random 75;
_Distance = (random 25) + 25;
_respawnGuy setPos ([_respawnGuy, _Distance, _Direction] call BIS_fnc_relPos);
5 fadeSound 1;
5 fadeMusic 1;
5 fadeSpeech 1;
5 fadeRadio 1;
titleText["", "PLAIN", 5];
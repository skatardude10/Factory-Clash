if ((paramsArray select 17) isEqualTo 1) then {

while {!isPlayer JTACOPF} do { 
_enemiesNear = JTACOPF findNearestEnemy JTACOPF;
if ((!isNull _enemiesNear) && (random 10 < 3)) then 
	{
		if (NearIntel and (random 10 > 3)) then {
			if !((side BoostGuyUnit) isEqualTo east) then {
				_enemyLocation = getPosATL Radio;
				_strikeLocation = [(_enemyLocation select 0) + random [-25,0,25], (_enemyLocation select 1) + random [-25,0,25], (_enemyLocation select 2) + random [-25,0,25]];
				_bombArray = ["bomb","clusterbomb"];
				_bombType = _bombArray select (floor (random (count _bombArray)));
				_bombNum = floor random [1,2,4];
				_planeNum = floor random [1,1,2];
				Null = [OPFOR,"opfor_bomber",_strikeLocation,"opfor_bomber",False,_bombType,_bombNum,false,_planeNum] execVM "scripts\NEKY_BombingRun.sqf";
			};
		} else { 
			if ((floor random 10) > 5 ) then {
				_enemyLocation = JTACOPF getHideFrom _enemiesNear;
				_roundNum = floor random 4;
				MORTOPF doArtilleryFire [[(_enemyLocation select 0) + random [-25,0,25], (_enemyLocation select 1) + random [-25,0,25], (_enemyLocation select 2) + random [-25,0,25]], "8Rnd_82mm_Mo_shells", _roundNum];
			} else {
				_enemyLocation = JTACOPF getHideFrom _enemiesNear;
				_strikeLocation = [(_enemyLocation select 0) + random [-25,0,25], (_enemyLocation select 1) + random [-25,0,25], (_enemyLocation select 2) + random [-25,0,25]];
				_bombArray = ["bomb","clusterbomb"];
				_bombType = _bombArray select (floor (random (count _bombArray)));
				_bombNum = floor random [3,5,7];
				_planeNum = floor random [1,2,3];  
				Null = [OPFOR,"opfor_bomber",_strikeLocation,"opfor_bomber",False,_bombType,_bombNum,false,_planeNum] execVM "scripts\NEKY_BombingRun.sqf";
			};
		};
	} else {};
sleep random [7,20,25];
};

} else {};
if ((paramsArray select 17) isEqualTo 1) then {

while {!isPlayer JTACINDF} do { 
_enemiesNear = JTACINDF findNearestEnemy JTACINDF;
if ((!isNull _enemiesNear) && (random 10 < 3)) then 
	{
	_enemyLocation = JTACINDF getHideFrom _enemiesNear;
	MORTINDF doArtilleryFire [[(_enemyLocation select 0) + random [-25,0,25], (_enemyLocation select 1) + random [-25,0,25], (_enemyLocation select 2) + random [-25,0,25]], "8Rnd_82mm_Mo_shells", 1];
	} else {};
sleep random [7,20,25];
};

} else {};

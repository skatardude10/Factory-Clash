if ((paramsArray select 17) == 1) then {

while {!isPlayer JTACBLUF} do { 
_enemiesNear = JTACBLUF findNearestEnemy JTACBLUF;
if ((!isNull _enemiesNear) && (random 10 < 3)) then 
	{
	_enemyLocation = JTACBLUF getHideFrom _enemiesNear;
	MORTBLUF doArtilleryFire [[(_enemyLocation select 0) + random [-25,0,25], (_enemyLocation select 1) + random [-25,0,25], (_enemyLocation select 2) + random [-25,0,25]], "8Rnd_82mm_Mo_shells", 1];
	} else {};
sleep random [7,20,25];
};

} else {};
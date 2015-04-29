_target = _this select 0;
_target enableFatigue true; 

while {true} do {
	waitUntil {getFatigue _target > 0.2}; 
	_target setFatigue 0;
}
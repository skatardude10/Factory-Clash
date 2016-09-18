while {true} do {
//Need to Execute
	if !(NearIntel) then {} else {
	_profileName =  name BoostGuyUnit;
	if ((damage BoostGuyUnit) > 0.1) then {BoostGuyUnit setDamage ((damage BoostGuyUnit) - 0.1)};
	_sideName = nil;
	_sideColor = "##000000";
	(side BoostGuyUnit) addScoreSide 1;
	_sideScore = scoreSide (side BoostGuyUnit);
	
//Do not need to: Select based on Parameter State
if ((paramsArray select 9) isEqualTo 1) then {
	if ((side BoostGuyUnit) isEqualTo west) then {
		_sideColor = "#0000ff"
		} else {
			if ((side BoostGuyUnit) isEqualTo east) then {
			_sideColor = "#ff0000"
			} else {
				if ((side BoostGuyUnit) isEqualTo resistance) then {				
				_sideColor = "#00ff00"
				} else {
					_sideColor = "##000000";
					_profileName = "Nobody"
						}
					} 
				};
	if ((side BoostGuyUnit) isEqualTo west) then {
		_sideName = "Blufor"
		} else {
			if ((side BoostGuyUnit) isEqualTo east) then {
				_sideName = "Opfor"
				} else {
					if ((side BoostGuyUnit) isEqualTo resistance) then {
						_sideName = "Indfor"
						} else {_sideName = "No One"}

					} 
				};

if (NearIntel) then {hintSilent parseText format ["<t size='1.25' color='%4'>%1</t><t size='1.25'> Has the VIP!</t>",_sideName, _sideScore, _sideName,_sideColor]};
};

};
sleep 12;
};




//
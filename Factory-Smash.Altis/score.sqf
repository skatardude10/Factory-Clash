while {true} do {
//Need to Execute
	_radioPos2 = getPosATL Radio;
	_BoostGuy2 =  _radioPos2 nearEntities ["Man",3];
	if (count _boostGuy2 == 0) then {} else {
	_unit = (_boostGuy2 select 0);
	_profileName =  name (_boostGuy2 select 0);
	if ((damage _unit) > 0.1) then {_unit setDamage ((damage _unit) - 0.1)};
	_sideName = nil;
	_sideColor = "##000000";
	(side _unit) addScoreSide 1;
	_sideScore = scoreSide (side _unit);
		if ((side _unit) == west) then {
		"areaops" setMarkerColor "ColorBLUFOR"
		} else {
			if ((side _unit) == east) then {
			"areaops" setMarkerColor "ColorOPFOR"
			} else {
				if ((side _unit) == resistance) then {				
				"areaops" setMarkerColor "ColorIndependent"
				} else {
						"areaops" setMarkerColor "ColorBlack"
						}
					} 
				};
	
//Do not need to: Select based on Parameter State
if ((paramsArray select 13) == 1) then {
	if ((side _unit) == west) then {
		_sideColor = "#0000ff"
		} else {
			if ((side _unit) == east) then {
			_sideColor = "#ff0000"
			} else {
				if ((side _unit) == resistance) then {				
				_sideColor = "#00ff00"
				} else {
					_sideColor = "##000000";
					_profileName = "Nobody"
						}
					} 
				};
	if ((side _unit) == west) then {
		_sideName = "Blufor"
		} else {
			if ((side _unit) == east) then {
				_sideName = "Opfor"
				} else {
					if ((side _unit) == resistance) then {
						_sideName = "Indfor"
						} else {_sideName = "No One"}

					} 
				};

if (count _BoostGuy2 > 0) then {hintSilent parseText format ["<t size='1.45'>%1</t> <t size='1.25'><br />Has the Intel!</t> <br /><t size='1.5' color='%4'>%3's Score: %2</t>",_profileName, _sideScore, _sideName,_sideColor]};
};

};
sleep 13;
};




//
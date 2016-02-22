while {true} do {
//Need to Execute
	"areaops" setMarkerPos (getPos Radio);
	if !(NearIntel) then {} else {
	_profileName =  name BoostGuyUnit;
	if ((damage BoostGuyUnit) > 0.1) then {BoostGuyUnit setDamage ((damage BoostGuyUnit) - 0.1)};
	_sideName = nil;
	_sideColor = "##000000";
	(side BoostGuyUnit) addScoreSide 1;
	_sideScore = scoreSide (side BoostGuyUnit);
		if ((side BoostGuyUnit) == west) then {
		"areaops" setMarkerColor "ColorBLUFOR"
		} else {
			if ((side BoostGuyUnit) == east) then {
			"areaops" setMarkerColor "ColorOPFOR"
			} else {
				if ((side BoostGuyUnit) == resistance) then {				
				"areaops" setMarkerColor "ColorIndependent"
				} else {
						"areaops" setMarkerColor "ColorBlack"
						}
					} 
				};
	
//Do not need to: Select based on Parameter State
if ((paramsArray select 13) == 1) then {
	if ((side BoostGuyUnit) == west) then {
		_sideColor = "#0000ff"
		} else {
			if ((side BoostGuyUnit) == east) then {
			_sideColor = "#ff0000"
			} else {
				if ((side BoostGuyUnit) == resistance) then {				
				_sideColor = "#00ff00"
				} else {
					_sideColor = "##000000";
					_profileName = "Nobody"
						}
					} 
				};
	if ((side BoostGuyUnit) == west) then {
		_sideName = "Blufor"
		} else {
			if ((side BoostGuyUnit) == east) then {
				_sideName = "Opfor"
				} else {
					if ((side BoostGuyUnit) == resistance) then {
						_sideName = "Indfor"
						} else {_sideName = "No One"}

					} 
				};

if (NearIntel) then {hintSilent parseText format ["<t size='1.45'>%1</t> <t size='1.25'><br />is escorting the intel officer!</t> <br /><t size='1.5' color='%4'>%3's Score: %2</t>",_sideName, _sideScore, _sideName,_sideColor]};
};

};
sleep 13;
};




//
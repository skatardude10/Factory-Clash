while {true} do {
"areaops" setMarkerPos (getPos Radio);
	if !(NearIntel) then {
			"areaops" setMarkerColor "ColorBlack";
			if ((paramsArray select 16) isEqualTo 1) then {
			"respawn_west" setMarkerPos (getMarkerPos "blufor_respawn_move");
			"respawn_east" setMarkerPos (getMarkerPos "opfor_respawn_move");
			"respawn_guerrila" setMarkerPos (getMarkerPos "indfor_respawn_move");
				};
	} else {
		if ((side BoostGuyUnit) isEqualTo west) then {
			"areaops" setMarkerColor "ColorBLUFOR";
			if ((paramsArray select 16) isEqualTo 1) then {
			"respawn_west" setMarkerPos (getPos Radio);
			"respawn_east" setMarkerPos (getMarkerPos "opfor_respawn_move");
			"respawn_guerrila" setMarkerPos (getMarkerPos "indfor_respawn_move");
				};
			} else {
				if ((side BoostGuyUnit) isEqualTo east) then {
					"areaops" setMarkerColor "ColorOPFOR";
					if ((paramsArray select 16) isEqualTo 1) then {
					"respawn_west" setMarkerPos (getMarkerPos "blufor_respawn_move");
					"respawn_east" setMarkerPos (getPos Radio);
					"respawn_guerrila" setMarkerPos (getMarkerPos "indfor_respawn_move");
						};
					} else {
						if ((side BoostGuyUnit) isEqualTo resistance) then {
							"areaops" setMarkerColor "ColorIndependent";
							if ((paramsArray select 16) isEqualTo 1) then {
							"respawn_west" setMarkerPos (getMarkerPos "blufor_respawn_move");
							"respawn_east" setMarkerPos (getMarkerPos "opfor_respawn_move");
							"respawn_guerrila" setMarkerPos (getPos Radio);
								};
							} else {
									"areaops" setMarkerColor "ColorBlack";
									if ((paramsArray select 16) isEqualTo 1) then {
									"respawn_west" setMarkerPos (getMarkerPos "blufor_respawn_move");
									"respawn_east" setMarkerPos (getMarkerPos "opfor_respawn_move");
									"respawn_guerrila" setMarkerPos (getMarkerPos "indfor_respawn_move");
										};
									};
								};
							};
						};
					sleep 1.5;
				}; 

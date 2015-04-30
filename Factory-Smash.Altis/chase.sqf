_null = [] spawn {
   while {true} do {
      {_x doMove (getPosATL Radio); _x setBehaviour "AWARE"; _x setSpeedMode "FULL"} foreach playableUnits;
      sleep 10;
   };
};  
_null = [] spawn {
   while {true} do {
      {_x doMove (getPosATL Radio)} foreach playableUnits;
      sleep 10;
   };
};  
[] spawn 
{
	while{true} do
	{
		waitUntil {!alive player};

		0 fadeSound 0;
		
		0 fadeMusic 0;
		
		0 fadeSpeech 0;
		
		0 fadeRadio 0;
		
		titleText["", "BLACK OUT", 0.05];
		
		waitUntil {alive player};
		
		5 fadeSound 1;
		
		5 fadeMusic 1;
		
		5 fadeSpeech 1;
		
		5 fadeRadio 1;
		
		titleText["", "PLAIN", 5];
	};
};
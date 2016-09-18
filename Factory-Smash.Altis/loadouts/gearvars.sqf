if ((paramsArray select 22) isEqualTo 1) then {
	gunAndMagArrayRifleman = [
		["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_C_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_AKS_F","30Rnd_545x39_Mag_Tracer_F",""],
		["arifle_CTAR_blk_F","30Rnd_580x42_Mag_Tracer_F",""],
		["SMG_05_F","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",""],
		["arifle_AKM_F","30Rnd_762x39_Mag_Tracer_Green_F",""],
		["arifle_AK12_F","30Rnd_762x39_Mag_Tracer_F",""],
		["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag_Tracer_Yellow",""],
		["arifle_CTARS_blk_F","100Rnd_580x42_Mag_Tracer_F",""],
		["LMG_03_F","200Rnd_556x45_Box_Tracer_Red_F",""],
		["arifle_SPAR_02_snd_F","150Rnd_556x45_Drum_Mag_Tracer_F",""],
		["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F",""],
		["arifle_SPAR_03_khk_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_03_F","20Rnd_762x51_Mag",""],
		["srifle_EBR_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_06_camo_F","20Rnd_762x51_Mag",""]
	];
	gunAndMagArrayGrenadier = [
		["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green", ""],
		["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_MX_GL_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_GL_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_TRG21_GL_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_AK12_GL_F","30Rnd_762x39_Mag_Tracer_F",""],
		["arifle_CTAR_GL_blk_F","30Rnd_580x42_Mag_Tracer_F",""],
		["arifle_SPAR_01_GL_blk_F","30Rnd_556x45_Stanag_Tracer_Green",""],
		["arifle_SPAR_01_GL_khk_F","30Rnd_556x45_Stanag_Tracer_Green",""]
	];
	gunAndMagArrayJTAC = [
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green",""],
		["arifle_AKS_F","30Rnd_545x39_Mag_Tracer_F",""],
		["arifle_CTAR_blk_F","30Rnd_580x42_Mag_Tracer_F",""],
		["SMG_05_F","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",""],
		["arifle_AKM_F","30Rnd_762x39_Mag_Tracer_Green_F",""],
		["arifle_AK12_F","30Rnd_762x39_Mag_Tracer_F",""],
		["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag_Tracer_Yellow",""]
	];
	gunAndMagArrayMachinegunner = [
		["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",""],
		["arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer",""],
		["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer","_MG"],
		["arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer",""],
		["MMG_02_black_F","130Rnd_338_Mag",""],
		["MMG_01_tan_F","150Rnd_93x64_Mag",""],
		["arifle_CTARS_blk_F","100Rnd_580x42_Mag_Tracer_F",""],
		["LMG_03_F","200Rnd_556x45_Box_Tracer_Red_F",""],
		["arifle_SPAR_02_snd_F","150Rnd_556x45_Drum_Mag_Tracer_F",""]
	];
	gunAndMagArrayMarksman = [
		["srifle_DMR_06_olive_F","20Rnd_762x51_Mag",""],      
		["srifle_DMR_03_tan_F","20Rnd_762x51_Mag",""],        
		["srifle_DMR_02_sniper_F","10Rnd_338_Mag",""],        
		["srifle_DMR_05_tan_f","10Rnd_93x64_DMR_05_Mag",""],   
		["srifle_DMR_04_Tan_F","10Rnd_127x54_Mag",""],          
		["srifle_DMR_02_camo_F","10Rnd_338_Mag",""],
		["srifle_DMR_03_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_03_khaki_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_03_woodland_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_06_camo_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_02_F","10Rnd_338_Mag",""],
		["srifle_DMR_04_F","10Rnd_127x54_Mag",""],
		["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",""],
		["srifle_DMR_01_F","10Rnd_762x54_Mag",""],
		["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F",""],
		["arifle_SPAR_03_khk_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F",""],
		["arifle_SPAR_03_khk_F","20Rnd_762x51_Mag",""]
	];
	gunAndMagArrayRocketeer = [
		["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_C_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_AKS_F","30Rnd_545x39_Mag_Tracer_F",""],
		["arifle_CTAR_blk_F","30Rnd_580x42_Mag_Tracer_F",""],
		["SMG_05_F","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",""],
		["arifle_AKM_F","30Rnd_762x39_Mag_Tracer_Green_F",""],
		["arifle_AK12_F","30Rnd_762x39_Mag_Tracer_F",""],
		["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag_Tracer_Yellow",""]
	];
	gunAndMagArrayScout = [
		["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green",""],
		["hgun_PDW2000_F","30Rnd_9x21_Mag",""],
		["arifle_TRG20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_AKS_F","30Rnd_545x39_Mag_Tracer_F",""],
		["arifle_CTAR_blk_F","30Rnd_580x42_Mag_Tracer_F",""],
		["SMG_05_F","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",""],
		["arifle_AKM_F","30Rnd_762x39_Mag_Tracer_Green_F",""],
		["arifle_AK12_F","30Rnd_762x39_Mag_Tracer_F",""],
		["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag_Tracer_Yellow",""]
	];
} else {
	gunAndMagArrayRifleman = [
		["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_C_F","30Rnd_65x39_caseless_green_mag_Tracer",""]
	];
	gunAndMagArrayGenadier = [
		["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green", ""],
		["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_MX_GL_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_GL_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_TRG21_GL_F","30Rnd_556x45_Stanag_Tracer_Red",""]
	];
	gunAndMagArrayJTAC = [
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green",""]
	];
	gunAndMagArrayMachinegunner = [
		["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",""],
		["arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer",""],
		["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer","_MG"],
		["arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer",""],
		["MMG_02_black_F","130Rnd_338_Mag",""],
		["MMG_01_tan_F","150Rnd_93x64_Mag",""]
	];
	gunAndMagArrayMarksman = [
		["srifle_DMR_06_olive_F","20Rnd_762x51_Mag",""],      
		["srifle_DMR_03_tan_F","20Rnd_762x51_Mag",""],        
		["srifle_DMR_02_sniper_F","10Rnd_338_Mag",""],        
		["srifle_DMR_05_tan_f","10Rnd_93x64_DMR_05_Mag",""],   
		["srifle_DMR_04_Tan_F","10Rnd_127x54_Mag",""],          
		["srifle_DMR_02_camo_F","10Rnd_338_Mag",""],
		["srifle_DMR_03_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_03_khaki_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_03_woodland_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_06_camo_F","20Rnd_762x51_Mag",""],
		["srifle_DMR_02_F","10Rnd_338_Mag",""],
		["srifle_DMR_04_F","10Rnd_127x54_Mag",""],
		["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",""],
		["srifle_DMR_01_F","10Rnd_762x54_Mag",""]
	];
	gunAndMagArrayRocketeer = [
		["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MX_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
		["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
		["arifle_Katiba_C_F","30Rnd_65x39_caseless_green_mag_Tracer",""]
	];
	gunAndMagArrayScout = [
		["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red",""],
		["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green",""],
		["hgun_PDW2000_F","30Rnd_9x21_Mag",""],
		["arifle_TRG20_F","30Rnd_556x45_Stanag_Tracer_Red",""]
	];
};
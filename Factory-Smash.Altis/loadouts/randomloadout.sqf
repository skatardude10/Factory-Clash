_target = _this select 0;
_gunAndMagArray = [
	["arifle_MX_Black_F","30Rnd_65x39_caseless_mag",""],
	["srifle_EBR_F","20Rnd_762x51_Mag",""],
	["srifle_DMR_01_F","10Rnd_762x54_Mag",""],
	["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",""],
	["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
	["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
	["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
	["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer",""],
	["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Green",""],
	["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green","muzzle_snds_acp"],
	["arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer",""],
	["LMG_Mk200_F","200Rnd_65x39_cased_Box","_MG"]
];

_randomGunAndMagArray = _gunAndMagArray select (floor (random (count _gunAndMagArray)));

_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;
_supressor =  [_randomGunAndMagArray select 2,"",""]  call BIS_fnc_selectRandom;

_launcherAndMissileArray = [
	["launch_I_Titan_short_F","Titan_AP"],
	["launch_RPG32_F","RPG32_HE_F"],
	["launch_NLAW_F","NLAW_F"],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""]
];

_randomLauncherAndMissileArray = _launcherAndMissileArray select (floor (random (count _launcherAndMissileArray)));
_launcher = _randomLauncherAndMissileArray select 0;
_missile =  _randomLauncherAndMissileArray select 1;

_outfit = ["U_C_Poloshirt_blue","U_C_Poloshirt_stripped","U_O_PilotCoveralls","_NikosBody","U_OrestesBody","U_O_OfficerUniform_ocamo","U_I_CombatUniform","U_I_pilotCoveralls","U_I_GhillieSuit","U_IG_Guerilla1_1","U_IG_Guerilla3_2","U_BG_leader","U_C_Poor_1","U_NikosAgedBody","U_OG_Guerilla3_2","U_O_CombatUniform_oucamo","U_B_CombatUniform_mcam","U_B_GhillieSuit","U_B_Wetsuit","U_O_GhillieSuit","U_C_Poloshirt_salmon","U_I_CombatUniform_shortsleeve","U_Competitor","U_IG_Guerilla1_1","U_BG_Guerilla2_3","U_OG_Guerilla3_1"] call BIS_fnc_selectRandom;

_backpack = ["B_Carryall_khk","B_Carryall_cbr","B_Kitbag_cbr","B_Kitbag_rgr","B_FieldPack_blk_DiverExp","B_Bergen_sgg","B_Carryall_mcamo"] call BIS_fnc_selectRandom;

_goggles = ["G_Bandanna_oli","shemagh_faceD","shemagh_faceOD"] call BIS_fnc_selectRandom;

_vest = ["V_PlateCarrierGL_blk","V_PlateCarrierIAGL_oli","V_PlateCarrierGL_rgr","V_TacVest_camo","V_TacVestIR_blk","V_HarnessO_gry","V_BandollierB_oli"] call BIS_fnc_selectRandom;

_optic = ["optic_MRCO","optic_DMS","optic_Holosight","optic_Aco","optic_ACO_grn","optic_Hamr","optic_Arco","optic_AMS","optic_Nightstalker","optic_Nightstalker","optic_Aco_smg","optic_ACO_grn_smg"] call BIS_fnc_selectRandom;

_bipod = ["bipod_01_F_blk","bipod_03_F_blk","bipod_01_F_snd"] call BIS_fnc_selectRandom;

_hat = ["H_Cap_tan_specops_US","H_Bandanna_mcamo","H_Cap_usblack","H_Booniehat_khk_hs","H_Watchcap_khk","H_HelmetB_camo","H_HelmetIA_net","H_Cap_red","H_HelmetCrew_I","H_MilCap_gry","H_HelmetSpecO_blk","H_Shemag_olive","H_Shemag_tan","H_Shemag_khk","H_Beret_blk","H_Watchcap_khk","H_HelmetB_light_grass"] call BIS_fnc_selectRandom;

_face = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","NATOHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15"] call BIS_fnc_selectRandom;

_voice = ["Male01ENG","Male01ENGB","Male01GRE","Male02ENG","Male02ENGB","Male02GRE","Male03ENG","Male03ENGB","Male03GRE","Male04ENG","Male04ENGB","Male04GRE","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG"] call BIS_fnc_selectRandom; 







//General Arsenal Stuff with guns, magazines, vests, uniforms, and optics array selections amended//
comment "Remove existing items";
removeAllWeapons _target;
removeAllItems _target;
removeAllAssignedItems _target;
removeUniform _target;
removeVest _target;
removeBackpack _target;
removeHeadgear _target;
removeGoggles _target;

comment "Add containers";
_target forceAddUniform _outfit;
for "_i" from 1 to 5 do {_target addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {_target addItemToUniform _magazine;};
_target addVest _vest;
for "_i" from 1 to 4 do {_target addItemToVest _magazine;};
for "_i" from 1 to 2 do {_target addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_target addItemToVest "HandGrenade";};
_target addBackpack _backpack;
_target addHeadgear _hat;
for "_i" from 1 to 3 do {_target addItemToBackpack _missile;};
for "_i" from 1 to 2 do {_target addItemToBackpack _magazine;};
_target addGoggles _goggles;

comment "Add weapons";
_target addWeapon _gun;
_target addPrimaryWeaponItem _supressor;
_target addPrimaryWeaponItem "acc_pointer_IR";
_target addPrimaryWeaponItem _optic;
_target addPrimaryWeaponItem _bipod;
_target addWeapon "hgun_Rook40_F";
_target addWeapon _launcher;
_target addWeapon "Rangefinder";


comment "Add items";
_target linkItem "ItemMap";
_target linkItem "ItemCompass";
_target linkItem "ItemWatch";
_target linkItem "ItemRadio";
_target linkItem "NVGoggles_OPFOR";

comment "Set identity";
_target setFace _face;
_target setSpeaker _voice;

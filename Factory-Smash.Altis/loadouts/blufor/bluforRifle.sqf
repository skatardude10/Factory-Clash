
_target = _this select 0;
_gunAndMagArray = [
	["arifle_MX_Black_F","30Rnd_65x39_caseless_mag","muzzle_snds_H"],
	["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",""],
	["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer","muzzle_snds_H"],
	["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer","muzzle_snds_H"],
	["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer","muzzle_snds_H"],
	["arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer","muzzle_snds_H"],
	["LMG_Mk200_F","200Rnd_65x39_cased_Box","muzzle_snds_H_MG"],
	["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag",""],
	["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
	["arifle_TRG21_F","30Rnd_556x45_Stanag",""],
	["srifle_EBR_F","20Rnd_762x51_Mag",""],
	["arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer","muzzle_snds_H"]
];

_randomGunAndMagArray = _gunAndMagArray select (floor (random (count _gunAndMagArray)));

_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;




_outfit = ["U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_mcam_tshirt","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3"] call BIS_fnc_selectRandom;
_vest = ["V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp"] call BIS_fnc_selectRandom;
_backpack = ["B_Carryall_mcamo","B_Carryall_cbr"] call BIS_fnc_selectRandom;
_hat = ["H_HelmetB_camo","H_HelmetB_desert"] call BIS_fnc_selectRandom;
_goggles = ["G_Shades_Blue","G_Balaclava_combat","G_Bandanna_shades","G_Bandanna_khk","G_Bandanna_sport","G_Squares_Tinted","G_Shades_Blue","G_Bandanna_shades","G_Sport_BlackWhite","G_Tactical_Clear","G_Tactical_Black"] call BIS_fnc_selectRandom;



_optic = ["optic_MRCO","optic_Holosight","optic_Aco","optic_ACO_grn","optic_Hamr","optic_Arco","optic_Aco_smg","optic_ACO_grn_smg"] call BIS_fnc_selectRandom;

_bipod = ["bipod_01_F_blk","bipod_03_F_blk","bipod_01_F_snd"] call BIS_fnc_selectRandom;



_face = ["WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_22_a","WhiteHead_22_l","WhiteHead_22_sa"] call BIS_fnc_selectRandom;

_voice = ["Male01ENG","Male01ENGB","Male02ENG","Male02ENGB","Male03ENG","Male03ENGB","Male04ENG","Male04ENGB","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG"] call BIS_fnc_selectRandom; 






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
for "_i" from 1 to 4 do {_target addItemToBackpack _magazine;};
_target addGoggles _goggles;

comment "Add weapons";
_target addWeapon _gun;
_target addPrimaryWeaponItem "acc_pointer_IR";
_target addPrimaryWeaponItem _optic;
_target addPrimaryWeaponItem _bipod;
_target addWeapon "hgun_Rook40_F";
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

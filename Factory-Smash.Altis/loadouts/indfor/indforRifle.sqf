_target = _this select 0;
_gunAndMagArray = [
	["arifle_MX_Black_F","30Rnd_65x39_caseless_mag",""],
	["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",""],
	["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",""],
	["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer",""],
	["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer",""],
	["arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer",""],
	["LMG_Mk200_F","200Rnd_65x39_cased_Box","_MG"],
	["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag",""],
	["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",""],
	["arifle_TRG21_F","30Rnd_556x45_Stanag",""],
	["srifle_EBR_F","20Rnd_762x51_Mag",""],
	["arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer",""]
];

_randomGunAndMagArray = _gunAndMagArray select (floor (random (count _gunAndMagArray)));

_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;





_outfit = ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_BG_Guerilla1_1","U_BG_Guerrilla_6_1","U_I_OfficerUniform"] call BIS_fnc_selectRandom;
_vest = ["V_PlateCarrierIAGL_oli","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl"] call BIS_fnc_selectRandom;
_backpack = ["B_AssaultPack_dgtl","B_AssaultPack_rgr","B_Kitbag_sgg","B_FieldPack_oli","B_AssaultPack_blk"] call BIS_fnc_selectRandom;
_hat = ["H_Watchcap_camo","H_Watchcap_khk","H_Booniehat_dgtl","H_Cap_oli_hs","H_Cap_blk_Raven","H_MilCap_dgtl","H_Cap_headphones","H_Shemag_olive_hs"] call BIS_fnc_selectRandom;
_goggles = ["G_Balaclava_oli","G_Bandanna_oli","G_Shades_Green","G_Shades_Blue","G_Bandanna_sport","G_Balaclava_oli","G_Sport_Greenblack","G_Sport_Greenblack","G_Bandanna_oli","G_Spectacles_Tinted"] call BIS_fnc_selectRandom;



_optic = ["optic_MRCO","optic_Holosight","optic_Aco","optic_ACO_grn","optic_Hamr","optic_Arco","optic_Aco_smg","optic_ACO_grn_smg"] call BIS_fnc_selectRandom;

_bipod = ["bipod_01_F_blk","bipod_03_F_blk","bipod_01_F_snd"] call BIS_fnc_selectRandom;



_face = ["GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","GreekHead_A3_10_a","GreekHead_A3_10_l","GreekHead_A3_10_sa"] call BIS_fnc_selectRandom;

_voice = ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"] call BIS_fnc_selectRandom; 







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

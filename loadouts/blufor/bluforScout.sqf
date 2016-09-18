_target = _this select 0;
_randomGunAndMagArray = gunAndMagArrayScout select (floor (random (count gunAndMagArrayScout)));
_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;
_supressor =  _randomGunAndMagArray select 2;
_goggles = ["G_Bandanna_sport","G_Squares_Tinted","G_Shades_Blue","G_Bandanna_shades","G_Sport_BlackWhite","G_Tactical_Clear","G_Tactical_Black"] call BIS_fnc_selectRandom;
_outfit = ["U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam","U_I_G_Story_Protagonist_F","U_B_CTRG_1","U_B_CombatUniform_mcam_worn"] call BIS_fnc_selectRandom;
_vest = ["V_PlateCarrierGL_mtp","V_PlateCarrier2_blk","V_PlateCarrierSpec_mtp","V_PlateCarrier2_rgr","V_PlateCarrierGL_rgr","V_Chestrig_oli","V_PlateCarrierGL_blk"] call BIS_fnc_selectRandom;
_hat = ["H_MilCap_mcamo","H_HelmetB_light_black","H_Cap_tan_specops_US","H_Beret_02","H_Watchcap_camo","H_Cap_usblack","H_Cap_blk_ION"] call BIS_fnc_selectRandom;
_optic = ["optic_MRCO","optic_DMS","optic_Hamr","optic_Arco","optic_AMS","optic_Nightstalker"] call BIS_fnc_selectRandom;
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
for "_i" from 1 to 7 do {_target addItemToVest _magazine;};
for "_i" from 1 to 2 do {_target addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_target addItemToVest "HandGrenade";};
_target addHeadgear _hat;
_target addGoggles _goggles;

comment "Add weapons";
_target addWeapon _gun;
_target addPrimaryWeaponItem _supressor;
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

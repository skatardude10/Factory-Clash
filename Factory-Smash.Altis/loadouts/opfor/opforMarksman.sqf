_target = _this select 0;
_randomGunAndMagArray = gunAndMagArrayMarksman select (floor (random (count gunAndMagArrayMarksman)));
_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;
_outfit = ["U_C_Poloshirt_salmon","U_O_CombatUniform_ocamo","U_O_OfficerUniform_ocamo"] call BIS_fnc_selectRandom;
_vest = ["V_TacVest_khk","V_HarnessO_brn","V_Chestrig_khk"] call BIS_fnc_selectRandom;
_backpack = ["B_AssaultPack_ocamo","B_FieldPack_khk","B_Kitbag_cbr"] call BIS_fnc_selectRandom;
_hat = ["H_Cap_red","H_Cap_marshal","H_MilCap_ocamo"] call BIS_fnc_selectRandom;
_goggles = ["G_Bandanna_sport","G_Sport_Blackred","G_Shades_Red"] call BIS_fnc_selectRandom;
_optic = ["optic_MRCO","optic_Hamr","optic_Arco","optic_AMS","optic_DMS","optic_KHS_blk","optic_tws","optic_LRPS"] call BIS_fnc_selectRandom;
_bipod = ["bipod_01_F_blk","bipod_03_F_blk","bipod_01_F_snd"] call BIS_fnc_selectRandom;
_face = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa"] call BIS_fnc_selectRandom;
_voice = ["Male01PER","Male02PER","Male03PER"] call BIS_fnc_selectRandom; 

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
for "_i" from 1 to 2 do {_target addItemToBackpack _magazine;};
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

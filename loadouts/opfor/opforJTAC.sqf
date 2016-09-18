_target = _this select 0;
_randomGunAndMagArray = gunAndMagArrayJTAC select (floor (random (count gunAndMagArrayJTAC)));
_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;
_outfit = ["U_O_CombatUniform_oucamo","U_Marshal"] call BIS_fnc_selectRandom;
_vest = ["V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk","V_HarnessOGL_gry","V_Chestrig_blk"] call BIS_fnc_selectRandom;
_backpack = ["B_Carryall_oucamo","B_FieldPack_blk"] call BIS_fnc_selectRandom;
_hat = ["H_HelmetSpecO_blk","H_Cap_brn_SPECOPS","H_Watchcap_cbr"] call BIS_fnc_selectRandom;
_goggles = ["G_Balaclava_combat","G_Bandanna_shades"] call BIS_fnc_selectRandom;
_optic = ["optic_MRCO","optic_Holosight","optic_Aco","optic_ACO_grn","optic_Hamr","optic_Arco","optic_Aco_smg","optic_ACO_grn_smg"] call BIS_fnc_selectRandom;
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

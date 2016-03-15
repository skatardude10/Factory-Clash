_target = _this select 0;
//_nearRadio = getPos Radio nearObjects ["Man",5];
//if !(_target in _nearRadio) then {
_gunAndMagArray = [
    ["MMG_02_black_F","130Rnd_338_Mag",""], 
	["MMG_02_camo_F","130Rnd_338_Mag",""],
	["MMG_02_sand_F","130Rnd_338_Mag",""],
    ["MMG_01_tan_F","150Rnd_93x64_Mag",""],   
    ["srifle_DMR_06_olive_F","20Rnd_762x51_Mag",""],      
    ["srifle_DMR_03_tan_F","20Rnd_762x51_Mag",""],        
    ["srifle_DMR_02_sniper_F","10Rnd_338_Mag",""],        
    ["srifle_DMR_05_tan_f","10Rnd_93x64_DMR_05_Mag",""],   
    ["srifle_DMR_04_Tan_F","10Rnd_127x54_Mag",""],          
	["srifle_DMR_02_camo_F","10Rnd_338_Mag",""],
	["srifle_DMR_03_F","20Rnd_762x51_Mag",""],
	["srifle_DMR_03_khaki_F","20Rnd_762x51_Mag",""],
	["srifle_DMR_03_woodland_F","20Rnd_762x51_Mag",""],
	["srifle_DMR_02_F","10Rnd_338_Mag",""],
	["srifle_DMR_04_F","10Rnd_127x54_Mag",""],
	["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",""],
	["srifle_DMR_01_F","10Rnd_762x54_Mag",""]
];

_randomGunAndMagArray = _gunAndMagArray select (floor (random (count _gunAndMagArray)));
_gun = _randomGunAndMagArray select 0;
_magazine = _randomGunAndMagArray select 1;


_outfit = ["U_I_CombatUniform","U_BG_Guerilla2_3","U_BG_Guerilla2_2","U_BG_Guerrilla_6_1","U_C_Poloshirt_tricolour","U_C_HunterBody_grn","U_BG_leader","U_BG_Guerilla3_1"] call BIS_fnc_selectRandom;
_vest = ["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_TacVest_camo","V_TacVest_blk","V_PlateCarrierIA1_dgtl","V_I_G_resistanceLeader_F"] call BIS_fnc_selectRandom;
_backpack = ["B_AssaultPack_dgtl","B_AssaultPack_rgr","B_Kitbag_sgg","B_FieldPack_oli","B_AssaultPack_blk"] call BIS_fnc_selectRandom;
_hat = ["H_ShemagOpen_tan", "H_Booniehat_oli","H_Cap_blk_Raven","H_Shemag_olive_hs","H_Bandanna_sgg","H_Bandanna_gry","H_Shemag_olive","H_MilCap_dgtl","H_Booniehat_dgtl","H_Watchcap_camo","H_Cap_oli_hs"] call BIS_fnc_selectRandom;
_goggles = ["G_Bandanna_oli","G_Sport_Greenblack","G_Shades_Green","G_Bandanna_aviator","G_Bandanna_aviator"] call BIS_fnc_selectRandom;

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
//};
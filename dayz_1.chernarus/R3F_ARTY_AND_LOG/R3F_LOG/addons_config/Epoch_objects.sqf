/**
 * English
 *
 * This file adds the ArmA 2 and Arrowhead objetcs in the configuration variables of the logistics system.
 *
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of vehicles which can tow towable objects.
 */
R3F_LOG_CFG_remorqueurs = R3F_LOG_CFG_remorqueurs +
[
	"Ikarus",
	"Ural_Base_withTurret",
	"Kamaz_Base",
	"MTVR",
	"V3S_Base",
	"BRDM2_Base",
	"BTR90_Base",
	"LAV25_Base",
	"StrykerBase_EP1",
	"GAZ_Vodnik_HMG",
	"BTR40_MG_base_EP1",
	"HMMWV_Base",
	"LandRover_Base",
	"ArmoredSUV_Base_PMC",
	"SUV_Base_EP1",
	"TowingTractor"
];

/**
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables = R3F_LOG_CFG_objets_remorquables +
[
  "Ikarus",
	"Ural_Base_withTurret",
	"Kamaz_Base",
	"MTVR",
	"V3S_Base",
	"BRDM2_Base",
	"BTR90_Base",
	"LAV25_Base",
	"StrykerBase_EP1",
	"GAZ_Vodnik_HMG",
	"BTR40_MG_base_EP1",
	"HMMWV_Base",
	"LandRover_Base",
	"ArmoredSUV_Base_PMC",
	"SUV_Base_EP1",
	"UAZ_Base",
	"SkodaBase",
	"hilux1_civil_1_open",
	"Pickup_PK_base",
	"Offroad_DSHKM_base",
	"Lada_base",
	"TowingTractor",
	"VWGolf",
	"hilux1_civil_3_open_EP1",
	"S1203_TK_CIV_EP1",
	"Volha_TK_CIV_Base_EP1",
	"BAF_Jackal2_BASE_D"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftable objects.
 */
R3F_LOG_CFG_heliporteurs = R3F_LOG_CFG_heliporteurs +
[
	"CH47_base_EP1",
	"MV22_DZ",
	"BAF_Merlin_HC3_D",
  "Mi24_Base",
	"Mi17_base",
	"UH60_Base",
	"UH1_Base",
	"UH1H_base"
];

/**
 * List of class names of liftable objects.
 */
R3F_LOG_CFG_objets_heliportables = R3F_LOG_CFG_objets_heliportables +
[
  "Ikarus",
	"Ural_Base_withTurret",
	"Kamaz_Base",
	"MTVR",
	"V3S_Base",
	"BRDM2_Base",
	"BTR90_Base",
	"LAV25_Base",
	"StrykerBase_EP1",
	"GAZ_Vodnik_HMG",
	"BTR40_MG_base_EP1",
	"HMMWV_Base",
	"LandRover_Base",
	"ArmoredSUV_Base_PMC",
	"SUV_Base_EP1",
	"UAZ_Base",
	"SkodaBase",
	"hilux1_civil_1_open",
	"Pickup_PK_base",
	"Offroad_DSHKM_base",
	"Lada_base",
	"TowingTractor",
	"VWGolf",
	"hilux1_civil_3_open_EP1",
	"S1203_TK_CIV_EP1",
	"Volha_TK_CIV_Base_EP1",
	"BAF_Jackal2_BASE_D"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USSpecialWeaponsBox "weights" 5 units.
 *
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le r�f�rentiel arbitraire utilis� est : une caisse de munition de type USSpecialWeaponsBox "p�se" 5 unit�s.
 *
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportable objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs = R3F_LOG_CFG_transporteurs +
[
  ["C130J_US_EP1", 1000],
	["CH47_base_EP1", 360],
	["MV22_DZ", 180],
	["BAF_Merlin_HC3_D", 80],
  ["Mi24_Base", 40],
	["Mi17_base", 20],
	["UH60_Base", 20],
	["AH1_Base", 10],
	["AH64_base_EP1", 10],
	["Kamov_Base", 10],
	["UH1_Base", 10],
	["AH6_Base_EP1", 10],
	["UH1H_base",10],
	["Ka137_Base_PMC", 10],
	["Ka60_Base_PMC", 10],
	["AW159_Lynx_BAF", 10]
];

/**
 * List of class names of transportable objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 */
R3F_LOG_CFG_objets_transportables = R3F_LOG_CFG_objets_transportables +
[
	["MAZ_543_SCUD_Base_EP1", 600],
	["Ikarus", 500],
	["Ural_Base_withTurret", 500],
	["Kamaz_Base", 500],
	["MTVR", 500],
	["V3S_Base", 500],
	["BRDM2_Base", 250],
	["BTR90_Base", 250],
	["LAV25_Base", 250],
	["StrykerBase_EP1", 250],
	["GAZ_Vodnik_HMG", 200],
	["BTR40_MG_base_EP1", 200],
	["HMMWV_Base", 180],
	["LandRover_Base", 180],
	["ArmoredSUV_Base_PMC", 180],
	["SUV_Base_EP1", 180],
	["UAZ_Base", 160],
	["SkodaBase", 160],
	["hilux1_civil_1_open", 160],
	["Pickup_PK_base", 160],
	["Offroad_DSHKM_base", 160],
	["Lada_base", 160],
	["TowingTractor", 160],
	["VWGolf", 160],
	["hilux1_civil_3_open_EP1", 160],
	["S1203_TK_CIV_EP1", 160],
	["Volha_TK_CIV_Base_EP1", 160],
	["BAF_Jackal2_BASE_D", 160],
	["ATV_Base_EP1", 40],
	["M1030_base", 20],
	["TT650_Base", 20],
	["Old_moto_base", 20],
	["MMT_base", 10],
	["Old_bike_base_EP1", 10]
];


/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/
//test
/**
 * List of class names of objects moveable by player.
 */
R3F_LOG_CFG_objets_deplacables = R3F_LOG_CFG_objets_deplacables +
[
	"MMT_Civ",
	"Old_bike_TK_INS_EP1",
	"CSJ_GyroC",
	"CSJ_GyroCover"
];
if (!isServer) exitwith {};
private ["_sqdPool","_unit","_i","_faction","_InfPool","_tempArray","_type","_diverPool","_ArmPool","_MotPool","_ACHPool","_CHPool","_uavPool","_shipPool","_stPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];
_i=0;
switch (_faction) do
{
	case 0:{
// EAST CSAT FACTION
	_InfPool=	["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];	
	_ArmPool=	["O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F"];
	_MotPool=	["O_Truck_02_covered_F","O_Truck_02_transport_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"];
	_ACHPool=	["O_Heli_Attack_02_F"];
	_CHPool=	["O_Heli_Light_02_F"];
	_uavPool=	["O_UAV_01_F","O_UAV_02_CAS_F","O_UGV_01_rcws_F"];
	_stPool=	["O_Mortar_01_F","O_static_AA_F"];
	_shipPool=	["O_Boat_Armed_01_hmg_F"];
	_diverPool=	["O_diver_exp_F","O_diver_F","O_diver_TL_F"];
	};
// WEST NATO FACTION
	case 1:{
	_InfPool=	["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F","B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];	
	_ArmPool=	["B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_02_cannon_F"];
	_MotPool=	["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"];
	_ACHPool=	["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"];
	_CHPool=	["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];
	_uavPool=	["B_UAV_01_F","B_UAV_01_CAS_F","B_UGV_01_rcws_F"];
	_stPool=	["B_Mortar_01_F","B_static_AT_F","B_static_AA_F"];
	_shipPool=	["B_Boat_Armed_01_hmg_F","B_Boat_Transport_01_F"];
	_diverPool=	["B_diver_exp_F","O_diver_F","B_diver_TL_F"];
	};
// INDEPENDENT AAF FACTION
	case 2:{
	_InfPool=	["I_engineer_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_exp_F","I_soldier_F","I_Soldier_GL_F","I_Soldier_repair_F"];	
	_ArmPool=	["I_APC_Wheeled_03_cannon_F"];
	_MotPool=	["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_medical_F"];
	_ACHPool=	[];
	_CHPool=	["I_Heli_Transport_02_F","B_Heli_Light_02_unarmed_F"];
	_uavPool=	["I_UAV_01_F","I_UAV_02_CAS_F","I_UGV_01_rcws_F"];
	_stPool=	["I_Mortar_01_F"];
	_shipPool=	["I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","I_Boat_Armed_01_minigun_F"];
	_diverPool=	["I_diver_exp_F","I_diver_F","I_diver_TL_F"];
	};
// CIVILIAN
	case 3:{
	_InfPool=	["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_pilot_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];	
	_ArmPool=	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Quadbike_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
	_MotPool=	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Quadbike_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	["C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_04_F","C_Rubberboat"];
	_diverPool=	[];
	};
// WEST FIA FACTION
	case 4:{
	_InfPool=	["B_G_engineer_F","B_G_medic_F","B_G_officer_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_Soldier_exp_F","B_G_Soldier_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","B_G_Soldier_M_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"];	
	_ArmPool=	[];
	_MotPool=	["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Van_01_transport_F","B_G_Van_01_fuel_F"];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	["B_G_Mortar_01_F"];
	_shipPool=	["B_G_Boat_Transport_01_F"];
	_diverPool=	[];
	};
// ADD CLASSNAMES 
	case 5:{
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	};
// ADD CLASSNAMES
	case 6:{
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	};
	case 7:{
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	};
};
switch (_type) do
{
	case 0:{_sqdPool=[];for "_i" from 0 to 5 do{_unit=_InfPool select (floor(random(count _InfPool)));_sqdPool = _sqdPool + [_unit];};_tempArray=_sqdPool;};
	case 1:{_tempArray=_diverPool};
	case 2:{_sqdPool=[];for "_i" from 0 to 5 do{_unit=_InfPool select (floor(random(count _InfPool)));_sqdPool = _sqdPool + [_unit];};_tempUnit=_shipPool select (floor(random(count _shipPool)));_temparray= _temparray + [_tempUnit];_temparray= [_temparray] + [_sqdPool];};
	case 3:{_sqdPool=[];for "_i" from 0 to 5 do{_unit=_InfPool select (floor(random(count _InfPool)));_sqdPool = _sqdPool + [_unit];};_tempUnit=_MotPool select (floor(random(count _MotPool)));_temparray= _temparray + [_tempUnit];_temparray= [_temparray] + [_sqdPool];};
	case 4:{_tempArray=_ArmPool select (floor(random(count _ArmPool)));};
	case 5:{_tempArray=_ACHPool select (floor(random(count _ACHPool)));};
	case 6:{_sqdPool=[];for "_i" from 0 to 5 do{_unit=_InfPool select (floor(random(count _InfPool)));_sqdPool = _sqdPool + [_unit];};_tempUnit=_CHPool select (floor(random(count _CHPool)));_temparray= _temparray + [_tempUnit];_temparray= [_temparray] + [_sqdPool];};
	case 7:{_tempArray=_stPool select (floor(random(count _stPool)));};
	case 8:{_tempArray=_uavPool select (floor(random(count _uavPool)));};
};

//hint format ["%1",_tempArray];
_tempArray
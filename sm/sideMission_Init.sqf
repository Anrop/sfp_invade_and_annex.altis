
private ["_smDelay","_seaSidemkrArray","_seaSmType","_answer","_smCount","_smLimit","_sideActive","_currentSM","_objectListArray","_currentSMType","_object","_enemyType","_EOSspawnDistance"];
if (!isServer) exitwith {};

_smDelay=(_this select 0);

_seaSidemkrArray=["sm1","sm2","sm3","sm4","sm5","sm6","sm7","sm8","sm9","sm10","sm11","sm12","sm13","sm14","sm15","sm16","sm17"];
{ _x setMarkerAlpha 0; } count _seaSidemkrArray;
_objectListArray=[smSeaObject1,smSeaObject2];
_seaSmType=["sm\UrbanDestroy.sqf"];
_answer=[true,false];

_smCount = 0;
_smLimit = (count _seaSidemkrArray);//SET IN DESCRIPTION

_sideActive=true;

while {_sideActive} do {
sleep _smDelay;

		if ((count _seaSidemkrArray) == 0) exitwith {_sideActive=false; };
		if (_smCount == _smLimit) exitwith {_sideActive=false;};
			_currentSMType=_seaSmType select (floor(random(count _seaSmType)));
			_currentSM=_seaSidemkrArray select (floor(random(count _seaSidemkrArray)));
			_seaSidemkrArray=_seaSidemkrArray - [_currentSM];
			_object=_objectListArray select (floor(random(count _objectListArray)));
		SM_COMPLETE=false;
		null =[_currentSM,_object] execVM
                        _currentSMType;
			_enemyType=0;
			_EOSspawnDistance=1000;
		[[_currentSM],[6,1],[6,1],[1,2],[0,0,0,0],[5,1,1200,EAST]] call EOS_Spawn;
		sleep 5;
		[[_currentSM],[3,1],[3,1],[0,0],[0,0,0,0],[3,1,1200,EAST]] call EOS_Spawn;

	waituntil {SM_COMPLETE};
		[] call AW_fnc_rewardPlusHint;
		_smCount=_smCount + 1;
			"SM_Marker" setMarkerPos [-10000,-10000,-10000];
			{
			_x setpos [0,0,0];
			}foreach _objectListArray;
			sleep 60;
			[[_currentSM]] call EOS_deactivate;
};

/*
	File: fn_accList.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Compiles a list of compatible attachments, first checks to see whether or not
	the new compatibleItmes class structure is in use, if it is it uses that list..
	Otherwise it switches to old style method.
*/
private["_weapon","_configInfo","_items","_badItems"];
_weapon = [_this,0,"",[""]] call BIS_fnc_param;
if(_weapon == "") exitWith {[]};

_configInfo = [_weapon,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
if(count _configInfo == 0) exitWith {[]};
if(count (_configInfo select 14) > 0) then {
	_items = [];
	_badItems = [];
	{
		_config = configFile >> "CfgWeapons" >> _data >> "WeaponSlotsInfo" >> _x >> "compatibleItems";
		for "_i" from 0 to count(_config)-1 do
		{
			_entry = _config select _i;
			if(getNumber(_entry) == 0) then {
				if(!((configName _entry) in _badItems)) then {
					_badItems set[count _badItems,(configName _entry)];
				};
			} else {
				_items set[count _items,(configName _entry)];
			};
		};

		if(count _badItems > 0) then {
			_parent = inheritsFrom _config;
			for "_i" from 0 to count(_parent)-1 do
			{
				_entry = _parent select _i;
				if(!((configName _entry) in _badItems)) then {
					_items set[count _items,(configName _entry)];
				};
			};
		};
	} foreach (_configInfo select 14);
	
	_items = _items + (_configInfo select 12);
} else {
	_items = ((_configInfo select 10) + (_configInfo select 11) + (_configInfo select 12));
};

_items;
/*
 * Siirrä alueella olevat objektit uuteen paikkaa
 *
 * 0: Mistä sijainnista siirretään <OBJECT, POSITION>
 * 1: Mihin sijaintiin siirretään <OBJECT, POSITION>
 * 2: Siirrettävän alueen koko <NUMBER>
 * 3: Siirrettävien objektien tyypit <ARRAY,STRING> (valinnainen)
 *
 * Esimerkki:
 * [
 *      start,
 *      destination,
 *      50,
 *      []
 * ] call kuikka_fnc_moveObjects;
 */

params [
    ["_startPos", [], [objNull, []]],
    ["_destPos", [], [objNull, []]],
    ["_range", 50, [50]],
    ["_types", [], [[],""]]
];

if(typeName _startPos == "OBJECT" && {isNull _startPos}) exitWith {
    ["Annettu objekti %1 on null!", str _startPos] call BIS_fnc_error;
};

if(typeName _destPos == "OBJECT" && {isNull _destPos}) exitWith {
    ["Annettu objekti %1 on null!", str _destPos] call BIS_fnc_error;
};

if (_startPos isEqualType objNull) then {_startPos = getPos _startPos};
if (_destPos isEqualType objNull) then {_destPos = getPos _destPos};
if (_types isEqualType "") then {_types = [_types]};

private _objects = nearestobjects [_startPos,_types,_range];

_startPos params ["_startX", "_startY"];
_destPos params ["_destX", "_destY"];

{
  private _objPos = getPos _x;
  _objPos params ["_objPosX", "_objPosY"];

  private _dir = (_objPosX - _startX) atan2 (_objPosY - _startY);
  private _dist = _startPos distance _objPos;

  _x setPos [(_destX + (_dist * sin _dir)), (_destY + (_dist * cos _dir)), 0];
} foreach _objects;

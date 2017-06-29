/*
 * Sammuta/käynnistä valot tietyltä alueelta
 *
 * 0: Sijainti <POSITION, OBJECT, STRING>
 * 1: Alue <NUMBER>
 * 2: Muutos <BOOL> (true = käynnistä, false = sammuta)
 *
 * Esimerkki:
 * [
 *      "city1marker",
 *      500,
 *      false
 * ] call kuikka_fnc_lightSwitch;
 */

params [
    ["_pos", [], [[], objNull, ""]],
    ["_area", 50, [0]],
    ["_turnOn", true, [true]]
];

if(_pos isEqualType objNull) then {_pos = getPos _pos};
if(_pos isEqualType "") then {_pos = getMarkerPos _pos};

if(count _pos < 3) exitWith {
  ["Virheellinen sijainti annettu! Anettu sijainti: %1", _pos] call BIS_fnc_error;
};
if(_area <= 0) exitWith {
  ["Alueen tulee olla suurempi kuin 0! Annettu alue: %1", _area] call BIS_fnc_error;
};

{
  {
    _x setDamage ([0.95, 0] select _turnOn);
  } forEach (_pos nearObjects [_x, _area]);
} forEach ["Lamps_Base_F", "PowerLines_base_F"];

/*
 * Helppo tapa luoda latauspalkki omiin skripteihin
 *
 * 0: Latauspalkin aika <NUMBER>
 * 1: Latausplakin teksti <STRING>
 * 2: Ajettava koodi onnistumisessa <CODE>
 * 3: Ajettava koodi epäonnistumisessa <CODE>
 * 4: Lisättävät argumentit ajettaviin koodeihin <ARRAY>
 * 5: Tarkistuskoodi <CODE>
 *
 * Esimerkki:
 * [
 *      5,
 *      "Odotetaan respawnia",
 *      {hint "Respawn onnistui!"},
 *      {hint "Respawn epäonnistui!"},
 *      [],
 *      {true}
 * ] call kuikka_fnc_progressBar;
 */

params [
    ["_time", -1, [0]],
    ["_text", "", [""]],
    ["_onSuccess", {}, [{}]],
    ["_onFailure", {}, [{}]],
    ["_arguments", [], [[]]],
    ["_condition", {true}, [{}]]
];

if(_time < 0) exitWith {["Aika on pienempi kuin 0! Annettu aika: %1", _time] call BIS_fnc_error};
if(_text == "") exitWith {["Teksti on tyhjä! Joku teksti tarvitaan kertomaan mitä tehdään"] call BIS_fnc_error};
if(typeName (call _condition) != "BOOL") exitWith {["Annettu tarkistuskoodi ei palauta boolean arvoa (true/false)!"] call BIS_fnc_error};

[_time, _arguments, _onSuccess, _onFailure, _text] call ace_common_fnc_progressBar;

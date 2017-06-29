/*
 * Helppo tapa luoda ace valikkoon nappi omille skripteille
 *
 * 0: Valikon ID (Pitää olla uniikki!) <STRING>
 * 1: Valikon teksti <STRING>
 * 2: Ajettava koodi <CODE>
 * 3: Tarkistuskoodi (true näyttää valikon) <CODE>
 * 4: Objketi johon valikko lisätään <ARRAY>
 * 5: Ace valikon actionit (missä kohtaa se näkyy valikossa, ei suositella muutettavan) <CODE>
 *
 * Esimerkki:
 * [
 *      "valitseid",
 *      "Valitse tämä",
 *      {hint "Onnistuit valitsemaan tämän!"},
 *      {true},
 *      player,
 *      ["ACE_MainActions"]
 * ] call kuikka_fnc_addMenuAction;
 */


params [
    ["_id", "", [""]],
    ["_text", "", [""]],
    ["_codeToRun", {}, [{}]],
    ["_condition", {}, [{}]],
    ["_attachTo", objNull, [objNull]],
    ["_actions", ["ACE_MainActions"], [[]]]
];

if(_id == "") exitWith {["Uniikki id valikolle tarvitaan!", _id] call BIS_fnc_error};
if(_text == "") exitWith {["Teksti tarvitaan kertomaan mitä valikko tekee!"] call BIS_fnc_error};
if((call _condition) isEqualType true) exitWith {["Koodin tulee palauttaa true tai false!"] call BIS_fnc_error};
if(isNull _attachTo) exitWith {["Annettu objekti on tyhjä!"] call BIS_fnc_error};

private _addedAction = [_id, _text, '', _codeToRun, _condition] call ace_interact_menu_fnc_createAction;
[_attachTo, 0, _actions, _addedAction] call ace_interact_menu_fnc_addActionToObject;

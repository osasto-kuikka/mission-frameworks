/*
 * Lisää ajettava skripti kun pelaajan inventory muuttuu
 *
 * 0: Ajettava koodi <STRING>
 *
 * Esimerkki:
 * inventorychangedID = [{ hint "inventorysi muuttui!" }] call kuikka_fnc_addOnInventoryChanged;
 *
 * Palauttaa:
 * Event ID <NUMBER>
 */

params [["_code", {}, [{}]]];

["playerInventoryChanged", _code] call ace_common_fnc_addEventHandler;

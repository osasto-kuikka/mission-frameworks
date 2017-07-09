/*
 * Poist inventory muutos skripti
 *
 * 0: Event ID <NUMBER>
 *
 * Esimerkki:
 * [inventorychangedID] call kuikka_fnc_removeOnInventoryChanged;
 */

params [["_id", -1, [0]]];

if(_id == -1) exitWith {["Virheellinen ID! 'playerInventoryChanged' eventtiä ei voitu poistaa!"] call BIS_fnc_error};

["playerInventoryChanged", _id] call ace_common_fnc_removeEventHandler;

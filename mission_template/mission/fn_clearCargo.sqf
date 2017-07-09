/*
 * Tyhjentään ajoneuvon/objektin inventoryn
 * Tätä skriptiä ei ole tarvetta muokata.
 *
 * Ajoneuvon/ammoboxin init riville laitettava koodi:
 * this call mission_fnc_clearCargo;
 */

// Vain server voi ajaa tämän skriptin
if(isServer) exitWith {};

params [["_target", objNull, [objNull]]];

// Tyhjennetään inventory
clearMagazineCargoGlobal _target;
clearWeaponCargo _target;
clearItemCargoGlobal _target;
clearBackpackCargoGlobal _target;

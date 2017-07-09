/*
 * Skriptit, jotka ajetaan kun pelaaja respawnaa
 */

/**************************************************/
// ÄLÄ MUOKKAA
params ["_newUnit", "_oldUnit"];
/**************************************************/

/**************************************************/
// Lataa pelaajalle tallennettu inventory
[_newUnit, [missionNamespace, "kuikka_inventory"]] call BIS_fnc_loadInventory;
/**************************************************/

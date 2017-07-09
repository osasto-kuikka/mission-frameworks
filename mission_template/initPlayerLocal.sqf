/*
 * Skriptit, jotka pelaaja ajaa
 */

/**************************************************/
// ÄLÄ MUOKKAA
params ["_player", "_JIP"];

// Koska headless ajaa myös tämän niin poistetaan se heti alussa ja ajetaan sille initHeadless
if(!hasInterface) exitWith { [_player, _JIP] call compile preprocessFile "initHeadless.sqf"; };

// Aja briefing pelaajalle
_player call mission_fnc_briefing;
/**************************************************/

/**************************************************/
// Yleisiä suositeltuja arma asetuksia
// Ottaa radio chatterit pois
enableRadio false;    //Ottaa radio chatterit pois
// Hiljennä pelin radiot
0 fadeRadio 0;
// Salli lauseet
enableSentences false;
// Estä keskustelu
_player disableConversation true;
// Salli tallennus
enableSaving [false, false];
/**************************************************/

/**************************************************/
// Tallenna pelaajan inventory
[_player, [missionNamespace, "kuikka_inventory"]] call BIS_fnc_saveInventory;
/**************************************************/

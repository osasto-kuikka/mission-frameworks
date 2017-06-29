/*
 * Skriptit, jotka headless ajaa
 */

/**************************************************/
// ÄLÄ MUOKKAA
params ["_headless", "_JIP"];

// Aseta headless paikalla olevaksi
if(isNil "HCPresent") then { HCPresent = true; publicVariable "HCPresent"; };

// Tallenna headlessiin nimi
if(isNil "HCName") then { HCName = name _headless; publicVariable "HCName"; };
/**************************************************/

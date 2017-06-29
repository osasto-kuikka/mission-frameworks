/*
 * Skriptit, jotka headless ajaa
 */

/**************************************************/
// ÄLÄ MUOKKAA
params ["_headless", "_JIP"];

HCPresent = true;
publicVariable "HCPresent";

if(isNil "HCName") then { HCName = name _headless; publicVariable "HCName"; };
/**************************************************/
/*
 * Ajetaan joka ammoboxin/ajoneuvon initissä
 *
 * Init riville laitettava koodi:
 * [this, "ROOLI/LOADOUT"] call mission_fnc_loadoutVehicle;
 *
 * Esim
 * [this, "example"] call mission_fnc_loadoutVehicle;
 */

/**************************************************/
// Älä muokkaa

// Vain server voi ajaa tämän skriptin!
if(!isServer) exitWith {};

params [
    ["_vehicle", objNull, [objNull]],
    ["_role", "", [""]]
];

switch(_role) do {
/**************************************************/
    case "example": {
        // Tyhjennetään inventory
        clearMagazineCargoGlobal _vehicle;
        clearWeaponCargo _vehicle;
        clearItemCargoGlobal _vehicle;
        clearBackpackCargoGlobal _vehicle;

        // Lisätään ammuksia
        _vehicle addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 15];
        _vehicle addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];
        _vehicle addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 5];
        _vehicle addMagazineCargoGlobal ["rhs_fim92_mag", 2];

        // Lisätään itemeitä
        _vehicle additemCargoGlobal ["ACE_morphine",10];
        _vehicle additemCargoGlobal ["ACE_epinephrine",10];
        _vehicle additemCargoGlobal ["ACE_bloodIV",4];
        _vehicle additemCargoGlobal ["ACE_packingBandage",10];
        _vehicle additemCargoGlobal ["ACE_plasmaIV",4];
        _vehicle additemCargoGlobal ["ACE_personalAidKit",4];

        // Lisätään reppuja
        _vehicle addbackpackcargoGlobal ["rhsusf_assault_eagleaiii_ocp", 3];
    };
/**************************************************/
// Älä muokkaa
};
/**************************************************/

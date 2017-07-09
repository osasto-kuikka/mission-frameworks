/*
 * Määrittää missions funktiot
 */

// Nimi
class mission {
    // Tarvittava ylimääräinen luokka määritys (bohemia plz!)
    class mission {
        // Mistä kansiosta skriptit löytyvät
        // Voidaan käyttää myös polkua, kuten "missions\kuikka" jos skriptit ovat siellä
        file = "mission";

        // Määrittelee skripti tiedostot
        // briefing tpauksessa tiedoston nimen tulee olla fn_briefing.sqf
        // Skripti voidaan nyt ajaa *nimi*_fnc_*skripti* (esim. mission_fnc_briefing)
        class briefing;
        class loadoutVehicle;
        class clearCargo;
    };
};

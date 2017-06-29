/*
 * Spawnaa annettujen spawn markerien määrästä riippuen ryhmiä ja lähettää ne hyökkäämään annettuun markkeriin
 *
 * 0: Attack markkerit <ARRAY, STRING>
 * 1: Spawn markkerit <ARRAY, STRING>
 * 2: Ryhmän config sijainnit <ARRAY, CONFIG>
 * 3: Ryhmän puoli <SIDE>
 * 4: Kuinka monta ryhmää spawnataan <NUMBER>
 * 5: Siirretään unitit lähimpään ajoneuvoon <BOOL>
 * 6: Poistetaan käytetyt attack markkerit taulusta <BOOL>
 * 7: Poistetaan käytetyt spawn markkerit taulusta <BOOL>
 * 8: Poistetaan käytetyt ryhmät taulusta <BOOL>
 *
 * Esimerkki:
 * [
 *      ["attackmarker1", "attackmarker2"],
 *      ["spawnmarker1", "spawnmarker2"],
 *      (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad"),
 *      EAST,
 *      1,
 *      true,
 *      false,
 *      false,
 *      false
 * ] call kuikka_fnc_groupSpawn;
 */

if !(isServer) exitWith {};

params [
    ["_attackMarkers", "", ["", []]],
    ["_spawnMarkers", "", ["", []]],
    ["_groups", [], [configFile, [], 0]],
    ["_side", EAST , [EAST]],
    ["_amount", 1, [0]],
    ["_toVehicle", false, [false]],
    ["_removeAttack", false, [false]],
    ["_removeSpawn", false, [false]],
    ["_removeGroup", false, [false]]
];

// Tarkistetaan pakolliset arvot
if(_attackMarkers isEqualTo "") exitWith { hint "Attack markkeria ei määritetty" };
if(_spawnMarkers isEqualTo "") exitWith { hint "Spawn markkeria ei määritetty" };
if(_groups isEqualTo []) exitWith { hint "Group array on tyhjä" };


if(typeName _attackMarkers != "ARRAY") then {
    // Muutetaan yksittäinen spawn markkeri taulukoksi helpomman käsittelyn takia
    _attackMarkers = +[_attackMarkers];
} else {
    // Kopioidaan annettu taulukko, jotta muutokset eivät vaikuta alkuperäiseen tauluun
    _attackMarkers = +_attackMarkers;
};

// Muutetaan yksittäinen spawn markkeri taulukoksi helpomman käsittelyn takia
if(typeName _spawnMarkers != "ARRAY") then {
    _spawnMarkers = +[_spawnMarkers];
} else {
    // Kopioidaan annettu taulukko, jotta muutokset eivät vaikuta alkuperäiseen tauluun
    _spawnMarkers = +_spawnMarkers;
};

// Muutetaan yksittäinen ryhmä taulukoksi helpomman käsittelyn takia
if(typeName _groups != "ARRAY") then {
    _groups = +[_groups];
} else {
    // Jos halutaan array tyyppinen ryhmä eri miehiä
    // lisätietoa: https://community.bistudio.com/wiki/BIS_fnc_spawnGroup
    if(typeName (_groups select 1) == "STRING") then {
        _groups = +[_groups];
    } else {
        // Kopioidaan annettu taulukko, jotta muutokset eivät vaikuta alkuperäiseen tauluun
        _groups = +_groups;
    };
};

for "_i" from 1 to _amount do {
    // Jos taulukko tyhjä niin poistu loopista
    if(count _attackMarkers == 0 ||
       count _spawnMarkers == 0 ||
       count _groups == 0) exitwith {};

    // Random numerot taulujen koosta
    private _attackNum = floor (random (count _attackMarkers));
    private _spawnNum = floor (random (count _spawnMarkers));
    private _groupNum = floor (random (count _groups));

    // Valitse arma numeron perusteella
    private _attack = _attackMarkers select _attackNum;
    private _spawn = _spawnMarkers select _spawnNum;
    private _group = _groups select _groupNum;

    // Jos poistetaan attack markkereita niin poistetaan vain taulukosta jossa on enemmän kuin 1
    if(_removeAttack && {count _attackMarkers > 1}) then {
        _attackMarkers deleteAt _attackNum;
    };

    // Jos poistetaan spawn markkereita niin poistetaan vain taulukosta jossa on enemmän kuin 1
    if(_removeSpawn && {count _spawnMarkers > 1}) then {
        _spawnMarkers deleteAt _spawnNum;
    };

    // Jos poistetaan ryhmiä niin poistetaan vain taulukosta jossa on enemmän kuin 1
    if(_removeGroup && {count _groups > 1}) then {
        _groups deleteAt _groupNum;
    };

    // Spawnataan ryhmä ja käsketään se hyökkäämään
    private _groupSpawned = [getMarkerPos _spawn, _side, _group] call BIS_fnc_spawnGroup;

    // Käy läpi ryhmän unitit
    {
        // Siirrä unitit ajoneuvoon
        if(_toVehicle) then {
            private _vehicle = nearestObject [_x, "LandVehicle"];

            // Siirrä vain ajoneuvon ulkopuolella olevat
            if !(vehicle _x isEqualTo _vehicle) then {
                _x moveInCargo _vehicle;
            };
        };
    } forEach (units _groupSpawned);


    [
        _groupSpawned,
        (getMarkerPos _attack),
        100,
        "MOVE",
        "AWARE",
        "YELLOW",
        "FULL",
        "STAG COLUMN",
        "this spawn CBA_fnc_searchNearby"
    ] call CBA_fnc_addWaypoint;
};

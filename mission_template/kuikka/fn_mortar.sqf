/*
 * Random mortarit ampuvat random kohteisiin
 *
 * Parametrit:
 * 1. Ampumakierrokset <NUMBER>
 * 2. Mortarit <ARRAY, OBJECT>
 * 3. Kohteet <ARRAY, OBJECT>
 * 4. Alue <NUMBER>
 * 5. Ammusten määrä <NUMBER>
 * 6. Odotusaika <NUMBER>
 *
 * Esimerkki:
 * [
 *     5, // Kuinka monta kertaa ammutaan
 *     [mortar1, mortar2], // Mitkä mortarit ampuvat
 *     [target1, target2], // Mihin kohteisiin ammutaan
 *     50, // Mille alueelle kohteen ympärille
 *     5, // Kuinka monta ammusta mortar ampuu
 *     2 // Kuinka kauan odotetaan ampumisten välissä
 * ] call kuikka_fnc_mortar;
 */

if !(isServer) exitWith {};

params [
    ["_rounds", 1, [0]],
    ["_mortars", [], [[], objNull]],
    ["_targets", [], [[], objNull]],
    ["_radius", 0, [0]],
    ["_shotsPerUnit", 0, [0]],
    ["_waitTime", 0, [0]]
];

// Korvaa objekti taulukolla
if(typeName _mortars != "ARRAY") then { _mortars = [_mortars]; };
if(typeName _targets != "ARRAY") then { _targets = [_targets]; };

// Poista taulukosta kaikki ei objektit
_mortars = _mortars select {typeName _x == "OBJECT"};
_targets = _targets select {typeName _x == "OBJECT"};

// Tee tarkistukset parametereille
if(_rounds <= 0) exitWith { ["Ammuskierrosten määrä on 0 tai vähemmän!"] call BIS_fnc_error; };
if(_radius <= 0) exitWith { ["Alue on 0 tai vähemmän!"] call BIS_fnc_error; };
if(_shotsPerUnit <= 0) exitWith { ["Ammutavien laukausten määrä on 0 tai vähemmän!"] call BIS_fnc_error; };

if(count _mortars == 0) exitWith { ["Mortar taulukkko on tyhjä tai se ei sisällä yhtään objektia!"] call BIS_fnc_error; };
if(count _targets == 0) exitWith { ["Kohde taulukkko on tyhjä tai se ei sisällä yhtään objektia!"] call BIS_fnc_error; };

// Aja spawnissa, jotta voidaan käyttää sleeppiä
[_rounds, _mortars, _targets, _radius, _waitTime, _shotsPerUnit] spawn {
    params ["_rounds","_mortars","_targets","_radius","_waitTime","_shotsPerUnit"];

    // Aja for loop ammusten määrän ajan
    for "_i" from 1 to _rounds do {
        // Valitse mortar ja kohdesijaint
        private _mortar = selectRandom _mortars;
        private _center = getPos (selectRandom _targets);

        for "_j" from 1 to _shotsPerUnit do {
            // Lisää randomisointi kohteen ympäristöön
            private _pos = [
                (_center select 0) - _radius + (2 * random _radius),
                (_center select 1) - _radius + (2 * random _radius),
                0
            ];

            // Käske mortarin ampua kohteeseen
            _mortar doArtilleryFire [
                _pos,
                getArtilleryAmmo [_mortar] select 0,
                1
            ];

            // Estää liian nopean ampumisen 
            sleep 3;
        };

        // Odota annettu aika
        sleep _waitTime;
    };
};

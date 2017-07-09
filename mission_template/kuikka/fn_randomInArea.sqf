/*
 * Generoi random piste annetun alueen sisältä
 *
 * 0: Sijainti (triggeri, markkeri) <OBJECT, STRING>
 *
 * Esimerkkejä:
 * [trigger1] call kuikka_fnc_randomInArea;
 * ["marker1"] call kuikka_fnc_randomInArea;
 */

params [
    ["_area", objNull, [objNull, ""]]
];

private _center = [0,0,0];
private _pos = [0,0,0];
private _radius = 0;

// Tarkista onko annettu objekti null
if (typeName _area == "OBJECT" && {isNull _area}) exitWith {
    ["Annettu objekti %1 on null!", str _area] call BIS_fnc_error;
    [0,0,0]
};

// Tarkista löytyykö annettua markkeria
if (typeName _area == "STRING" && {getMarkerType _area == ""}) exitWith {
    ["Annettua markkeria '%1' ei löydetty!", _area] call BIS_fnc_error;
    [0,0,0]
};

// Määritä keskipiste ja alue triggerille
if(typeName _area == "OBJECT") then {
    private _size = triggerArea _area;
    _size params ["_sizeX", "_sizeY"];

    _radius = [_sizeY, _sizeX] select (_sizeX > _sizeY);
    _center = getPos _area;
};

// Määritä keskipiste ja alue markkerille
if(typeName _area == "STRING") then {
    private _size = getMarkerSize _area;
    _size params ["_sizeX", "_sizeY"];

    _radius = [_sizeY, _sizeX] select (_sizeX > _sizeY);
    _center = getMarkerPos _area;
};

// Valitse random sijainti alueelta
_pos = [_center, _radius] call CBA_fnc_randPos;

// Looppaa niin kauan kunnes saadaan sijainti alueen sisältä
while {_pos inArea _area} do {
    _pos = [_center, _radius] call CBA_fnc_randPos;
};

// Palauta randomisoitu sijainti
_pos

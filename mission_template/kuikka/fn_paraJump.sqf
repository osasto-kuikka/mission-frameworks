/*
 * Yksinkertainen funktio luomaan laskuvarjohyppy
 *
 * 0: Filtteri <ARRAY, OBJECT, SIDE>
 * 1: Korkeus <NUMBER>
 *
 * Esimerkki:
 * [[west],1300] call kuikka_fnc_paraJump;
 */

params [
    ["_filter", [], [[], west, objNull]],
    ["_height", 1000, [0]]
];

// Muutetaan arvo taulukoksi
if(typeName _filter != "ARRAY") then {
    _filter = [_filter];
};

// Hyppy funktio
private _fnc_startParachute = {

    // teleportataan pelaaja ilmaan
    private _currPos = getPos player;
    _currPos params ["_currPosX", "_currPosY"];
    player setPos [_currPosX, _currPosY, _height];

    // Jos pelaajalla on reppu, lisätään se rintaan ja poisteaan nykyinen reppu selästä
    if (backPack player != "") then {
        [player, backPack player, backPackItems player] call ZADE_BOC_fnc_addChestBackpack;
        removeBackpack player;
    };

    // Annetaan pelaajalle laskuvarjo ja avataan se
    player addBackpack "B_Parachute";
    player action ["OpenParachute", player];

    // Odotetaan kunnes pelaaja osuu maahan ja laitetaan reppu rinnasta takaisin selkään
    [{
        removeBackpack player;
        [player] call ZADE_BOC_fnc_BackpackonBack;
    }, [], {isTouchingGround player}] call kge_common_fnc_waitUntil;
};

// Katsotaan löytyykö pelaaja filtteristä
{
    if(!isNull _x) then {
        switch(typeName _x) do {
           case "SIDE": {
                if((side (group player)) isEqualTo _x) then {
                     call _fnc_startParachute;
                };
            };
            case "OBJECT": {
                if(player isEqualTo _x) then {
                      call _fnc_startParachute;
                };
            };
        };
    };
} forEach _filter;

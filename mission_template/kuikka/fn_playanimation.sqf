if !(isServer) exitWith {};

params [
    ["_unit", objNull, [objNull]],
    ["_animation", "", [""]],
    ["_switchMove", false, [true]]
];

[_unit, _animation, [1,2] select _switchMove] call ace_commmon_fnc_doAnimation;

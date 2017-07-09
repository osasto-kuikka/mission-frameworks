/*
 * Täältä löytyvät briiffit, tämä ajetaan automaatisesti tehtävän alussa
 *
 * Ajetaan komennolla:
 * *objekti* call mission_fnc_briefing;
 *
 * Esim
 * player call mission_fnc_briefing;
 */

/**************************************************/
// ÄLÄ MUOKKAA
params [
    ["_player", objNull, [objNull]]
];
/**************************************************/

switch(side (group _player)) do {
    /***************************************************/
    // BLUFOR
    case west: {
        // Perus briefing pohja
        _player createDiaryRecord ["Diary", ["Info", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tiedustelu", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tehtävät", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tilanne", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Assetit", "
        test<br/>
        "]];
    };
    /***************************************************/
    // OPFOR
    case east: {
        // Perus briefing pohja
        _player createDiaryRecord ["Diary", ["Info", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tiedustelu", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tehtävät", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Tilanne", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Assetit", "
        test<br/>
        "]];
    };
    /***************************************************/
    // INDEPENDENT
    case independent: {
        // Perus briefing pohja
        _player createDiaryRecord ["Diary", ["Info", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tiedustelu", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tehtävät", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Tilanne", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Assetit", "
        test<br/>
        "]];
    };
    /***************************************************/
    // CIVILIAN
    case civilian: {
        // Perus briefing pohja
        _player createDiaryRecord ["Diary", ["Info", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tiedustelu", "
        test<br/>
        "]];

        _player createDiaryRecord ["Diary", ["Tehtävät", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Tilanne", "
        <br/> test
        "]];

        _player createDiaryRecord ["Diary", ["Assetit", "
        test<br/>
        "]];
    };
}

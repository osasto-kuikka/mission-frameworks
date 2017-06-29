/*
 * Skriptit, jotka serveri ajaa
 */

/**************************************************/
// ÄLÄ MUOKKAA
params ["_isDedicated"];
/**************************************************/

/**************************************************/
//TASK FORCE ASETUKSET
// Samalla puolella olevien lyhyen radion kanavataajuudet ovat sama (true/false)
tf_same_sw_frequencies_for_side = true;
// Ei automaattista pitkää radiota pelaajille (true/false)
tf_no_auto_long_range_radio = true;
// Samalla puolella olevien pitkän radion kanavataajuudet ovat sama (true/false)
tf_same_lr_frequencies_for_side = true;
// Anna lyhyt radio pelaajille automaattisesti (true/false)
TF_give_personal_radio_to_regular_soldier = false;
/**************************************************/

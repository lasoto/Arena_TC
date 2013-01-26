

-- Readd loot to Stinky
DELETE FROM `creature_loot_template` WHERE `entry` IN(37025,38064);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`)
VALUES
(37025,1,100,1,0,-35069,2),
(38064,1,100,1,0,-35069,2);

-- fix bad condition2/3 values on ItemEquip Conditions
UPDATE `conditions` SET `ConditionValue2`=0,`ConditionValue3`=0 WHERE `ConditionTypeOrReference`=3;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=51315;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`Scriptname`,`Comment`) VALUES
-- Lich King 10N
(1,36597,51315,0,1,2,0,51315,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player doesn''t have it already'),
(1,36597,51315,0,1,3,0,49623,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player is wielding Shadowmourne'),
(1,36597,51315,0,1,9,0,24748,0,0,0,0 ,'' , 'Sealed Chest will drop only if the player has "The Lich King''s Last Stand" in their quest log'),
(1,36597,51315,0,1,14,0,24914,0,0,0,0,'' , 'Sealed Chest will drop only if the player has not completed the quest Personal Property'),
-- Lich King 25N
(1,39166,51315,0,1,2,0,51315,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player doesn''t have it already'),
(1,39166,51315,0,1,3,0,49623,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player is wielding Shadowmourne'),
(1,39166,51315,0,1,9,0,24748,0,0,0,0 ,'' , 'Sealed Chest will drop only if the player has "The Lich King''s Last Stand" in their quest log'),
(1,39166,51315,0,1,14,0,24914,0,0,0,0,'' , 'Sealed Chest will drop only if the player has not completed the quest Personal Property'),
-- Lich King 10H
(1,39167,51315,0,1,2,0,51315,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player doesn''t have it already'),
(1,39167,51315,0,1,3,0,49623,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player is wielding Shadowmourne'),
(1,39167,51315,0,1,9,0,24748,0,0,0,0 ,'' , 'Sealed Chest will drop only if the player has "The Lich King''s Last Stand" in their quest log'),
(1,39167,51315,0,1,14,0,24914,0,0,0,0,'' , 'Sealed Chest will drop only if the player has not completed the quest Personal Property'),
-- Lich King 25H
(1,39168,51315,0,1,2,0,51315,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player doesn''t have it already'),
(1,39168,51315,0,1,3,0,49623,1,1,1,0 ,'' , 'Sealed Chest will drop only if the player is wielding Shadowmourne'),
(1,39168,51315,0,1,9,0,24748,0,0,0,0 ,'' , 'Sealed Chest will drop only if the player has "The Lich King''s Last Stand" in their quest log'),
(1,39168,51315,0,1,14,0,24914,0,0,0,0,'' , 'Sealed Chest will drop only if the player has not completed the quest Personal Property');

-- Dragonbone Condor
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (106595,106596,106597,106598,106603,106604,106605,106607,106608,106626,106629,106631,106643,106646,106658,106663,106665,106668,106669,106675,106676,106679,106680,106681,106682,106683,106684,106685,106686,106687,106688,106692,106693,106696,106702,106703,106706,106722,106723,106724,106726,106727,106728,106733,106737,106741,106749,106755,106757,131072);
UPDATE `creature` SET `position_z`=72.130 WHERE `guid`=106631;
UPDATE `creature` SET `position_z`=72.902 WHERE `guid`=106675;
UPDATE `creature` SET `position_z`=69.505 WHERE `guid`=131072;
/* Carrion Condor
 * All these have unitfieldbyte1=1 which means sitting. Obviously that makes no sense when they are moving randomly within their spawndist. They should be sitting on the pillars in Borean Tundra.
 * There are some that are spawned very close to dead Taunka. From retail I know they should be flying directly on top of them not moving so I changed them, too. */
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (101804,101805,101806,101807,101808,101809,101810,101814,101815,101818,101819,101820,101823,101824,101825,101832,101834,101836,101837,101838,101839,101842,101845,101849,101850,101856,101859,101860,101862,101866,101872,101876,101877,101890,101921,101923);
-- Courier Lanson: The npc should be sleeping on the bed instead of just standing there.
DELETE FROM `creature_template_addon` WHERE `entry`=27060;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27060,0,0,3,0,0,'');

UPDATE `smart_scripts` SET `action_param3`=3500,`action_param4`=6000 WHERE `entryorguid`=9458 AND `source_type`=0 AND `id`=0;
-- Orphan Matron Aria
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=34365;

DELETE FROM `smart_scripts` WHERE `entryorguid`=34365 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(34365,1,4,62,10502,1,33,34365,7,'Orphan Matron Aria - On gossip select - Give quest credit'),
(34365,2,4,62,10502,2,11,65359,7,'Orphan Matron Aria - On gossip select - Create oracle orphan whistle'),
(34365,3,4,62,10502,3,11,65360,7,'Orphan Matron Aria - On gossip select - Create wolvar orphan whistle'),
(34365,4,0,61,0,0,72,0,7,'Orphan Matron Aria - On gossip select - Close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10502;
INSERT INTO `gossip_menu_option`(`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(10502,1,0,'Tell me about the orphans.',1,1),
(10502,2,0,'I need a new Oracle Orphan Whistle.',1,1),
(10502,3,0,'I need a new Wolvar Orphan Whistle.',1,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10502;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUES
(15,10502,1,1,12,10,0,0,'Childrens Week must be active'),
(15,10502,1,1,1,58818,0,0,'Needs aura 58818'),
(15,10502,1,1,9,13927,0,0,'Quest 13927 must be active'),
(15,10502,1,2,12,10,0,0,'Childrens Week must be active'),
(15,10502,1,2,1,58818,0,0,'Needs aura 58818'),
(15,10502,1,2,9,13926,0,0,'Quest 13926 must be active'),
(15,10502,2,0,12,10,0,0,'Childrens Week must be active'),
(15,10502,2,0,8,13926,0,0,'Quest 13926 must be rewarded'),
(15,10502,2,0,2,46397,1,1,'Must not have item 46397'),
(15,10502,3,0,12,10,0,0,'Childrens Week must be active'),
(15,10502,3,0,8,13927,0,0,'Quest 13926 must be rewarded'),
(15,10502,3,0,2,46396,1,1,'Must not have item 46397');

-- Orphan Matron Battlewail
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=14451;

DELETE FROM `smart_scripts` WHERE `entryorguid`=14451 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(14451,1,2,62,5848,1,11,23125,7,'Orphan Matron Battlewail - On gossip select - Create orc orphan whistle'),
(14451,2,0,61,0,0,72,0,7,'Orphan Matron Battlewail - On gossip select - Close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=5848;
INSERT INTO `gossip_menu_option`(`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(5848,1,0,'I need a new Orc Orphan Whistle.',1,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=5848;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUES
(15,5848,1,0,12,10,0,0,'Childrens Week must be active'),
(15,5848,1,0,8,172,0,0,'Quest 172 must be rewarded'),
(15,5848,1,0,2,18597,1,1,'Must not have item 18597');

-- Orphan Matron Mercy
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=22819;

DELETE FROM `smart_scripts` WHERE `entryorguid`=22819 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(22819,1,3,62,8568,1,11,39512,7,'Orphan Matron Mercy - On gossip select - Create blood elf orphan whistle'),
(22819,2,3,62,8568,2,11,39513,7,'Orphan Matron Mercy - On gossip select - Create draenei orphan whistle'),
(22819,3,0,61,0,0,72,0,7,'Orphan Matron Mercy - On gossip select - Close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=8568;
INSERT INTO `gossip_menu_option`(`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(8568,1,0,'I need a new Blood Elf Orphan Whistle.',1,1),
(8568,2,0,'I need a new Draenei Orphan Whistle.',1,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8568;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUES
(15,8568,1,0,12,10,0,0,'Childrens Week must be active'),
(15,8568,1,0,8,10942,0,0,'Quest 10942 must be rewarded'),
(15,8568,1,0,2,31880,1,1,'Must not have item 31880'),
(15,8568,2,0,12,10,0,0,'Childrens Week must be active'),
(15,8568,2,0,8,10943,0,0,'Quest 10943 must be rewarded'),
(15,8568,2,0,2,31881,1,1,'Must not have item 31881');

-- Orphan Matron Nightingale
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=14450;

DELETE FROM `smart_scripts` WHERE `entryorguid`=14450 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(14450,1,2,62,5849,1,11,23124,7,'Orphan Matron Nightingale - On gossip select - Create human orphan whistle'),
(14450,2,0,61,0,0,72,0,7,'Orphan Matron Nightingale - On gossip select - Close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=5849;
INSERT INTO `gossip_menu_option`(`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(5849,1,0,'I need a new Human Orphan Whistle.',1,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=5849;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUES
(15,5849,1,0,12,10,0,0,'Childrens Week must be active'),
(15,5849,1,0,8,1468,0,0,'Quest 1468 must be rewarded'),
(15,5849,1,0,2,18598,1,1,'Must not have item 18598');

-- Oracle Orphan
SET @TEXT_ORACLE_ORPHAN_1 = 1;
SET @TEXT_ORACLE_ORPHAN_2 = 2;
SET @TEXT_ORACLE_ORPHAN_3 = 3;
SET @TEXT_ORACLE_ORPHAN_4 = 4;
SET @TEXT_ORACLE_ORPHAN_5 = 5;
SET @TEXT_ORACLE_ORPHAN_6 = 6;
SET @TEXT_ORACLE_ORPHAN_7 = 7;
SET @TEXT_ORACLE_ORPHAN_8 = 8;
SET @TEXT_ORACLE_ORPHAN_9 = 9;
SET @TEXT_ORACLE_ORPHAN_10 = 10;
SET @TEXT_ORACLE_ORPHAN_11 = 11;
SET @TEXT_ORACLE_ORPHAN_12 = 12;
SET @TEXT_ORACLE_ORPHAN_13 = 13;
SET @TEXT_ORACLE_ORPHAN_14 = 14;

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=33533;

DELETE FROM `smart_scripts` WHERE `entryorguid`=33533 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`event_type`,`event_param1`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(33533,8,65357,33,36209,7,'Oracle Orphan - On spellhit - Give quest credit');

DELETE FROM `creature_text` WHERE `entry`=33533;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(33533,@TEXT_ORACLE_ORPHAN_1,"Look!",12,0),
(33533,@TEXT_ORACLE_ORPHAN_2,"We can dance too!",12,0),
(33533,@TEXT_ORACLE_ORPHAN_3,"We made a new friend!",12,0),
(33533,@TEXT_ORACLE_ORPHAN_4,"We here! Only, if this is world tree, how come it broke when they tried to put whole world in?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_5,"Look! Is that us? We think it's us. A bit older, maybe?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_6,"Looks like we blessed by Great Ones! Shrines give magic, make us high-oracle someday? Maybe?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_7,"Wow! A real Great One? We don't even think Soo-say has met a real Great One!",12,0),
(33533,@TEXT_ORACLE_ORPHAN_8,"Um, hello, Mr. Great One. We are honored to meet you.",12,0),
(33533,@TEXT_ORACLE_ORPHAN_9,"Maybe you're asleep, Mr. Great One? We stand. Must be hard working being Great One, collecting all the shinies we leave for you.",12,0),
(33533,@TEXT_ORACLE_ORPHAN_10,"We brought you a gift, Great One. Maybe you see it when you wake up. Maybe you remember we came to see you, oki?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_11,"So that's the queen of the dragons? Hmm... we thought she'd be bigger. Yes, we did.",12,0),
(33533,@TEXT_ORACLE_ORPHAN_12,"How come she doesn't look like the other dragons? could she turn into a big ol' dragon if she wanted to?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_13,"Um... Your Majesty, would you turn into a dragon for us?",12,0),
(33533,@TEXT_ORACLE_ORPHAN_14,"Oki... How about now?",12,0);

DELETE FROM `creature_questrelation` WHERE `id`=33533;

DELETE FROM `game_event_creature_quest` WHERE `id`=33533;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,33533,13929),
(10,33533,13933),
(10,33533,13950),
(10,33533,13954),
(10,33533,13956),
(10,33533,13937),
(10,33533,13959);

DELETE FROM `creature_involvedrelation` WHERE `id`=33533;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(33533,13929),
(33533,13933),
(33533,13950),
(33533,13954),
(33533,13956),
(33533,13937),
(33533,13926);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (13954,13956,13937);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,13954,8,13929,'Accept quest 13954 - Quest 13929 needs to be rewarded'),
(19,13954,8,13933,'Accept quest 13954 - Quest 13933 needs to be rewarded'),
(19,13954,8,13950,'Accept quest 13954 - Quest 13950 needs to be rewarded'),
(19,13956,8,13929,'Accept quest 13956 - Quest 13929 needs to be rewarded'),
(19,13956,8,13933,'Accept quest 13956 - Quest 13933 needs to be rewarded'),
(19,13956,8,13950,'Accept quest 13956 - Quest 13950 needs to be rewarded'),
(19,13937,8,13956,'Accept quest 13937 - Quest 13956 needs to be rewarded'),
(20,13954,8,13929,'Show quest mark 13954 - Quest 13929 needs to be rewarded'),
(20,13954,8,13933,'Show quest mark 13954 - Quest 13933 needs to be rewarded'),
(20,13954,8,13950,'Show quest mark 13954 - Quest 13950 needs to be rewarded'),
(20,13956,8,13929,'Show quest mark 13956 - Quest 13929 needs to be rewarded'),
(20,13956,8,13933,'Show quest mark 13956 - Quest 13933 needs to be rewarded'),
(20,13956,8,13950,'Show quest mark 13956 - Quest 13950 needs to be rewarded'),
(20,13937,8,13956,'Show quest mark 13937 - Quest 13956 needs to be rewarded');

-- Wolvar Orphan
SET @TEXT_WOLVAR_ORPHAN_1 = 1;
SET @TEXT_WOLVAR_ORPHAN_2 = 2;
SET @TEXT_WOLVAR_ORPHAN_3 = 3;
SET @TEXT_WOLVAR_ORPHAN_4 = 4;
SET @TEXT_WOLVAR_ORPHAN_5 = 5;
SET @TEXT_WOLVAR_ORPHAN_6 = 6;
SET @TEXT_WOLVAR_ORPHAN_7 = 7;
SET @TEXT_WOLVAR_ORPHAN_8 = 8;
SET @TEXT_WOLVAR_ORPHAN_9 = 9;
SET @TEXT_WOLVAR_ORPHAN_10 = 10;
SET @TEXT_WOLVAR_ORPHAN_11 = 11;
SET @TEXT_WOLVAR_ORPHAN_12 = 12;
SET @TEXT_WOLVAR_ORPHAN_13 = 13;

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=33532;

DELETE FROM `smart_scripts` WHERE `entryorguid`=33532 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`event_type`,`event_param1`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(33532,8,65357,33,36209,7,'Wolvar Orphan - On spellhit - Give quest credit');

DELETE FROM `creature_text` WHERE `entry`=33532;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(33532,@TEXT_WOLVAR_ORPHAN_1,"Look!",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_2,"Got you back!",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_3,"Good snowball fight!",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_4,"Look! That must be Kekek as a mighty warrior! See? What Kekek tell you?",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_5,"Hmm... that Kekek very old. Must be elder, leader of Frenzyheart. This good. Kekek have good future as warrior and leader. Kekek very happy you bring him here. Orphan-lady never do that for Kekek.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_6,"Wow. At last, Kekek get to meet Hemet Nesingwary!",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_7,"Even Frenzyheart know all about you after you come to Sholazar. Maybe you teach Kekek your tricks?",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_8,"Not sure how reading helps. Kekek can't read anyway, but if Hemet Nesingwary say, Kekek try.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_9,"Maybe give up and throw book at animals, but try.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_10,"You think maybe one day, Kekek lead Frenzyheart home, like bear-men fight to get tree-city back? Kekek want own home, not city with purple men, not jungle with big-tongues.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_11,"Kekek thought we go see dragon queen. This just some elf-lady with funny horns.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_12,"But why? Dragons big and powerful. Elf-lady weak. Kekek want to see dragon queen's real form.",12,0),
(33532,@TEXT_WOLVAR_ORPHAN_13,"Oh! Now Kekek understand. Not want to be crushed by big dragon-lady. Maybe come back sometime when not so crowded. Nice to meet you, dragon-lady.",12,0);

DELETE FROM `game_event_creature_quest` WHERE `id`=33532;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,33532,13938),
(10,33532,13960),
(10,33532,13930),
(10,33532,13951),
(10,33532,13934),
(10,33532,13955),
(10,33532,13957);

DELETE FROM `creature_involvedrelation` WHERE `id`=33532;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(33532,13938),
(33532,13930),
(33532,13927),
(33532,13951),
(33532,13934),
(33532,13955),
(33532,13957);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (13955,13957,13938);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,13955,8,13930,'Accept quest 13955 - Quest 13930 needs to be rewarded'),
(19,13955,8,13934,'Accept quest 13955 - Quest 13934 needs to be rewarded'),
(19,13955,8,13951,'Accept quest 13955 - Quest 13951 needs to be rewarded'),
(19,13957,8,13930,'Accept quest 13957 - Quest 13930 needs to be rewarded'),
(19,13957,8,13934,'Accept quest 13957 - Quest 13934 needs to be rewarded'),
(19,13957,8,13951,'Accept quest 13957 - Quest 13951 needs to be rewarded'),
(19,13938,8,13957,'Accept quest 13938 - Quest 13957 needs to be rewarded'),
(20,13955,8,13930,'Show quest mark 13955 - Quest 13930 needs to be rewarded'),
(20,13955,8,13934,'Show quest mark 13955 - Quest 13934 needs to be rewarded'),
(20,13955,8,13951,'Show quest mark 13955 - Quest 13951 needs to be rewarded'),
(20,13957,8,13930,'Show quest mark 13957 - Quest 13930 needs to be rewarded'),
(20,13957,8,13934,'Show quest mark 13957 - Quest 13934 needs to be rewarded'),
(20,13957,8,13951,'Show quest mark 13957 - Quest 13951 needs to be rewarded'),
(20,13938,8,13957,'Show quest mark 13938 - Quest 13957 needs to be rewarded');

-- Blood Elf Orphan
UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|2 WHERE `Id` IN (10945,10953,10951,10963);

DELETE FROM `game_event_creature_quest` WHERE `id`=22817;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,22817,10945),
(10,22817,10953),
(10,22817,10951),
(10,22817,10963),
(10,22817,11975),
(10,22817,10967);

DELETE FROM `creature_involvedrelation` WHERE `id`=22817;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(22817,10942),
(22817,10951),
(22817,11975),
(22817,10963);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (11975,10963,10967);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,11975,8,10945,'Accept quest 11975 - Quest 10945 needs to be rewarded'),
(19,11975,8,10953,'Accept quest 11975 - Quest 10953 needs to be rewarded'),
(19,11975,8,10951,'Accept quest 11975 - Quest 10951 needs to be rewarded'),
(19,10963,8,10945,'Accept quest 10963 - Quest 10945 needs to be rewarded'),
(19,10963,8,10953,'Accept quest 10963 - Quest 10953 needs to be rewarded'),
(19,10963,8,10951,'Accept quest 10963 - Quest 10951 needs to be rewarded'),
(19,10967,8,10963,'Accept quest 10967 - Quest 10963 needs to be rewarded'),
(20,11975,8,10945,'Show quest mark 11975 - Quest 10945 needs to be rewarded'),
(20,11975,8,10953,'Show quest mark 11975 - Quest 10953 needs to be rewarded'),
(20,11975,8,10951,'Show quest mark 11975 - Quest 10951 needs to be rewarded'),
(20,10963,8,10945,'Show quest mark 10963 - Quest 10945 needs to be rewarded'),
(20,10963,8,10953,'Show quest mark 10963 - Quest 10953 needs to be rewarded'),
(20,10963,8,10951,'Show quest mark 10963 - Quest 10951 needs to be rewarded'),
(20,10967,8,10963,'Show quest mark 10967 - Quest 10963 needs to be rewarded');

-- Draenei Orphan
UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|2 WHERE `Id` IN (10956,10968,10950,10952,10954,10962);

DELETE FROM `game_event_creature_quest` WHERE `id`=22818;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,22818,10952),
(10,22818,10950),
(10,22818,10966),
(10,22818,10954),
(10,22818,10956),
(10,22818,10962);

DELETE FROM `creature_involvedrelation` WHERE `id`=22818;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(22818,10950),
(22818,10952),
(22818,10943),
(22818,10962);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (10956,10962,10966);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,10956,8,10950,'Accept quest 10956 - Quest 10950 needs to be rewarded'),
(19,10956,8,10954,'Accept quest 10956 - Quest 10954 needs to be rewarded'),
(19,10956,8,10952,'Accept quest 10956 - Quest 10952 needs to be rewarded'),
(19,10962,8,10950,'Accept quest 10962 - Quest 10950 needs to be rewarded'),
(19,10962,8,10954,'Accept quest 10962 - Quest 10954 needs to be rewarded'),
(19,10962,8,10952,'Accept quest 10962 - Quest 10952 needs to be rewarded'),
(19,10966,8,10962,'Accept quest 10966 - Quest 10962 needs to be rewarded'),
(20,10956,8,10950,'Show quest mark 10956 - Quest 10950 needs to be rewarded'),
(20,10956,8,10954,'Show quest mark 10956 - Quest 10954 needs to be rewarded'),
(20,10956,8,10952,'Show quest mark 10956 - Quest 10952 needs to be rewarded'),
(20,10962,8,10950,'Show quest mark 10962 - Quest 10950 needs to be rewarded'),
(20,10962,8,10954,'Show quest mark 10962 - Quest 10954 needs to be rewarded'),
(20,10962,8,10952,'Show quest mark 10962 - Quest 10952 needs to be rewarded'),
(20,10966,8,10962,'Show quest mark 10966 - Quest 10962 needs to be rewarded');

-- Human Orphan
DELETE FROM `creature_questrelation` WHERE `id`=14305;

DELETE FROM `game_event_creature_quest` WHERE `id`=14305;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,14305,171),
(10,14305,558),
(10,14305,1687),
(10,14305,1479),
(10,14305,1558),
(10,14305,4822);

DELETE FROM `creature_involvedrelation` WHERE `id`=14305;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(14305,1468),
(14305,558),
(14305,1687),
(14305,1479),
(14305,1558),
(14305,4822);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (558,4822,171);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,558,8,1687,'Accept quest 558 - Quest 1687 needs to be rewarded'),
(19,558,8,1558,'Accept quest 558 - Quest 1558 needs to be rewarded'),
(19,558,8,1479,'Accept quest 558 - Quest 1479 needs to be rewarded'),
(19,558,16,1101,'Accept quest 558 - Needs to be in race mask 1101'),
(19,4822,8,1687,'Accept quest 4822 - Quest 1687 needs to be rewarded'),
(19,4822,8,1558,'Accept quest 4822 - Quest 1558 needs to be rewarded'),
(19,4822,8,1479,'Accept quest 4822 - Quest 1479 needs to be rewarded'),
(19,171,8,4822,'Accept quest 171 - Quest 4822 needs to be rewarded'),
(20,558,8,1687,'Show quest mark 558 - Quest 1687 needs to be rewarded'),
(20,558,8,1558,'Show quest mark 558 - Quest 1558 needs to be rewarded'),
(20,558,8,1479,'Show quest mark 558 - Quest 1479 needs to be rewarded'),
(20,558,16,1101,'Show quest mark 558 - Needs to be in race mask 1101'),
(20,4822,8,1687,'Show quest mark 4822 - Quest 1687 needs to be rewarded'),
(20,4822,8,1558,'Show quest mark 4822 - Quest 1558 needs to be rewarded'),
(20,4822,8,1479,'Show quest mark 4822 - Quest 1479 needs to be rewarded'),
(20,171,8,4822,'Show quest mark 171 - Quest 4822 needs to be rewarded');

-- Orcish Orphan
DELETE FROM `creature_questrelation` WHERE `id`=14444;

DELETE FROM `game_event_creature_quest` WHERE `id`=14444;
INSERT INTO `game_event_creature_quest`(`eventEntry`,`id`,`quest`) VALUES
(10,14444,910),
(10,14444,911),
(10,14444,1800),
(10,14444,925),
(10,14444,915),
(10,14444,5502);

DELETE FROM `creature_involvedrelation` WHERE `id`=14444;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(14444,925),
(14444,172),
(14444,910),
(14444,911),
(14444,1800),
(14444,915);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (915,925,5502);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
(19,925,8,910,'Accept quest 925 - Quest 910 needs to be rewarded'),
(19,925,8,911,'Accept quest 925 - Quest 911 needs to be rewarded'),
(19,925,8,1800,'Accept quest 925 - Quest 1800 needs to be rewarded'),
(19,915,8,910,'Accept quest 915 - Quest 910 needs to be rewarded'),
(19,915,8,911,'Accept quest 915 - Quest 911 needs to be rewarded'),
(19,915,8,1800,'Accept quest 915 - Quest 1800 needs to be rewarded'),
(19,5502,8,925,'Accept quest 5502 - Quest 925 needs to be rewarded'),
(20,925,8,910,'Show quest mark 925 - Quest 910 needs to be rewarded'),
(20,925,8,911,'Show quest mark 925 - Quest 911 needs to be rewarded'),
(20,925,8,1800,'Show quest mark 925 - Quest 1800 needs to be rewarded'),
(20,915,8,910,'Show quest mark 915 - Quest 910 needs to be rewarded'),
(20,915,8,911,'Show quest mark 915 - Quest 911 needs to be rewarded'),
(20,915,8,1800,'Show quest mark 915 - Quest 1800 needs to be rewarded'),
(20,5502,8,925,'Show quest mark 5502 - Quest 925 needs to be rewarded');

-- Home of the bear-men
SET @GUIDS = 85179;
SET @GUID_GRIZZLEMAW_TRIGGER_1 = @GUIDS + 0;
SET @GUID_GRIZZLEMAW_TRIGGER_2 = @GUIDS + 1;
SET @GUID_GRIZZLEMAW_TRIGGER_3 = @GUIDS + 2;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_grizzlemaw_cw_trigger',`flags_extra`=0 WHERE `entry`=36209;

DELETE FROM `creature` WHERE `guid` IN (@GUID_GRIZZLEMAW_TRIGGER_1,@GUID_GRIZZLEMAW_TRIGGER_2,@GUID_GRIZZLEMAW_TRIGGER_3);
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`) VALUES
(@GUID_GRIZZLEMAW_TRIGGER_1,36209,571,4068.82,-3811,223.4),
(@GUID_GRIZZLEMAW_TRIGGER_2,36209,571,4073.2,-3734.354,222.6634),
(@GUID_GRIZZLEMAW_TRIGGER_3,36209,571,3923.109,-3763.967,165.362);

-- Elder Kekek
SET @GUID_KEKEK = @GUIDS + 3;
SET @TEXT_ELDER_KEKEK_1 = 1;

UPDATE `creature_template` SET `ScriptName`='npc_elder_kekek' WHERE `entry`=34387;

DELETE FROM `creature` WHERE `guid`=@GUID_KEKEK OR `id`=34387;
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_KEKEK,34387,571,4181.482,-461.453,120.728,1.398097);

DELETE FROM `creature_text` WHERE `entry`=34387;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(34387,@TEXT_ELDER_KEKEK_1,"No worry, Kekek. You grow up, be strong for Frenzyheart. You lead people back to old home, where there no big-tongue babies.",12,0);

-- Alexstraza
SET @TEXT_ALEXSTRASZA_2 = 2;
SET @TEXT_KRASUS_8 = 8;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_alexstraza_the_lifebinder' WHERE `entry`=26917;

DELETE FROM `creature_text` WHERE (`entry`=26917 AND `groupid`=@TEXT_ALEXSTRASZA_2) OR (`entry`=27990 AND `groupid`=@TEXT_KRASUS_8);
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(26917,@TEXT_ALEXSTRASZA_2,"If I was in my dragon form, there wouldn't be any room for anyone else, little one.",12,0),
(27990,@TEXT_KRASUS_8,"Rest assured, Kekek, she is the queen of the dragons. We often take the forms of smaller beings when we work with them.",12,0);

-- High Oracle Soo Roo
SET @GUID_SOO_ROO = @GUIDS + 4;
SET @TEXT_SOO_ROO_1 = 1;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_high_oracle_soo_roo' WHERE `entry`=34386;

DELETE FROM `creature_text` WHERE `entry`=34386;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(34386,@TEXT_SOO_ROO_1,"We remember this visit, yes we do. Never forget what you learn from your new friend, little Roo. You got great future ahead.",12,0);

DELETE FROM `creature` WHERE `guid`=@GUID_SOO_ROO OR `id`=34386;
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_SOO_ROO,34386,571,4120.996,-329.486,121.443817,0.299253);

-- Nesingwary
SET @TEXT_NESINGWARY_1 = 1;

DELETE FROM `creature_text` WHERE `entry`=27986;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(27986,@TEXT_NESINGWARY_1,"Well, lad, you can start by readin' The Green Hills of Stranglethorn. Then, maybe you can join me on one of my safaris. What do you say?",12,0);

-- Snowfall Glade Playmate
SET @GUID_SNOWFALL_GLADE_PLAYMATE = @GUIDS + 5;
SET @TEXT_SNOWFALL_GLADE_PLAYMATE_1 = 1;
SET @TEXT_SNOWFALL_GLADE_PLAYMATE_2 = 2;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_snowfall_glade_playmate' WHERE `entry`=34490;

DELETE FROM `creature_text` WHERE `entry`=34490;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(34490,@TEXT_SNOWFALL_GLADE_PLAYMATE_1,"Better watch out!",12,0),
(34490,@TEXT_SNOWFALL_GLADE_PLAYMATE_2,"Got you good!",12,0);

DELETE FROM `creature` WHERE `guid`=@GUID_SNOWFALL_GLADE_PLAYMATE OR `id`=34490;
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_SNOWFALL_GLADE_PLAYMATE,34490,571,3325.193,1026.451,138.1712,2.062184);

-- Winterfin Playmate
SET @GUID_WINTERFIN_PLAYMATE = @GUIDS + 6;
SET @TEXT_WINTERFIN_PLAYMATE_1 = 1;
SET @TEXT_WINTERFIN_PLAYMATE_2 = 2;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_winterfin_playmate' WHERE `entry`=34489;

DELETE FROM `creature_text` WHERE `entry`=34489;
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`emote`) VALUE
(34489,@TEXT_WINTERFIN_PLAYMATE_1,"Wanna see what I can do?",12,0),
(34489,@TEXT_WINTERFIN_PLAYMATE_2,"Now dance together!",12,0);

DELETE FROM `creature` WHERE `guid`=@GUID_WINTERFIN_PLAYMATE OR `id`=34489;
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_WINTERFIN_PLAYMATE,34489,571,4382.502,6066.199,0.724562,3.571894);

-- Biggest Tree Ever
SET @GUID_BIGGEST_TREE_TRIGGER = @GUIDS + 7;

UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_the_biggest_tree',`flags_extra`=0 WHERE `entry`=34381;

DELETE FROM `creature` WHERE `guid`=@GUID_BIGGEST_TREE_TRIGGER OR `id`=34381;
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_BIGGEST_TREE_TRIGGER,34381,571,4022.666,-3777.682,115.443588,4.857019);

-- Meeting A Great One
UPDATE `creature_template` SET `ScriptName`='npc_the_etymidian' WHERE `entry`=28092;

-- POIs
DELETE FROM `quest_poi` WHERE `questId` IN (13956,13929,13950,13951,13957,13933,13934,13930,13954,13955);
INSERT INTO `quest_poi`(`questId`,`objIndex`,`mapid`,`WorldMapAreaId`,`unk4`) VALUES
(13956,16,1,201,3),
(13929,16,571,490,3),
(13950,16,571,486,3),
(13951,16,571,488,3),
(13957,16,571,493,3),
(13933,16,571,488,3),
(13934,16,571,488,3),
(13930,16,571,490,3),
(13954,16,571,488,3),
(13955,16,571,488,3);

DELETE FROM `quest_poi_points` WHERE `questid` IN (13956,13929,13950,13951,13957,13933,13934,13930,13954,13955);
INSERT INTO `quest_poi_points`(`questId`,`x`,`y`) VALUES
(13956,-6193,-1223),
(13929,4022,-3777),
(13950,4382,6066),
(13951,3325,1026),
(13957,5584,5748),
(13933,4121,-329),
(13934,4181,-461),
(13930,4071,-3773),
(13954,3530,271),
(13955,3530,271);

-- NPC areatriggers
SET @GUID_AERIS_LANDING_TRIGGER = @GUIDS + 8;
SET @GUID_SILVERMOON_TRIGGER_01 = @GUIDS + 9;
SET @GUID_AUCHINDOUN_TRIGGER = @GUIDS + 10;
SET @GUID_SPOREGGAR_TRIGGER = @GUIDS + 11;
SET @GUID_THRONE_OF_ELEMENTS_TRIGGER = @GUIDS + 12;

UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=0,`unit_flags`=33554432,`ScriptName`='npc_cw_area_trigger',`AIName`='' WHERE `entry` IN (22905,22851,22838,22866,22831,22829,22872,22839);

DELETE FROM `creature` WHERE `guid` IN (@GUID_SILVERMOON_TRIGGER_01,@GUID_AERIS_LANDING_TRIGGER,@GUID_AUCHINDOUN_TRIGGER,@GUID_SPOREGGAR_TRIGGER,@GUID_THRONE_OF_ELEMENTS_TRIGGER);
INSERT INTO `creature`(`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID_AERIS_LANDING_TRIGGER,22838,530,-2075.759,8559.336,23.027,4.857019),
(@GUID_SILVERMOON_TRIGGER_01,22866,530,9506.086,-7329.313,14.397272,0),
(@GUID_AUCHINDOUN_TRIGGER,22831,530,-3320.860,4925.095,-101.1,0),
(@GUID_SPOREGGAR_TRIGGER,22829,530,203.587,8550.11,22.3256,0),
(@GUID_THRONE_OF_ELEMENTS_TRIGGER,22839,530,-781.294,6943.52,33.3344,0);

-- Misc
DELETE `game_event_creature` FROM `game_event_creature` INNER JOIN `creature` ON `creature`.`guid`=`game_event_creature`.`guid` 
WHERE `id` IN (22905,22851,22838,22866,22831,22829,22872,22839,14450,22819,14451,34365,34387,34386,34490,34489,34381,36209);
INSERT INTO `game_event_creature`(`eventEntry`,`guid`) SELECT 10,`guid` FROM `creature` 
WHERE `id` IN (22905,22851,22838,22866,22831,22829,22872,22839,14450,22819,14451,34365,34387,34386,34490,34489,34381,36209);

DELETE FROM `game_event_npc_vendor` WHERE `eventEntry`=10 AND `item`=46693;
INSERT INTO `game_event_npc_vendor` (`eventEntry`, `guid`, `item`) VALUES 
(10,99369,46693),
(10,97984,46693);

UPDATE `item_template` SET `minMoneyLoot`=50000,`maxMoneyLoot`=50000 WHERE `entry`=23022;
UPDATE `item_template` SET `HolidayId`=201 WHERE `entry` IN (46396,46397,31880,31881,18598,18597);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (23012,23013,39478,39479,65352,65353);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ErrorTextId`,`Comment`) VALUES 
(17,0,23012,0,12,10,0,"Orphan Whistle only while children's week"),
(17,0,23013,0,12,10,0,"Orphan Whistle only while children's week"),
(17,0,39478,0,12,10,0,"Orphan Whistle only while children's week"),
(17,0,39479,0,12,10,0,"Orphan Whistle only while children's week"),
(17,0,65352,0,12,10,0,"Orphan Whistle only while children's week"),
(17,0,65353,0,12,10,0,"Orphan Whistle only while children's week");

UPDATE `quest_poi_points` SET `x`=1642,`y`=239 WHERE `questId`=1800 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-248,`y`=956 WHERE `questId`=10952 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-11400.211,`y`=1944.599 WHERE `questId`=1687 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-998.183,`y`=-3822.07 WHERE `questId`=910 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=1260.812,`y`=-2223.765 WHERE `questId`=911 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=9933,`y`=2500 WHERE `questId`=1479 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-2075.759,`y`=8559.336 WHERE `questId`=10954 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=9506,`y`=-7329 WHERE `questId`=11975 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-3320.860,`y`=4925.095 WHERE `questId`=10950 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=203.587,`y`=8550.11 WHERE `questId`=10945 AND `id`=0 AND `idx`=0;
UPDATE `quest_poi_points` SET `x`=-781.294,`y`=6943.52 WHERE `questId`=10953 AND `id`=0 AND `idx`=0;

-- Spellscript and conditions for spells of quest Gordunni Cobalt
DELETE FROM `spell_script_names` WHERE `spell_id`=19395;
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(19395,'spell_gordunni_trap');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=11757;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,1,11757,31,5,144050,'Digging for Cobalt targets Gordunni Trap');

DELETE FROM `command` WHERE `name` LIKE 'lfg%';

INSERT INTO `command` (`name`, `security`, `help`) VALUES
('lfg player', 2, 'Syntax: .lfg player\n Shows information about player (state, roles, comment, dungeons selected).'),
('lfg group', 2, 'Syntax: .lfg group\n Shows information about all players in the group  (state, roles, comment, dungeons selected).'),
('lfg queue', 2, 'Syntax: .lfg queue\n Shows info about current lfg queues.'),
('lfg clean', 3, 'Syntax: .flg clean\n Cleans current queue, only for debugging purposes.'),
('lfg options', 3, 'Syntax: .lfg options [new value]\n Shows current lfg options. New value is set if extra param is present.');
-- Update position for Koltira Deathweaver
UPDATE `creature_transport` SET `TransOffsetX`=45.50927,`TransOffsetY`=6.679555,`TransOffsetZ`=30.17881,`TransOffsetO`=5.445427 WHERE `guid`=36;

-- Set proper name and period timers for icecrown ships
UPDATE `transports` SET `name`= 'Alliance gunship patrolling above Icecrown (\"The Skybreaker\")',`period`=1051388 WHERE `entry`=192242;
UPDATE `transports` SET `name`= 'Horde gunship patrolling above Icecrown (\"Orgrim''s Hammer\")',`period`=1431158 WHERE `entry`=192241;
DELETE FROM `trinity_string` WHERE `entry` IN (9980, 9981, 9982, 9983, 9984, 9985, 9986, 9987, 9988, 9989, 9990, 9991, 9992, 9993, 9994, 9995, 9996, 9997, 9998, 9999);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
  (9980, 'Player name: %s, State: %s, Dungeons: %u (%s), Roles: %s, Comment: %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9981, 'LfgGroup?: %u, State: %s, Dungeon: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9982, 'Not in group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9983, 'Queues cleared', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9984, 'Lfg options: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9985, 'Lfg options changed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9986, 'None', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9987, 'Role check', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9988, 'Queued', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9989, 'Proposal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9990, 'Vote kick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9991, 'In dungeon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9992, 'Finished dungeon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9993, 'Raid browser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9994, 'Tank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9995, 'Healer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9996, 'Dps', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9997, 'Leader', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9998, 'None', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9999, 'Error', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Area conditions for Plant Chieftains Totem
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=56765;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ErrorTextId`,`Comment`) VALUES
(17,56765,29,30446,15,64,'Plant Chieftains Totem only useable next to Rift');

-- Apply Close Rift to The Chieftain's Totem
DELETE FROM `creature_template_addon` WHERE `entry`=30444;
INSERT INTO `creature_template_addon`(`entry`,`auras`) VALUES
(30444,'56763');

-- Assign aura script to Close Rift
DELETE FROM `spell_script_names` WHERE `spell_id`=56763;
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(56763,'spell_close_rift');

-- Target conditions for spell triggered by Close Rift Periodic
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (56764,61665);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,1,56764,31,3,30446,'Close Rift Periodic targets Frostfloe Rift'),
(13,1,61665,31,3,30446,'Despawn Rift targets Frostfloe Rift');

-- Assign SmartAI to Frostfloe Rift
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=30446;

-- Create SAI for Frostfloe Rift
DELETE FROM `smart_scripts` WHERE `entryorguid`=30446 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(30446,1,2,8,61665,45,1,1,7,'Frostfloe Rift - On spell hit - Set data of invoker'),
(30446,2,0,61,0,41,0,0,1,'Frostfloe Rift - On spell hit - Despawn');

-- Assign SmartAI to Chieftain's Totem
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=30444;

-- Create SAI for Chieftain's Totem
DELETE FROM `smart_scripts` WHERE `entryorguid`=30444 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(30444,38,1,1,33,30444,23,'Chieftains Totem - On data set - Give quest credit');

ALTER TABLE `conditions` CHANGE COLUMN `SourceEntry` `SourceEntry` MEDIUMINT(8) NOT NULL DEFAULT 0;

-- Spawnmask updates
UPDATE `creature` SET `spawnMask`=15 WHERE `id` IN(40091, 40081);

-- Auras updates (Now in script, can't be used in creature_addon because dynamically spawned)
DELETE FROM `creature_template_addon` WHERE `entry` IN(39863, 40142);

-- Blazing Aura
-- NOTE: This still does not work, no clue why. Probably a core-side bug ?
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,2,75886,0,0,31,0,3,40683,0,0,0, '', 'Blazing Aura can only target Living Embers');


SET @GUID   := 43456;

DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+3;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,30236,571,1,64,0,0,6219.17,59.9983,400.375,1.6057,120,0,0,1,0,0,0,0,0),
(@GUID+1,30236,571,1,64,0,0,6256.11,93.2413,410.92,0.767945,120,0,0,1,0,0,0,0,0),
(@GUID+2,30236,571,1,64,0,0,6297.37,53.5677,410.957,0.802851,120,0,0,1,0,0,0,0,0),
(@GUID+3,30236,571,1,64,0,0,6162.81,60.9792,400.371,1.55334,120,0,0,1,0,0,0,0,0);

DELETE FROM `creature_template_addon` WHERE `entry`=30236;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(30236,0,0,0x0,0x1,'');

DELETE FROM `creature_model_info` WHERE `modelid`=27101;
INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`) VALUES
(27101,0.3055,1,2);

UPDATE `creature_template` SET `VehicleId`=246,`npcflag`=0x1000000,`resistance2`=4394,`resistance4`=1 WHERE `entry`=30236;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=30236;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(30236,57573,1,0);

SET @OGUID  := 7278;
DELETE FROM `gameobject` WHERE `id` IN (192657,192658,192769,192770,192767,192768,192771,192772);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0, 192657, 571, 1, 64, 6255.958, 93.05556, 403.0368, 5.454153, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+1, 192658, 571, 1, 64, 6255.961, 93.06424, 408.4696, 5.44543, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+2, 192769, 571, 1, 64, 6219.205, 59.86806, 392.5132, 6.283184, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+3, 192770, 571, 1, 64, 6219.202, 59.875, 397.924, 6.274461, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+4, 192767, 571, 1, 64, 6297.223, 53.39583, 402.9972, 5.532692, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+5, 192768, 571, 1, 64, 6297.226, 53.40451, 408.4129, 5.523969, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+6, 192771, 571, 1, 64, 6162.772, 60.73438, 392.4362, 6.265733, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+7, 192772, 571, 1, 64, 6162.768, 60.74306, 397.8138, 6.257008, 0, 0, 0, 1, 120, 255, 1);

UPDATE `gameobject_template` SET `flags`=32,`faction`=114 WHERE `entry` IN (192657,192658,192769,192770,192767,192768,192771,192772);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26467;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26467;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26467 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26467,0,0,0,11,0,100,0,0,0,0,0,11,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On spawn - Spellcast Jormungar Tunnel Passive'),
(26467,0,1,0,21,0,100,0,0,0,0,0,11,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On reached homeposition - Spellcast Jormungar Tunnel Passive'),
(26467,0,2,0,1,0,100,0,3000,5000,15000,18000,11,51879,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jormungar Tunneler - On update (IC) - Spellcast Corrode Flesh'),
(26467,0,3,0,4,0,100,0,0,0,0,0,28,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On aggro - Remove Jormungar Tunnel Passive');-- Pathing for Ol' Sooty Entry: 1225
SET @NPC := 8877;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawntimesecs`=1200,`spawndist`=0,`MovementType`=2,`position_x`=-5716.181152,`position_y`=-3110.810791,`position_z`=316.686523 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5716.181152,-3110.810791,316.686523,0,0,0,100,0), 
(@PATH,2,-5716.187012,-3093.080078,325.600677,0,0,0,100,0), 
(@PATH,3,-5712.214355,-3090.297607,327.738647,0,0,0,100,0), 
(@PATH,4,-5705.484375,-3092.523438,329.362366,0,0,0,100,0), 
(@PATH,5,-5681.826660,-3110.568848,338.121887,0,0,0,100,0), 
(@PATH,6,-5659.498535,-3122.215576,344.336151,0,0,0,100,0), 
(@PATH,7,-5639.585938,-3124.536133,348.404938,0,0,0,100,0), 
(@PATH,8,-5618.112793,-3110.905762,360.618225,0,0,0,100,0), 
(@PATH,9,-5621.486816,-3096.315918,368.247772,0,0,0,100,0), 
(@PATH,10,-5632.212891,-3078.608398,374.990936,0,0,0,100,0), 
(@PATH,11,-5629.793457,-3056.124023,384.465576,0,0,0,100,0), 
(@PATH,12,-5642.278809,-3036.872314,385.471649,0,0,0,100,0), 
(@PATH,13,-5609.369141,-3006.883301,386.288177,0,0,0,100,0), 
(@PATH,14,-5643.634277,-3036.388672,385.531891,0,0,0,100,0), 
(@PATH,15,-5630.174805,-3057.015869,384.385712,0,0,0,100,0), 
(@PATH,16,-5629.840332,-3065.496338,381.129578,0,0,0,100,0), 
(@PATH,17,-5634.866211,-3078.448975,374.489044,0,0,0,100,0), 
(@PATH,18,-5620.416504,-3101.081543,364.819855,0,0,0,100,0), 
(@PATH,19,-5624.629395,-3117.040527,354.493805,0,0,0,100,0), 
(@PATH,20,-5644.949707,-3125.081787,347.271362,0,0,0,100,0), 
(@PATH,21,-5660.741699,-3121.580566,343.975922,0,0,0,100,0), 
(@PATH,22,-5676.210938,-3111.586914,340.021484,0,0,0,100,0), 
(@PATH,23,-5691.895508,-3102.994385,333.646698,0,0,0,100,0), 
(@PATH,24,-5711.662109,-3088.433594,328.761566,0,0,0,100,0), 
(@PATH,25,-5717.663574,-3099.033691,321.686920,0,0,0,100,0), 
(@PATH,26,-5705.214844,-3132.324219,315.837585,0,0,0,100,0), 
(@PATH,27,-5679.014160,-3185.046875,319.508057,0,0,0,100,0);

-- Set chaining for Doomguard minion quests
UPDATE `quest_template` SET `PrevQuestId`=7581 WHERE `Id`=7582; -- Complete The Prison's Bindings before The Prison's Casing
UPDATE `quest_template` SET `PrevQuestId`=7582 WHERE `Id`=7583; -- Complete The Prison's Casing before Suppression




-- update quest linking for Egg Collection
UPDATE `quest_template` SET `NextQuestId`=5522 WHERE `Id`=4735;
-- --------------------------------------------------------------------------------------------------------------
-- Test of Endurance (Gecko32)
DELETE FROM `event_scripts` WHERE `id`=747 AND `command`=10 AND `datalong`=4100; -- Remove summon of Screeching Harpies
UPDATE `event_scripts` SET `delay`=5 WHERE `id`=747 AND `command`=10 AND `datalong`=4490; -- Lower summon time of Grenka Bloodscreech from 40 sec to 5 sec
-- --------------------------------------------------------------------------------------------------------------
-- Tapper Swindlekeg (24711) fix Alliance faction exploitation (nelgano)
UPDATE `creature_template` SET `unit_flags`=4864 WHERE `entry`=24711;
-- --------------------------------------------------------------------------------------------------------------
DELETE FROM `gameobject` WHERE `guid`=335;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(335,1684,1,1,1,1524.929,-4371.182,17.94367,1.62046,0,0,0,1,300,100,1);

DELETE FROM `gameobject` WHERE `guid`IN (335,);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(335,324,1,1,1,-6314,507.647,7.651,0.496,0,0,0,0,2700,100,1),
(347,1684,1,1,1,1524.929,-4371.182,17.94367,1.62046,0,0,0,1,300,100,1);

-- Fix Jormungar Tunneler
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26467;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26467;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26467 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26467,0,0,0,11,0,100,0,0,0,0,0,11,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On spawn - Spellcast Jormungar Tunnel Passive'),
(26467,0,1,0,21,0,100,0,0,0,0,0,11,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On reached homeposition - Spellcast Jormungar Tunnel Passive'),
(26467,0,2,0,1,0,100,0,3000,5000,15000,18000,11,51879,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jormungar Tunneler - On update (IC) - Spellcast Corrode Flesh'),
(26467,0,3,0,4,0,100,0,0,0,0,0,28,47677,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jormungar Tunneler - On aggro - Remove Jormungar Tunnel Passive');
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Fjord Hawk: Lots of these had incorrect movement.
DELETE FROM `creature_addon` WHERE `guid` IN (112058,112059,112088,112089,112091,112114,112115,112141,112142,112149,112150,112151,112152,112153,112154,112155,112156,112157,112158);
INSERT INTO `creature_addon` (`guid`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(112058,0,1,1,''),(112059,0,1,1,''),(112088,0,1,1,''),
(112089,0,1,1,''),(112091,0,1,1,''),(112114,0,1,1,''),
(112115,0,1,1,''),(112141,0,1,1,''),(112142,0,1,1,''),
(112149,0,1,1,''),(112150,0,1,1,''),(112151,0,1,1,''),
(112152,0,1,1,''),(112153,0,1,1,''),(112154,0,1,1,''),
(112155,0,1,1,''),(112156,0,1,1,''),(112157,0,1,1,''),(112158,0,1,1,'');
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (112058,112059,112088,112089,112091,112114,112115,112141,112142,112149,112150,112151,112152,112153,112154,112155,112156,112157,112158);
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAI for Lashers
UPDATE `creature_addon` SET `bytes1`=0 WHERE `guid` BETWEEN 88228 AND 88237;
UPDATE `creature_addon` SET `bytes1`=0 WHERE `guid` BETWEEN 131438 AND 131457;
UPDATE `creature_addon` SET `auras`='' WHERE `guid`=131452;
UPDATE `creature_addon` SET `bytes1`=0 WHERE `guid` IN (106897,106898,106899,106900,106902,106903,106909,106910,106911,106912,106913,106914,106915,106916,106917,106918);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`IN(27254,30845,34300);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`IN(27254,30845,34300);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27254,30845,34300) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Emerald Lasher
(27254,0,0,2,11,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Emerald Lasher - On spawn - Set unitfield_bytes1 9 (submerged)'),
(27254,0,1,2,21,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Emerald Lasher - On reached homeposition - Set unitfield_bytes1 9 (submerged)'),
(27254,0,2,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Emerald Lasher - Linked with event 0 or 1 - Disable combat movement'),
(27254,0,3,0,4,0,100,0,0,0,0,0,11,37752,0,0,0,0,0,1,0,0,0,0,0,0,0,'Emerald Lasher - On aggro - Spellcast Stand'),
(27254,0,4,0,0,0,100,0,1500,1500,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Emerald Lasher - On update (IC) - Enable combat movement'),
(27254,0,5,0,0,0,100,0,4000,7000,9000,13000,11,51901,0,0,0,0,0,2,0,0,0,0,0,0,0,'Emerald Lasher - On update (IC) - Spellcast Dream Lash'),
-- Living Lasher
(30845,0,0,2,11,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Living Lasher - On spawn - Set unitfield_bytes1 9 (submerged)'),
(30845,0,1,2,21,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Living Lasher - On reached homeposition - Set unitfield_bytes1 9 (submerged)'),
(30845,0,2,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Living Lasher - Linked with event 0 or 1 - Disable combat movement'),
(30845,0,3,0,4,0,100,0,0,0,0,0,11,37752,0,0,0,0,0,1,0,0,0,0,0,0,0,'Living Lasher - On aggro - Spellcast Stand'),
(30845,0,4,0,0,0,100,0,1500,1500,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Living Lasher - On update (IC) - Enable combat movement'),
(30845,0,5,0,0,0,100,0,4000,7000,9000,13000,11,51901,0,0,0,0,0,2,0,0,0,0,0,0,0,'Living Lasher - On update (IC) - Spellcast Dream Lash'),
-- 34300 Mature Lasher
(34300,0,0,2,11,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mature Lasher - On spawn - Set unitfield_bytes1 9 (submerged)'),
(34300,0,1,2,21,0,100,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mature Lasher - On reached homeposition - Set unitfield_bytes1 9 (submerged)'),
(34300,0,2,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mature Lasher - Linked with event 0 or 1 - Disable combat movement'),
(34300,0,3,0,4,0,100,0,0,0,0,0,11,37752,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mature Lasher - On aggro - Spellcast Stand'),
(34300,0,4,0,0,0,100,0,1500,1500,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mature Lasher - On update (IC) - Enable combat movement'),
(34300,0,5,0,0,0,100,0,4000,7000,9000,13000,11,51901,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mature Lasher - On update (IC) - Spellcast Dream Lash');
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Secrets of the Scourge
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12312;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Icehorn updates from sniffs
UPDATE `creature_template` SET `speed_run`=0.9920629, `rank`=4, `unit_flags`=32832, `family`=43, `type_flags`=65537 WHERE `entry`=32361;
DELETE FROM `creature_template_addon` WHERE `entry`=32361;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(32361,0,0,1,'60915');
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dragonblight optical improvements
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (27203,30058);
UPDATE `creature_template` SET `inhabitType`=4 WHERE `entry`=30078;
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (131075,131077);
UPDATE `creature_addon` SET `auras`='42048' WHERE `guid`=131066;
UPDATE `creature_addon` SET `auras`='42049' WHERE `guid`=106614;
UPDATE `creature_addon` SET `auras`='42050' WHERE `guid`=131068;
UPDATE `creature_addon` SET `auras`='42051' WHERE `guid`=106634;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (27222,27223,30078);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-102199,-105487,-105488,-105489,-105495,-131055,-131056,-131058,-131059) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-102199,0,0,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Footman - On reset - Set event phase 1'),
(-102199,0,1,2,1,1,100,0,2000,2000,12000,14000,11,48115,0,0,0,0,0,19,27222,30,0,0,0,0,0,'Onslaught Footman - On OOC update (phase 1) - Spellcast Shoot on Archery Target'),
(-102199,0,2,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Footman - On OOC update (phase 1) - Set event phase 2'),
(-102199,0,3,4,1,2,100,0,16000,18000,16000,18000,11,48117,0,0,0,0,0,19,27223,30,0,0,0,0,0,'Onslaught Footman - On OOC update (phase 2) - Spellcast Shoot on Archery Target'),
(-102199,0,4,0,61,2,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Footman - On OOC update (phase 2) - Set event phase 4'),
(-105487,0,0,0,1,0,100,0,2000,2000,0,0,11,55840,0,0,0,0,0,10,107492,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Blue Wyrmrest Warden Beam'),
(-105488,0,0,0,1,0,100,0,2000,2000,0,0,11,55841,0,0,0,0,0,10,107491,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Yellow Wyrmrest Warden Beam'),
(-105489,0,0,0,1,0,100,0,2000,2000,0,0,11,55841,0,0,0,0,0,10,107491,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Yellow Wyrmrest Warden Beam'),
(-105495,0,0,0,1,0,100,0,2000,2000,0,0,11,55840,0,0,0,0,0,10,107492,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Blue Wyrmrest Warden Beam'),
(-131055,0,0,0,1,0,100,0,2000,2000,0,0,11,55838,0,0,0,0,0,10,131075,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Green Wyrmrest Warden Beam'),
(-131056,0,0,0,1,0,100,0,2000,2000,0,0,11,55824,0,0,0,0,0,10,131077,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Red Wyrmrest Warden Beam'),
(-131058,0,0,0,1,0,100,0,2000,2000,0,0,11,55838,0,0,0,0,0,10,131075,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Green Wyrmrest Warden Beam'),
(-131059,0,0,0,1,0,100,0,2000,2000,0,0,11,55824,0,0,0,0,0,10,131077,0,0,0,0,0,0,'Warden of the Chamber - On reset - Spellcast Red Wyrmrest Warden Beam');
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Borean Tundra visual improvement and missing spawn
SET @GOGUID :=356; -- need 1 set by TDB
SET @GUID :=43460; -- need 3 set by TDB
DELETE FROM `gameobject` WHERE `guid`=@GOGUID;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GOGUID,187879,571,1,1,4207.366,4056.894,91.62077,2.792518,0,0,0.984807,0.1736523,300,100,1);
DELETE FROM `creature` WHERE `guid` in (@GUID+0,@GUID+1,@GUID+2);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,24021,571,1,1,21999,0,4207.475,4056.687,93.53715,2.094395,300,0,0,42,0,0,0,0,0),
(@GUID+1,23837,571,1,1,11686,0,4207.471,4056.705,93.66189,3.979351,300,0,0,42,0,0,0,0,0),
(@GUID+2,24957,571,1,1,0,0,4200.877,4056.888,92.28766,6.25263,300,0,0,7185,7196,0,0,0,0);
DELETE FROM `smart_scripts` WHERE `entryorguid`=24957 AND `source_type`=0 AND `id` IN (1,3);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24957,0,1,0,11,0,100,0,0,0,0,0,11,45820,0,0,0,0,0,9,24021,0,30,0,0,0,0,'Cult Plaguebringer - On spawn - Spellcast Plague Cauldron Beam'),
(24957,0,3,0,21,0,100,0,0,0,0,0,11,45820,0,0,0,0,0,9,24021,0,30,0,0,0,0,'Cult Plaguebringer - On reached homeposition - Spellcast Plague Cauldron Beam');
UPDATE `creature_addon` SET `auras`='45797' WHERE `guid` IN (98730,115941);
DELETE FROM `creature_addon` WHERE `guid` IN (@GUID+0,@GUID+1);
INSERT INTO `creature_addon` (`guid`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@GUID+0,0,0,1,'45797'),
(@GUID+1,0,0,1,'45797');


SET @GUID :=43494; -- need 8 set by TDB
SET @OGUID :=5681; -- need 3 set by TDB

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9426 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9615 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9426,0,0, 'Remove the Eye of the Prophets from the idol''s face.',1,1,0,0,0,0, ''),
(9615,1,0, 'I need another of your elixirs, Drakuru.',1,1,0,0,0,0, '');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9426 AND `text_id` IN (12669,12670);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9426,12669),(9426,12670);

-- Creature Template update from sniff
UPDATE `creature_template` SET `minLevel`=70, `maxLevel`=70, `unit_flags`=33024, `AIName`='SmartAI' WHERE `entry` IN (26500);
UPDATE `creature_template` SET `npcflag`=2, `unit_flags`=33024, `AIName`='SmartAI' WHERE `entry` IN (26543,26701,26787);

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=61 WHERE `item`=35799 AND `entry`=26447;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=58 WHERE `item`=35799 AND `entry`=26425;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100 WHERE `item`=35836;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=49 WHERE `item`=36743 AND `entry`=26704;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=50 WHERE `item`=36743 AND `entry`=27554;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=51 WHERE `item`=36758 AND `entry`=26795;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=48 WHERE `item`=36758 AND `entry`=26797;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=66 WHERE `item`=38303 AND `entry`=26620;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=67 WHERE `item`=38303 AND `entry`=26639;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=15 WHERE `item`=38303 AND `entry`=27431;

UPDATE `creature_involvedrelation` SET `id`=26543 WHERE `quest`=12007;
UPDATE `creature_involvedrelation` SET `id`=26701 WHERE `quest`=12802;
UPDATE `creature_involvedrelation` SET `id`=26787 WHERE `quest`=12068;
UPDATE `creature_questrelation` SET `id`=26543 WHERE `quest`=12042;
UPDATE `creature_questrelation` SET `id`=26701 WHERE `quest`=12068;
UPDATE `creature_questrelation` SET `id`=26787 WHERE `quest`=12238;

DELETE FROM `creature_text` WHERE `entry`=26500;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(26500,0,0,'I''ll be waitin'' for ya, mon.',15,0,100,0,0,0,'Image of Drakuru');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=47110;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9426 AND `SourceEntry`=12670;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9426 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9615 AND `SourceEntry`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,47110,0,0,31,0,3,26498,0,0,0,'','Spell Summon Drakuru''s Image targets Drakuru''s Bunny 01'),
(13,1,47110,0,1,31,0,3,26559,0,0,0,'','Spell Summon Drakuru''s Image targets Drakuru''s Bunny 02'),
(13,1,47110,0,2,31,0,3,26700,0,0,0,'','Spell Summon Drakuru''s Image targets Drakuru''s Bunny 03'),
(13,1,47110,0,3,31,0,3,26789,0,0,0,'','Spell Summon Drakuru''s Image targets Drakuru''s Bunny 04'),
(13,1,47110,0,4,31,0,3,28015,0,0,0,'','Spell Summon Drakuru''s Image targets Drakuru''s Bunny 05'),
(14,9426,12670,0,0,2,0,35806,1,1,0,0,'','Seer of Zeb''Halak - Show different gossip if player has item Eye of the Propehts'),
(15,9426,0,0,0,9,0,12007,0,0,0,0,'','Seer of Zeb''Halak - Show gossip option if player has taken quest 12007'),
(15,9426,0,0,0,2,0,35806,1,1,1,0,'','Seer of Zeb''Halak - Show gossip option if player has not item Eye of the Propehts'),
(15,9615,1,0,0,8,0,11990,0,0,0,0,'','Drakuru - Show gossip option if player has rewarded quest 11990'),
(15,9615,1,0,0,8,0,12238,0,0,1,0,'','Drakuru - Show gossip option if player has not rewarded quest 12238'),
(15,9615,1,0,0,2,0,35797,1,1,1,0,'','Drakuru - Show gossip option if player has not item Drakuru''s Elixir');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=188458;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (26498,26559,26700,26789);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26498,26500,26543,26559,26700,26701,26787,26789) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26423 AND `source_type`=0 AND `id` IN (2,3);
DELETE FROM `smart_scripts` WHERE `entryorguid`=188458 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26423,0,2,3,62,0,100,0,9615,1,0,0,85,50021,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru - On gossip option select - Invoker spellcast Replace Drakuru''s Elixir'),
(26423,0,3,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru - On gossip option select - Close gossip'),
(26498,0,0,0,8,0,100,0,47110,0,0,0,11,47117,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru''s Bunny 01 - On spellhit - Spellcast Script Cast Summon Image of Drakuru'),
(26500,0,0,1,19,0,100,0,12007,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Image of Drakuru - On quest accepted - Say text'),
(26500,0,1,0,61,0,100,0,12007,0,0,0,11,47122,0,0,0,0,0,7,0,0,0,0,0,0,0,'Image of Drakuru - On quest accepted - Spellcast Strip Detect Drakuru'),
(26543,0,0,1,19,0,100,0,12042,0,0,0,11,47308,0,0,0,0,0,7,0,0,0,0,0,0,0,'Image of Drakuru - On quest accepted - Spellcast Strip Detect Drakuru 02'),
(26559,0,0,0,8,0,100,0,47110,0,0,0,11,47149,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru''s Bunny 02 - On spellhit - Spellcast Script Cast Summon Image of Drakuru 02'),
(26700,0,0,0,8,0,100,0,47110,0,0,0,11,47316,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru''s Bunny 03 - On spellhit - Spellcast Script Cast Summon Image of Drakuru 03'),
(26701,0,0,1,19,0,100,0,12068,0,0,0,11,47403,0,0,0,0,0,7,0,0,0,0,0,0,0,'Image of Drakuru - On quest accepted - Spellcast Strip Detect Drakuru 03'),
(26787,0,0,1,19,0,100,0,12238,0,0,0,11,48417,0,0,0,0,0,7,0,0,0,0,0,0,0,'Image of Drakuru - On quest accepted - Spellcast Strip Detect Drakuru 04'),
(26789,0,0,0,8,0,100,0,47110,0,0,0,11,47405,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru''s Bunny 04 - On spellhit - Spellcast Script Cast Summon Image of Drakuru 04'),
(188458,1,0,1,62,0,100,0,9426,0,0,0,85,47293,0,0,0,0,0,7,0,0,0,0,0,0,0,'Seer of Zeb''Halak - On gossip option select - Invoker spellcast Create Eye of the Prophets'),
(188458,1,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Seer of Zeb''Halak - On gossip option select - Close gossip');

DELETE FROM `spell_scripts` WHERE `id` IN (47117,47149,47316,47405,50439);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(47117,0,0,15,47118,2,0,0,0,0,0), -- Script Cast Summon Image of Drakuru - Spellcast Envision Drakuru
(47149,0,0,15,47150,2,0,0,0,0,0), -- Script Cast Summon Image of Drakuru 02 - Spellcast Envision Drakuru
(47316,0,0,15,47317,2,0,0,0,0,0), -- Script Cast Summon Image of Drakuru 03 - Spellcast Envision Drakuru
(47405,0,0,15,47406,2,0,0,0,0,0), -- Script Cast Summon Image of Drakuru 04 - Spellcast Envision Drakuru
(50439,0,0,15,50440,2,0,0,0,0,0); -- Script Cast Summon Image of Drakuru 05 - Spellcast Envision Drakuru

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-47122,-47308,-47403,-48417);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-47122,-47118,0,'On Strip Detect Drakuru fade - Remove Envision Drakuru'),
(-47308,-47150,0,'On Strip Detect Drakuru 02 fade - Remove Envision Drakuru'),
(-47403,-47317,0,'On Strip Detect Drakuru 03 fade - Remove Envision Drakuru'),
(-48417,-47406,0,'On Strip Detect Drakuru 04 fade - Remove Envision Drakuru');

DELETE FROM `creature` WHERE `guid` in (@GUID+0,@GUID+1,@GUID+2,@GUID+3,@GUID+4,@GUID+5,@GUID+6,@GUID+7);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,26498,571,1,1,19595,0,3386.607,-1805.944,115.2497,3.001966,300,0,0,0,0,0,0,0,0),
(@GUID+1,26500,571,1,1,0,0,3386.272,-1805.434,115.4441,4.939282,300,0,0,0,0,0,0,0,0),
(@GUID+2,26559,571,1,1,19595,0,4243.962,-2024.805,238.2487,1.411705,300,0,0,0,0,0,0,0,0),
(@GUID+3,26543,571,1,1,0,0,4243.962,-2024.805,238.2487,1.411705,300,0,0,0,0,0,0,0,0),
(@GUID+4,26700,571,1,1,19595,0,4523.894,-3472.863,228.2441,4.695459,300,0,0,0,0,0,0,0,0),
(@GUID+5,26701,571,1,1,0,0,4523.894,-3472.863,228.2441,4.695459,300,0,0,0,0,0,0,0,0),
(@GUID+6,26787,571,1,1,0,0,4599.709,-4876.9,48.95556,0.719772,300,0,0,0,0,0,0,0,0),
(@GUID+7,26789,571,1,1,19595,0,4599.709,-4876.9,48.95556,0.719772,300,0,0,0,0,0,0,0,0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (26500,26543,26701,26787);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(26500,0,0,65536,1,0,'43167 47119'),
(26543,0,0,65536,1,0,'43167 47119'),
(26701,0,0,65536,1,0,'43167 47119'),
(26787,0,0,65536,1,0,'43167 47119');

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+2;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0,188600,571,1,1,3980.721,-1956.352,210.6624,1.169369,0,0,0,1,120,255,1),
(@OGUID+1,188600,571,1,1,3957.188,-1908.295,209.97,0.8901166,0,0,0,1,120,255,1),
(@OGUID+2,188600,571,1,1,3964.761,-1884.524,208.2739,1.692969,0,0,0,1,120,255,1);

-- Fix [Q]{A/H} Meet At The Grave
UPDATE `creature_template_addon` SET `auras`='10848' WHERE `entry`=9299; -- allow to be seen in world of death
UPDATE `creature_template` SET `npcflag`=32770,`unit_flags`=768 WHERE `entry`=9299; -- makes unseen in world of living

DELETE FROM `player_factionchange_items` WHERE `alliance_id` IN (15198, 47937);
INSERT INTO `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) VALUES
(0, 15198, 'Knight\'s Colors', 0, 15199, 'Stone Guard\'s Herald'),
(0, 47937, 'Girdle of the Nether Champion', 0, 48009, 'Belt of the Nether Champion');

UPDATE `game_event` SET `start_time`= '2012-11-18 01:00:00' WHERE `eventEntry`=26;REPLACE INTO `creature_template` VALUES (190000, 0, 0, 0, 0, 0, 29348, 0, 0, 0, 'Arena Spectator', 'Spectate Master', 'Speak', 50001, 71, 71, 2, 35, 35, 3, 1, 1.14286, 1.25, 1, 124, 256, 0, 783, 1, 2000, 0, 1, 2, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 138936390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 168000, 190000, '', 0, 3, 1, 1.56, 1.56, 1.56, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 'npc_arena_spectator', 12340);

DELETE FROM `command` WHERE `name` = 'spectate';        
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate', 0, 'Syntax: .spectate $subcommand.\nUse .help sppectate');
DELETE FROM `command` WHERE `name` = 'spectatefrom';    
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate view', 0, 'Syntax: .spectate view #player\nAllow player to spectate arena from anotherplayer.');
DELETE FROM `command` WHERE `name` = 'spectate leav';   
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate leave', 0, 'Syntax: .spectate leave\nDisable spectator mode.');
DELETE FROM `command` WHERE `name` = 'spectate player'; 
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate player', 0, 'Syntax: .spectate player #player\nAllow to spectate player.');
DELETE FROM `command` WHERE `name` = 'spectate reset';  
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate reset', 0, 'Syntax: .spectate reset\nSend addon data.');

UPDATE `gameobject_template` SET `flags` = 36 WHERE entry IN (185918, 185917, 183970, 183971, 183972, 183973, 183977, 183979, 183978, 183980);REPLACE INTO `battleground_template` VALUES (1, 20, 40, 51, 80, 611, 3.16312, 610, 0.715504, 100, 0, '', 'Alterac Valley');
REPLACE INTO `battleground_template` VALUES (2, 1, 10, 10, 80, 769, 3.14159, 770, 0.151581, 75, 1, '', 'Warsong Gulch');
REPLACE INTO `battleground_template` VALUES (3, 2, 15, 20, 80, 890, 3.91571, 889, 0.813671, 75, 1, '', 'Arathi Basin');
REPLACE INTO `battleground_template` VALUES (7, 2, 15, 61, 80, 1103, 3.03123, 1104, 0.055761, 75, 1, '', 'Eye of The Storm');
REPLACE INTO `battleground_template` VALUES (4, 0, 2, 10, 80, 929, 0, 936, 3.14159, 20, 1, '', 'Nagrand Arena');
REPLACE INTO `battleground_template` VALUES (5, 0, 2, 10, 80, 939, 0, 940, 3.14159, 20, 1, '', 'Blades\'s Edge Arena');
REPLACE INTO `battleground_template` VALUES (8, 0, 2, 10, 80, 1258, 0, 1259, 3.14159, 20, 1, '', 'Ruins of Lordaeron');
REPLACE INTO `battleground_template` VALUES (9, 10, 15, 71, 80, 1367, 0, 1368, 0, 0, 0, '', 'Strand of the Ancients');
REPLACE INTO `battleground_template` VALUES (10, 0, 5, 10, 80, 1362, 0, 1363, 0, 20, 1, '', 'Dalaran Sewers');
REPLACE INTO `battleground_template` VALUES (11, 5, 5, 10, 80, 1364, 0, 1365, 0, 20, 0, '', 'The Ring of Valor');
REPLACE INTO `battleground_template` VALUES (30, 20, 40, 71, 80, 1485, 0, 1486, 3.16124, 200, 0, '', 'Isle of Conquest');
REPLACE INTO `battleground_template` VALUES (32, 1, 10, 1, 80, 0, 0, 0, 0, 0, 1, '', 'Random battleground');
REPLACE INTO `battleground_template` (`id`, `MinPlayersPerTeam`, `MaxPlayersPerTeam`, `MinLvl`, `MaxLvl`, `AllianceStartLoc`, `AllianceStartO`, `HordeStartLoc`, `HordeStartO`, `StartMaxDist`, `Weight`, `ScriptName`, `Comment`) VALUES
(6,0,2,10,80,0,0,0,0,0,1,'','All Arena');

-- Creature Template update from sniff
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `speed_walk`=2, `speed_run`=0.992062, `unit_flags`=768, `equipment_id`=2481 WHERE `entry`=28498;
UPDATE `creature_template` SET `gossip_menu_id`=9707, `faction_A`=190, `faction_H`=190, `speed_walk`=2, `npcflag`=`npcflag`|1, `unit_flags`=33024 WHERE `entry`=28016;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (28015,28016,28492,28498);

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9707 AND `text_id`=13265;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9707,13265);

DELETE FROM `creature_equip_template` WHERE `entry`=2481;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(2481,33475,0,0);

UPDATE `creature_model_info` SET `bounding_radius`=2.5, `combat_reach`=2.5 WHERE `modelid`=28122;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51825;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,51825,0,0,31,0,3,28016,0,0,0,'','Spell Arthas Scourge Drakuru targets Drakuru');

-- Creature text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (28016,28498);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(28016,0,0,'Ahh,  Back in Drak''Tharon at last!',12,0,100,71,0,14006,'Drakuru'),
(28016,1,0,'Drakuru casts his gaze down on Drak''Tharon Keep.',16,0,100,0,0,0,'Drakuru'),
(28016,2,0,'Ya done well, mon....',12,0,100,0,0,14007,'Drakuru'),
(28016,3,0,'Ya surpassed my greatest hopes.',12,0,100,0,0,14008,'Drakuru'),
(28016,4,0,'For your efforts, you be gettin'' da greatest of rewards....',12,0,100,0,0,14009,'Drakuru'),
(28016,5,0,'Revelation!',12,0,100,5,0,14010,'Drakuru'),
(28016,6,0,'Be still, friend, and behold da truth of things!',12,0,100,0,0,14011,'Drakuru'),
(28016,7,0,'Master, my mission be complete.',12,0,100,0,0,14012,'Drakuru'),
(28016,8,0,'With da help of these mortals, dis region been cleansed of all who oppose us.',12,0,100,0,0,14013,'Drakuru'),
(28016,9,0,'As you wish, master.',12,0,100,396,0,14014,'Drakuru'),
(28016,10,0,'Forgive my deception, mon. It all been for your own good.',12,0,100,396,0,14015,'Drakuru'),
(28016,11,0,'Ya needed ta prove yer worthiness....',12,0,100,396,0,14016,'Drakuru'),
(28016,12,0,'I be needin'' worthy underlings in Zul''Drak, mon. Ones ready to wield real power.',12,0,100,396,0,14017,'Drakuru'),
(28016,13,0,'You see for yourself now. Da Lich King be generous to dem who obey.',12,0,100,396,0,14018,'Drakuru'),
(28016,14,0,'Follow dis path, mon, and soon you be tastin'' immortality!',12,0,100,396,0,14019,'Drakuru'),

(28498,0,0,'You have done well, Drakuru.',12,0,100,396,0,14749,'The Lich King'),
(28498,1,0,'Your betrayal of the Drakkari Empire has borne me a new army.',12,0,100,396,0,14750,'The Lich King'),
(28498,2,0,'Your army....',12,0,100,0,0,14751,'The Lich King'),
(28498,3,0,'Arise, and accept my gift.',12,0,100,396,0,14752,'The Lich King'),
(28498,4,0,'I charge you now with the cleansing of Zul''Drak, Drakuru.',12,0,100,397,0,14753,'The Lich King'),
(28498,5,0,'Fail me and it shall be your undoing...',12,0,100,396,0,14754,'The Lich King'),
(28498,6,0,'Succeed, and even greater power shall be yours!',12,0,100,396,0,14755,'The Lich King');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28015,28016,28498,-127497,-127496,-127495,-127493) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28492*100,28016*100,28016*100+1,28498*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28015,0,0,0,8,0,100,0,47110,0,0,0,11,50439,0,0,0,0,0,7,0,0,0,0,0,0,0,'Drakuru''s Bunny 05 - On spellhit - Spellcast Script Cast Summon Image of Drakuru 05'),
(28016,0,0,0,54,0,100,0,0,0,0,0,80,28016*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On update - Run script'),
(28016,0,1,2,40,0,100,0,1,0,0,0,54,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 1 - Pause movement 2 seconds'),
(28016,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru - On WP 1 - Say line'),
(28016,0,3,4,40,0,100,0,5,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 5 - Pause movement 8 seconds'),
(28016,0,4,5,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru - On WP 5 - Say line'),
(28016,0,5,0,61,0,100,0,0,0,0,0,80,28016*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 5 - Run script'),
(28016,0,6,7,40,0,100,0,8,0,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 8 - Pause movement 4 seconds'),
(28016,0,7,8,61,0,100,0,0,0,0,0,1,3,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru - On WP 8 - Say line'),
(28016,0,8,0,61,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 8 - Set unit_field_bytes1'),
(28016,0,9,10,40,0,100,0,9,0,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 9 - Pause movement 4 seconds'),
(28016,0,10,0,61,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 9 - Set unit_field_bytes1'),
(28016,0,11,12,40,0,100,0,10,0,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 10 - Pause movement 3 seconds'),
(28016,0,12,13,61,0,100,0,0,0,0,0,1,4,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru - On WP 10 - Say line'),
(28016,0,13,0,61,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 10 - Set unit_field_bytes1'),
(28016,0,14,15,40,0,100,0,12,0,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On WP 12 - Stop movement'),
(28016,0,15,16,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.694936,'Drakuru - On WP 12 - Set orientation'),
(28016,0,16,0,61,0,100,0,0,0,0,0,1,5,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru - On WP 12 - Say line'),
(28016,0,18,0,8,0,100,0,51825,0,0,0,11,51834,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru - On spellhit Arthas Scourge Drakuru - Spellcast Drakuru Transform'),

(28498,0,0,0,54,0,100,0,0,0,0,0,53,0,28498,0,0,0,0,1,0,0,0,0,0,0,0,'The Lich King - Just summoned - Start WP movement'),
(28498,0,1,2,40,0,100,0,2,0,0,0,54,83000,0,0,0,0,0,1,0,0,0,0,0,0,0,'The Lich King - On WP 2 - Pause movement 83 seconds'),
(28498,0,2,0,61,0,100,0,0,0,0,0,80,28498*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'The Lich King - On WP 2 - Run script'),
(28498,0,3,4,40,0,100,0,3,0,0,0,45,0,2,0,0,0,0,10,127495,0,0,0,0,0,0,'The Lich King - On WP 3 - Despawn'),
(28498,0,4,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'The Lich King - On WP 3 - Despawn'),

(-127497,0,0,1,38,0,100,0,0,1,0,0,11,51802,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Spellcast Red Lightning Bolt'),
(-127497,0,1,0,61,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Set data 0 0'),
(-127496,0,0,1,38,0,100,0,0,1,0,0,11,51802,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Spellcast Red Lightning Bolt'),
(-127496,0,1,0,61,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Set data 0 0'),
(-127493,0,0,1,38,0,100,0,0,1,0,0,11,51802,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Spellcast Red Lightning Bolt'),
(-127493,0,1,0,61,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Set data 0 0'),
(-127495,0,0,0,38,0,100,0,0,1,0,0,11,51807,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 1 - Spellcast Arthas Portal'),
(-127495,0,1,2,38,0,100,0,0,2,0,0,80,28492*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 2 set - Start script'),
(-127495,0,2,0,61,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 - On data 0 2 set - Set data 0 0'),

(28016*100,9,0,0,0,0,100,0,6000,6000,0,0,5,21,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Play emote applaud'),
(28016*100,9,1,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,2,0,0,0,100,0,6500,6500,0,0,50,190597,22.5,0,0,0,0,8,0,0,0,-241.5434,-675.4514,132.2164,-1.029743,'Drakuru script - Summon gameobject'),
(28016*100,9,3,0,0,0,100,0,6000,6000,0,0,50,190596,15.5,0,0,0,0,8,0,0,0,-235.8484,-680.4561,131.885,-2.792518,'Drakuru script - Summon gameobject'),
(28016*100,9,4,0,0,0,100,0,5000,5000,0,0,50,190595,11,0,0,0,0,8,0,0,0,-233.977,-673.1368,132.0999,0.7853968,'Drakuru script - Summon gameobject'),
(28016*100,9,5,0,0,0,100,0,6000,6000,0,0,11,51795,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Spellcast Shadow Channelling (10 sec)'),
(28016*100,9,6,0,0,0,100,0,5000,5000,0,0,45,0,1,0,0,0,0,10,127497,0,0,0,0,0,0,'Drakuru script - Set data 0 1'),
(28016*100,9,7,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,127496,0,0,0,0,0,0,'Drakuru script - Set data 0 1'),
(28016*100,9,8,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,127493,0,0,0,0,0,0,'Drakuru script - Set data 0 1'),
(28016*100,9,9,0,0,0,100,0,4000,4000,0,0,45,0,1,0,0,0,0,10,127495,0,0,0,0,0,0,'Drakuru script - Set data 0 1'),
(28016*100,9,10,0,0,0,100,0,1000,1000,0,0,1,6,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,11,0,0,0,100,0,5000,5000,0,0,12,28498,8,0,0,0,0,8,0,0,0,-237.1671,-702.1379,128.8857,1.570796,'Drakuru script - Summon Lich King'),
(28016*100,9,12,0,0,0,100,0,4000,4000,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Set unit_field_bytes1'),
(28016*100,9,13,0,0,0,100,0,2000,2000,0,0,1,7,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,14,0,0,0,100,0,6000,6000,0,0,1,8,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,15,0,0,0,100,0,33000,33000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Remove unit_field_bytes1'),
(28016*100,9,16,0,0,0,100,0,6000,6000,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Play emote roar'),
(28016*100,9,17,0,0,0,100,0,0,0,0,0,4,3326,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Play sound roar'),
(28016*100,9,18,0,0,0,100,0,12000,12000,0,0,1,9,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,19,0,0,0,100,0,27000,27000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.70526,'Drakuru script - Set orientation'),
(28016*100,9,20,0,0,0,100,0,7000,7000,0,0,1,10,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,21,0,0,0,100,0,8000,8000,0,0,1,11,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,22,0,0,0,100,0,8000,8000,0,0,1,12,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,23,0,0,0,100,0,11000,11000,0,0,1,13,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,24,0,0,0,100,0,7000,7000,0,0,1,14,0,0,0,0,0,23,0,0,0,0,0,0,0,'Drakuru script - Say line'),
(28016*100,9,25,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Set npcflag'),

(28016*100+1,9,0,0,0,0,100,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Remove npcflag'),
(28016*100+1,9,1,0,0,0,100,0,3000,3000,0,0,53,0,28016,0,0,0,0,1,0,0,0,0,0,0,0,'Drakuru script - Start WP movement'),

(28492*100,9,0,0,0,0,100,0,5000,5000,0,0,28,51807,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drak''Tharon - Drakuru Event Invisman 00 script - Remove aura Arthas Portal'),

(28498*100,9,0,0,0,0,100,0,15000,15000,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,1,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,2,0,0,0,100,0,10000,10000,0,0,1,2,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,3,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,4,0,0,0,100,0,5000,5000,0,0,11,51825,0,0,0,0,0,9,28016,0,10,0,0,0,0,'The Lich King script - Spellcast Arthas Scourge Drakuru'),
(28498*100,9,5,0,0,0,100,0,8000,8000,0,0,1,4,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,6,0,0,0,100,0,16000,16000,0,0,1,5,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line'),
(28498*100,9,7,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,23,0,0,0,0,0,0,0,'The Lich King script - Say line');

DELETE FROM `creature_template_addon` WHERE `entry` IN (28016,28498);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28016,0,0,0,1,0,''),
(28498,0,0,0,1,0,'');

DELETE FROM `spell_scripts` WHERE `id`=50439;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(50439,0,0,15,50440,2,0,0,0,0,0); -- Script Cast Summon Image of Drakuru - Spellcast Envision Drakuru

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=50440;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(50440,50446,1,'On Envision Drakuru - Spellcast Summon Drakuru');

DELETE FROM `waypoints` WHERE `entry` IN (28016,28498);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(28016, 1,-240.1569,-630.3474,116.4973,'pause and text'),
(28016, 2,-237.9522,-652.9613,131.131,''),
(28016, 3,-252.4211,-663.5404,131.2025,''),
(28016, 4,-261.2747,-667.5787,131.1916,''),
(28016, 5,-264.9144,-667.5964,131.1769,'pause and text'),
(28016, 6,-258.2646,-669.388,131.1983,''),
(28016, 7,-248.6646,-674.2229,132.1737,''),
(28016, 8,-243.7752,-674.9374,131.8365,'pause'),
(28016, 9,-236.3793,-678.6719,131.8578,'pause'),
(28016,10,-235.4743,-674.3039,131.8569,'pause'),
(28016,11,-234.869,-674.1355,131.8544,''),
(28016,12,-237.0977,-676.1853,131.8683,''),

(28498,1,-237.4704,-689.8357,129.5296,''),
(28498,2,-237.2737,-686.5334,132.1735,'pause'),
(28498,3,-237.0624,-700.3822,130.4357,'');-- faze nejde
UPDATE `world`.`quest_template` SET `Method` = '0' WHERE `quest_template`.`Id` =12687;-- Exhausted Vrykul SAI
SET @ENTRY := 30146;
SET @SPELL_DESPERATE_BLOW := 57395;
SET @SPELL_DISCIPLINING_ROD := 56033;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100+0,@ENTRY*100+1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - Out of Combat - Set Bytes1 Sit"), -- Not doing this in creature_addon(_template) so that we can cancel this in SAI
(@ENTRY,0,1,2,8,0,100,0,@SPELL_DISCIPLINING_ROD,0,0,0,87,@ENTRY*100+0,@ENTRY*100+1,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Spellhit - Run Random Script"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Spellhit - Set Phase 1"), -- To prevent the same one to give more credits
(@ENTRY*100+0,9,0,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Attack Player"),
(@ENTRY*100+0,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Say Line 0 (random)"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Say Line 1 (random)"),
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,91,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Stand Up"),
(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Emote Work"),
(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,33,29886,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Kill Credit"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,11,@SPELL_DESPERATE_BLOW,0,0,0,0,0,2,0,0,0,0,0,0,0,"Exhausted Vrykul - At 15% HP - Cast Desperate Blow");-- Creature Gossip Update for midsummer event from sniff
UPDATE `creature_template` SET `gossip_menu_id`=9148 WHERE `entry`=16781; -- Midsummer Celebrant
UPDATE `creature_template` SET `gossip_menu_id`=7326 WHERE `entry`=16817; -- Festival Loremaster
UPDATE `creature_template` SET `gossip_menu_id`=11417 WHERE `entry`=25697; -- Luma Skymother <The Earthen Ring>
UPDATE `creature_template` SET `gossip_menu_id`=9260 WHERE `entry`=25754; -- Earthen Ring Flamecaller <The Earthen Ring>
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25883; -- Ashenvale Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25884; -- Ashenvale Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25887; -- Arathi Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25888; -- Azuremyst Isle Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25889; -- Blade's Edge Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25890; -- Blasted Lands Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25891; -- Bloodmyst Isle Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25892; -- Burning Steppes Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25893; -- Darkshore Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25894; -- Desolace Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25895; -- Dun Morogh Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25896; -- Duskwood Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25897; -- Dustwallow Marsh Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25898; -- Elwynn Forest Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25899; -- Feralas Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25900; -- Hellfire Peninsula Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25901; -- Hillsbrad Flame Warden -> Deleted in cata, taking from 3.x sniff
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25902; -- Loch Modan Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25903; -- Nagrand Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25904; -- Redridge Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25905; -- Shadowmoon Valley Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25906; -- Teldrassil Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25907; -- Terokkar Forest Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25908; -- The Hinterlands Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25909; -- Western Plaguelands Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25910; -- Westfall Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25911; -- Wetlands Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25912; -- Zangarmarsh Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25913; -- Netherstorm Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25914; -- Silithus Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25915; -- Cape of Stranglethorn Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25916; -- Tanaris Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=25917; -- Winterspring Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25918; -- Netherstorm Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25919; -- Silithus Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25920; -- Cape of Stranglethorn Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25921; -- Tanaris Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25922; -- Winterspring Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25923; -- Arathi Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25925; -- Badlands Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25926; -- Blade's Edge Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25927; -- Burning Steppes Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25928; -- Desolace Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25929; -- Durotar Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25930; -- Dustwallow Marsh Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25931; -- Eversong Woods Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25932; -- Feralas Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25933; -- Ghostlands Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25934; -- Hellfire Peninsula Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25935; -- Hillsbrad Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25936; -- Mulgore Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25937; -- Nagrand Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25938; -- Shadowmoon Valley Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25939; -- Silverpine Forest Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25940; -- Stonetalon Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25941; -- Swamp of Sorrows Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25942; -- Terokkar Forest Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25943; -- The Northern Barrens Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25944; -- The Hinterlands Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25945; -- Thousand Needles Flame Keeper -> Deleted in cata, taking from 3.x sniff
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25946; -- Tirisfal Glades Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25947; -- Zangarmarsh Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9204 WHERE `entry`=25962; -- Fire Eater
UPDATE `creature_template` SET `gossip_menu_id`=9204 WHERE `entry`=25975; -- Master Fire Eater
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=32801; -- Borean Tundra Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=32802; -- Sholazar Basin Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=32806; -- Storm Peaks Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=32807; -- Crystalsong Forest Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9203 WHERE `entry`=32808; -- Zul'Drak Flame Warden
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32809; -- Borean Tundra Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32810; -- Sholazar Basin Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32811; -- Dragonblight Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32812; -- Howling Fjord Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32813; -- Grizzly Hills Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32814; -- Storm Peaks Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32815; -- Crystalsong Forest Flame Keeper
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32816; -- Zul'Drak Flame Keeper
-- Gossip insert from sniff
DELETE FROM `gossip_menu` WHERE (`entry`=9148 AND `text_id`=12376) OR (`entry`=7326 AND `text_id`=8703) OR (`entry`=11417 AND `text_id`=12390) OR (`entry`=9260 AND `text_id`=12571) OR (`entry`=9260 AND `text_id`=12572) OR (`entry`=9203 AND `text_id`=12504) OR (`entry`=9278 AND `text_id`=12582) OR (`entry`=9204 AND `text_id`=12506) OR (`entry`=9370 AND `text_id`=12374) OR (`entry`=9406 AND `text_id`=12377) OR (`entry`=9352 AND `text_id`=12377) OR (`entry`=9354 AND `text_id`=12377) OR (`entry`=9384 AND `text_id`=12377) OR (`entry`=9385 AND `text_id`=12377) OR (`entry`=9386 AND `text_id`=12377) OR (`entry`=9387 AND `text_id`=12377) OR (`entry`=9388 AND `text_id`=12377) OR (`entry`=9389 AND `text_id`=12377) OR (`entry`=9390 AND `text_id`=12377) OR (`entry`=9391 AND `text_id`=12377) OR (`entry`=9392 AND `text_id`=12377) OR (`entry`=9393 AND `text_id`=12377) OR (`entry`=9394 AND `text_id`=12377) OR (`entry`=9395 AND `text_id`=12377) OR (`entry`=9396 AND `text_id`=12377) OR (`entry`=9397 AND `text_id`=12377) OR (`entry`=9398 AND `text_id`=12377) OR (`entry`=9399 AND `text_id`=12377) OR (`entry`=9400 AND `text_id`=12377) OR (`entry`=9401 AND `text_id`=12377) OR (`entry`=9402 AND `text_id`=12377) OR (`entry`=9403 AND `text_id`=12377) OR (`entry`=9404 AND `text_id`=12377) OR (`entry`=9405 AND `text_id`=12377) OR (`entry`=9407 AND `text_id`=12377) OR (`entry`=9408 AND `text_id`=12377) OR (`entry`=9409 AND `text_id`=12377) OR(`entry`=9410 AND `text_id`=12377) OR (`entry`=9411 AND `text_id`=12377) OR (`entry`=9412 AND `text_id`=12377) OR  (`entry`=9413 AND `text_id`=12377) OR (`entry`=9353 AND `text_id`=12374) OR (`entry`=9355 AND `text_id`=12374) OR (`entry`=9379 AND `text_id`=12374) OR (`entry`=9380 AND `text_id`=12374) OR (`entry`=9381 AND `text_id`=12374) OR (`entry`=9382 AND `text_id`=12374) OR (`entry`=9383 AND `text_id`=12374) OR (`entry`=9356 AND `text_id`=12374) OR (`entry`=9357 AND `text_id`=12374) OR (`entry`=9358 AND `text_id`=12374) OR (`entry`=9359 AND `text_id`=12374) OR (`entry`=9360 AND `text_id`=12374) OR (`entry`=9361 AND `text_id`=12374) OR (`entry`=9362 AND `text_id`=12374) OR (`entry`=9363 AND `text_id`=12374) OR (`entry`=9364 AND `text_id`=12374) OR (`entry`=9365 AND `text_id`=12374) OR (`entry`=9366 AND `text_id`=12374) OR (`entry`=9367 AND `text_id`=12374) OR (`entry`=9368 AND `text_id`=12374) OR (`entry`=9369 AND `text_id`=12374) OR (`entry`=9371 AND `text_id`=12374) OR (`entry`=9372 AND `text_id`=12374) OR (`entry`=9373 AND `text_id`=12374) OR (`entry`=9374 AND `text_id`=12374) OR (`entry`=9375 AND `text_id`=12374) OR (`entry`=9377 AND `text_id`=12374) OR (`entry`=9378 AND `text_id`=12374) OR (`entry`=10227 AND `text_id`=12377) OR (`entry`=10228 AND `text_id`=12374) OR (`entry`=10231 AND `text_id`=12374) OR (`entry`=10230 AND `text_id`=12377) OR (`entry`=10239 AND `text_id`=12374) OR (`entry`=10238 AND `text_id`=12377) OR (`entry`=10240 AND `text_id`=12377) OR (`entry`=10241 AND `text_id`=12374) OR (`entry`=10242 AND `text_id`=12374) OR (`entry`=10243 AND `text_id`=12377);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(9148, 12376), -- 16781
(7326, 8703), -- 16817
(11417, 12390), -- 25697
(9260, 12571), -- 25754
(9260, 12572), -- 25754
(9203, 12504), -- 25883, 25887, 25888, 25889, 25890, 25891, 25892, 25893, 25894, 25895, 25896, 25897, 25898, 25899, 25900, 25901, 25902, 25903, 25904, 25905, 25906, 25907, 25908, 25909, 25910, 25911, 25912, 25913, 25914, 25915, 25916, 25917, 32801, 32802, 32806, 32807, 32808
(9278, 12582), -- 25884, 25918, 25919, 25920, 25921, 25922, 25923, 25925, 25926, 25927, 25928, 25929, 25930, 25931, 25932, 25933, 25934, 25935, 25936, 25937, 25938, 25939, 25940, 25941, 25942, 25943, 25944, 25945, 25946, 25947, 32809, 32810, 32811, 32812, 32813, 32814, 32815, 32816
(9204, 12506), -- 25962, 25975
(9370, 12374), -- 187559
(9406, 12377), -- 187564
(9352, 12377), -- 187914
(9354, 12377), -- 187916
(9384, 12377), -- 187917
(9385, 12377), -- 187919
(9386, 12377), -- 187920
(9387, 12377), -- 187921
(9388, 12377), -- 187922
(9389, 12377), -- 187923
(9390, 12377), -- 187924
(9391, 12377), -- 187925
(9392, 12377), -- 187926
(9393, 12377), -- 187927
(9394, 12377), -- 187928
(9395, 12377), -- 187929
(9396, 12377), -- 187930
(9397, 12377), -- 187931 -> Deleted in cata, taking from 3.x sniff
(9398, 12377), -- 187932
(9399, 12377), -- 187933
(9400, 12377), -- 187934
(9401, 12377), -- 187935
(9402, 12377), -- 187936
(9403, 12377), -- 187937
(9404, 12377), -- 187938
(9405, 12377), -- 187939
(9407, 12377), -- 187940
(9408, 12377), -- 187941
(9409, 12377), -- 187942
(9410, 12377), -- 187943
(9411, 12377), -- 187944
(9412, 12377), -- 187945
(9413, 12377), -- 187946
(9353, 12374), -- 187947
(9355, 12374), -- 187948
(9379, 12374), -- 187949
(9380, 12374), -- 187950
(9381, 12374), -- 187951
(9382, 12374), -- 187952
(9383, 12374), -- 187953
(9356, 12374), -- 187954
(9357, 12374), -- 187955
(9358, 12374), -- 187956
(9359, 12374), -- 187957
(9360, 12374), -- 187958
(9361, 12374), -- 187959
(9362, 12374), -- 187960
(9363, 12374), -- 187961
(9364, 12374), -- 187962
(9365, 12374), -- 187963
(9366, 12374), -- 187964
(9367, 12374), -- 187965
(9368, 12374), -- 187966
(9369, 12374), -- 187967
(9371, 12374), -- 187968
(9372, 12374), -- 187969
(9373, 12374), -- 187970
(9374, 12374), -- 187971
(9375, 12374), -- 187972
(9377, 12374), -- 187974
(9378, 12374), -- 187975
(10227, 12377), -- 194032
(10228, 12374), -- 194033
(10231, 12374), -- 194034
(10230, 12377), -- 194035
(10239, 12374), -- 194043
(10238, 12377), -- 194044
(10240, 12377), -- 194045
(10241, 12374), -- 194046
(10242, 12374), -- 194048
(10243, 12377); -- 194049
-- Add quest to creature (warden)
DELETE FROM `game_event_creature_quest` WHERE (`id`=25883 AND `quest`=11805) OR (`id`=25887 AND `quest`=11804) OR (`id`=25888 AND `quest`=11806) OR (`id`=25889 AND `quest`=11807) OR (`id`=25890 AND `quest`=11808) OR (`id`=25891 AND `quest`=11809) OR (`id`=25892 AND `quest`=11810) OR (`id`=25893 AND `quest`=11811) OR (`id`=25894 AND `quest`=11812) OR (`id`=25895 AND `quest`=11813) OR (`id`=25896 AND `quest`=11814) OR (`id`=25897 AND `quest`=11815) OR (`id`=25898 AND `quest`=11816) OR (`id`=25899 AND `quest`=11817) OR (`id`=25900 AND `quest`=11818) OR (`id`=25901 AND `quest`=11819) OR (`id`=25902 AND `quest`=11820) OR (`id`=25903 AND `quest`=11821) OR (`id`=25904 AND `quest`=11822) OR (`id`=25905 AND `quest`=11823) OR (`id`=25906 AND `quest`=11824) OR (`id`=25907 AND `quest`=11825) OR (`id`=25908 AND `quest`=11826) OR (`id`=25909 AND `quest`=11827) OR (`id`=25910 AND `quest`=11583) OR (`id`=25911 AND `quest`=11828) OR (`id`=25912 AND `quest`=11829) OR (`id`=25913 AND `quest`=11830) OR (`id`=25914 AND `quest`=11831) OR (`id`=25915 AND `quest`=11832) OR (`id`=25916 AND `quest`=11833) OR (`id`=25917 AND `quest`=11834) OR (`id`=32801 AND `quest`=13485) OR (`id`=32802 AND `quest`=13486) OR (`id`=32806 AND `quest`=13490) OR (`id`=32807 AND `quest`=13491) OR (`id`=32808 AND `quest`=13492);
INSERT INTO `game_event_creature_quest` (`eventEntry`, `id`, `quest`) VALUES
(1, 25883, 11805),
(1, 25887, 11804),
(1, 25888, 11806),
(1, 25889, 11807),
(1, 25890, 11808),
(1, 25891, 11809),
(1, 25892, 11810),
(1, 25893, 11811),
(1, 25894, 11812),
(1, 25895, 11813),
(1, 25896, 11814),
(1, 25897, 11815),
(1, 25898, 11816),
(1, 25899, 11817),
(1, 25900, 11818),
(1, 25901, 11819), -- Deleted in cata, taking from 3.x sniff
(1, 25902, 11820),
(1, 25903, 11821),
(1, 25904, 11822),
(1, 25905, 11823),
(1, 25906, 11824),
(1, 25907, 11825),
(1, 25908, 11826),
(1, 25909, 11827),
(1, 25910, 11583),
(1, 25911, 11828),
(1, 25912, 11829),
(1, 25913, 11830),
(1, 25914, 11831),
(1, 25915, 11832),
(1, 25916, 11833),
(1, 25917, 11834),
(1, 32801, 13485),
(1, 32802, 13486),
(1, 32806, 13490),
(1, 32807, 13491),
(1, 32808, 13492);
-- Delete double quest
DELETE FROM `creature_questrelation` WHERE `id`=25889 AND `quest` =11807;
-- Add quest relation to Gameobject (fire)
DELETE FROM `game_event_gameobject_quest` WHERE (`id`=187559 AND `quest`=11580) OR (`id`=187564 AND `quest`=11581) OR (`id`=187914 AND `quest`=11732) OR (`id`=187916 AND `quest`=11734) OR (`id`=187917 AND `quest`=11735) OR (`id`=187919 AND `quest`=11736) OR (`id`=187920 AND `quest`=11737) OR (`id`=187921 AND `quest`=11738) OR (`id`=187922 AND `quest`=11739) OR (`id`=187923 AND `quest`=11740) OR (`id`=187924 AND `quest`=11741) OR (`id`=187925 AND `quest`=11742) OR (`id`=187926 AND `quest`=11743) OR (`id`=187927 AND `quest`=11744) OR (`id`=187928 AND `quest`=11745) OR (`id`=187929 AND `quest`=11746) OR (`id`=187930 AND `quest`=11747) OR (`id`=187931 AND `quest`=11748) OR (`id`=187932 AND `quest`=11749) OR (`id`=187933 AND `quest`=11750) OR (`id`=187934 AND `quest`=11751) OR (`id`=187935 AND `quest`=11752) OR (`id`=187936 AND `quest`=11753) OR (`id`=187937 AND `quest`=11754) OR (`id`=187938 AND `quest`=11755) OR (`id`=187939 AND `quest`=11756) OR (`id`=187940 AND `quest`=11757) OR (`id`=187941 AND `quest`=11758) OR (`id`=187942 AND `quest`=11759) OR(`id`=187943 AND `quest`=11760) OR (`id`=187944 AND `quest`=11761) OR (`id`=187945 AND `quest`=11762) OR  (`id`=187946 AND `quest`=11763) OR (`id`=187947 AND `quest`=11764) OR (`id`=187948 AND `quest`=11765) OR (`id`=187949 AND `quest`=11799) OR (`id`=187950 AND `quest`=11800) OR (`id`=187951 AND `quest`=11801) OR (`id`=187952 AND `quest`=11802) OR (`id`=187953 AND `quest`=11803) OR (`id`=187954 AND `quest`=11766) OR (`id`=187955 AND `quest`=11767) OR (`id`=187956 AND `quest`=11768) OR (`id`=187957 AND `quest`=11769) OR (`id`=187958 AND `quest`=11770) OR (`id`=187959 AND `quest`=11771) OR (`id`=187960 AND `quest`=11772) OR (`id`=187961 AND `quest`=11773) OR (`id`=187962 AND `quest`=11774) OR (`id`=187963 AND `quest`=11775) OR (`id`=187964 AND `quest`=11776) OR (`id`=187965 AND `quest`=11777) OR (`id`=187966 AND `quest`=11778) OR (`id`=187967 AND `quest`=11779) OR (`id`=187968 AND `quest`=11780) OR (`id`=187969 AND `quest`=11781) OR (`id`=187970 AND `quest`=11782) OR (`id`=187971 AND `quest`=11783) OR (`id`=187972 AND `quest`=11784) OR (`id`=187974 AND `quest`=11786) OR (`id`=187975 AND `quest`=11787) OR (`id`=194032 AND `quest`=13440) OR (`id`=194033 AND `quest`=13441) OR (`id`=194034 AND `quest`=13450) OR (`id`=194035 AND `quest`=13442) OR (`id`=194043 AND `quest`=13455) OR (`id`=194044 AND `quest`=13446) OR (`id`=194045 AND `quest`=13447) OR (`id`=194046 AND `quest`=13457) OR (`id`=194048 AND `quest`=13458) OR (`id`=194049 AND `quest`=13449);
INSERT INTO `game_event_gameobject_quest` (`eventEntry`, `id`, `quest`) VALUES
(1, 187559, 11580),
(1, 187564, 11581),
(1, 187914, 11732),
(1, 187916, 11734),
(1, 187917, 11735),
(1, 187919, 11736),
(1, 187920, 11737),
(1, 187921, 11738),
(1, 187922, 11739),
(1, 187923, 11740),
(1, 187924, 11741),
(1, 187925, 11742),
(1, 187926, 11743),
(1, 187927, 11744),
(1, 187928, 11745),
(1, 187929, 11746),
(1, 187930, 11747),
(1, 187931, 11748), -- Deleted in cata, taking from 3.x sniff
(1, 187932, 11749),
(1, 187933, 11750),
(1, 187934, 11751),
(1, 187935, 11752),
(1, 187936, 11753),
(1, 187937, 11754),
(1, 187938, 11755),
(1, 187939, 11756),
(1, 187940, 11757),
(1, 187941, 11758),
(1, 187942, 11759),
(1, 187943, 11760),
(1, 187944, 11761),
(1, 187945, 11762),
(1, 187946, 11763),
(1, 187947, 11764),
(1, 187948, 11765),
(1, 187949, 11799),
(1, 187950, 11800),
(1, 187951, 11801),
(1, 187952, 11802),
(1, 187953, 11803),
(1, 187954, 11766),
(1, 187955, 11767),
(1, 187956, 11768),
(1, 187957, 11769),
(1, 187958, 11770),
(1, 187959, 11771),
(1, 187960, 11772),
(1, 187961, 11773),
(1, 187962, 11774),
(1, 187963, 11775),
(1, 187964, 11776),
(1, 187965, 11777),
(1, 187966, 11778),
(1, 187967, 11779),
(1, 187968, 11780),
(1, 187969, 11781),
(1, 187970, 11782),
(1, 187971, 11783),
(1, 187972, 11784),
(1, 187974, 11786),
(1, 187975, 11787),
(1, 194032, 13440),
(1, 194033, 13441),
(1, 194034, 13450),
(1, 194035, 13442),
(1, 194043, 13455),
(1, 194044, 13446),
(1, 194045, 13447),
(1, 194046, 13457),
(1, 194048, 13458),
(1, 194049, 13449);-- Update creature gossip_menu_option from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8803,8808,8894,9045,9621,9879,9895,9987,10117,10218) AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9879 AND `id`=1;                 
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8803,0,1, 'I need some booze, Coot.',3,128,0,0,0,0, ''),
(8808,0,1, 'I require some components, Sorely.',3,128,0,0,0,0, ''),
(8894,0,0, 'I need to fly to the Windrunner Official business!',1,1,0,0,0,0, ''),
(9045,0,0, 'I don''t have time for chit-chat, Lou. Take me to Scalawag Point.',1,1,0,0,0,0, ''),
(9621,0,0, 'Harry said I could use his bomber to Bael''gun''s. I''m ready to go!',1,1,0,0,0,0, ''),
(9879,0,3, 'Train me',5,16,0,0,0,0, ''),
(9879,1,1, 'Let me browse your goods.',3,128,0,0,0,0, ''),
(9895,0,3, 'Train me',5,16,0,0,0,0, ''),
(9987,0,3, 'Train me',5,16,0,0,0,0, ''),
(10117,0,3, 'Train me',5,16,0,0,0,0, ''),
(10218,0,0, '<Get in the bomber and return to Scalawag Point.>',1,1,0,0,0,0, '');
-- Insert gossip menu from sniff
DELETE FROM `gossip_menu` WHERE `entry`=8803 AND `text_id`=11287;
DELETE FROM `gossip_menu` WHERE `entry`=8808 AND `text_id`=11297;
DELETE FROM `gossip_menu` WHERE `entry`=8820 AND `text_id`=11352;
DELETE FROM `gossip_menu` WHERE `entry`=8832 AND `text_id`=11418;
DELETE FROM `gossip_menu` WHERE `entry`=8839 AND `text_id`=11436;
DELETE FROM `gossip_menu` WHERE `entry`=8893 AND `text_id`=11655;
DELETE FROM `gossip_menu` WHERE `entry`=8900 AND `text_id`=11691;
DELETE FROM `gossip_menu` WHERE `entry`=8957 AND `text_id`=11746;
DELETE FROM `gossip_menu` WHERE `entry`=8985 AND `text_id`=12130;
DELETE FROM `gossip_menu` WHERE `entry`=9008 AND `text_id`=12170;
DELETE FROM `gossip_menu` WHERE `entry`=9045 AND `text_id`=12222;
DELETE FROM `gossip_menu` WHERE `entry`=9346 AND `text_id`=12646;
DELETE FROM `gossip_menu` WHERE `entry`=9895 AND `text_id`=13738;
DELETE FROM `gossip_menu` WHERE `entry`=9987 AND `text_id`=13841;
DELETE FROM `gossip_menu` WHERE `entry`=10117 AND `text_id`=14043;
DELETE FROM `gossip_menu` WHERE `entry`=10218 AND `text_id`=14205;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(8803,11287),
(8808,11297),
(8820,11352),
(8832,11418),
(8839,11436),
(8893,11655),
(8900,11691),
(8957,11746),
(8985,12130),
(9008,12170),
(9045,12222),
(9346,12646),
(9895,13738),
(9987,13841),
(10117,14043),
(10218,14205);
-- Insert creature gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=8803 WHERE `entry`=23737; -- Coot "The Stranger" Albertson
UPDATE `creature_template` SET `gossip_menu_id`=8808 WHERE `entry`=23732; -- Sorely Twitchblade
UPDATE `creature_template` SET `gossip_menu_id`=8820 WHERE `entry`=23862; -- Finlay Fletcher
UPDATE `creature_template` SET `gossip_menu_id`=8832 WHERE `entry`=23770; -- Cannoneer Ely
UPDATE `creature_template` SET `gossip_menu_id`=8839 WHERE `entry`=23906; -- Scout Knowles
UPDATE `creature_template` SET `gossip_menu_id`=8893 WHERE `entry`=24106; -- Scout Valory
UPDATE `creature_template` SET `gossip_menu_id`=8900 WHERE `entry`=24135; -- Greatmother Ankha
UPDATE `creature_template` SET `gossip_menu_id`=8957 WHERE `entry`=23833; -- Explorer Jaren
UPDATE `creature_template` SET `gossip_menu_id`=8985 WHERE `entry`=24544; -- Old Icefin
UPDATE `creature_template` SET `gossip_menu_id`=9008, `npcflag`=`npcflag`|1 WHERE `entry`=24643; -- Grezzix Spindlesnap
UPDATE `creature_template` SET `gossip_menu_id`=9045, `npcflag`=1, `AIName`='SmartAI' WHERE `entry`=24896; -- Lou the Cabin Boy
UPDATE `creature_template` SET `gossip_menu_id`=9346 WHERE `entry`=26540; -- Drenk Spannerspark
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry` IN (24067,24154,24350); -- Mahana Frosthoof, Mary Darrow, Robert Clarke
UPDATE `creature_template` SET `gossip_menu_id`=9879 WHERE `entry`=26959; -- Booker Kells
UPDATE `creature_template` SET `gossip_menu_id`=9895 WHERE `entry`=26960; -- Carter Tiffens
UPDATE `creature_template` SET `gossip_menu_id`=9987 WHERE `entry`=26953; -- Thomas Kolichio
UPDATE `creature_template` SET `gossip_menu_id`=10117 WHERE `entry`=26964; -- Alexandra McQueen
UPDATE `creature_template` SET `gossip_menu_id`=10218, `AIName`='SmartAI' WHERE `entry`=28277; -- Harry's Bomber
-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (12130,13702);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(12130,'<Old Icefin eyes you warily, his fishy eye blinking as he bobs his head up and down once in a curt dismissal.>','',0,1,0,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,12340),
(13702,'How may I help you?','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,12340);
-- Insert creature_text from sniff
DELETE FROM `creature_text` WHERE `entry` IN (27923,27933);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(27923,0,0,'Hang on to your hat, $N! To Scalawag we go!',12,0,100,0,0,0,'Lou the Cabin Boy'),
(27923,1,0,'YAAARRRRR! Here we be, matey! Scalawag Point!',12,0,100,0,0,0,'Lou the Cabin Boy'),
(27933,0,0,'Enjoy the ride! It''s a one way trip!',12,0,100,3,0,0,'Alanya');
-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (8894,9045,9621,10218) AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (8894,9546) AND `SourceEntry`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8894,0,0,0,9,0,11229,0,0,0,0,'','Bathandler Camille - Show gossip option only if player has taken quest 11229'),
(15,8894,1,0,0,9,0,11170,0,0,0,0,'','Bathandler Camille - Show gossip option only if player has taken quest 11170'),
(15,9045,0,0,0,9,0,11509,0,0,0,0,'','Lou the Cabin Boy - Show gossip option only if player has taken quest 11509'),
(15,9546,1,0,0,9,0,12298,0,0,0,0,'','Greer Orehammer - Show gossip option only if player has taken quest 12298'),
(15,9621,0,0,0,9,0,11567,0,0,0,0,'','Alanya - Show gossip option only if player has taken quest 11567'),
(15,10218,0,0,0,9,0,11567,0,0,0,0,'','Harry''s Bomber - Show gossip option if player has taken quest 11567');
-- SmartAIs
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27933;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=23816;
DELETE FROM `smart_scripts` WHERE `entryorguid`=23859 AND `source_type`=0 AND `id` IN (3,4); -- this npc had already a SmartAI so deleting just the new lines
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23816,24896,27933,28277) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23816,0,0,2,62,0,100,0,8894,0,0,0,85,43074,0,0,0,0,0,7,0,0,0,0,0,0,0,'Bathandler Camille - On gossip select - Invoker spellcast'),
(23816,0,1,2,62,0,100,0,8894,1,0,0,85,43136,0,0,0,0,0,7,0,0,0,0,0,0,0,'Bathandler Camille - On gossip select - Invoker spellcast'),
(23816,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Bathandler Camille - On gossip select - Close gossip'),
(23859,0,3,4,62,0,100,0,9546,1,0,0,11,48862,0,0,0,0,0,7,0,0,0,0,0,0,0,'Greer Orehammer - On gossip select - Invoker spellcast'),
(23859,0,4,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Greer Orehammer - On gossip select - Close gossip'),
(24896,0,0,1,62,0,100,0,9045,0,0,0,11,50004,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lou the Cabin Boy - On gossip select - Spellcast'),
(24896,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lou the Cabin Boy - On gossip select - Close gossip'),
(27933,0,0,1,62,0,100,0,9621,0,0,0,11,50038,0,0,0,0,0,7,0,0,0,0,0,0,0,'Alanya - On gossip select - Spellcast'),
(27933,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Alanya - On gossip select - Close gossip'),
(27933,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Alanya - On gossip select - Say line'),
(28277,0,0,1,62,0,100,0,10218,0,0,0,11,61604,0,0,0,0,0,7,0,0,0,0,0,0,0,'Harry''s Bomber - On gossip select - Spellcast'),
(28277,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Harry''s Bomber - On gossip select - Close gossip');
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=24896; -- that was absolutely not correct
DELETE FROM `spell_target_position` WHERE `id` IN (50005,50039,61605);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(50005,571,595.208,-2796.47,-0.124098,3.66519), -- Summon Lou the Cabin Boy
(50039,571,-170.469,-3588.19,-0.221146,4.2586), -- Summon Harry's Bomber
(61605,571,89.7416,-6286.08,1.17903,1.58825); -- Summon Harry's BomberUPDATE `creature` SET `spawntimesecs`=43204800 WHERE  `map`=631;


UPDATE creature_template SET InhabitType=7 WHERE name LIKE '%flying%'; 

UPDATE `creature_template` SET `InhabitType`=7 WHERE  `entry` in (16168, 3869, 16446, 17906, 24440, 24624, 26491, 26517, 27829, 28749, 29239, 28874, 121212, 8534, 29576, 37544, 38481, 31040, 37920, 37187, 36725, 38004, 37970, 38454, 37955, 37126, 36789, 37970, 37972, 37973, 36678);

UPDATE `creature_template` SET `npcflag`=1 WHERE  `entry`=37187;
DELETE FROM `creature_template` WHERE `entry`=500200;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES ('500200', '0', '0', '0', '0', '0', '26644', '0', '26644', '0', 'Event Vendor', 'CzechFun', NULL, '0', '80', '80', '0', '35', '35', '3', '1', '1.14286', '1', '2', '1', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'EM_trader', '1');

REPLACE INTO `creature_template` VALUES (190001, 0, 0, 0, 0, 0, 15998, 0, 0, 0, 'Transmogrify Master', '', 'Speak', 50000, 71, 71, 0, 35, 35, 3, 1, 1.14286, 1.25, 1, 0, 0, 0, 0, 1, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 138936390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1.56, 1.56, 1.56, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'npc_transmogrify', 1);

INSERT INTO `gossip_menu` VALUES (51000, 51000);
INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(51000, 'Put in the first slot of bag item, that you want to transmogrify. In the second slot, put item with perfect display.', 0);UPDATE `creature_template` SET `gossip_menu_id`=9260 WHERE `entry`=25754;
DELETE FROM `gossip_menu` WHERE `entry`=9260 AND `text_id`=12572;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9260,12572);

UPDATE `creature_template` SET `gossip_menu_id`=11417 WHERE `entry`=25697;
DELETE FROM `gossip_menu` WHERE `entry`=11417 AND `text_id`=12390;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11417,12390);

UPDATE `creature_template` SET `gossip_menu_id`=9298 WHERE `entry`=16818;
DELETE FROM `gossip_menu` WHERE `entry`=9298 AND `text_id`=12609;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9298,12609);

UPDATE `creature_template` SET `gossip_menu_id`=9204 WHERE `entry`=26113;
UPDATE `creature_template` SET `gossip_menu_id`=9204 WHERE `entry`=25994;
DELETE FROM `gossip_menu` WHERE `entry`=9204 AND `text_id`=12506;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9204,12506);

UPDATE `creature_template` SET `gossip_menu_id`=9148 WHERE `entry`=16781;
DELETE FROM `gossip_menu` WHERE `entry`=9148 AND `text_id`=12376;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9148,12376);

UPDATE `creature_template` SET `gossip_menu_id`=9157 WHERE `entry`=26221;
DELETE FROM `gossip_menu` WHERE `entry`=9157 AND `text_id`=12390;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9157,12390);

UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25884;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25918;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25919;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25920;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25921;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25922;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25924;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25926;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25928;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25929;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25930;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25932;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25934;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25936;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25937;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25938;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25940;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25943;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=25947;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32809;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32810;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32811;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32812;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32813;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32814;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32815;
UPDATE `creature_template` SET `gossip_menu_id`=9278 WHERE `entry`=32816;
DELETE FROM `gossip_menu` WHERE `entry`=9278 AND `text_id`=12582;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9278,12582);

DELETE FROM `gossip_menu` WHERE `entry`=9354 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9354,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9384 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9384,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9385 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9385,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9386 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9386,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9387 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9387,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9389 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9389,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9390 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9390,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9393 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9393,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9395 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9395,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9396 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9396,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9399 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9399,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9401 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9401,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9403 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9403,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9408 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9408,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9409 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9409,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9410 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9410,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9411 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9411,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9412 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9412,12377);
DELETE FROM `gossip_menu` WHERE `entry`=9413 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9413,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10230 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10230,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10232 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10232,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10233 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10233,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10234 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10234,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10237 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10237,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10238 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10238,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10240 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10240,12377);
DELETE FROM `gossip_menu` WHERE `entry`=10243 AND `text_id`=12377;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10243,12377);INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50000', NULL, 'Vitej, $N. V nasledujicim prehledu si muzes vybrat sekci a v te dale nakupovat. $BProdavam pouze za event marky ktere muzes ziskat z ruznych eventu, ktere poradaji GM$B$BVybirej peclive, pozdejsi reklamace netoleruji!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50001', NULL, 'Vyborne, $N! Prave se nachazis v account manageru kde mas k dispozici 2 moznosti:$B1. Rename - Po zakoupeni a naslednem znovu-prihlaseni na tvuj ucet budes mit k dispozici rename na tuto postavu.$B2. Character Customizer - Po zakoupeni a naslednem znovu-prihlaseni budes mit k dispozici na teto postave zmenu vzhledu.$BNeni to velky vyber, nicmene nakupuj s rozvahou!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50002', NULL, 'Vyborne, $N! Prave se nachazis ve vyberu mountu.Po vybrani ti bude do batohu dan item pro jeho nauceni.$BVybirej s rozvahou!$B!!WARNING!! Zkontroluj si pred koupi, zda mas volno ve svem batohu, jinak ti item nebude moci byt pridelen a o event marky prijdes!!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50003', NULL, 'Vyborne, $N! Prave se nachazis ve vyberu non-combat petu.Po vybrani ti bude do batohu dan item pro jeho nauceni.$BVybirej s rozvahou!$B!!WARNING!! Zkontroluj si pred koupi, zda mas volno ve svem batohu, jinak ti item nebude moci byt pridelen a o event marky prijdes!!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50004', NULL, 'Vyborne, $N! Prave se nachazis ve vyberu emblemu, k dispozici mas koupi Emblem of Frost, Emblem of Triumph a Emblem of Conquest. Ceny jsou ruzne.$BNakupuj s rozvahou!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50005', NULL, 'Vyborne, $N!$BProsim, potvrd svuj zajem o rename!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');


INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50006', NULL, 'Vyborne, $N!$BProsim, potvrd svuj zajem o character customizer!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');


INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50007', NULL, 'Vyborne, $N!$BDo tve sbirky nini pribyl dalsi mount!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50008', NULL, 'Vyborne, $N!$BDo tve sbirky nini pribyl dalsi emblem!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ('50009', NULL, 'Vyborne, $N!$BDo tve sbirky nini pribyl dalsi non-combat pet!', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '1');UPDATE `quest_template` SET `OfferRewardText`="WOW, that was a real life ghost! That was so awesome - I can't wait to tell everyone back at the orphanage. Captain Grayson... he even looked like a pirate! When I grow up I wanna be a ghost pirate too!$B$BThanks for taking me to Westfall, $N. I know there are scary things out there in the wilds of Westfall, and I hope I wasn't too much of a pain. You're awesome!" WHERE `Id`=1687;UPDATE `creature_template` SET `minrangedmg` = '7',`maxrangedmg` = '11',`Health_mod` = '0.04' WHERE `entry` =12922;
UPDATE `creature_template` SET `Health_mod` = '0.4' WHERE `creature_template`.`entry` =8996;
UPDATE `creature_template` SET `mindmg` = '30',`maxdmg` = '45',`minrangedmg` = '40',`maxrangedmg` = '70',`Health_mod` = '0.4',`Mana_mod` = '0.4' WHERE `entry` =10928;



REPLACE INTO `creature_template` VALUES (121212, 0, 0, 0, 0, 0, 10045, 0, 0, 0, 'Mmaps', 'Waypoint', NULL, 0, 1, 1, 2, 35, 35, 0, 1, 1.14286, 0.5, 0, 422, 586, 0, 642, 1, 2000, 2200, 2, 0, 2048, 8, 0, 0, 0, 0, 0, 345, 509, 103, 6, 72, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 7, 9, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340);

REPLACE INTO `disables` VALUES (7, 650, 8, '', '', 'Mmaps - Trial of the Champion');
REPLACE INTO `disables` VALUES (7, 649, 8, '', '', 'Mmaps - Trial of the Crusader');
SET @GMlevel : = 0; 

REPLACE INTO `command` VALUES ('mmap', @GMlevel, 'Syntax: Syntax: .mmaps $subcommand Type .mmaps to see the list of possible subcommands or .help mmaps $subcommand to see info on subcommands');
REPLACE INTO `command` VALUES ('mmap path', @GMlevel, 'Syntax: .mmap path to calculate and show a path to current select unit');
REPLACE INTO `command` VALUES ('mmap loc', @GMlevel, 'Syntax: .mmap loc to print on which tile one is');
REPLACE INTO `command` VALUES ('mmap loadedtiles', @GMlevel, 'Syntax: .mmap loadedtiles to show which tiles are currently loaded');
REPLACE INTO `command` VALUES ('mmap stats', @GMlevel, 'Syntax: .mmap stats to show information about current state of mmaps');
REPLACE INTO `command` VALUES ('mmap testarea', @GMlevel, 'Syntax: .mmap testarea to calculate paths for all nearby npcs to player');
UPDATE `quest_template` SET `RequiredNpcOrGo1` = '18069',`RequiredNpcOrGoCount1` = '1' WHERE `Id` =9977;
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `Id` =9977;

DELETE FROM creature_template WHERE entry = 500300;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES ('500300', '0', '0', '0', '0', '0', '7869', '0', '7869', '0', 'Supporter', 'CzechFun', NULL, '0', '80', '80', '0', '35', '35', '3', '1', '1.14286', '1', '2', '1', '1', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_supporter', '1');
UPDATE `creature_template` SET `faction_A`=24, `faction_H`=24, `unit_flags`=0, `resistance1`=0, `resistance2`=60, `resistance3`=0, `resistance4`=0, `resistance5`=36, `resistance6`=18 WHERE  `entry`=10161;UPDATE npc_vendor SET ExtendedCost = 2403 WHERE ExtendedCost = 2569 AND entry IN(32832, 32834);
UPDATE npc_vendor SET ExtendedCost = 2289 WHERE ExtendedCost = 2570 AND entry IN(32832, 32834);UPDATE `world`.`creature_template` SET `InhabitType` = '1' WHERE `creature_template`.`entry` =16879;DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`, `dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `custom_npc_tele_category`;
INSERT INTO `custom_npc_tele_category`
   (`id`, `name`, `flag`, `data0`, `data1`)
VALUES
   (1, 'Cities', 0, 1, 0),
   (2, 'Cities', 0, 2, 0),
   (6, '[Instances Lvl 1-60]', 0, 0, 0),
   (7, '[Instances Lvl 60]', 5, 60, 0),
   (8, '[Instances Lvl 70]', 5, 70, 0),
   (10, '[Instances WOTLK - 5man]', 5, 70, 0),
   (11, '[Instances WOTLK - Raids]', 5, 70, 0),
   (12, '[Skakacky]', 0, 0, 0);

TRUNCATE `custom_npc_tele_destination`;
INSERT INTO `custom_npc_tele_destination`
   (`id`, `name`, `pos_X`, `pos_Y`, `pos_Z`, `map`, `orientation`, `level`, `cost`)
VALUES
   (5, 'Black Temple', -3610.72, 324.988, 37.4, 530, 3.28298, 0, 0),
   (6, 'Blackfathom Deeps (22-25 lvl)', 4254.58, 664.74, -29.04, 1, 1.97, 0, 0),
   (7, 'Blackrock Depths (53-56 lvl)', -7301.03, -913.19, 165.37, 0, 0.08, 0, 0),
   (8, 'Blackrock Spire (58 lvl)', -7535.43, -1212.04, 285.45, 0, 5.29, 0, 0),
   (9, 'Blackwing Lair', -7665.55, -1102.49, 400.679, 469, 0, 0, 0),
   (10, 'Caverns of Time', -8173.66, -4746.36, 33.8423, 1, 4.93989, 0, 0),
   (11, 'Circle of Blood', 2839.44, 5930.17, 11.1002, 530, 3.16284, 0, 0),
   (12, 'Coilfang Reservoir', 517.288, 6976.28, 32.0072, 530, 0, 0, 0),
   (13, 'Darnassus', 9947.52, 2482.73, 1316.21, 1, 0, 0, 0),
   (14, 'Dire Maul (44-47 lvl)', -3982.47, 1127.79, 161.02, 1, 0.05, 0, 0),
   (15, 'Exodar', -4073.03, -12020.4, -1.47, 530, 0, 0, 0),
   (18, 'Goldshire', -9464, 62, 56, 0, 0, 0, 0),
   (19, 'Gruul\'s Lair', 3539.01, 5082.36, 1.69107, 530, 0, 0, 0),
   (20, 'Gurubashi', -13261.3, 168.294, 35.0792, 0, 1.00688, 0, 0),
   (21, 'Hellfire Citadel', -305.816, 3056.4, -2.47318, 530, 2.01, 0, 0),
   (22, 'Ironforge', -4924.07, -951.95, 501.55, 0, 5.4, 0, 0),
   (23, 'Isle Of Quel\'Danas', 12947.4, -6893.31, 5.68398, 530, 3.09154, 0, 0),
   (24, 'Karazhan', -11118.8, -2010.84, 47.0807, 0, 0, 0, 0),
   (25, 'Maraudon (36-39 lvl)', -1433.33, 2955.34, 96.21, 1, 4.82, 0, 0),
   (26, 'Molten Core', 1121.45, -454.317, -101.33, 230, 3.5, 0, 0),
   (27, 'Naxxramas', 3125.18, -3748.02, 136.049, 0, 0, 0, 0),
   (28, 'Onyxia\'s Lair', -4707.44, -3726.82, 54.6723, 1, 3.8, 0, 0),
   (29, 'Orgrimmar', 1552.5, -4420.66, 8.94802, 1, 0, 0, 0),
   (30, 'Razor Hill', 315.721, -4743.4, 10.4867, 1, 0, 0, 0),
   (31, 'Razorfen Downs (42-45 lvl)', -4645.08, -2470.85, 85.53, 1, 4.39, 0, 0),
   (32, 'Razorfen Kraul (32-35 lvl)', -4484.04, -1739.4, 86.47, 1, 1.23, 0, 0),
   (33, 'Ring of Trials', -1999.94, 6581.71, 11.32, 530, 2.3, 0, 0),
   (34, 'Ruins of Ahn\'Qiraj', -8409.03, 1498.83, 27.3615, 1, 2.49757, 0, 0),
   (35, 'Scholomance (40-43 lvl)', 1219.01, -2604.66, 85.61, 0, 0.5, 0, 0),
   (36, 'Shadowfang Keep (18-21 lvl)', -254.47, 1524.68, 76.89, 0, 1.56, 0, 0),
   (37, 'Shattrath City', -1850.21, 5435.82, -10.9614, 530, 3.40391, 0, 0),
   (38, 'Silvermoon', 9338.74, -7277.27, 13.7895, 530, 0, 0, 0),
   (39, 'Stormwind', -8960.14, 516.266, 96.3568, 0, 0, 0, 0),
   (40, 'Stratholme (48-51 lvl)', 3263.54, -3379.46, 143.59, 0, 0, 0, 0),
   (41, 'Tempest Keep', 3089.58, 1399.05, 187.653, 530, 4.79407, 0, 0),
   (42, 'Temple of Ahn\'Qiraj', -8245.84, 1983.74, 129.072, 1, 0.936195, 0, 0),
   (43, 'The Deadmines (15-15 lvl)', -11212, 1658.58, 25.67, 0, 1.45, 0, 0),
   (44, 'The Maul', -3761.49, 1133.43, 132.083, 1, 4.57259, 0, 0),
   (45, 'The Scarlet Monastery (31-34 lvl)', 2843.89, -693.74, 139.32, 0, 5.11, 0, 0),
   (46, 'The Sunken Temple (52 lvl)', -10346.9, -3851.9, -43.41, 0, 6.09, 0, 0),
   (47, 'The Wailing Caverns (17-20 lvl)', -722.53, -2226.3, 16.94, 1, 2.71, 0, 0),
   (48, 'Thunder Bluff', -1290, 147.034, 129.682, 1, 4.919, 0, 0),
   (49, 'Uldaman (37-40 lvl)', -6119.7, -2957.3, 204.11, 0, 0.03, 0, 0),
   (50, 'Undercity', 1819.71, 238.79, 60.5321, 0, 0, 0, 0),
   (53, 'Zul\'Aman', 6846.95, -7954.5, 170.028, 530, 4.61501, 0, 0),
   (54, 'Zul\'Farrak (46-49 lvl)', -6839.39, -2911.03, 8.87, 1, 0.41, 0, 0),
   (55, 'Zul\'Gurub', -11916.7, -1212.82, 92.2868, 0, 4.6095, 0, 0),
   (57, 'Utgarde', 1259.33, -4852.02, 215.763, 571, 3.48293, 0, 0),
   (58, 'The Nexus', 3781.81, 6953.65, 104.82, 571, 0.467432, 0, 0),
   (59, 'Pit of Narjun', 3707.86, 2150.23, 36.76, 571, 3.22, 0, 0),
   (60, 'DrakTharon Keep', 4774.6, -2032.92, 229.15, 571, 1.59, 0, 0),
   (61, 'Gundrak', 6898.72, -4584.94, 451.12, 571, 2.34455, 0, 0),
   (62, 'Halls of Stone/Lightning', 9049.37, -1282.35, 1060.19, 571, 5.8395, 0, 0),
   (63, 'Culling of Stratholme', -8742.98, -4434.52, -200.51, 1, 4.1, 0, 0),
   (64, 'Halls of Reflection', 5635.06, 2052.08, 798.05, 571, 4.68, 0, 0),
   (65, 'Naxxramas', 3668.72, -1262.46, 243.622, 571, 4.785, 0, 0),
   (66, 'Eye of Eternity', 3857.17, 6990.71, 152.10, 571, 5.87, 0, 0),
   (67, 'The Obsidian Sanctuary', 3516.08, 269.89, -114.035, 571, 3.23, 0, 0),
   (68, 'Onyxias Lair', -4708.27, -3727.64,54.5589, 1, 3.72786, 0, 0),
   (69, 'Ulduar', 9049.37, -1282.35,1060.19, 571, 5.8395, 0, 0),
   (70, 'Ruby Sanctum', 3598.44, 198.52,-110.85, 571, 2.22, 0, 0),
   (71, 'Icecrown Citadel', 5873.82, 2110.98,636.011, 571, 3.5523, 0, 0),
   (72, 'Dalaran', 5804.1499, 624.77,647.767, 571, 1.64, 0, 0),
   (74, 'Trial of Crusader', 8515.888, 629.481,547.39, 571, 1.5, 0, 0);
   

TRUNCATE `custom_npc_tele_association`;
INSERT INTO `custom_npc_tele_association`
  (`cat_id`, `dest_id`)
VALUES
  (1, 13), (1, 15), (1, 18), (1, 22), (1, 23), (1, 37), (1, 39), (2, 23), (2, 29), (2, 30), (2, 37), (2, 38), (2, 48), (2, 50), (3, 1), (3, 4), (3, 16), (3, 52), (4, 2), (4, 3), (4, 17), (4, 51), (5, 11), (5, 20), (5, 33), (5, 44), (6, 6), (6, 7), (6, 8), (6, 14), (6, 25), (6, 31), (6, 32), (6, 35), (6, 36), (6, 40), (6, 43), (6, 45), (6, 46), (6, 47), (6, 49), (6, 54), (7, 9), (7, 26), (7, 27), (7, 28), (7, 34), (7, 42), (7, 55), (8, 5), (8, 10), (8, 12), (8, 19), (8, 21), (8, 24), (8, 41), (8, 53), (9, 56), (10,57), (10,58), (10,59), (10,60), (10,61), (10,62), (10,63), (10,64), (11,65), (11,66), (11,67), (11,68), (11,69), (11,70), (11,71), (1,72), (2,72), (11,73), (11,74), (12,75), (12,76),(12,77);

-- `npc_text`
REPLACE INTO `npc_text` (`ID`, `text0_0`) VALUES
   (100000, 'Choose your Category.'),
   (100001, 'Choose your Destination.');

-- `creature_template`
INSERT INTO `creature_template`
(`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) 
 
 VALUES (100000, 0, 0, 0, 0, 0, 26502, 0, 0, 0, 'Teleporter', '', '', 0, 83, 83, 0, 35, 35, 1, 1, 1.14286, 2, 1, 509, 683, 0, 805, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 371, 535, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'npc_teleport', 1);
SET @GMlevel : = 0; 

REPLACE INTO `command` VALUES ('utility', @GMlevel, 'Syntax: .utility');
REPLACE INTO `command` VALUES ('utility changerace', @GMlevel, 'Syntax: .utility changerace');
REPLACE INTO `command` VALUES ('utility changefaction', @GMlevel, 'Syntax: .utility changefaction');
REPLACE INTO `command` VALUES ('utility maxskills', @GMlevel, 'Syntax: .utility maxskills');
REPLACE INTO `command` VALUES ('utility customize', @GMlevel, 'Syntax: .utility customize');UPDATE `world`.`creature_template` SET `ScriptName` = 'npc_vladof' WHERE `creature_template`.`entry` =30022;UPDATE `creature_template` SET `faction_A` = '14',`faction_H` = '14' WHERE `entry` =30093;

UPDATE `creature_template` SET `faction_A` = '14',`faction_H` = '14' WHERE `entry` =30110;





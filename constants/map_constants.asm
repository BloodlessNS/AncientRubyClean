newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH  EQU \2
\1_HEIGHT EQU \3
ENDM

GROUP_N_A  EQU -1
MAP_N_A    EQU -1

GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map group ids
	const_def
	newgroup                                                     ;  1
	map_const MOVING_TRUCK,                                3,  2 ;  1

	newgroup                                                     ;  2

	newgroup                                                     ;  3

	newgroup                                                     ;  4

	newgroup                                                     ;  5

	newgroup                                                     ;  6

	map_const CINNABAR_POKECENTER_1F,                      6,  4 ;  1
	map_const SEAFOAM_ISLANDS_1F,                         17, 18 ;  2
	map_const SEAFOAM_GYM,                                12, 12 ;  3
	map_const SEAFOAM_ISLANDS_B1F,                        20, 10 ;  4
	map_const SEAFOAM_ISLANDS_B2F,                        20, 10 ;  5
	map_const SEAFOAM_ISLANDS_B3F,                        20, 10 ;  6
	map_const SEAFOAM_ISLANDS_B4F,                        20, 10 ;  7
	map_const ROUTE_19,                                   10, 29 ;  8
	map_const ROUTE_20,                                   55,  9 ;  9
	map_const ROUTE_21,                                   10, 48 ; 10
	map_const URAGA_CHANNEL_WEST,                         10, 15 ; 11
	map_const CINNABAR_ISLAND,                            12, 11 ; 12
	map_const CINNABAR_VOLCANO_1F,                        14, 14 ; 13
	map_const CINNABAR_VOLCANO_B1F,                       18, 18 ; 14
	map_const CINNABAR_VOLCANO_B2F,                       14, 14 ; 15
	map_const POKEMON_MANSION_1F,                         15, 14 ; 16
	map_const POKEMON_MANSION_B1F,                        17, 16 ; 17
	map_const CINNABAR_LAB,                               16,  9 ; 18
	map_const SCARY_CAVE_1F,                              20, 17 ; 19
	map_const SCARY_CAVE_B1F,                             12, 12 ; 20
	map_const SCARY_CAVE_SHIPWRECK,                        6,  6 ; 21
	map_const ROUTE_19_BEACH_HOUSE,                        4,  4 ; 22

	newgroup                                                     ;  7

	map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE,             4,  4 ;  1
	map_const CERULEAN_POLICE_STATION,                     4,  4 ;  2
	map_const CERULEAN_TRADE_SPEECH_HOUSE,                 4,  4 ;  3
	map_const CERULEAN_POKECENTER_1F,                      6,  4 ;  4
	map_const CERULEAN_GYM,                                5,  8 ;  6
	map_const CERULEAN_MART,                               6,  4 ;  7
	map_const ROUTE_10_POKECENTER_1F,                      6,  4 ;  8
	map_const POWER_PLANT,                                10,  9 ; 10
	map_const BILLS_HOUSE,                                 4,  4 ; 11
	map_const ROUTE_4,                                    33, 10 ; 12
	map_const ROUTE_24,                                   14, 20 ; 13
	map_const ROUTE_25,                                   17, 21 ; 14
	map_const CERULEAN_CAPE,                              25, 19 ; 15
	map_const CERULEAN_CITY,                              20, 16 ; 16
	map_const CERULEAN_CAVE_1F,                           17, 12 ; 17
	map_const CERULEAN_CAVE_2F,                           17, 11 ; 18
	map_const CERULEAN_CAVE_B1F,                          17, 11 ; 19
	map_const CERULEAN_BIKE_SHOP,                          4,  4 ; 20
	map_const CERULEAN_BERRY_POWDER_HOUSE,                 4,  4 ; 21
	map_const CERULEAN_COUPLE_HOUSE,                       4,  4 ; 22
	map_const CERULEAN_WATER_SHOW_SPEECH_HOUSE,            4,  4 ; 23

	newgroup                                                     ;  8

	map_const AZALEA_POKECENTER_1F,                        6,  4 ;  1
	map_const CHARCOAL_KILN,                               5,  4 ;  2
	map_const AZALEA_MART,                                 6,  4 ;  3
	map_const KURTS_HOUSE,                                 8,  4 ;  4
	map_const AZALEA_GYM,                                  5,  8 ;  5
	map_const ROUTE_33,                                   10,  9 ;  6
	map_const AZALEA_TOWN,                                20,  9 ;  7

	newgroup                                                     ;  9

	map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,             4,  4 ;  1
	map_const LAKE_OF_RAGE_MAGIKARP_HOUSE,                 4,  4 ;  2
	map_const ROUTE_43_MAHOGANY_GATE,                      5,  4 ;  3
	map_const ROUTE_43_GATE,                               5,  4 ;  4
	map_const ROUTE_43,                                   10, 27 ;  5
	map_const LAKE_OF_RAGE,                               20, 18 ;  6

	newgroup                                                     ; 10

	map_const ROUTE_32,                                   10, 45 ;  1
	map_const ROUTE_32_COAST,                             15, 36 ;  2
	map_const VIOLET_CITY,                                20, 20 ;  3
	map_const VIOLET_MART,                                 6,  4 ;  4
	map_const VIOLET_GYM,                                  5,  8 ;  5
	map_const EARLS_POKEMON_ACADEMY,                       4,  8 ;  6
	map_const VIOLET_NICKNAME_SPEECH_HOUSE,                4,  4 ;  7
	map_const VIOLET_POKECENTER_1F,                        6,  4 ;  8
	map_const VIOLET_ONIX_TRADE_HOUSE,                     4,  4 ;  9
	map_const ROUTE_32_RUINS_OF_ALPH_GATE,                 5,  4 ; 10
	map_const ROUTE_32_POKECENTER_1F,                      6,  4 ; 11
	map_const ROUTE_32_COAST_HOUSE,                        4,  4 ; 12
	map_const MAGNET_TUNNEL_EAST,                         10, 11 ; 13
	map_const VIOLET_OUTSKIRTS,                           20,  8 ; 14

	newgroup                                                     ; 11

	map_const ROUTE_34,                                   10, 27 ;  1
	map_const ROUTE_34_COAST,                              9, 34 ;  2
	map_const ROUTE_35,                                   12, 18 ;  3
	map_const STORMY_BEACH,                               22, 11 ;  4
	map_const MURKY_SWAMP,                                23, 19 ;  5
	map_const GOLDENROD_CITY,                             22, 18 ;  6
	map_const GOLDENROD_GYM,                              10,  9 ;  7
	map_const GOLDENROD_BIKE_SHOP,                         4,  4 ;  8
	map_const GOLDENROD_HAPPINESS_RATER,                   4,  4 ;  9
	map_const GOLDENROD_BILLS_HOUSE,                       4,  4 ; 10
	map_const GOLDENROD_MAGNET_TRAIN_STATION,             10,  9 ; 11
	map_const GOLDENROD_FLOWER_SHOP,                       4,  4 ; 12
	map_const GOLDENROD_PP_SPEECH_HOUSE,                   4,  4 ; 13
	map_const GOLDENROD_NAME_RATER,                        4,  4 ; 14
	map_const GOLDENROD_DEPT_STORE_1F,                     8,  4 ; 15
	map_const GOLDENROD_DEPT_STORE_2F,                     8,  4 ; 16
	map_const GOLDENROD_DEPT_STORE_3F,                     8,  4 ; 17
	map_const GOLDENROD_DEPT_STORE_4F,                     8,  4 ; 18
	map_const GOLDENROD_DEPT_STORE_5F,                     8,  4 ; 19
	map_const GOLDENROD_DEPT_STORE_6F,                     8,  4 ; 20
	map_const GOLDENROD_DEPT_STORE_ELEVATOR,               2,  2 ; 21
	map_const GOLDENROD_DEPT_STORE_ROOF,                   8,  6 ; 22
	map_const GOLDENROD_GAME_CORNER,                      10,  7 ; 23
	map_const GOLDENROD_POKECOM_CENTER_1F,                16,  8 ; 24
	map_const GOLDENROD_POKECOM_CENTER_OFFICE,             4,  4 ; 25
	map_const ILEX_FOREST_AZALEA_GATE,                     5,  4 ; 26
	map_const ROUTE_34_ILEX_FOREST_GATE,                   5,  4 ; 27
	map_const ROUTE_35_GOLDENROD_GATE,                     5,  4 ; 28
	map_const ROUTE_35_NATIONAL_PARK_GATE,                10,  4 ; 29
	map_const DAYCARE,                                     4,  4 ; 30
	map_const GOLDENROD_HP_UP_HOUSE,                       4,  4 ; 31
	map_const GOLDENROD_NET_BALL_HOUSE,                    4,  4 ; 32
	map_const GOLDENROD_BAND_HOUSE,                        4,  4 ; 33
	map_const GOLDENROD_MUSEUM_1F,                         7,  4 ; 34
	map_const GOLDENROD_MUSEUM_2F,                         7,  4 ; 35
	map_const MAGNET_TUNNEL_WEST,                         10, 11 ; 36
	map_const MAGNET_TUNNEL_INSIDE,                       23, 13 ; 37

	newgroup                                                     ; 12

	map_const ROUTE_6,                                    15, 16 ;  1
	map_const ROUTE_11,                                   26,  9 ;  2
	map_const VERMILION_CITY,                             20, 20 ;  3
	map_const VERMILION_HOUSE_FISHING_SPEECH_HOUSE,        4,  4 ;  4
	map_const VERMILION_POKECENTER_1F,                     6,  4 ;  5
	map_const POKEMON_FAN_CLUB,                            5,  4 ;  6
	map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,         4,  4 ;  7
	map_const VERMILION_MART,                              6,  4 ;  8
	map_const VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE,  4,  4 ;  9
	map_const VERMILION_GYM,                               5,  9 ; 10
	map_const ROUTE_6_SAFFRON_GATE,                        5,  4 ; 11
	map_const ROUTE_6_UNDERGROUND_ENTRANCE,                4,  4 ; 12
	map_const ROUTE_11_GATE,                               5,  5 ; 13
	map_const ROUTE_11_GATE_2F,                            4,  4 ; 14
	map_const VERMILION_POLLUTION_SPEECH_HOUSE,            4,  4 ; 15
	map_const VERMILION_S_S_ANNE_SPEECH_HOUSE,             4,  4 ; 16

	newgroup                                                     ; 13

	map_const ROUTE_1,                                    12, 18 ;  1
	map_const PALLET_TOWN,                                10,  9 ;  2
	map_const REDS_HOUSE_1F,                               4,  4 ;  3
	map_const REDS_HOUSE_2F,                               4,  4 ;  4
	map_const BLUES_HOUSE_1F,                              4,  4 ;  5
	map_const BLUES_HOUSE_2F,                              4,  4 ;  6
	map_const OAKS_LAB,                                    5,  6 ;  7

	newgroup                                                     ; 14

	map_const ROUTE_2_NORTH,                              10, 18 ;  1
	map_const ROUTE_3,                                    36, 11 ;  2
	map_const ROUTE_3_POKECENTER_1F,                       6,  4 ;  3
	map_const PEWTER_CITY,                                20, 18 ;  4
	map_const PEWTER_NIDORAN_SPEECH_HOUSE,                 4,  4 ;  5
	map_const PEWTER_GYM,                                  5,  7 ;  6
	map_const PEWTER_MART,                                 6,  4 ;  7
	map_const PEWTER_POKECENTER_1F,                        6,  4 ;  8
	map_const PEWTER_SNOOZE_SPEECH_HOUSE,                  4,  4 ;  9
	map_const PEWTER_MUSEUM_OF_SCIENCE_1F,                10,  4 ; 10
	map_const PEWTER_MUSEUM_OF_SCIENCE_2F,                 7,  4 ; 11

	newgroup                                                     ; 15

	map_const OLIVINE_PORT,                               10, 16 ;  1
	map_const VERMILION_PORT,                             10, 13 ;  2
	map_const FAST_SHIP_1F,                               16,  9 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                 4, 16 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                  4, 16 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,      5, 17 ;  6
	map_const FAST_SHIP_B1F,                              14,  7 ;  7
	map_const OLIVINE_PORT_PASSAGE,                        4, 15 ;  8
	map_const VERMILION_PORT_PASSAGE,                      4, 15 ;  9
	map_const MOUNT_MOON_SQUARE,                          15,  9 ; 10
	map_const MOUNT_MOON_GIFT_SHOP,                        4,  4 ; 11
	map_const TIN_TOWER_ROOF,                              7,  9 ; 12

	newgroup                                                     ; 16

	map_const ROUTE_23,                                   10, 70 ;  1
	map_const INDIGO_PLATEAU,                             10, 13 ;  2
	map_const INDIGO_PLATEAU_POKECENTER_1F,                8,  7 ;  3
	map_const WILLS_ROOM,                                  5,  9 ;  4
	map_const KOGAS_ROOM,                                  5,  9 ;  5
	map_const BRUNOS_ROOM,                                 5,  9 ;  6
	map_const KARENS_ROOM,                                 5,  9 ;  7
	map_const LANCES_ROOM,                                 7, 12 ;  8
	map_const HALL_OF_FAME,                                5,  7 ;  9
	map_const BELLCHIME_TRAIL,                            12,  7 ; 10

	newgroup                                                     ; 17

	map_const ROUTE_12_SOUTH,                             10, 44 ;  1
	map_const ROUTE_13_EAST,                              23, 10 ;  2
	map_const ROUTE_13_WEST,                              12, 10 ;  3
	map_const ROUTE_14,                                   12, 19 ;  4
	map_const ROUTE_15,                                   20,  9 ;  5
	map_const ROUTE_18_EAST,                              14, 11 ;  6
	map_const FUCHSIA_CITY,                               20, 18 ;  7
	map_const FUCHSIA_MART,                                6,  4 ;  8
	map_const FUCHSIA_GYM,                                 5,  9 ;  9
	map_const FUCHSIA_BILL_SPEECH_HOUSE,                   4,  4 ; 10
	map_const FUCHSIA_SAFARI_BALL_HOUSE,                   4,  4 ; 11
	map_const FUCHSIA_POKECENTER_1F,                       6,  4 ; 12
	map_const SAFARI_ZONE_WARDENS_HOME,                    5,  4 ; 13
	map_const SAFARI_ZONE_FUCHSIA_GATE,                    5,  4 ; 14
	map_const ROUTE_12_GATE,                               5,  5 ; 15
	map_const ROUTE_12_GATE_2F,                            4,  4 ; 16
	map_const ROUTE_15_FUCHSIA_GATE,                       5,  5 ; 17
	map_const ROUTE_15_FUCHSIA_GATE_2F,                    4,  4 ; 18
	map_const ROUTE_19_FUCHSIA_GATE,                       5,  4 ; 19
	map_const ROUTE_12_SUPER_ROD_HOUSE,                    4,  4 ; 20
	map_const LUCKY_ISLAND,                               23, 17 ; 21

	newgroup                                                     ; 18

	map_const ROUTE_8,                                    26, 11 ;  1
	map_const ROUTE_8_SAFFRON_GATE,                        5,  4 ;  2
	map_const ROUTE_10_SOUTH,                             10,  9 ;  3
	map_const ROUTE_12_NORTH,                             10,  9 ;  4
	map_const LAVENDER_TOWN,                              10, 10 ;  5
	map_const LAVENDER_POKECENTER_1F,                      6,  4 ;  6
	map_const MR_FUJIS_HOUSE,                              5,  4 ;  7
	map_const LAVENDER_TOWN_SPEECH_HOUSE,                  4,  4 ;  8
	map_const LAVENDER_NAME_RATER,                         4,  4 ;  9
	map_const LAVENDER_MART,                               6,  4 ; 10
	map_const SOUL_HOUSE,                                  5,  5 ; 11
	map_const SOUL_HOUSE_B1F,                             10,  9 ; 12
	map_const SOUL_HOUSE_B2F,                             10,  9 ; 13
	map_const SOUL_HOUSE_B3F,                              4,  9 ; 14
	map_const LAV_RADIO_TOWER_1F,                         10,  4 ; 15
	map_const LAV_RADIO_TOWER_2F,                          9,  4 ; 16
	map_const LAV_RADIO_TOWER_3F,                          9,  4 ; 17
	map_const LAV_RADIO_TOWER_4F,                          9,  4 ; 18
	map_const LAV_RADIO_TOWER_5F,                          7,  4 ; 19
	map_const HAUNTED_RADIO_TOWER_2F,                      9,  4 ; 20
	map_const HAUNTED_RADIO_TOWER_3F,                      9,  4 ; 21
	map_const HAUNTED_RADIO_TOWER_4F,                      9,  4 ; 22
	map_const HAUNTED_RADIO_TOWER_5F,                      8,  9 ; 23
	map_const HAUNTED_RADIO_TOWER_6F,                      8,  9 ; 24

	newgroup                                                     ; 19

	map_const ROUTE_28,                                   19,  9 ;  1
	map_const SILVER_CAVE_OUTSIDE,                        20, 15 ;  2
	map_const SILVER_CAVE_POKECENTER_1F,                   6,  4 ;  3
	map_const ROUTE_28_FAMOUS_SPEECH_HOUSE,                4,  4 ;  4
	map_const NAVEL_ROCK_OUTSIDE,                         13, 16 ;  5
	map_const NAVEL_ROCK_INSIDE,                          20, 45 ;  6
	map_const NAVEL_ROCK_ROOF,                             8, 11 ;  7
	map_const FARAWAY_ISLAND,                             17, 23 ;  8
	map_const FARAWAY_JUNGLE,                             14, 12 ;  9
	map_const SEAGALLOP_FERRY_VERMILION_GATE,              7,  6 ;  10
	map_const SEAGALLOP_FERRY_NAVEL_GATE,                  7,  6 ;  11
	map_const SEAGALLOP_FERRY_SHAMOUTI_GATE,               7,  6 ;  12

	newgroup                                                     ; 20

	map_const POKECENTER_2F,                               8,  4 ;  1
	map_const TRADE_CENTER,                                5,  4 ;  2
	map_const COLOSSEUM,                                   5,  4 ;  3
	map_const HIDDEN_TREE_GROTTO,                          5,  9 ;  4
	map_const HIDDEN_CAVE_GROTTO,                         20, 45 ;  5
	map_const YELLOW_FOREST_GATE,                          5,  4 ;  6
	map_const YELLOW_FOREST,                              29, 26 ;  7
	map_const ECRUTEAK_SHRINE_OUTSIDE,                     6,  9 ;  8
	map_const ECRUTEAK_SHRINE_INSIDE,                      6,  6 ;  9

	newgroup                                                     ; 21

	map_const ROUTE_7,                                    10,  9 ;  1
	map_const ROUTE_16_NORTHEAST,                         11, 11 ;  2
	map_const ROUTE_16_SOUTH,                             11, 11 ;  3
	map_const ROUTE_17,                                   10, 63 ;  4
	map_const ROUTE_18_WEST,                              10,  9 ;  5
	map_const URAGA_CHANNEL_EAST,                         23,  9 ;  6
	map_const CELADON_CITY,                               22, 18 ;  7
	map_const CELADON_DEPT_STORE_1F,                       8,  4 ;  8
	map_const CELADON_DEPT_STORE_2F,                       8,  4 ;  9
	map_const CELADON_DEPT_STORE_3F,                       8,  4 ; 10
	map_const CELADON_DEPT_STORE_4F,                       8,  4 ; 11
	map_const CELADON_DEPT_STORE_5F,                       8,  4 ; 12
	map_const CELADON_DEPT_STORE_6F,                       8,  4 ; 13
	map_const CELADON_DEPT_STORE_ELEVATOR,                 2,  2 ; 14
	map_const CELADON_MANSION_1F,                          4,  5 ; 15
	map_const CELADON_MANSION_2F,                          4,  5 ; 16
	map_const CELADON_MANSION_3F,                          4,  5 ; 17
	map_const CELADON_MANSION_ROOF,                        4,  7 ; 18
	map_const CELADON_MANSION_ROOF_HOUSE,                  4,  4 ; 19
	map_const CELADON_POKECENTER_1F,                       6,  4 ; 20
	map_const CELADON_GAME_CORNER,                        10,  7 ; 21
	map_const CELADON_GAME_CORNER_PRIZE_ROOM,              4,  4 ; 22
	map_const CELADON_GYM,                                 5,  9 ; 23
	map_const CELADON_CAFE,                                6,  4 ; 24
	map_const CELADON_CHIEF_HOUSE,                         4,  4 ; 25
	map_const CELADON_HOTEL_1F,                            9,  4 ; 26
	map_const CELADON_HOTEL_2F,                            9,  2 ; 27
	map_const CELADON_HOTEL_ROOM_1,                        3,  3 ; 28
	map_const CELADON_HOTEL_ROOM_2,                        3,  3 ; 29
	map_const CELADON_HOTEL_ROOM_3,                        3,  3 ; 30
	map_const CELADON_HOTEL_POOL,                          7,  4 ; 31
	map_const EUSINES_HOUSE,                               4,  4 ; 32
	map_const PSYCHIC_INVERS_HOUSE,                        4,  4 ; 33
	map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE,               4,  4 ; 34
	map_const ROUTE_16_GATE,                               5,  4 ; 35
	map_const ROUTE_16_17_GATE,                            5,  5 ; 36
	map_const ROUTE_16_17_GATE_2F,                         4,  4 ; 37
	map_const ROUTE_7_SAFFRON_GATE,                        5,  4 ; 38
	map_const ROUTE_18_GATE,                               5,  5 ; 39
	map_const ROUTE_18_GATE_2F,                            4,  4 ; 40
	map_const CELADON_HOME_DECOR_STORE_1F,                 5,  4 ; 41
	map_const CELADON_HOME_DECOR_STORE_2F,                 5,  4 ; 42
	map_const CELADON_HOME_DECOR_STORE_3F,                 5,  4 ; 43
	map_const CELADON_HOME_DECOR_STORE_4F,                 5,  4 ; 44
	map_const CELADON_UNIVERSITY_1F,                      15, 10 ; 45
	map_const CELADON_UNIVERSITY_2F,                      13,  7 ; 46
	map_const CELADON_UNIVERSITY_LIBRARY_1F,               7,  6 ; 47
	map_const CELADON_UNIVERSITY_LIBRARY_2F,               7,  6 ; 48
	map_const CELADON_UNIVERSITY_PRINCIPALS_OFFICE,        3,  4 ; 49
	map_const CELADON_UNIVERSITY_WESTWOODS_OFFICE,         3,  3 ; 50
	map_const CELADON_UNIVERSITY_WILLOWS_OFFICE,           3,  3 ; 51
	map_const CELADON_UNIVERSITY_LOUNGE,                   4,  6 ; 52
	map_const CELADON_UNIVERSITY_CAFETERIA,                8,  4 ; 53
	map_const CELADON_UNIVERSITY_HYPER_TEST_ROOM,          4,  6 ; 54
	map_const CELADON_UNIVERSITY_POOL,                     8,  5 ; 55
	map_const CELADON_UNIVERSITY_CLASSROOM_1,              4,  6 ; 56
	map_const CELADON_UNIVERSITY_CLASSROOM_2,              4,  6 ; 57
	map_const CELADON_UNIVERSITY_CLASSROOM_3,              4,  6 ; 58
	map_const CELADON_UNIVERSITY_CLASSROOM_4,              4,  6 ; 59
	map_const CELADON_OLD_MAN_SPEECH_HOUSE,                4,  4 ; 60
	map_const CELADON_DEVELOPMENT_SPEECH_HOUSE,            4,  4 ; 61
	map_const CELADON_OUTSKIRTS,                          10,  6 ; 62

	newgroup                                                     ; 22

	map_const ROUTE_40,                                   10, 20 ;  1
	map_const ROUTE_41,                                   32, 27 ;  2
	map_const CIANWOOD_CITY,                              15, 27 ;  3
	map_const MANIAS_HOUSE,                                4,  4 ;  4
	map_const CIANWOOD_GYM,                                5,  9 ;  5
	map_const CIANWOOD_POKECENTER_1F,                      6,  4 ;  6
	map_const CIANWOOD_PHARMACY,                           4,  4 ;  7
	map_const CIANWOOD_CITY_PHOTO_STUDIO,                  4,  4 ;  8
	map_const CIANWOOD_LUGIA_SPEECH_HOUSE,                 4,  4 ;  9
	map_const STATS_JUDGES_HOUSE,                          4,  4 ; 10
	map_const BATTLE_TOWER_1F,                            11,  7 ; 11
	map_const BATTLE_TOWER_2F,                            11,  5 ; 12
	map_const BATTLE_TOWER_BATTLE_ROOM,                    4,  4 ; 13
	map_const BATTLE_TOWER_ELEVATOR,                       2,  2 ; 14
	map_const BATTLE_TOWER_HALLWAY,                       11,  2 ; 15
	map_const ROUTE_40_BATTLE_TOWER_GATE,                  5,  4 ; 16
	map_const BATTLE_TOWER_OUTSIDE,                       10, 13 ; 17

	newgroup                                                     ; 23

	map_const ROUTE_2_SOUTH,                              10, 18 ;  1
	map_const ROUTE_22,                                   15,  9 ;  2
	map_const VIRIDIAN_CITY,                              20, 18 ;  3
	map_const VIRIDIAN_GYM,                                7, 23 ;  4
	map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE,              4,  4 ;  5
	map_const VIRIDIAN_SCHOOL_HOUSE,                       4,  5 ;  6
	map_const TRAINER_HOUSE_1F,                            5,  6 ;  7
	map_const TRAINER_HOUSE_B1F,                           5,  8 ;  8
	map_const VIRIDIAN_MART,                               6,  4 ;  9
	map_const VIRIDIAN_POKECENTER_1F,                      6,  4 ; 11
	map_const ROUTE_2_NUGGET_SPEECH_HOUSE,                 4,  4 ; 12
	map_const ROUTE_2_GATE,                                5,  4 ; 13
	map_const POKEMON_LEAGUE_GATE,                        11,  9 ; 14
	map_const VIRIDIAN_FOREST,                            19, 26 ; 15
	map_const VIRIDIAN_FOREST_VIRIDIAN_GATE,               5,  4 ; 16
	map_const VIRIDIAN_FOREST_PEWTER_GATE,                 5,  4 ; 17
	map_const ROUTE_1_VIRIDIAN_GATE,                       5,  4 ; 18
	map_const ROUTE_16_NORTHWEST,                         11, 11 ; 19
	map_const ROUTE_16_WEST,                              34, 11 ; 20

	newgroup                                                     ; 24

	map_const ROUTE_26,                                   10, 54 ;  1
	map_const ROUTE_27,                                   40,  9 ;  2
	map_const ROUTE_29,                                   30,  9 ;  3
	map_const NEW_BARK_TOWN,                              10,  9 ;  4
	map_const ELMS_LAB,                                    5,  6 ;  5
	map_const KRISS_HOUSE_1F,                              6,  4 ;  6
	map_const KRISS_HOUSE_2F,                              4,  3 ;  7
	map_const KRISS_NEIGHBORS_HOUSE,                       4,  4 ;  8
	map_const LYRAS_HOUSE_1F,                              6,  4 ;  9
	map_const LYRAS_HOUSE_2F,                              4,  3 ; 10
	map_const ELMS_HOUSE,                                  4,  4 ; 11
	map_const ROUTE_26_HEAL_SPEECH_HOUSE,                  4,  4 ; 12
	map_const ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE,         4,  4 ; 13
	map_const ROUTE_27_REST_HOUSE,                         4,  4 ; 14
	map_const ROUTE_29_46_GATE,                            5,  4 ; 15

	newgroup                                                     ; 25

	map_const FIGHTING_DOJO,                               5,  6 ;  1
	map_const SAFFRON_GYM,                                10,  9 ;  2
	map_const SAFFRON_MART,                                6,  4 ;  3
	map_const SAFFRON_POKECENTER_1F,                       6,  4 ;  4
	map_const MR_PSYCHICS_HOUSE,                           4,  4 ;  5
	map_const SAFFRON_TRAIN_STATION,                      10,  9 ;  6
	map_const SILPH_CO_1F,                                 8,  4 ;  7
	map_const SILPH_CO_2F,                                 8,  4 ;  8
	map_const SILPH_CO_3F,                                 8,  4 ;  9
	map_const COPYCATS_HOUSE_1F,                           4,  4 ; 10
	map_const COPYCATS_HOUSE_2F,                           4,  3 ; 11
	map_const ROUTE_5,                                    10, 17 ; 12
	map_const ROUTE_5_UNDERGROUND_ENTRANCE,                4,  4 ; 13
	map_const ROUTE_5_SAFFRON_CITY_GATE,                   5,  4 ; 14
	map_const ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE,            4,  4 ; 15
	map_const POKEMON_TRAINER_FAN_CLUB,                    4,  5 ; 16
	map_const SAFFRON_HITMONTOP_KID_HOUSE,                 4,  4 ; 17
	map_const SAFFRON_BOOK_SPEECH_HOUSE,                   4,  4 ; 18
	map_const SAFFRON_ORRE_SPEECH_HOUSE,                   4,  4 ; 19
	map_const SAFFRON_RICH_SPEECH_HOUSE,                   4,  4 ; 20

	newgroup                                                     ; 26

	map_const ROUTE_30,                                   10, 27 ;  1
	map_const ROUTE_31,                                   22,  9 ;  2
	map_const CHERRYGROVE_BAY,                            15, 25 ;  3
	map_const CHERRYGROVE_CITY,                           20, 10 ;  4
	map_const CHERRYGROVE_MART,                            6,  4 ;  5
	map_const CHERRYGROVE_POKECENTER_1F,                   6,  4 ;  6
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                4,  4 ;  7
	map_const GUIDE_GENTS_HOUSE,                           4,  4 ;  8
	map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,          4,  4 ;  9
	map_const ROUTE_30_BERRY_SPEECH_HOUSE,                 4,  4 ; 10
	map_const MR_POKEMONS_HOUSE,                           4,  4 ; 11
	map_const ROUTE_31_VIOLET_GATE,                        5,  4 ; 12

	newgroup                                                     ; 27

	map_const CLIFF_EDGE_GATE,                            10, 11 ;  1
	map_const CLIFF_CAVE,                                  6, 18 ;  2
	map_const ROUTE_47,                                   39, 19 ;  3
	map_const ROUTE_48,                                   18, 11 ;  4
	map_const QUIET_CAVE_1F,                              18, 18 ;  5
	map_const QUIET_CAVE_B1F,                             18, 18 ;  6
	map_const QUIET_CAVE_B2F,                             18, 18 ;  7
	map_const QUIET_CAVE_B3F,                             18, 18 ;  8

	newgroup                                                     ; 28

	map_const ROUTE_9,                                    26,  9 ;  1
	map_const ROUTE_10_NORTH,                             10, 29 ;  2
	map_const DIM_CAVE_1F,                                17, 18 ;  3
	map_const DIM_CAVE_2F,                                17, 18 ;  4
	map_const DIM_CAVE_3F,                                16, 17 ;  5
	map_const DIM_CAVE_4F,                                16, 16 ;  6
	map_const DIM_CAVE_5F,                                17, 17 ;  7

	newgroup                                                     ; 29

	map_const GOLDENROD_HARBOR,                           24, 18 ;  1
	map_const GOLDENROD_HARBOR_GATE,                       5,  4 ;  2

	newgroup                                                     ; 30

	map_const RUINS_OF_ALPH_OUTSIDE,                      11, 21 ;  1
	map_const RUINS_OF_ALPH_HO_OH_CHAMBER,                 4,  5 ;  2
	map_const RUINS_OF_ALPH_KABUTO_CHAMBER,                4,  5 ;  3
	map_const RUINS_OF_ALPH_OMANYTE_CHAMBER,               4,  5 ;  4
	map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER,            4,  5 ;  5
	map_const RUINS_OF_ALPH_ENTRANCE_CHAMBER,              4,  4 ;  6
	map_const RUINS_OF_ALPH_INNER_CHAMBER,                10, 14 ;  7
	map_const RUINS_OF_ALPH_RESEARCH_CENTER,               4,  4 ;  8
	map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM,               4,  5 ;  9
	map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM,              4,  5 ; 10
	map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM,             4,  5 ; 11
	map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM,          4,  5 ; 12
	map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,              10, 12 ; 13
	map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,             10,  7 ; 14
	map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,            10,  8 ; 15
	map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,         10,  7 ; 16
	map_const RUINS_OF_ALPH_SINJOH_CHAMBER,                5,  5 ; 17
	map_const ROUTE_22_PAST,                               6,  6 ; 18

	newgroup                                                     ; 31

	map_const SHAMOUTI_ISLAND,                            18, 15 ;  1
	map_const BEAUTIFUL_BEACH,                            21, 15 ;  2
	map_const WARM_BEACH,                                 12, 13 ;  3
	map_const SHAMOUTI_COAST,                             48, 10 ;  4
	map_const ROCKY_BEACH,                                20, 15 ;  5
	map_const SHAMOUTI_TUNNEL,                            18, 10 ;  6
	map_const NOISY_FOREST,                               22, 20 ;  7
	map_const SHAMOUTI_POKECENTER_1F,                      6,  4 ;  8
	map_const SHAMOUTI_HOTEL_1F,                           9,  4 ;  9
	map_const SHAMOUTI_HOTEL_2F,                           9,  2 ; 10
	map_const SHAMOUTI_HOTEL_3F,                           9,  2 ; 11
	map_const SHAMOUTI_HOTEL_ROOM_2A,                      3,  3 ; 12
	map_const SHAMOUTI_HOTEL_ROOM_2B,                      3,  3 ; 13
	map_const SHAMOUTI_HOTEL_ROOM_3B,                      3,  3 ; 14
	map_const SHAMOUTI_HOTEL_ROOM_3C,                      3,  3 ; 15
	map_const SHAMOUTI_HOTEL_RESTAURANT,                   9,  4 ; 16
	map_const SHAMOUTI_TOURIST_CENTER,                     4,  4 ; 17
	map_const SHAMOUTI_MERCHANT,                           4,  4 ; 18
	map_const SHAMOUTI_HOUSE,                              4,  4 ; 19
	map_const BEAUTIFUL_BEACH_VILLA,                       6,  4 ; 20
	map_const WARM_BEACH_SHACK,                            4,  4 ; 21
	map_const WARM_BEACH_HOUSE,                            4,  4 ; 22
	map_const ROCKY_BEACH_HOUSE,                           4,  4 ; 23
	map_const FIRE_ISLAND,                                13, 16 ; 24
	map_const FIRE_ISLAND_ROOF,                            6,  6 ; 25
	map_const ICE_ISLAND,                                 13, 16 ; 26
	map_const ICE_ISLAND_ROOF,                             6,  6 ; 27
	map_const LIGHTNING_ISLAND,                           13, 16 ; 28
	map_const LIGHTNING_ISLAND_ROOF,                       6,  6 ; 29

	newgroup                                                     ; 32

	map_const SAFARI_ZONE_HUB,                            17, 16 ;  1
	map_const SAFARI_ZONE_EAST,                           17, 15 ;  2
	map_const SAFARI_ZONE_NORTH,                          22, 20 ;  3
	map_const SAFARI_ZONE_WEST,                           17, 15 ;  4
	map_const SAFARI_ZONE_HUB_REST_HOUSE,                  4,  4 ;  5
	map_const SAFARI_ZONE_EAST_REST_HOUSE,                 4,  4 ;  6
	map_const SAFARI_ZONE_NORTH_REST_HOUSE,                4,  4 ;  7
	map_const SAFARI_ZONE_WEST_REST_HOUSE_1,               4,  4 ;  8
	map_const SAFARI_ZONE_WEST_REST_HOUSE_2,               4,  4 ;  9

	newgroup                                                     ; 33

	map_const VALENCIA_ISLAND,                            14, 12 ;  1
	map_const ROUTE_49,                                   20, 11 ;  2
	map_const IVYS_LAB,                                    5,  6 ;  3
	map_const IVYS_HOUSE,                                  4,  4 ;  4
	map_const VALENCIA_HOUSE,                              4,  4 ;  5
	map_const VALENCIA_PORT,                              11,  9 ;  6

	newgroup                                                     ; 34

	map_const SINJOH_RUINS,                                9, 13 ;  1
	map_const SINJOH_RUINS_HOUSE,                          4,  4 ;  2
	map_const MYSTRI_STAGE,                                7, 10 ;  3
	map_const EMBEDDED_TOWER,                              7, 12 ;  4

	newgroup                                                     ; 35

	map_const SAFFRON_CITY,                               20, 19 ;  1
	map_const SHAMOUTI_SHRINE_RUINS,                      12, 17 ;  2

scene_var: MACRO
; db group, map
; dw address
	map_id \1
	dw \2
ENDM

MapTriggers::
	scene_var MOVING_TRUCK,                           wMovingTruckTrigger
	scene_var AZALEA_TOWN,                            wAzaleaTownTrigger
	scene_var BATTLE_TOWER_1F,                        wBattleTower1FTrigger
	scene_var BATTLE_TOWER_BATTLE_ROOM,               wBattleTowerBattleRoomTrigger
	scene_var BATTLE_TOWER_ELEVATOR,                  wBattleTowerElevatorTrigger
	scene_var BATTLE_TOWER_HALLWAY,                   wBattleTowerHallwayTrigger
	scene_var BATTLE_TOWER_OUTSIDE,                   wBattleTowerOutsideTrigger
	scene_var BELLCHIME_TRAIL,                        wBellchimeTrailTrigger
	scene_var BRUNOS_ROOM,                            wBrunosRoomTrigger
	scene_var CERULEAN_CAPE,                          wCeruleanCapeTrigger
	scene_var CERULEAN_CAVE_1F,                       wCeruleanCave1FTrigger
	scene_var CERULEAN_GYM,                           wCeruleanGymTrigger
	scene_var CHERRYGROVE_CITY,                       wCherrygroveCityTrigger
	scene_var CIANWOOD_CITY,                          wCianwoodCityTrigger
	scene_var CINNABAR_LAB,                           wCinnabarLabTrigger
	scene_var COLOSSEUM,                              wColosseumTrigger
	scene_var DAYCARE,                                wDayCareTrigger
	scene_var ELMS_LAB,                               wElmsLabTrigger
	scene_var FARAWAY_ISLAND,                         wFarawayIslandTrigger
	scene_var FAST_SHIP_1F,                           wFastShip1FTrigger
	scene_var FAST_SHIP_B1F,                          wFastShipB1FTrigger
	scene_var GOLDENROD_CITY,                         wGoldenrodCityTrigger
	scene_var GOLDENROD_GYM,                          wGoldenrodGymTrigger
	scene_var GOLDENROD_MAGNET_TRAIN_STATION,         wAlways0Trigger
	scene_var INDIGO_PLATEAU_POKECENTER_1F,           wAlways0Trigger
	scene_var KARENS_ROOM,                            wKarensRoomTrigger
	scene_var KOGAS_ROOM,                             wKogasRoomTrigger
	scene_var KRISS_HOUSE_1F,                         wKrissHouse1FTrigger
	scene_var LANCES_ROOM,                            wLancesRoomTrigger
	scene_var LAVENDER_TOWN,                          wLavenderTownTrigger
	scene_var MOUNT_MOON_SQUARE,                      wAlways0Trigger
	scene_var MR_POKEMONS_HOUSE,                      wMrPokemonsHouseTrigger
	scene_var MYSTRI_STAGE,                           wMystriStageTrigger
	scene_var NEW_BARK_TOWN,                          wNewBarkTownTrigger
	scene_var OLIVINE_PORT,                           wOlivinePortTrigger
	scene_var POKECENTER_2F,                          wPokecenter2FTrigger
	scene_var POKEMON_LEAGUE_GATE,                    wPokemonLeagueGateTrigger
	scene_var POWER_PLANT,                            wPowerPlantTrigger
	scene_var ROUTE_10_NORTH,                         wRoute10NorthTrigger
	scene_var ROUTE_16_17_GATE,                       wAlways0Trigger
	scene_var ROUTE_18_GATE,                          wAlways0Trigger
	scene_var ROUTE_18_WEST,                          wAlways0Trigger
	scene_var ROUTE_22_PAST,                          wAlways0Trigger
	scene_var ROUTE_23,                               wRoute23Trigger
	scene_var ROUTE_24,                               wRoute24Trigger
	scene_var ROUTE_27,                               wRoute27Trigger
	scene_var ROUTE_29,                               wRoute29Trigger
	scene_var ROUTE_32,                               wRoute32Trigger
	scene_var ROUTE_34,                               wRoute34Trigger
	scene_var ROUTE_34_ILEX_FOREST_GATE,              wAlways0Trigger
	scene_var ROUTE_35_NATIONAL_PARK_GATE,            wRoute35NationalParkGateTrigger
	scene_var ROUTE_43_GATE,                          wRoute43GateTrigger
	scene_var ROUTE_47,                               wRoute47Trigger
	scene_var ROUTE_48,                               wRoute48Trigger
	scene_var RUINS_OF_ALPH_AERODACTYL_CHAMBER,       wRuinsOfAlphAerodactylChamberTrigger
	scene_var RUINS_OF_ALPH_HO_OH_CHAMBER,            wRuinsOfAlphHoOhChamberTrigger
	scene_var RUINS_OF_ALPH_INNER_CHAMBER,            wRuinsOfAlphInnerChamberTrigger
	scene_var RUINS_OF_ALPH_KABUTO_CHAMBER,           wRuinsOfAlphKabutoChamberTrigger
	scene_var RUINS_OF_ALPH_OMANYTE_CHAMBER,          wRuinsOfAlphOmanyteChamberTrigger
	scene_var RUINS_OF_ALPH_OUTSIDE,                  wRuinsOfAlphOutsideTrigger
	scene_var RUINS_OF_ALPH_RESEARCH_CENTER,          wRuinsOfAlphResearchCenterTrigger
	scene_var SAFFRON_TRAIN_STATION,                  wAlways0Trigger
	scene_var SEAGALLOP_FERRY_NAVEL_GATE,             wSeagallopFerryNavelGateTrigger
	scene_var SEAGALLOP_FERRY_SHAMOUTI_GATE,          wSeagallopFerryShamoutiGateTrigger
	scene_var SEAGALLOP_FERRY_VERMILION_GATE,         wSeagallopFerryVermilionGateTrigger
	scene_var SHAMOUTI_HOTEL_RESTAURANT,              wShamoutiHotelRestaurantTrigger
	scene_var TRADE_CENTER,                           wTradeCenterTrigger
	scene_var TRAINER_HOUSE_B1F,                      wAlways0Trigger
	scene_var VERMILION_CITY,                         wVermilionCityTrigger
	scene_var VERMILION_PORT,                         wVermilionPortTrigger
	scene_var VIOLET_GYM,                             wVioletGymTrigger
	scene_var WILLS_ROOM,                             wWillsRoomTrigger
	scene_var YELLOW_FOREST,                          wYellowForestTrigger
	db -1

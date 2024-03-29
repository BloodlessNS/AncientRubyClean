spawn: MACRO
; map, y, x
	map_id \1
	db \2, \3
ENDM

SpawnPoints: ; 0x152ab
	spawn MOVING_TRUCK,                3,  2

	spawn PALLET_TOWN,                 5,  6
	spawn VIRIDIAN_CITY,              23, 26
	spawn PEWTER_CITY,                13, 26
	spawn ROUTE_3,                    61,  4
	spawn CERULEAN_CITY,              19, 18
	spawn ROUTE_10_NORTH,             11, 36
	spawn VERMILION_CITY,              9,  6
	spawn LAVENDER_TOWN,               5,  8
	spawn SAFFRON_CITY,                9, 30
	spawn CELADON_CITY,               33, 10
	spawn FUCHSIA_CITY,               19, 28
	spawn CINNABAR_ISLAND,            11, 16
	spawn INDIGO_PLATEAU,              9,  6

	spawn NEW_BARK_TOWN,              15,  6
	spawn CHERRYGROVE_CITY,           29,  4
	spawn VIOLET_CITY,                31, 30
	spawn ROUTE_32,                   11, 74
	spawn AZALEA_TOWN,                15, 10
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             18, 28
	spawn LAKE_OF_RAGE,               21, 29
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2
	spawn N_A,                        -1, -1

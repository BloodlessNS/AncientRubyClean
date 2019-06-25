treemon_map: macro
	map_id \1
	db  \2 ; treemon set
endm

TreeMonMaps:
	treemon_map ROUTE_26, 4
	treemon_map ROUTE_27, 4
	treemon_map ROUTE_28, 1
	treemon_map ROUTE_29, 3
	treemon_map ROUTE_30, 3
	treemon_map ROUTE_31, 3
	treemon_map ROUTE_32, 4
	treemon_map ROUTE_33, 2
	treemon_map ROUTE_34, 3
	treemon_map ROUTE_35, 3
	treemon_map ROUTE_40, 0
	treemon_map ROUTE_41, 0
	treemon_map NEW_BARK_TOWN, 0
	treemon_map CHERRYGROVE_CITY, 0
	treemon_map VIOLET_CITY, 0
	treemon_map AZALEA_TOWN, 2
	treemon_map CIANWOOD_CITY, 0
	treemon_map GOLDENROD_CITY, 0
	treemon_map LAKE_OF_RAGE, 5
	treemon_map SILVER_CAVE_OUTSIDE, 1
	treemon_map MURKY_SWAMP, 6
	treemon_map YELLOW_FOREST, 6
	treemon_map ROUTE_32_COAST, 4
	treemon_map ROUTE_34_COAST, 3
	treemon_map NOISY_FOREST, 3
	db -1

RockMonMaps:
	treemon_map ROUTE_19, 7
	treemon_map ROUTE_40, 7
	treemon_map CIANWOOD_CITY, 7
	treemon_map VERMILION_CITY, 7
	treemon_map RUINS_OF_ALPH_OUTSIDE, 7
	treemon_map STORMY_BEACH, 7
	db -1

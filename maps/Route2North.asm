Route2North_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 6 ; warp events
;	warp_event 15, 19, ROUTE_2_NUGGET_SPEECH_HOUSE, 1
;	warp_event 16, 35, ROUTE_2_GATE, 1
;	warp_event 17, 35, ROUTE_2_GATE, 2
;	warp_event 12,  9, DIGLETTS_CAVE, 3
;	warp_event  1, 11, VIRIDIAN_FOREST_PEWTER_GATE, 3
;	warp_event  2, 11, VIRIDIAN_FOREST_PEWTER_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 11, SIGNPOST_JUMPTEXT, UnknownText_0x1ac49f

	db 6 ; object events
	object_event  6,  6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacEd, -1
	itemball_event 19,  4, CARBOS, 1, EVENT_ROUTE_2_CARBOS
	fruittree_event  7, 13, FRUITTREE_ROUTE_2, LUM_BERRY
	cuttree_event  5, 10, EVENT_ROUTE_2_CUT_TREE_1
	cuttree_event 15, 22, EVENT_ROUTE_2_CUT_TREE_2
	object_event 12, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, Route2NorthCooltrainermText, EVENT_VERMILION_CITY_SNORLAX

GenericTrainerBug_maniacEd:
	generictrainer BUG_MANIAC, ED, EVENT_BEAT_BUG_MANIAC_ED, Bug_maniacEdSeenText, Bug_maniacEdBeatenText

	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

Bug_maniacEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

Bug_maniacEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

Route2NorthCooltrainermText:
	text "Diglett's Cave is"
	line "just a dead end."

	para "The Vermilion City"
	line "exit is blocked"

	para "by a sleeping"
	line "Snorlax."
	done

UnknownText_0x1ac49f:
	text "Diglett's Cave"
	done

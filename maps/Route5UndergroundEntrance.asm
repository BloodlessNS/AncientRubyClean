Route5UndergroundEntrance_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x18b558, -1

UnknownText_0x18b558:
	text "Many cities in"
	line "Johto have long"

	para "histories. I'd"
	line "love to visit!"
	done

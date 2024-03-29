IlexForestAzaleaGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
;	warp_event  0,  4, ILEX_FOREST, 2
;	warp_event  0,  5, ILEX_FOREST, 3
;	warp_event  9,  4, AZALEA_TOWN, 7
;	warp_event  9,  5, AZALEA_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x62c80, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x62cb0, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ProfOaksAide1Script, -1

ProfOaksAide1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_NEST_BALLS_FROM_PROF_OAKS_AIDE
	iftrue .Explain
	writetext ProfOaksAide1HiText
	waitbutton
	count_seen_caught
	checkcode VAR_DEXCAUGHT
	ifgreater 14, .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide1UhOhText

.HereYouGo
	writetext ProfOaksAide1HereYouGoText
	waitbutton
	giveitem NEST_BALL, 5
	waitsfx
	iffalse .NoRoom
	writetext ProfOaksAide1NestBallText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_NEST_BALLS_FROM_PROF_OAKS_AIDE
.Explain
	jumpopenedtext ProfOaksAide1ExplainText

.NoRoom
	jumpopenedtext ProfOaksAide1NoRoomText

UnknownText_0x62c80:
	text "Ilex Forest is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

UnknownText_0x62cb0:
	text "The Forest is"
	line "watched over by"
	cont "its protector."

	para "Stay out of"
	line "mischief!"
	done

ProfOaksAide1HiText:
	text "Hello there! I'm"
	line "Prof.Oak's aide."

	para "If you caught 15"
	line "kinds of #mon,"

	para "I'm supposed to"
	line "give you an item."

	para "So, <PLAYER>,"
	line "have you caught"

	para "at least 15 kinds"
	line "of #mon?"
	done

ProfOaksAide1UhOhText:
	text "Let's see…"
	line "Uh-oh! You've only"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Come back and see"
	line "me when you catch"
	cont "15 kinds."
	done

ProfOaksAide1HereYouGoText:
	text "Let's see…"
	line "Great job! You've"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Congratulations!"
	line "Here you go!"
	done

ProfOaksAide1NoRoomText:
	text "Oh! I see you"
	line "don't have any"
	cont "room for this."
	done

ProfOaksAide1NestBallText:
	text "<PLAYER> received"
	line "5 Nest Balls."
	done

ProfOaksAide1ExplainText:
	text "Those Nest Balls"
	line "are like Apricorn"

	para "Balls, but they're"
	line "made by Silph Co."
	cont "in Kanto."

	para "They work best"
	line "on low-leveled"
	cont "#mon."

	para "Use them to com-"
	line "plete the #dex!"
	done

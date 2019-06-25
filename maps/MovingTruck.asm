MovingTruck_MapScriptHeader:
	db 2 ; scene scripts
	scene_script MovingTruckTrigger0
	scene_script MovingTruckTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	
.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

MovingTruckTrigger0:
	priorityjump TruckMoving
	setscene $1
	end

MovingTruckTrigger1:
	end
	
TruckMoving:
	playsound SFX_TRUCK
	earthquake 60
	waitsfx
	pause 20
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $07
	changeblock 4, 0, $08
	reloadmappart
	waitsfx
	end

	db 2 ; warp events
	warp_event  5, 1, KRISS_HOUSE_1F, 3
	warp_event  5, 2, KRISS_HOUSE_1F, 3

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events


const_value set 2

LavRadioTower2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

LavRadioTower2F_MapEventHeader:
.Warps:
	db 2
	warp_def $0, $d, 3, LAV_RADIO_TOWER_1F
	warp_def $0, $2, 1, LAV_RADIO_TOWER_3F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0

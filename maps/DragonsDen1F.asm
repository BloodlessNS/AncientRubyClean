DragonsDen1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

DragonsDen1F_MapEventHeader:
.Warps:
	db 4
	warp_def $39, $f, 8, BLACKTHORN_CITY
	warp_def $37, $f, 4, DRAGONS_DEN_1F
	warp_def $39, $5, 1, DRAGONS_DEN_B1F
	warp_def $37, $5, 2, DRAGONS_DEN_1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0

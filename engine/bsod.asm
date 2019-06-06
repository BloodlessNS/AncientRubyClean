BSOD:
	ld a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, .Palette
	ld de, wBGPals
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ld [rSVBK], a

	ld a, 1
	ld [hCGBPalUpdate], a

	xor a
	ld [hBGMapHalf], a
	call DelayFrame

	ld de, FontNormal
	ld hl, VTiles1
	lb bc, BANK(FontNormal), 111
	call Get1bpp

	ld de, .Message
	hlcoord 1, 1
	call PlaceString

	call ApplyTilemapInVBlank

.infiniteloop
	call DelayFrame
	jr .infiniteloop
; 4eac5

.Palette:
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

.Message: ; 4eb38
IF DEF(SAPPHIRE)
	db   "      Pokémon"
	next "  Ancient Sapphire"
	next "       ERROR"
	next "------------------"
	next "Please report this"
	next "crash to the deve-"
	next "loper.@"
else
	db   "      Pokémon"
	next "    Ancient Ruby"
	next "       ERROR"
	next "------------------"
	next "Please report this"
	next "crash to the deve-"
	next "loper.@"
endc
; 4eb76

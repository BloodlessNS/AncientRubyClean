_TitleScreen: ; 10ed67

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimerLo
	ld [hl], a  ; wTitleScreenTimerHi

; Turn LCD off
	call DisableLCD


; VRAM bank 1
	ld a, 1
	ld [rVBK], a


; Decompress Legend gfx
if DEF(SAPPHIRE)
	ld hl, TitleKyogreGFX
	ld de, VTiles1
	call Decompress
else
	ld hl, TitleGroudonGFX
	ld de, VTiles1
	call Decompress
endc


; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, SCREEN_WIDTH * BG_MAP_WIDTH
	xor a
	call ByteFill


; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, VBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 1
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 3
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 4
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 6
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill


; 'CRYSTAL VERSION'
	hlbgcoord 5, 7
	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	call ByteFill

; Groudon gfx
	hlbgcoord 0, 8
	ld bc, 10 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 8
	call ByteFill


; Back to VRAM bank 0
	xor a
	ld [rVBK], a


; Decompress logo
if DEF(SAPPHIRE)
	ld hl, TitleLogoSapphireGFX
	ld de, VTiles1
	call Decompress
else
	ld hl, TitleLogoGFX
	ld de, VTiles1
	call Decompress
endc

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 1
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic
	
; Draw Groudon
	hlcoord 0, 8
	lb bc, 10, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 4, 0, VBGMap1
	lb bc, 1, 13
	lb de, $0c, 0
	call DrawTitleGraphic

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, wUnknBGPals
	ld bc, 16 palettes
	rst CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals
	ld bc, 16 palettes
	rst CopyBytes

; Restore WRAM bank
	pop af
	ld [rSVBK], a


; LY/SCX trickery starts here

	ld a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ld [rSVBK], a

; Make sure the LYOverrides buffer is empty
	ld hl, wLYOverrides
	xor a
	ld bc, wLYOverridesEnd - wLYOverrides
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, rSCX - rJOYP
	ld [hLCDCPointer], a

	pop af
	ld [rSVBK], a


; Reset audio
	call ChannelsOff
	call EnableLCD

	ld a, [rLCDC]
	set 2, a ; 8x16 sprites
	ld [rLCDC], a

	ld a, +0
	ld [hSCX], a
	ld a, 8
	ld [hSCY], a
	ld a, 7
	ld [hWX], a
	ld a, -0
	ld [hWY], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a

	xor a
	ld [wUnknBGPals palette 0 + 2], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX

	ret
; 10eea7

GroudonFrameIterator: ; 10eea7
	ld hl, wUnknBGPals
	ld a, [hl]
	ld c, a
	inc [hl]
	
	; Only do this once every eight frames
	and %111
	ret nz	
GroudonFade:
	ld hl, wBGPals + 4
	ld a, [wUnknBGPals]
	and %11111111
	cp %01111111
	jr z, .okay
	jr c, .okay
	ld c, a
	ld a, %11111111
	sub c
.okay
	srl a
	srl a
	ld c, a
	ld b, $0
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals)
	ldh [rSVBK], a

	push hl
	ld hl, .BWFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret
	

.BWFade:
if DEF(SAPPHIRE)
hue = 0
rept 32
	RGB hue, 0, 0
hue = hue + 1
endr
else
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr
endc

DrawTitleGraphic: ; 10eeef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10ef06

InitializeBackground: ; 10ef06
	ld hl, wSprites
	lb de, -$22, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret
; 10ef1c

.InitColumn: ; 10ef1c
	lb bc, $40, $6
.loop2
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	add $8
	ld b, a
	ld a, e
	ld [hli], a
	inc e
	inc e
	ld a, $80
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
; 10ef32

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.2bpp.lz"
; 10fcee

TitleLogoSapphireGFX:
INCBIN "gfx/title/logosapphire.2bpp.lz"

TitleGroudonGFX:
INCBIN "gfx/title/groudon.2bpp.lz"

TitleKyogreGFX:
INCBIN "gfx/title/kyogre.2bpp.lz"

TitleScreenPalettes:
if DEF(SAPPHIRE)
; BG
	RGB 00, 00, 15
	RGB 19, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 15
	RGB 31, 31, 31
	RGB 15, 16, 31
	RGB 00, 00, 00

	RGB 00, 00, 15
	RGB 00, 00, 07
	RGB 31, 31, 31
	RGB 02, 03, 30

	RGB 00, 00, 15
	RGB 00, 00, 07
	RGB 31, 31, 18
	RGB 02, 03, 30

	RGB 00, 00, 15
	RGB 00, 00, 07
	RGB 29, 28, 12
	RGB 02, 03, 30

	RGB 00, 00, 15
	RGB 00, 00, 07
	RGB 28, 25, 06
	RGB 02, 03, 30

	RGB 00, 00, 15
	RGB 00, 00, 07
	RGB 26, 21, 00
	RGB 02, 03, 30

	RGB 00, 00, 15
	RGB 11, 11, 19
	RGB 31, 31, 31
	RGB 00, 00, 00

; OBJ
	RGB 00, 00, 00
	RGB 10, 00, 15
	RGB 17, 05, 22
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
else
; BG
	RGB 15, 00, 00
	RGB 19, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 15, 00, 00
	RGB 31, 31, 31
	RGB 15, 16, 31
	RGB 00, 00, 00

	RGB 15, 00, 00
	RGB 07, 00, 00
	RGB 31, 31, 31
	RGB 02, 03, 30

	RGB 15, 00, 00
	RGB 07, 00, 00
	RGB 31, 31, 18
	RGB 02, 03, 30

	RGB 15, 00, 00
	RGB 07, 00, 00
	RGB 29, 28, 12
	RGB 02, 03, 30

	RGB 15, 00, 00
	RGB 07, 00, 00
	RGB 28, 25, 06
	RGB 02, 03, 30

	RGB 15, 00, 00
	RGB 07, 00, 00
	RGB 26, 21, 00
	RGB 02, 03, 30

	RGB 15, 00, 00
	RGB 11, 11, 19
	RGB 31, 31, 31
	RGB 00, 00, 00

; OBJ
	RGB 00, 00, 00
	RGB 10, 00, 15
	RGB 17, 05, 22
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endc

PrintMonTypes: ; 5090d
; Print one or both types of [wCurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
	pop hl

	; PrintMonTypes is only called for the stats screen,
	; so assume that the full data is in wTempMon
	; Armored Mewtwo is Psychic/Steel
	ld a, [wTempMonSpecies]
	cp MEWTWO
	jr nz, .not_armored_mewtwo
	ld a, [wTempMonItem]
	cp ARMOR_SUIT
	jr nz, .not_armored_mewtwo
	ld a, STEEL
	ld [wBaseType2], a
.not_armored_mewtwo

	push hl
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	ret z

	ld bc, SCREEN_WIDTH
	add hl, bc

.Print:
	ld b, a

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString
; 50964


GetTypeName: ; 50964
; Copy the name of type [wNamedObjectIndexBuffer] to StringBuffer1.

	ld a, [wNamedObjectIndexBuffer]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, 13
	rst CopyBytes
	ret
; 5097b


TypeNames: ; 5097b
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bug
	dw Ghost
	dw Steel
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	dw Fairy
	dw UnknownType

Normal:      db "Normal@"
Fighting:    db "Fighting@"
Flying:      db "Flying@"
Poison:      db "Poison@"
Ground:      db "Ground@"
Rock:        db "Rock@"
Bug:         db "Bug@"
Ghost:       db "Ghost@"
Steel:       db "Steel@"
Fire:        db "Fire@"
Water:       db "Water@"
Grass:       db "Grass@"
Electric:    db "Electric@"
Psychic:     db "Psychic@"
Ice:         db "Ice@"
Dragon:      db "Dragon@"
Dark:        db "Dark@"
Fairy:       db "Fairy@"
UnknownType: db "???@"

; 50a28

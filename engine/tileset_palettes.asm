LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

BlindingFlashPalette: ; 49418
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
; 49420

LoadSpecialMapPalette: ; 494ac
	GLOBAL GenericMart_BlockData
	call GetMapHeaderTimeOfDayNybble
	cp PALETTE_DARK
	jr nz, .not_dark
	ld a, [wStatusFlags]
	bit 2, a ; Flash
	jp z, .do_nothing
.not_dark

	ld a, [wTileset]

	ld hl, PokeComPalette
	cp TILESET_POKECOM_CENTER
	jp z, .load_eight_bg_palettes
	ld hl, BattleTowerPalette
	cp TILESET_BATTLE_TOWER_INSIDE
	jp z, .load_eight_bg_palettes
	ld hl, GatePalette
	cp TILESET_GATE
	jp z, .load_eight_bg_palettes
	ld hl, HotelPalette
	cp TILESET_HOTEL
	jp z, .load_eight_bg_palettes
	ld hl, QuietCavePalette
	cp TILESET_QUIET_CAVE
	jp z, .load_eight_bg_palettes
	ld hl, RuinsPalette
	cp TILESET_RUINS_OF_ALPH
	jp z, .load_eight_bg_palettes
	cp TILESET_ALPH_WORD_ROOM
	jp z, .load_eight_bg_palettes

	ld hl, SafariZonePalette
	cp TILESET_SAFARI_ZONE
	jp z, .load_eight_time_of_day_bg_palettes
	ld hl, FarawayIslandPalette
	cp TILESET_FARAWAY_ISLAND
	jp z, .load_eight_time_of_day_bg_palettes
	ld hl, ShamoutiIslandPalette
	cp TILESET_SHAMOUTI_ISLAND
	jp z, .load_eight_time_of_day_bg_palettes
	ld hl, ValenciaIslandPalette
	cp TILESET_VALENCIA_ISLAND
	jp z, .load_eight_time_of_day_bg_palettes

	cp TILESET_POKECENTER
	jp z, .pokecenter
	cp TILESET_ICE_PATH
	jp z, .ice_path_or_hall_of_fame
	cp TILESET_RADIO_TOWER
	jp z, .radio_towers
	cp TILESET_GYM
	jp z, .maybe_elite_room
	cp TILESET_MAGNET_TRAIN
	jp z, .maybe_viridian_gym
	cp TILESET_CHAMPIONS_ROOM
	jp z, .maybe_lances_room
	cp TILESET_PORT
	jp z, .maybe_cerulean_gym
	cp TILESET_GAME_CORNER
	jp z, .maybe_saffron_gym
	cp TILESET_UNDERGROUND
	jp z, .maybe_fuchsia_gym
	cp TILESET_LAB
	jp z, .maybe_lab_or_dragon_shrine
	cp TILESET_TUNNEL
	jp z, .maybe_lightning_island_or_magnet_tunnel
	cp TILESET_SPROUT_TOWER
	jp z, .maybe_mystri_or_tower
	cp TILESET_POKEMON_MANSION
	jp z, .maybe_cinnabar_lab
	cp TILESET_MUSEUM
	jp z, .maybe_goldenrod_museum
	cp TILESET_CELADON_MANSION
	jp z, .maybe_celadon_mansion_roof
	cp TILESET_MART
	jp z, .maybe_goldenrod_dept_store_roof
	cp TILESET_HOME_DECOR_STORE
	jp z, .maybe_celadon_home_decor_store_4f
	cp TILESET_JOHTO_TRADITIONAL
	jp z, .maybe_special_johto_1
	cp TILESET_FOREST
	jp z, .maybe_special_forest
	cp TILESET_CAVE
	jp z, .maybe_special_cave

	call GetOvercastIndex
	and a
	jp z, .maybe_sinjoh_ruins
	ld hl, OvercastBGPalette
	jp .load_eight_time_of_day_bg_palettes

.do_nothing
	and a
	ret
; 494f2

.pokecenter
	ld a, [wMapGroup]
	cp GROUP_POKECENTER_2F
	jr nz, .ok
	ld a, [wMapNumber]
	cp MAP_POKECENTER_2F
	jr nz, .ok
	ld a, [wBackupMapGroup]
	cp GROUP_SHAMOUTI_POKECENTER_1F
	jr nz, .normal_pokecenter
	ld a, [wBackupMapNumber]
	cp MAP_SHAMOUTI_POKECENTER_1F
	jr nz, .normal_pokecenter
	jr .shamouti_pokecenter
.ok
	ld a, [wMapGroup]
	cp GROUP_SHAMOUTI_POKECENTER_1F
	jr nz, .normal_pokecenter
	ld a, [wMapNumber]
	cp MAP_SHAMOUTI_POKECENTER_1F
	jr nz, .normal_pokecenter
.shamouti_pokecenter
	ld hl, ShamoutiPokeCenterPalette
	jp .load_eight_bg_palettes

.normal_pokecenter
	ld hl, PokeCenterPalette
.load_eight_bg_palettes:
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM

; replace green with Poké Mart blue for maps using Mart.ablk
	ld a, [wMapBlockDataBank]
	cp BANK(GenericMart_BlockData)
	jr nz, .not_mart
	ld a, [wMapBlockDataPointer]
	cp GenericMart_BlockData % $100
	jr nz, .not_mart
	ld a, [wMapBlockDataPointer + 1]
	cp GenericMart_BlockData / $100
	jr nz, .not_mart
	ld hl, MartBluePalette
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_GREEN
	ld bc, 1 palettes
	call FarCopyWRAM
.not_mart

	scf
	ret

.ice_path_or_hall_of_fame
	ld hl, LancesRoomPalette
	ld a, [wPermission] ; permission
	and 7
	cp INDOOR ; Hall of Fame
	jp z, .load_eight_bg_palettes
	ld hl, IcePathPalette
	jp .load_eight_bg_palettes

.radio_towers
	ld hl, RadioTowerPalette
	ld hl, HauntedRadioTowerPalette
	ld a, [wMapNumber]
	cp MAP_HAUNTED_RADIO_TOWER_2F
	jp z, .load_eight_bg_palettes
	cp MAP_HAUNTED_RADIO_TOWER_3F
	jp z, .load_eight_bg_palettes
	ld hl, HauntedPokemonTowerPalette
	cp MAP_HAUNTED_RADIO_TOWER_4F
	jp z, .load_eight_bg_palettes
	cp MAP_HAUNTED_RADIO_TOWER_5F
	jp z, .load_eight_bg_palettes
	cp MAP_HAUNTED_RADIO_TOWER_6F
	jp z, .load_eight_bg_palettes
	ld hl, RadioTowerPalette
	jp .load_eight_bg_palettes

.maybe_elite_room
	ld a, [wMapGroup]
	cp GROUP_WILLS_ROOM ; same as GROUP_KOGAS_ROOM, GROUP_BRUNOS_ROOM, and GROUP_KARENS_ROOM
	jp nz, .do_nothing
	ld a, [wMapNumber]
	ld hl, WillsRoomPalette
	cp MAP_WILLS_ROOM
	jp z, .load_eight_bg_palettes
	ld hl, KogasRoomPalette
	cp MAP_KOGAS_ROOM
	jp z, .load_eight_bg_palettes
	ld hl, BrunosRoomPalette
	cp MAP_BRUNOS_ROOM
	jp z, .load_eight_bg_palettes
	ld hl, KarensRoomPalette
	cp MAP_KARENS_ROOM
	jp z, .load_eight_bg_palettes
	jp .do_nothing

.maybe_lances_room
	ld a, [wMapGroup]
	cp GROUP_LANCES_ROOM
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_LANCES_ROOM
	jp nz, .do_nothing
	ld hl, LancesRoomPalette
	jp .load_eight_bg_palettes

.maybe_cerulean_gym
	ld a, [wMapGroup]
	cp GROUP_CERULEAN_GYM
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_CERULEAN_GYM
	jp nz, .do_nothing
	ld hl, CeruleanGymPalette
	jp .load_eight_bg_palettes

.maybe_saffron_gym
	ld hl, GameCornerPalette
	ld a, [wMapGroup]
	cp GROUP_SAFFRON_GYM
	jp nz, .load_eight_bg_palettes
	ld a, [wMapNumber]
	cp MAP_SAFFRON_GYM
	jp nz, .load_eight_bg_palettes
	ld hl, SaffronGymPalette
	jp .load_eight_bg_palettes

.maybe_fuchsia_gym
	ld a, [wMapGroup]
	cp GROUP_FUCHSIA_GYM
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_FUCHSIA_GYM
	jp nz, .do_nothing
	ld hl, FuchsiaGymPalette
	jp .load_eight_bg_palettes

.maybe_lab_or_dragon_shrine
	ld a, [wMapGroup]
	cp GROUP_OAKS_LAB
	jp nz, .not_oaks_lab
	ld a, [wMapNumber]
	cp MAP_OAKS_LAB
	jp nz, .not_oaks_lab
	ld hl, OaksLabPalette
	jp .load_eight_bg_palettes

.not_oaks_lab
	ld a, [wMapGroup]
	cp GROUP_IVYS_LAB
	jp nz, .not_ivys_lab
	ld a, [wMapNumber]
	cp MAP_IVYS_LAB
	jp nz, .not_ivys_lab
	ld hl, IvysLabPalette
	jp .load_eight_bg_palettes

.not_ivys_lab
	ld hl, LightningIslandPalette
	jp .load_eight_bg_palettes

.maybe_lightning_island_or_magnet_tunnel
	ld a, [wMapGroup]
	cp GROUP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld a, [wMapNumber]
	cp MAP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld hl, LightningIslandPalette
	jp .load_eight_bg_palettes

.not_lightning_island
	ld a, [wMapGroup]
	cp GROUP_MAGNET_TUNNEL_INSIDE
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_MAGNET_TUNNEL_INSIDE
	jp nz, .do_nothing
	ld hl, MagnetTunnelPalette
	jp .load_eight_bg_palettes

.maybe_viridian_gym
	ld a, [wMapGroup]
	cp GROUP_VIRIDIAN_GYM
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_VIRIDIAN_GYM
	jp nz, .do_nothing
	ld hl, ViridianGymPalette
	jp .load_eight_bg_palettes

.maybe_mystri_or_tower
	ld a, [wMapGroup]
	cp GROUP_MYSTRI_STAGE
	jr nz, .maybe_embedded_tower
	ld a, [wMapNumber]
	cp MAP_MYSTRI_STAGE
	jr nz, .maybe_embedded_tower
	ld hl, MystriStagePalette
	jp .load_eight_bg_palettes

.maybe_embedded_tower
	ld a, [wMapGroup]
	cp GROUP_EMBEDDED_TOWER
	jr nz, .maybe_tin_tower_roof
	ld a, [wMapNumber]
	cp MAP_EMBEDDED_TOWER
	jr nz, .maybe_tin_tower_roof
	ld hl, EmbeddedTowerPalette
	jp .load_eight_bg_palettes

.maybe_tin_tower_roof
	jp nz, .do_nothing
	ld hl, TinTowerRoofPalette
	jp .load_eight_time_of_day_bg_palettes

.maybe_cinnabar_lab
	ld a, [wMapGroup]
	cp GROUP_CINNABAR_LAB
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_CINNABAR_LAB
	jp nz, .do_nothing
	ld hl, CinnabarLabPalette
	jp .load_eight_bg_palettes

.maybe_goldenrod_museum
	ld a, [wMapGroup]
	cp GROUP_GOLDENROD_MUSEUM_1F
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_GOLDENROD_MUSEUM_1F
	ld hl, GoldenrodMuseumPalette
	jp z, .load_eight_bg_palettes
	cp MAP_GOLDENROD_MUSEUM_2F
	jp z, .load_eight_bg_palettes
	jp .do_nothing

.maybe_celadon_mansion_roof
	ld a, [wMapGroup]
	cp GROUP_CELADON_MANSION_ROOF
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_CELADON_MANSION_ROOF
	jp nz, .do_nothing
	ld hl, CeladonMansionRoofPalette
	jp .load_eight_time_of_day_bg_palettes

.maybe_goldenrod_dept_store_roof
	ld hl, MartPalette
	ld a, [wMapGroup]
	cp GROUP_GOLDENROD_DEPT_STORE_ROOF
	jp nz, .load_eight_bg_palettes
	ld a, [wMapNumber]
	cp MAP_GOLDENROD_DEPT_STORE_ROOF
	jp nz, .load_eight_bg_palettes
	ld hl, GoldenrodDeptStoreRoofPalette
	jp .load_eight_time_of_day_bg_palettes

.maybe_celadon_home_decor_store_4f
	ld a, [wMapGroup]
	cp GROUP_CELADON_HOME_DECOR_STORE_4F
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_CELADON_HOME_DECOR_STORE_4F
	jp nz, .do_nothing
	ld hl, CeladonHomeDecorStore4FPalette
	jp .load_eight_bg_palettes

.maybe_sinjoh_ruins
	ld a, [wMapGroup]
	cp GROUP_SINJOH_RUINS
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_SINJOH_RUINS
	jp nz, .do_nothing
	ld hl, SinjohRuinsPalette
	jp .load_eight_time_of_day_bg_palettes

.maybe_special_johto_1
	ld hl, VioletEcruteakPalette
	ld a, [wMapGroup]
	cp GROUP_VIOLET_CITY
	jr nz, .not_violet_city
	ld a, [wMapNumber]
	cp MAP_VIOLET_CITY
	jp z, .load_eight_time_of_day_bg_palettes
.not_violet_city
	jp z, .load_eight_time_of_day_bg_palettes
.not_ecruteak_city
	ld hl, BellchimeTrailPalette
	ld a, [wMapGroup]
	cp GROUP_BELLCHIME_TRAIL
	jr nz, .not_bellchime_trail
	ld a, [wMapNumber]
	cp MAP_BELLCHIME_TRAIL
	jp z, .load_eight_time_of_day_bg_palettes
.not_bellchime_trail
	jp .do_nothing

.maybe_special_forest
	ld a, [wMapGroup]
	cp GROUP_YELLOW_FOREST
	jr nz, .not_yellow_forest
	ld a, [wMapNumber]
	cp MAP_YELLOW_FOREST
	jr nz, .not_yellow_forest
	ld hl, YellowForestPalette
	jp .load_eight_time_of_day_bg_palettes

.not_yellow_forest
	ld a, [wMapGroup]
	cp GROUP_MURKY_SWAMP
	jr nz, .not_murky_swamp
	ld a, [wMapNumber]
	cp MAP_MURKY_SWAMP
	jr nz, .not_murky_swamp
	ld hl, MurkySwampPalette
	jp .load_eight_bg_palettes

.not_murky_swamp
	ld a, [wMapGroup]
	cp GROUP_HIDDEN_TREE_GROTTO
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_HIDDEN_TREE_GROTTO
	jp nz, .do_nothing
	ld hl, HiddenTreeGrottoPalette
	jp .load_eight_bg_palettes

.maybe_special_cave
	ld a, [wMapGroup]
	cp GROUP_HIDDEN_CAVE_GROTTO
	jr nz, .not_hidden_cave_grotto
	ld a, [wMapNumber]
	cp MAP_HIDDEN_CAVE_GROTTO
	jr nz, .not_hidden_cave_grotto
	ld hl, HiddenCaveGrottoPalette
	jp .load_eight_bg_palettes

.not_hidden_cave_grotto
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld hl, DimCavePalette
	cp DIM_CAVE
	jp z, .load_eight_bg_palettes
	ld hl, CinnabarVolcanoPalette
	cp CINNABAR_VOLCANO
	jp z, .load_eight_bg_palettes
	ld hl, CeruleanCavePalette
	cp CERULEAN_CAVE
	jp z, .load_eight_bg_palettes
	ld hl, SilverCavePalette
	cp SILVER_CAVE
	jp z, .load_eight_bg_palettes
	ld hl, DarkCavePalette
	cp MT_MORTAR
	jp z, .load_eight_bg_palettes
	cp DARK_CAVE
	jp z, .load_eight_bg_palettes
	ld hl, WhirlIslandsPalette
	cp WHIRL_ISLANDS
	jp z, .load_eight_bg_palettes
	ld hl, ScaryCavePalette
	cp SCARY_CAVE
	jp z, .load_eight_bg_palettes
	cp NAVEL_ROCK
	jp nz, .do_nothing
	ld hl, NavelRockPalette
	ld a, [wMapGroup]
	cp GROUP_NAVEL_ROCK_ROOF
	jp nz, .load_eight_bg_palettes
	ld a, [wMapNumber]
	cp MAP_NAVEL_ROCK_ROOF
	jp nz, .load_eight_bg_palettes
.load_eight_time_of_day_bg_palettes:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

BattleTowerPalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

GatePalette:
INCLUDE "gfx/tilesets/gate.pal"

HotelPalette:
INCLUDE "gfx/tilesets/hotel.pal"

QuietCavePalette:
INCLUDE "gfx/tilesets/quiet_cave.pal"

RuinsPalette:
INCLUDE "gfx/tilesets/ruins_of_alph.pal"

SafariZonePalette:
INCLUDE "gfx/tilesets/safari_zone.pal"

PokeCenterPalette:
INCLUDE "gfx/tilesets/pokecenter.pal"

ShamoutiPokeCenterPalette:
INCLUDE "gfx/tilesets/shamouti_pokecenter.pal"

FarawayIslandPalette:
INCLUDE "gfx/tilesets/faraway_island.pal"

ShamoutiIslandPalette:
INCLUDE "gfx/tilesets/shamouti_island.pal"

ValenciaIslandPalette:
INCLUDE "gfx/tilesets/valencia_island.pal"

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"


HauntedRadioTowerPalette:
INCLUDE "gfx/tilesets/haunted_radio_tower.pal"

HauntedPokemonTowerPalette:
INCLUDE "gfx/tilesets/haunted_pokemon_tower.pal"

WillsRoomPalette:
INCLUDE "maps/WillsRoom.pal"

KogasRoomPalette:
INCLUDE "maps/KogasRoom.pal"

BrunosRoomPalette:
INCLUDE "maps/BrunosRoom.pal"

KarensRoomPalette:
INCLUDE "maps/KarensRoom.pal"

LancesRoomPalette:
INCLUDE "maps/LancesRoom.pal"

CeruleanGymPalette:
INCLUDE "maps/CeruleanGym.pal"

SaffronGymPalette:
INCLUDE "maps/SaffronGym.pal"

ViridianGymPalette:
INCLUDE "maps/ViridianGym.pal"

FuchsiaGymPalette:
INCLUDE "maps/FuchsiaGym.pal"

GameCornerPalette:
INCLUDE "gfx/tilesets/game_corner.pal"

OaksLabPalette:
INCLUDE "maps/OaksLab.pal"

IvysLabPalette:
INCLUDE "maps/IvysLab.pal"

LightningIslandPalette:
INCLUDE "maps/LightningIsland.pal"

MagnetTunnelPalette:
INCLUDE "maps/MagnetTunnelInside.pal"

MystriStagePalette:
INCLUDE "maps/MystriStage.pal"

EmbeddedTowerPalette:
INCLUDE "maps/EmbeddedTower.pal"

TinTowerRoofPalette:
INCLUDE "maps/TinTowerRoof.pal"

CinnabarLabPalette:
INCLUDE "maps/CinnabarLab.pal"

GoldenrodMuseumPalette:
INCLUDE "gfx/tilesets/goldenrod_museum.pal"

CeladonMansionRoofPalette:
INCLUDE "maps/CeladonMansionRoof.pal"

MartPalette:
INCLUDE "gfx/tilesets/mart.pal"

GoldenrodDeptStoreRoofPalette:
INCLUDE "maps/GoldenrodDeptStoreRoof.pal"

CeladonHomeDecorStore4FPalette:
INCLUDE "maps/CeladonHomeDecorStore4F.pal"

SinjohRuinsPalette:
INCLUDE "maps/SinjohRuins.pal"

VioletEcruteakPalette:
INCLUDE "gfx/tilesets/violet_ecruteak.pal"

BellchimeTrailPalette:
INCLUDE "maps/BellchimeTrail.pal"

YellowForestPalette:
INCLUDE "maps/YellowForest.pal"

MurkySwampPalette:
INCLUDE "maps/MurkySwamp.pal"

HiddenTreeGrottoPalette:
INCLUDE "maps/HiddenTreeGrotto.pal"

HiddenCaveGrottoPalette:
INCLUDE "maps/HiddenCaveGrotto.pal"

DimCavePalette:
INCLUDE "gfx/tilesets/dim_cave.pal"

WhirlIslandsPalette:
INCLUDE "gfx/tilesets/whirl_islands.pal"

ScaryCavePalette:
INCLUDE "gfx/tilesets/scary_cave.pal"

CinnabarVolcanoPalette:
INCLUDE "gfx/tilesets/cinnabar_volcano.pal"

CeruleanCavePalette:
INCLUDE "gfx/tilesets/cerulean_cave.pal"

SilverCavePalette:
INCLUDE "gfx/tilesets/silver_cave.pal"

DarkCavePalette:
INCLUDE "gfx/tilesets/dark_cave.pal"

NavelRockPalette:
INCLUDE "gfx/tilesets/navel_rock.pal"

OvercastBGPalette:
INCLUDE "gfx/tilesets/bg_tiles_overcast.pal"

OvercastOBPalette:
INCLUDE "gfx/overworld/npc_sprites_overcast.pal"

MartBluePalette:
	RGB 20, 27, 28
	RGB 06, 22, 25
	RGB 04, 17, 19
	RGB 07, 07, 07

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ld a, $5
	ld de, wUnknBGPals palette 2
	ld hl, LinkTradePalette
	ld bc, 6 palettes
	call FarCopyWRAM
	farjp ApplyPals
; 49826

LinkTradePalette:
INCLUDE "gfx/tilesets/link_trade.pal"

LoadSpecialMapOBPalette:
	call GetOvercastIndex
	and a
	jr z, .not_overcast
	ld hl, OvercastOBPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknOBPals
	ld bc, 8 palettes
	jp FarCopyWRAM

.not_overcast
	ld a, [wTileset]
	cp TILESET_SHAMOUTI_ISLAND
	jr z, .load_bg_tree_palette
	cp TILESET_SAFARI_ZONE
	jr nz, .not_shamouti_or_safari
.load_bg_tree_palette
	ld hl, wUnknBGPals palette PAL_BG_GREEN
.load_tree_palette:
	ld de, wUnknOBPals palette PAL_OW_TREE
.load_single_palette:
	ld bc, 1 palettes
.load_ob_palettes:
	ld a, $5
	jp FarCopyWRAM

.not_shamouti_or_safari:
	cp TILESET_FARAWAY_ISLAND
	jr nz, .not_faraway
	ld hl, wUnknBGPals palette 1 ; grass
	jr .load_tree_palette

.not_faraway:
	ld a, [wMapGroup]
	cp GROUP_MURKY_SWAMP ; GROUP_ROUTE_34
	jr nz, .not_murky_swamp_or_route_34
	ld a, [wMapNumber]
	cp MAP_MURKY_SWAMP
	jr z, .load_bg_tree_palette
	cp MAP_ROUTE_34
	jp z, .load_gray_party_mon_palette

.not_murky_swamp_or_route_34:
	ld a, [wMapGroup]
	cp GROUP_VERMILION_GYM
	jr nz, .not_vermilion_gym
	ld a, [wMapNumber]
	cp MAP_VERMILION_GYM
	jr nz, .not_vermilion_gym
	ld hl, VermilionGymOBPalette_Tree
	jr .load_tree_palette

.not_vermilion_gym:
	ld a, [wMapGroup]
	cp GROUP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld a, [wMapNumber]
	cp MAP_LIGHTNING_ISLAND
	jr nz, .not_lightning_island
	ld hl, LightningIslandOBPalette_Tree
	jr .load_tree_palette

.not_lightning_island:
	ld hl, RockTunnelOBPalette_Tree
	jp .load_tree_palette

.not_lyras_house_2f_or_kriss_house_2f:
	ld a, [wMapGroup]
	cp GROUP_GOLDENROD_HARBOR
	jr nz, .not_goldenrod_harbor
	ld a, [wMapNumber]
	cp MAP_GOLDENROD_HARBOR
	jr nz, .not_goldenrod_harbor
	ld hl, GoldenrodHarborOBPalette_Purple
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld de, wUnknOBPals palette PAL_OW_PURPLE
	jp .load_single_palette

.not_goldenrod_harbor:
	ld a, [wMapGroup]
	cp GROUP_GOLDENROD_POKECOM_CENTER_1F ; GROUP_GOLDENROD_POKECOM_CENTER_OFFICE, GROUP_GOLDENROD_MUSEUM_1F, GROUP_GOLDENROD_MUSEUM_2F
	jr nz, .not_goldenrod
	ld a, [wMapNumber]
	cp MAP_GOLDENROD_POKECOM_CENTER_1F
	jr nz, .not_pokecom_center_1f
	ld hl, PokecomCenter1FOBPalette_Rock
	jr .load_rock_palette
.not_pokecom_center_1f
	cp MAP_GOLDENROD_POKECOM_CENTER_OFFICE
	jr nz, .not_pokecom_center_office
	ld hl, PokecomCenterOfficeOBPalette_Purple
	ld de, wUnknOBPals palette PAL_OW_PURPLE
	jp .load_single_palette
.not_pokecom_center_office
	ld a, [wTileset]
	cp TILESET_MUSEUM
	jr nz, .not_goldenrod
	ld hl, GoldenrodMuseumOBPalettes_TreeRock
	ld de, wUnknOBPals palette PAL_OW_TREE
	ld bc, 2 palettes
	jp .load_ob_palettes

.not_goldenrod
	ld a, [wMapGroup]
	cp GROUP_MOUNT_MOON_SQUARE
	jr nz, .not_mount_moon_square
	ld a, [wMapNumber]
	cp MAP_MOUNT_MOON_SQUARE
	jr nz, .not_mount_moon_square
	ld hl, wUnknBGPals palette PAL_BG_GRAY
	jr .load_rock_palette

.not_mount_moon_square:
	ld a, [wMapGroup]
	cp GROUP_MAGNET_TUNNEL_INSIDE
	jr nz, .not_magnet_tunnel
	ld a, [wMapNumber]
	cp MAP_MAGNET_TUNNEL_INSIDE
	jr nz, .not_magnet_tunnel
	ld hl, wUnknBGPals palette PAL_BG_GRAY
	jr .load_rock_palette

.not_magnet_tunnel
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp CINNABAR_VOLCANO
	jr z, .load_bg_rock_palette
	cp DIM_CAVE
	jr z, .load_bg_rock_palette
	cp ICE_PATH
	jr z, .load_bg_rock_palette
	cp SEAFOAM_ISLANDS
	jr z, .load_bg_rock_palette
	cp WHIRL_ISLANDS
	ret z
.load_bg_rock_palette
	ld hl, wUnknBGPals palette PAL_BG_BROWN
.load_rock_palette
	ld de, wUnknOBPals palette PAL_OW_ROCK
	jp .load_single_palette

.get_timeofday_party_mon_palettes:
	ld hl, OverworldPartyMonPalettes
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 3 palettes
	rst AddNTimes
	ret

.load_gray_party_mon_palette:
	call .get_timeofday_party_mon_palettes
	ld de, wUnknOBPals palette PAL_OW_ROCK
	ld bc, 1 palettes
	ld a, $5
	jp FarCopyWRAM

.load_party_mon_palettes:
	call .get_timeofday_party_mon_palettes
	ld de, wUnknOBPals palette PAL_OW_SILVER
	ld bc, 3 palettes
	ld a, $5
	jp FarCopyWRAM

VermilionGymOBPalette_Tree:
	RGB 27, 31, 27
	RGB 31, 31, 30
	RGB 19, 24, 31
	RGB 05, 10, 27

LightningIslandOBPalette_Tree:
	RGB 19, 15, 10
	RGB 31, 31, 31
	RGB 31, 27, 01
	RGB 31, 16, 01

RockTunnelOBPalette_Tree:
	RGB 15, 14, 24
	RGB 31, 30, 31
	RGB 24, 18, 31
	RGB 12, 08, 18

LyrasHouse2FOBPalette_Rock:
	RGB 30, 28, 26
	RGB 30, 28, 02
	RGB 08, 14, 24
	RGB 07, 07, 07

GoldenrodHarborOBPalette_Purple:
; morn
	RGB 28, 31, 16
	RGB 28, 31, 16
	RGB 18, 19, 31
	RGB 07, 07, 07
; day
	RGB 27, 31, 27
	RGB 27, 31, 27
	RGB 18, 19, 31
	RGB 07, 07, 07
; nite
	RGB 15, 14, 24
	RGB 15, 14, 24
	RGB 10, 09, 20
	RGB 00, 00, 00

PokecomCenter1FOBPalette_Rock:
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 11, 13, 31
	RGB 07, 07, 07

PokecomCenterOfficeOBPalette_Purple:
	RGB 28, 31, 16
	RGB 31, 22, 10
	RGB 07, 17, 21
	RGB 00, 00, 00

GoldenrodMuseumOBPalettes_TreeRock:
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 28, 28
	RGB 22, 27, 26
	RGB 09, 10, 10

OverworldPartyMonPalettes:
; morn
	RGB 28,31,16, 31,22,10, 13,13,13, 00,00,00 ; gray
	RGB 28,31,16, 31,22,10, 31,10,11, 00,00,00 ; pink
	RGB 28,31,16, 31,22,10, 03,23,21, 00,00,00 ; teal
; day
	RGB 27,31,27, 31,19,10, 13,13,13, 00,00,00 ; gray
	RGB 27,31,27, 31,19,10, 31,10,11, 00,00,00 ; pink
	RGB 27,31,27, 31,19,10, 03,23,21, 00,00,00 ; teal
; nite
	RGB 15,14,24, 16,09,09, 07,07,10, 00,00,00 ; gray
	RGB 15,14,24, 16,09,09, 17,07,08, 00,00,00 ; pink
	RGB 15,14,24, 16,09,09, 02,12,16, 00,00,00 ; teal

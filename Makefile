NAME := ancientruby
VERSION := 1.0.0-beta

TITLE := PKANCIENT
MCODE := PKRS
ROMVERSION := 0x30

FILLER = 0x00

ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

RGBASM_FLAGS =
RGBLINK_FLAGS = -n $(ROM_NAME).sym -m $(ROM_NAME).map -l contents/contents.link -p $(FILLER)
RGBFIX_FLAGS = -csjv -t $(TITLE) -i $(MCODE) -n $(ROMVERSION) -p $(FILLER) -k 01 -l 0x33 -m 0x10 -r 3

CFLAGS = -O3 -std=c11 -Wall -Wextra -pedantic

ifeq ($(filter sapphire,$(MAKECMDGOALS)),sapphire)
RGBASM_FLAGS += -DSAPPHIRE
endif
ifeq ($(filter nortc,$(MAKECMDGOALS)),nortc)
RGBASM_FLAGS += -DNO_RTC
endif
ifeq ($(filter debug,$(MAKECMDGOALS)),debug)
RGBASM_FLAGS += -DDEBUG
endif


.SUFFIXES:
.PHONY: all clean ruby sapphire nortc debug bankfree freespace compare tools
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp %.lz %.o


roms_md5      = roms.md5
bank_ends_txt = contents/bank_ends.txt
sorted_sym    = contents/$(NAME).sym

PYTHON = python
CC     = gcc
RM     = rm -f
GFX    = $(PYTHON) gfx.py
MD5    = md5sum

LZ            = tools/lzcomp
SCAN_INCLUDES = tools/scan_includes

bank_ends := $(PYTHON) contents/bank_ends.py $(NAME)-$(VERSION)


ruby_obj := \
main.o \
home.o \
ram.o \
audio.o \
audio/musicplayer.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
data/maps/map_data.o \
data/text/common.o \
data/tilesets.o \
engine/credits.o \
engine/events.o \
gfx/pics.o \
gfx/sprites.o


all: ruby

ruby: FILLER = 0x00
ruby: ROM_NAME = $(NAME)-$(VERSION)
ruby: $(NAME)-$(VERSION).gbc

sapphire: ruby
nortc: ruby
debug: ruby

bankfree: FILLER = 0xff
bankfree: ROM_NAME = $(NAME)-$(VERSION)-0xff
bankfree: $(NAME)-$(VERSION)-0xff.gbc

freespace: $(bank_ends_txt) $(roms_md5) $(sorted_sym)


# Build tools when building the rom
ifeq ($(filter clean tools,$(MAKECMDGOALS)),)
Makefile: tools
endif

tools: $(LZ) $(SCAN_INCLUDES)

$(LZ): $(LZ).c
	$(CC) $(CFLAGS) -o $@ $<

$(SCAN_INCLUDES): $(SCAN_INCLUDES).c
	$(CC) $(CFLAGS) -o $@ $<


clean:
	$(RM) $(ruby_obj) $(wildcard $(NAME)-*.gbc) $(wildcard $(NAME)-*.map) $(wildcard $(NAME)-*.sym)

compare: ruby
	$(MD5) -c $(roms_md5)


$(bank_ends_txt): ruby bankfree ; $(bank_ends) > $@
$(roms_md5): ruby ; $(MD5) $(NAME)-$(VERSION).gbc > $@
$(sorted_sym): ruby ; tail -n +3 $(NAME)-$(VERSION).sym | sort -o $@


%.o: dep = $(shell $(SCAN_INCLUDES) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm $(RGBASM_FLAGS) -o $@ $<

.gbc:
%.gbc: $(ruby_obj)
	$(RGBDS_DIR)rgblink $(RGBLINK_FLAGS) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_FLAGS) $@

%.2bpp: %.png ; $(GFX) 2bpp $<
%.1bpp: %.png ; $(GFX) 1bpp $<

gfx/pokemon/%/bitmask.asm gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.2bpp

%.lz: % ; $(LZ) $< $@

%.pal: ; $(error ERROR: Cannot find '$@')
%.png: ; $(error ERROR: Cannot find '$@')
%.asm: ; $(error ERROR: Cannot find '$@')
%.bin: ; $(error ERROR: Cannot find '$@')
%.ablk: ; $(error ERROR: Cannot find '$@')
%.tilemap: ; $(error ERROR: Cannot find '$@')

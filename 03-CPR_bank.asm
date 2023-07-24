
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; //////////////// ENVOIE DES FICHIERS DANS LES ROMS ////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////




; ///////////////////////////////////////////////////////////////////////////////
; ////////////////////////////// LE PROGRAMME  //////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 1
	include"04-Programme.asm"
bank 2
	include"04_bis-Programme_ROM.asm"

; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////// LA MUSIQUE //////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	

; la bank 3 est assemblé à la fin dufichier Programme.asm
; bank 3

; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////// LES TILESETS ////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 5
		incbin"contenu_cartouche/gfx/espace.imp"   ; contient le niveau 1


; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////// LES HUDS & PALETTES /////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 8
org	#C000
	incbin"contenu_cartouche/gfx/hudtoto.imp"
	;incbin"contenu_cartouche/gfx/hud2ply.imp"
	incbin"contenu_cartouche/gfx/crocohud.imp"
	incbin"contenu_cartouche/gfx/button.imp"
org	DEPART_PALETTES	
; title screen
	org PALETTE_TITLE_SCREEN
		;DW		#000,#008,#0F0,#8F0,#FF0,#FFF,#FF8,#888,#080,#555,#44A,#00F,#aaa,#03A,#80F,#888
		db #00,#00,#08,#00,#f0,#03,#f0,#08
db #f0,#0f,#ff,#0f,#f8,#0f,#bb,#0b
db #80,#02,#08,#08,#4c,#00,#0f,#00
db #9a,#0f,#6c,#01,#0f,#08,#88,#08
; le choix des vaisseaux
	org PALETTE_CHOIX_VAISSEAUX
		DW		#000,#006,#00F,#060,#066,#0F0,#606,#60F,#660,#666,#6F0,#F66,#F6F,#FF0,#FF6,#FFF

		
		
; game over
	org PALETTE_GAME_OVER
		DW 		#000,#020,#050,#080,#0F0,#001,#002,#004,#005,#008,#08F,#0FF,#8F0,#80F,#F8F,#FFF
; sprites hard
	org PALETTE_SPRITE_HARD
		dw 		#0f0,#000,#00b,#ff0,#f3f,#72f,#fff,#b0d,#0a0,#9f4,#ff7,#d08,#666,#48c,#07f
; decors
	org PALETTE_DECORS
	;	dw #fff,#9aa,#000,#0a0,#0f0,#008,#00b,#00f,#90f,#900,#d00,#f1b,#8e0,#de0,#2be,#7dc
dw #000,#001,#002,#003,#013,#023,#034,#035,#046,#037,#057,#068,#04A,#07A,#06B,#6CF




; la fin
	org PALETTE_FIN
		dw #000,#080,#001,#003,#004,#006,#01D,#1D2,#6D2,#606,#61D,#BD2,#BD8,#B9D,#BDD,#FFE
; entre les level
	org PALETTE_INTERLEVEL
	dw #000,#000,#0F0,#008,#00F,#0FF,#8F0,#808,#888,#80F,#FF0,#FF8,#F8F,#FFF,#FFF,#FFF

; hud
	org PALETTE_HUD
		db #ff,#0f,#00,#00,#66,#06,#77,#07
		db #99,#09,#bb,#0b,#dd,#0d,#05,#08
		db #07,#08,#00,#06,#70,#05,#c0,#00
		db #d2,#07,#d4,#0d,#8c,#04,#ff,#05
; menu
	org	PALETTE_MENU
	db #00,#00,#06,#00,#0f,#00,#60,#00
	db #68,#06,#f0,#00,#88,#08,#06,#06
	db #0f,#06,#6f,#06,#f0,#06,#06,#0f
	db #6f,#0f,#f0,#0f,#f6,#0f,#ff,#0f
; credit
	org PALETTE_CREDIT
	dw #000,#0F0,#00F,#0FF,#8F0,#808,#888,#80F,#FF0,#F08,#FF8,#F8F,#FFF,#FFF,#FFF,#FFF
; metamorphose
	org PALETTE_METAMORPHOSE
db #00,#00,#bb,#0a,#ff,#0f,#e0,#00
db #f0,#0a,#f0,#0f,#b0,#0b,#00,#0f
db #78,#07,#56,#05,#7e,#0e,#0f,#00
db #0c,#00,#08,#00,#90,#00,#f8,#06
; shop
org PALETTE_SHOP
db #00,#00,#bb,#0a,#ff,#0f,#e0,#00
db #f0,#0a,#d0,#0e,#8c,#05,#09,#0b
db #09,#08,#00,#08,#7e,#0e,#1f,#05
db #0c,#00,#08,#00,#90,#00,#f8,#06

; crocofest
org	PALETTE_CROCOFEST
DW #000,#060,#080,#0E0,#0F0,#008,#00E,#00F,#60F,#8F0,#808,#80F,#FF0,#FF8,#F8F,#FFF

; FONTE
	org HUD_DEPART_FONTES
	incbin"contenu_cartouche/gfx/fontesok.bin"

	incbin"contenu_cartouche/gfx/fonthud.bin"

; ///////////////////////////////////////////////////////////////////////////////
; ////////////////////// TOUTES LES SPRITES HARD ////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 9
	incbin"contenu_cartouche/sprites_hard/GOLDORA1.spr"			; sprites Goldorak
bank 10
	incbin"contenu_cartouche/sprites_hard/GOLGOTH1.spr"			; golgoth 1,2,3,4,6 + soucoupes
bank 11
	incbin"contenu_cartouche/sprites_hard/GOLGOTH2.spr"		; golgoth 7 et 8 (à rajouter) + items et explosion simple à virer

bank 16
 	incbin"contenu_cartouche/sprites_hard/EXPLOSE.spr"		; explosions
	

	
; ///////////////////////////////////////////////////////////////////////////////
; /////////////////////////////// LES ECRANS TITRE  /////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	
bank 17
	org #c000
		;incbin"contenu_cartouche/gfx/titlego1.ZX0"
		incbin"contenu_cartouche/gfx/titre.go1.ZX0"
	org #d700
		;incbin"contenu_cartouche/gfx/titlego2.ZX0"
		incbin"contenu_cartouche/gfx/titre.go2.ZX0"

Bank 18
	
		incbin"contenu_cartouche/gfx/crocof.SCR.ZX0"

	
		
Bank 19
		incbin"contenu_cartouche/gfx/choix.scr"


bank 20
	org #c000
		incbin"contenu_cartouche/gfx/routes.scr"
bank 22
	incbin"contenu_cartouche/gfx/nude.scr"
		
Bank 4
	org #C000
	incbin"contenu_cartouche/gfx/crocmenu.SCR.ZX0"


; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////  MAPTILES DES 7 ROUTES  ///////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////		

; !!!!!  8000 / 16000 octets d'utilisé seulement !!!!!!
bank 21
	incbin"contenu_cartouche/maptiles/goldospace.prg"
	

	
; ///////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////  SAMPLES  ///////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	
bank 28
	incbin"contenu_cartouche/gfx/go.scr"

bank 31
	incbin"contenu_cartouche\sound\go.spl"
	;include"X-sample.asm"


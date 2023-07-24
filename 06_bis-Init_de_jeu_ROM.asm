init_nouveau_level_ROM	
	ld		a,(level_en_cours)
	cp		a,1
	;jp		z,init_la_fin
	jp		z,init_level_2
	cp		a,2
	jp		z,init_level_3
	cp		a,3
	jp		z,init_level_4
	cp		a,4
	jp		z,init_level_5
	cp		a,5
	jp		z,init_level_6
	cp		a,6
	jp		z,init_level_7
	cp		a,7
	jp		z,init_level_8
	cp		a,8
	jp		z,init_la_fin
init_level_2
	ex		af,af'
	ld		a,1
	ld		(automodif_music+1),a
	ex		af,af'
	
	ld		hl,largeur_chiffre2
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre2_ROM
	ld		(adr_chiffre),hl
	
	ld		hl,BANK_LEVEL_2
	ld		(bank_level),hl
	ld		hl,BANK_TILESET_2
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_2
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_2+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	
	jp		suite_init_level
init_level_3
	ex		af,af'
	ld		a,2
	ld		(automodif_music+1),a
	ex		af,af'
	
	ld		hl,largeur_chiffre3
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre3_ROM
	ld		(adr_chiffre),hl
	
	ld		hl,BANK_LEVEL_3
	ld		(bank_level),hl
	ld		hl,BANK_TILESET_3
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_3
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_3+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_level_4
	ex		af,af'
	ld		a,3
	ld		(automodif_music+1),a
	ex		af,af'		
	
	ld		hl,largeur_chiffre4
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre4_ROM
	ld		(adr_chiffre),hl
	ld		hl,BANK_LEVEL_4
	ld		(bank_level),hl
	ld		hl,BANK_TILESET_4
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_4
	
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_4+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_level_5
	ex		af,af'
	ld		a,4
	ld		(automodif_music+1),a
	ex		af,af'	
	ld		hl,largeur_chiffre5
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre5_ROM
	ld		(adr_chiffre),hl	
	ld		hl,BANK_LEVEL_5
	ld		(bank_level),hl
		ld		hl,BANK_TILESET_5
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_5
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_5+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_level_6	
	ex		af,af'
	ld		a,5
	ld		(automodif_music+1),a
	ex		af,af'
	ld		hl,largeur_chiffre6
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre6_ROM
	ld		(adr_chiffre),hl
	ld		hl,BANK_LEVEL_6
	ld		(bank_level),hl
			ld		hl,BANK_TILESET_6
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_6
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_6+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_level_7
	ex		af,af'
	ld		a,4
	ld		(automodif_music+1),a
	ex		af,af'	
	ld		hl,largeur_chiffre7
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre7_ROM
	ld		(adr_chiffre),hl
	ld		hl,BANK_LEVEL_7
	ld		(bank_level),hl
			ld		hl,BANK_TILESET_7
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_7
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_7+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_level_8
	ex		af,af'
	ld		a,3
	ld		(automodif_music+1),a
	ex		af,af'	
	ld		hl,largeur_chiffre7
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre7_ROM
	ld		(adr_chiffre),hl
	ld		hl,BANK_LEVEL_8
	ld		(bank_level),hl
	ld		hl,BANK_TILESET_8
	ld		(bank_tileset),hl
	ld		(automodif_Bank_tileset_scroll+1),hl
	ld		hl,SCREEN_LEVEL_8
	ld		(adr_screen_level),hl
	ld		hl,SCREEN_DEPART_LEVEL_8+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl
	jp		suite_init_level
init_la_fin
	ld		a,1
	ld		(fini),a
	jp		suite_init_level
suite_init_level	

	inc		a						; on increment le level
	ld		(level_en_cours),a

; on désactive les évenements de la boucle	
	xor		a						; on va remplir de zero
	ld		hl,event_fade_out		; les evenements qui sont
	ld		(hl),a					; encore actif dans la boucle
	ld		de,event_fade_out+1
	ld		bc,40
	LDIR	
; on éteinds les sprites hard
	ld		(SPRH0_ZOOM),a
	ld		(SPRH1_ZOOM),a
	ld		(SPRH2_ZOOM),a
	ld		(SPRH3_ZOOM),a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(SPRH6_ZOOM),a
	ld		(SPRH7_ZOOM),a
	ld		(SPRH8_ZOOM),a
	ld		(SPRH9_ZOOM),a
	ld		(SPRH10_ZOOM),a
	ld		(SPRH11_ZOOM),a
	ld		(SPRH12_ZOOM),a
	ld		(SPRH13_ZOOM),a
	ld		(SPRH14_ZOOM),a
	ld		(SPRH15_ZOOM),a
; on place les sprites de goldorak
	ld		hl,190		
	ld		(SPRH4_X),hl			; sprite 0 X
	ld		(SPRH2_X),hl			; sprite 2 X
	ld		(SPRH0_X),hl
	ld		de,32+32
	add		hl,de
	ld		(SPRH1_X),hl
	ld		(SPRH5_X),hl			; sprite 1 X
	ld		(SPRH3_X),hl			; sprite 3 X
	ld		hl,230
	ld		(SPRH4_Y),hl			; sprite 0 Y
	ld		(SPRH0_y),hl
	ld		(SPRH1_y),hl
	ld		(SPRH5_Y),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(SPRH2_Y),hl			; sprite 2 Y
	ld		(SPRH3_Y),hl			; sprite 3 Y
; on reinitialise le CRTC	
	ld		a,#30
	ld		bc,#bc00+12: out (c),c
	ld		bc,#bd00 : out (c),a
	xor		a
	ld		bc,#bc00+13: out (c),c
	ld		bc,#bd00 : out (c),a
	
	xor		a
	ld		(EtpGolgoth),a
	ld		(VitesseAnimGolgoth),a
	ld		(Etp_Anim_Golgoth),a
	ld		(flag_MortGolgoth),a
	
	ld		(etp_powerup),a
	ld		(etp_arme2),a
	ld		(Compteur_DistanceGolgoth_1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ret
	
	
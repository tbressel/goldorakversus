initialisation_du_jeu
	ld		c,BANK_ROM_2
	call	rom_on_EI
	CALL	initialisation_du_jeu_ROM
	call	nouvelle_ligne
	
	Asic ON
; Copie pallette fond
	LD 		BC,BANK8_PALETTES:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	ld		hl,PALETTE_DECORS
	ld		de,PALETTE_ASIC
	ld		bc,#20
	LDIR
; Copie pallette sprites hard
	ld		hl,PALETTE_SPRITE_HARD
	ld		de,PALETTE_SPRH
	ld		bc,#1d
	LDIR
	Asic OFF
	ret



ROUTE_LEVEL
; on fait le menage
	ld		bc,#7F00+%10001100			; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c				
	ld		a,#c0
	ld		(#c000),a
	ld 		hl,#C000
	ld		de,#c001
	LD 		BC,#3fff
	ldir
Asic ON
; on fait le menage
	xor		a
	ld		hl,PALETTE_ASIC
	ld		(hl),a
	ld		de,PALETTE_ASIC+1
	ld		bc,#20
	LDIR
	
	xor		a
	ld		(SPRH10_ZOOM),a
	ld		(SPRH11_ZOOM),a
	ld		(SPRH12_ZOOM),a
	ld		(SPRH13_ZOOM),a
	ld		(valeur_zoom_sprh10),a
	ld		(valeur_zoom_sprh11),a
	ld		(valeur_zoom_sprh12),a
	ld		(valeur_zoom_sprh13),a
	
	

; --------------------------------   ECRAN A DECOMPRESSER CICI ------------------------	
	LD 		BC,BANK19_CHOIX_VAISSEAUX:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	
NUDE_PATCH
; premiere tuiles de 64*93
	ld		hl,64
	ld		(LargeurMorceau),hl
	ld		a,93
	ld		(HauteurMorceau),a
	ld		hl,#c000
	ld		(AdrMorceauROM),hl
	ld		hl,#C000
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau
; premiere tuiles de 16*56
	ld		hl,16
	ld		(LargeurMorceau),hl
	ld		a,56
	ld		(HauteurMorceau),a
	ld		hl,#c040
	ld		(AdrMorceauROM),hl
	ld		hl,#Eac0
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau	
; deuxieme tuiles de 16*56
	ld		hl,16
	ld		(LargeurMorceau),hl
	ld		a,56
	ld		(HauteurMorceau),a
	ld		hl,#c270
	ld		(AdrMorceauROM),hl
	ld		hl,#EAd0
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau		
; troisieme tuiles de 16*56
	ld		hl,16
	ld		(LargeurMorceau),hl
	ld		a,56
	ld		(HauteurMorceau),a
	ld		hl,#c4a0
	ld		(AdrMorceauROM),hl
	ld		hl,#EAe0
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau		
; première tuiles de 16*28
	ld		hl,16
	ld		(LargeurMorceau),hl
	ld		a,28
	ld		(HauteurMorceau),a
	ld		hl,#fdf0
	ld		(AdrMorceauROM),hl
	ld		hl,#EAf0
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau		
; première tuiles de 16*28
	ld		hl,16
	ld		(LargeurMorceau),hl
	ld		a,28
	ld		(HauteurMorceau),a
	ld		hl,#fe00
	ld		(AdrMorceauROM),hl
	ld		hl,#cbf0
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau		

; dernière tuiles de 64*66
	ld		hl,64
	ld		(LargeurMorceau),hl
	ld		a,66
	ld		(HauteurMorceau),a
	ld		hl,#eb70
	ld		(AdrMorceauROM),hl
	ld		hl,#ec80
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau			



; on affiche le hud par defaut

	ld		hl,32
	ld		(LargeurMorceau),hl
	ld		a,45
	ld		(HauteurMorceau),a
Asic OFF		
	LD 		BC,#DF00+#80+28
	OUT 	(C),C
	LD		BC,#7F00+%10000100
	OUT 	(C),C
	ld		hl,HUD_J1_GOLDORAK
	ld		(AdrMorceauROM),hl
	ld		hl,HUD_J1_ADR_ECRAN
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau_hud
	

	ld		hl,HUD_J2_GOLDORAK
	ld		(AdrMorceauROM),hl
	ld		hl,HUD_J1_ADR_ECRAN+#20
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau_hud
	LD		BC,#7F00
	OUT 	(C),C
Asic ON	
	
	
	
	
	
	
	jp		suite_morceau

LargeurMorceau		ds	2,0
HauteurMorceau		ds	1,0
AdrMorceauROM		ds	2,0
AdrMorceauECRAN		ds	2,0
HudJoueurChoix		ds	2,0
HudJoueurAdrEcran	ds	2,0
Pointeur_TblHudJoueur1Choix		ds	2,0
Pointeur_TblHudJoueur2Choix		ds	2,0



affiche_morceau
	ld		hl,(AdrMorceauROM)
	ld		de,(AdrMorceauECRAN)
	ld		a,(HauteurMorceau)
	ld		b,a
	.boucle
		push	bc
		push	de
		push	hl
		ld		bc,(LargeurMorceau)
		ldir
		pop 	hl
		call	ligne_inf_C000_type2
		pop		de
		call	ligne_inf_C000_type1
		pop		bc
		djnz	.boucle
		ret


affiche_morceau_hud
	ld		hl,(AdrMorceauROM)
	ld		de,(AdrMorceauECRAN)
	ld		a,(HauteurMorceau)
	ld		b,a
	.boucle
		push	bc
		push	de
		push	hl
		ld		bc,(LargeurMorceau)
		ldir
		pop 	hl
		call	ligne_inf_C000_type2
		pop		de
		call	ligne_inf_4000
		pop		bc
		djnz	.boucle
		ret


	
	

suite_morceau

	ld	hl,TblHudJoueur1Choix+2
	ld	(Pointeur_TblHudJoueur1Choix),hl

	ld	hl,TblHudJoueur2Choix+2
	ld	(Pointeur_TblHudJoueur2Choix),hl

; -------------------------------------------------------------------------------------
; Copie pallette fond
	LD 		BC,BANK8_PALETTES:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	ld		hl,PALETTE_CHOIX_VAISSEAUX
	ld		de,#6400
	ld		bc,#20
	LDIR	
	
	; Copie pallette sprites hard
	ld		hl,PALETTE_SPRITE_HARD
	ld		de,PALETTE_SPRH
	ld		bc,#1d
	LDIR
	
	
	LD 		BC,BANK_GOLDORAK_SPRH:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	LD		hl,#E400
	ld		de,SPRH0_ADR
	ld		bc,#A00
	LDIR
	
; on place les sprites à l'écran

; coordonnée en X
	ld		hl,24
	ld		(SPRH0_X),hl
	ld		(SPRH2_X),hl
	ld		(SPRH4_X),hl
	ld		(SPRH6_X),hl
	ld		de,32
	add		hl,de
	ld		(SPRH1_X),hl
	ld		(SPRH3_X),hl
	ld		(SPRH5_X),hl
	ld		(SPRH7_X),hl

	ld		hl,128+64+36
	ld		(SPRH10_X),hl
	ld		de,32
	add		hl,de
	ld		(SPRH11_X),hl
	
	ld		de,62
	add		hl,de
	ld		(SPRH12_X),hl
	ld		de,32
	add		hl,de
	ld		(SPRH13_X),hl

; coordonnée en Y	
	ld		hl,32
	ld		(SPRH0_Y),hl
	ld		(SPRH1_Y),hl
	ld		de,32
	add		hl,de
	ld		(SPRH2_Y),hl
	ld		(SPRH3_Y),hl
	ld		de,32
	add		hl,de
	ld		(SPRH4_Y),hl
	ld		(SPRH5_Y),hl
	ld		de,32
	add		hl,de
	ld		(SPRH6_Y),hl
	ld		(SPRH7_Y),hl
	ld		de,32+28
	add		hl,de
	ld		(SPRH10_Y),hl
	ld		(SPRH11_Y),hl	
	ld		(SPRH12_Y),hl
	ld		(SPRH13_Y),hl
	
; placement du curseur 1	et    2
	ld		hl,20
	ld		(SPRH8_X),hl
	ld		(SPRH9_X),hl
	ld		hl,32
	ld		(SPRH8_Y),hl
	ld		(SPRH9_Y),hl
	

	
	
	
	
	
; on affiche les zoom
	ld		a,zoom_mode1_1
	ld		(SPRH0_ZOOM),a
	ld		(SPRH1_ZOOM),a
	ld		(SPRH2_ZOOM),a
	ld		(SPRH3_ZOOM),a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(SPRH6_ZOOM),a
	ld		(SPRH7_ZOOM),a

	

	
	ld		(valeur_zoom_sprh0),a
	ld		(valeur_zoom_sprh1),a
	ld		(valeur_zoom_sprh2),a
	ld		(valeur_zoom_sprh3),a
	ld		(valeur_zoom_sprh4),a
	ld		(valeur_zoom_sprh5),a
	ld		(valeur_zoom_sprh6),a
	ld		(valeur_zoom_sprh7),a


	
	
	
	
	ld		a,zoom_mode1_1
	ld		(SPRH8_ZOOM),a
	ld		(SPRH9_ZOOM),a	
		ld		(valeur_zoom_sprh8),a
	ld		(valeur_zoom_sprh9),a
	
	ld		a,1
	ld		(PositionCurseurJoueur_1),a
	ld		(PositionCurseurJoueur_2),a
	

	
	ld		e,255
boucle_choix_vaisseau
	ld    b,#f5    			;adresse du port B du PPI
vblchoix
	in    a,(c)     		;On récupère l'octet contenu sur le port dans A
	rra              		;On fait une rotation afin de récupérer le bit 0 dans le flag carry
	jr    nc,vblchoix


	
	dec		e
	jr		nz,boucle_choix_vaisseau
	ld		e,255

	call	test_du_clavier_joueur1
	call	test_du_clavier_joueur2
	
	
	
	ld		a,(resultat_test_de_touche_joueur1)
	bit		1,a
	jp		z,Bas_Joueur1
	bit		0,a
	jp		z,Haut_Joueur1
	bit		5,a
	jp		z,OK_Joueur1
	bit		4,a
	jp		z,GoldorakGO
retour_joueur_1
	ld		a,(resultat_test_de_touche_joueur2)
	bit		1,a
	jp		z,Bas_Joueur2
	bit		0,a
	jp		z,Haut_Joueur2
	bit		5,a
	jp		z,OK_Joueur2
	bit		7,a
	jp		z,NUDEVENUSIA
retour_joueur_2	


	jp		boucle_choix_vaisseau
	
	
BugCPCPlus1
ld		a,zoom_mode1_1
	ld		(SPRH10_ZOOM),a
	ld		(SPRH11_ZOOM),a

	ld		(valeur_zoom_sprh10),a
	ld		(valeur_zoom_sprh11),a

ret	
BugCPCPlus2
ld		a,zoom_mode1_1

	ld		(SPRH12_ZOOM),a
	ld		(SPRH13_ZOOM),a

	ld		(valeur_zoom_sprh12),a
	ld		(valeur_zoom_sprh13),a
ret		
	

; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
test_du_clavier_joueur2
	
	ld		bc,#F40E:OUT (C),c
	ld		bc,#F6C0:OUT (C),C
	ld		bc,#F600:OUT (C),C
	ld		bc,#F792:OUT (C),C				; on place le port A en sortie (#92)
	ld		bc,#F646:OUT (C),C				; test la ligne 6 avec #F6 + %0100 0110 (#46)
	ld		b,#F4:IN A,(C)
	ld		bc,#F782:OUT (C),C				; on place le port A en entrée (#82)
	ld		bc,#F600:OUT (C),C
		
	ld		(resultat_test_de_touche_joueur2),a
	ret
test_du_clavier_joueur1

	ld		bc,#F40E:OUT (C),c
	ld		bc,#F6C0:OUT (C),C
	ld		c,#00:OUT (C),C
	ld		c,#49:OUT (C),C
	ld		bc,#F792:OUT (C),C				; on place le port A en sortie (#92)
	ld		b,#F4:IN A,(C)
	ld		bc,#F782:OUT (C),C				; on place le port A en entrée (#82)
	ld		bc,#F600:OUT (C),C
	
	ld		(resultat_test_de_touche_joueur1),a
	ret
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////

Bas_Joueur1
call	BugCPCPlus1
	ld		a,(FlagJoueursOK)
	bit		0,a
	jp		nz,retour_joueur_1
; bandeau en bas
	ld		hl,(Pointeur_TblHudJoueur1Choix)
	inc		hl
	inc		hl
	ld		a,(hl)
	cp		a,#FF
	jr		nz,.pointeur
	ld		hl,TblHudJoueur1Choix+2
		.pointeur	
			ld		(Pointeur_TblHudJoueur1Choix),hl
			ld		e,(hl)
			inc		hl
			ld		d,(hl)
		
			ld		(HudJoueurChoix),de
			ld		hl,HUD_J1_ADR_ECRAN
			ld		(HudJoueurAdrEcran),hl
				; curseur de selection	
					ld		hl,(SPRH8_Y)
					ld		(SprhCurseurJoueur),hl
					ld		a,(PositionCurseurJoueur_1)
					ld		(PositionCurseur),a
					call	Calcule_Curseur_Bas
					ld		(PositionCurseurJoueur_1),a
					ld		(SPRH8_Y),hl
					jp		Valide_Joueur1

Haut_Joueur1
call	BugCPCPlus1
	ld		a,(FlagJoueursOK)
	bit		0,a
	jp		nz,retour_joueur_1
; bandeau en bas
	ld		hl,(Pointeur_TblHudJoueur1Choix)
	dec		hl
	dec		hl
	ld		a,(hl)
	cp		a,#FF
	jr		nz,.pointeur
	ld		hl,TblHudJoueur1Choix+8
		.pointeur	
			ld		(Pointeur_TblHudJoueur1Choix),hl
			ld		e,(hl)
			inc		hl
			ld		d,(hl)
			ld		(HudJoueurChoix),de
			ld		hl,HUD_J1_ADR_ECRAN
			ld		(HudJoueurAdrEcran),hl
				; curseur de selection	
					ld		hl,(SPRH8_Y)
					ld		(SprhCurseurJoueur),hl
					ld		a,(PositionCurseurJoueur_1)
					ld		(PositionCurseur),a
					call	Calcule_Curseur_Haut
					ld		(PositionCurseurJoueur_1),a
					ld		(SPRH8_Y),hl
					jp		Valide_Joueur1
						Valide_Joueur1
							ld		hl,SPRH10_ADR
							ld		(SprhApercuDestination),hl
							ld		a,(PositionCurseurJoueur_1)
							call	Afficher_Choix
							ld		(ChoixVaisseauJ1),hl
							jp		retour_joueur_1


; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////

Bas_Joueur2
call	BugCPCPlus2
	ld		a,(FlagJoueursOK)
	bit		1,a
	jp		nz,retour_joueur_2
	; bandeau en bas
	ld		hl,(Pointeur_TblHudJoueur2Choix)
	inc		hl
	inc		hl
	ld		a,(hl)
	cp		a,#FF
	jr		nz,.pointeur
	ld		hl,TblHudJoueur2Choix+2
		.pointeur	
			ld		(Pointeur_TblHudJoueur2Choix),hl
			ld		e,(hl)
			inc		hl
			ld		d,(hl)
			ld		(HudJoueurChoix),de
			ld		hl,HUD_J1_ADR_ECRAN+#20
			ld		(HudJoueurAdrEcran),hl
				; curseur de selection	
					ld		hl,(SPRH9_Y)
					ld		(SprhCurseurJoueur),hl
					ld		a,(PositionCurseurJoueur_2)
					ld		(PositionCurseur),a
					call	Calcule_Curseur_Bas
					ld		(PositionCurseurJoueur_2),a
					ld		(SPRH9_Y),hl
					jp		Valide_Joueur2
Haut_Joueur2
call	BugCPCPlus2
	ld		a,(FlagJoueursOK)
	bit		1,a
	jp		nz,retour_joueur_2
; bandeau en bas
	ld		hl,(Pointeur_TblHudJoueur2Choix)
	dec		hl
	dec		hl
	ld		a,(hl)
	cp		a,#FF
	jr		nz,.pointeur
	ld		hl,TblHudJoueur2Choix+8
		.pointeur	
			ld		(Pointeur_TblHudJoueur2Choix),hl
			ld		e,(hl)
			inc		hl
			ld		d,(hl)
			ld		(HudJoueurChoix),de
			ld		hl,HUD_J1_ADR_ECRAN+#20
			ld		(HudJoueurAdrEcran),hl
				; curseur de selection	
					ld		hl,(SPRH9_Y)
					ld		(SprhCurseurJoueur),hl
					ld		a,(PositionCurseurJoueur_2)
					ld		(PositionCurseur),a
					call	Calcule_Curseur_Haut
					ld		(PositionCurseurJoueur_2),a
					ld		(SPRH9_Y),hl
					jp		Valide_Joueur2



Calcule_Curseur_Bas
	ld		a,(PositionCurseur)
	inc		a
	cp		a,5
	jp		z,Reinit_Curseur
	ld		(PositionCurseur),a	
	ld		hl,(SprhCurseurJoueur)
	ld		de,32
	add		hl,de
	ret
		Reinit_Curseur
			ld		a,1
			ld		(PositionCurseur),a
			ld		hl,32
			ld		(SprhCurseurJoueur),hl
			ret

Calcule_Curseur_Haut
	ld		a,(PositionCurseur)
	dec		a
	cp		a,0
	jp		z,Deinit_Curseur
	ld		(PositionCurseur),a
	ld		hl,(SprhCurseurJoueur)
	ld		de,-32
	add		hl,de
	ret
		Deinit_Curseur
			ld		a,4
			ld		(PositionCurseur),a
			ld		hl,(SprhCurseurJoueur)
			ld		de,32*3
			add		hl,de
			ret
			

Valide_Joueur2
	ld		hl,SPRH12_ADR
	ld		(SprhApercuDestination),hl
	ld		a,(PositionCurseurJoueur_2)
	call	Afficher_Choix
	ld		(ChoixVaisseauJ2),hl
	jp		retour_joueur_2

Afficher_Choix

	cp		a,1
	jr		z,Choix_Goldorak
	cp		a,2
	jr		z,Choix_Venusiak
	cp		a,3
	jr		z,Choix_Alcorak
	cp		a,4
	jr		z,Choix_OVTerre
		Choix_Goldorak
			ld		hl,SPRH0_ADR
			ld		de,(SprhApercuDestination)
			ld		bc,#200
			LDIR
			call	Update_Hud_choix
			
			ld		hl,#E400
			ret
		Choix_Venusiak
			ld		hl,SPRH2_ADR
			ld		de,(SprhApercuDestination)
			ld		bc,#200
			LDIR
			call	Update_Hud_choix
			
			ld		hl,#E600
			ret
		Choix_Alcorak
			ld		hl,SPRH4_ADR
			ld		de,(SprhApercuDestination)
			ld		bc,#200
			LDIR
			call	Update_Hud_choix
			
			ld		hl,#E800
			ret
		Choix_OVTerre
			ld		hl,SPRH6_ADR
			ld		de,(SprhApercuDestination)
			ld		bc,#200
			LDIR
			call	Update_Hud_choix
			
			ld		hl,#EA00
			ret



OK_Joueur1
	ld		hl,(SPRH10_X)
	ld		de,(SPRH10_Y)
	ld		(SPRH8_X),hl
	ld		(SPRH8_Y),de
		
	ld		a,(FlagJoueursOK)
	set		0,a
	ld		(FlagJoueursOK),a
	
	ld		hl,(ChoixVaisseauJ1)
	ld		a,h
	cp		a,0
	call	z,.defaut
	jp		retour_joueur_1
		.defaut
			ld		hl,HUD_J1_GOLDORAK
			ld		(HudJoueurChoix),hl
			ld		hl,HUD_J1_ADR_ECRAN
			ld		(HudJoueurAdrEcran),hl
		
			
			ld		hl,SPRH10_ADR
			ld		(SprhApercuDestination),hl
			ld		a,(PositionCurseurJoueur_1)
			call	Afficher_Choix
			ld		(ChoixVaisseauJ1),hl
			ret
		
		
		
		

OK_Joueur2
	ld		hl,(SPRH12_X)
	ld		de,(SPRH12_Y)
	ld		(SPRH9_X),hl
	ld		(SPRH9_Y),de

	ld		a,(FlagJoueursOK)
	set		1,a
	ld		(FlagJoueursOK),a
	
	ld		hl,(ChoixVaisseauJ2)
	ld		a,h
	cp		a,0
	call	z,.defaut
	
	
	jp		retour_joueur_2
		.defaut
				ld		hl,HUD_J2_GOLDORAK
			ld		(HudJoueurChoix),hl
			ld		hl,HUD_J1_ADR_ECRAN+#20
			ld		(HudJoueurAdrEcran),hl
ld		hl,SPRH12_ADR
	ld		(SprhApercuDestination),hl
	ld		a,(PositionCurseurJoueur_2)
	call	Afficher_Choix
	ld		(ChoixVaisseauJ2),hl
	jp		retour_joueur_2
ret


GoldorakGO
	ld		a,(FlagJoueursOK)
	cp		a,%00000011
	jp		z,.goldorakgo
	jp      boucle_choix_vaisseau

.goldorakgo
		ld		a,0
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
	
	ld		(valeur_zoom_sprh0),a
	ld		(valeur_zoom_sprh1),a
	ld		(valeur_zoom_sprh2),a
	ld		(valeur_zoom_sprh3),a
	ld		(valeur_zoom_sprh4),a
	ld		(valeur_zoom_sprh5),a
	ld		(valeur_zoom_sprh6),a
	ld		(valeur_zoom_sprh7),a
		ld		(valeur_zoom_sprh8),a
	ld		(valeur_zoom_sprh9),a
	ld		(valeur_zoom_sprh10),a
	ld		(valeur_zoom_sprh11),a
	ld		(valeur_zoom_sprh12),a
	ld		(valeur_zoom_sprh13),a
	ld		(valeur_zoom_sprh14),a
	ld		(valeur_zoom_sprh15),a
	ret


TblHudJoueur1Choix
	dw		#FFFF,HUD_J1_GOLDORAK,HUD_J1_VENUSIAK,HUD_J1_ALCORAK,HUD_J1_OVTERRE,#FFFF
	
TblHudJoueur2Choix	
	dw		#FFFF,HUD_J2_GOLDORAK,HUD_J2_VENUSIAK,HUD_J2_ALCORAK,HUD_J2_OVTERRE,#FFFF

Update_Hud_choix
Asic OFF		
	LD 		BC,#DF00+#80+28
	OUT 	(C),C
	LD		BC,#7F00+%10000100
	OUT 	(C),C
	ld		hl,(HudJoueurChoix)
	ld		(AdrMorceauROM),hl
	ld		hl,(HudJoueurAdrEcran)
	ld		(AdrMorceauECRAN),hl
	call	affiche_morceau_hud
	LD		BC,#7F00
	OUT 	(C),C
Asic ON	
	ret

NUDEVENUSIA


; --------------------------------   ECRAN A DECOMPRESSER CICI ------------------------	
	LD 		BC,#DF00+#80+22:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
JP		NUDE_PATCH

; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////


resultat_test_de_touche_joueur1		ds			1,0
resultat_test_de_touche_joueur2		ds			1,0
PositionCurseur						ds			1,0
PositionCurseurJoueur_1				ds			1,0
PositionCurseurJoueur_2				ds			1,0
SprhCurseurJoueur					ds			2,0
SprhApercuDestination				ds			2,0
ChoixVaisseauJ2						ds			2,0
ChoixVaisseauJ1						ds			2,0
FlagJoueursOK						ds			1,0


; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////

init_nouveau_level

Asic ON
; on affiche les zoom
	ld		a,0
	ld		(SPRH0_ZOOM),a
	ld		(SPRH1_ZOOM),a
	ld		(SPRH2_ZOOM),a
	ld		(SPRH3_ZOOM),a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(SPRH6_ZOOM),a
	ld		(SPRH7_ZOOM),a
	ld		(SPRH10_ZOOM),a
	ld		(SPRH11_ZOOM),a
	ld		(SPRH12_ZOOM),a
	ld		(SPRH13_ZOOM),a
	
	ld		(valeur_zoom_sprh0),a
	ld		(valeur_zoom_sprh1),a
	ld		(valeur_zoom_sprh2),a
	ld		(valeur_zoom_sprh3),a
	ld		(valeur_zoom_sprh4),a
	ld		(valeur_zoom_sprh5),a
	ld		(valeur_zoom_sprh6),a
	ld		(valeur_zoom_sprh7),a
	ld		(valeur_zoom_sprh10),a
	ld		(valeur_zoom_sprh11),a
	ld		(valeur_zoom_sprh12),a
	ld		(valeur_zoom_sprh13),a
Asic OFF

	
	LD 		BC,BANK2_INIT:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale
	call	init_nouveau_level_ROM
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c	
	
	;call	PreparationEcran
	
	ld		a,(fini)
	cp		a,1 	
	jp		z,jeu_termine
	call	ROUTE_LEVEL
Asic ON
	xor		a
	ld		hl,PALETTE_ASIC
	ld		(hl),a
	ld		de,PALETTE_ASIC+1
	ld		bc,#20
	LDIR
Asic OFF
	call	affiche_hud

	ld		a,_CALL
	ld		(event_powerup),a
	ld		hl,powerup
	ld		(event_powerup+1),hl

	
	jp		NOUVEAU_LEVEL

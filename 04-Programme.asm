org #8000
di
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////        INIT CONNEXION ROM      //////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	ld		c,BANK_ROM_0					; sélection de la ROM n°0
	ld		a,#80
	add		a,c							; on ajoute #80 au numéros de la ROM
	ld		c,a							; le reg C contient la valeur de sélection de la ROM
	ld		b,#DF
	ld		(rom_sectionnee),bc
	out		(c),c						; on execute la sélèction de la ROM
	ld		bc,#7F00+%10001100			; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	ld		(etat_de_la_rom),bc
	out		(c),c						; on exécute la connexion de la ROM sélectionnée.
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////        INIT INTERRUPTIONS      //////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	ld		a,#C3					; on met un JP
	ld		(#38),a					; en #38
	ld		hl,interruption_ligne_190		; puis l'adresse de l'interruption
	ld		(#39),hl
	
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////    CONFIGURATION BANK, POINTEURS, VIES, NRJ    ////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	ld		c,BANK_ROM_2
	call	rom_on_EI
	call	Programme_ROM
automodif_bank_tileset
		ld		hl,BANK_TILESET_1
		ld		(bank_tileset),hl
automodif_bank_level
		ld		hl,BANK_LEVEL_1
		ld		(bank_level),hl
automodif_screen_level
		ld		hl,SCREEN_LEVEL_1
		ld		(adr_screen_level),hl
automodif_depart_level
		ld		hl,SCREEN_DEPART_LEVEL_1+(-16*13)		; je pointe sur la première tile de la ligne à afficher
		ld		(pointeur_de_tile),hl	
	
	call	ROUTE_LEVEL
; la je met toutes les encres à zéro
Asic ON
	xor		a
	ld		hl,PALETTE_ASIC
	ld		(hl),a
	ld		de,PALETTE_ASIC+1
	ld		bc,#20
	LDIR
	
	ld		hl,#000
	ld		(#6420),hl
	
	
Asic OFF
	call	affiche_hud
	call	affiche_hud_2_joueurs

NOUVEAU_LEVEL
	;call	scrolling_off
	ld		hl,#c000
	ld		(valeur_offset),hl
	ld		a,SCROLL_SLOW_RETARD_VIDEO
	;ld		a,SCROLL_NORMAL_RETARD_VIDEO
	;ld		a,SCROLL_FAST_RETARD_VIDEO
	ld		(vitesse_scroll),a
	call	affiche_fond
	call	Affiche_sprite_hard
	call	initialisation_du_jeu
	
	; on allume et selectionne par défaut le 1er boutton et la 1ere amre
	ld		a,(id_arme)
	inc		a
	ld		(id_arme),a
	ld		hl,HUD_BOUTON_ON_ADR
	ld		de,HUD_BOUTON1_ADR
	ld		b,HUD_HAUTEUR_BOUTTON
	call	bcl_affiche_bouton

	ld		a,FORCE_MISSILES_GAMMA
	ld		(points_attaque),a
	
	ei
	call	RAM_SAMPLES
	
boucle_principale
	ld    b,#f5    			;adresse du port B du PPI
.vbl
	in    a,(c)     		;On récupère l'octet contenu sur le port dans A
	rra              		;On fait une rotation afin de récupérer le bit 0 dans le flag carry
	jr    nc,.vbl
	ld    b,#f5    			;adresse du port B du PPI

event_bloquer_la_boucle		ds		3,0

	
	call	compteur_evenements
event_playsample	
	;call		Sample
	;jp			boucle_principale
event_fade_out			ds	    6,0
	;call		fade_out
	;jp			boucle_principale
event_arrimage			ds		6,0
	;call		Arrimage
	;jp			boucle_principale
event_powerup
	;call		powerup
event_retournement		ds		3,0
	;call		GoldroakRetournement
event_enemis	
event_ennemis1			ds		3,0
	;call		soucoupe_1
event_ennemis2			ds		3,0
	;call		soucoupe_2
event_ennemis3			ds		3,0
	;call		soucoupe_3
event_ennemis4			ds		3,0
	;call		soucoupe_4
event_ennemis5			ds		3,0
	;call		soucoupe_5
event_ennemis6			ds		3,0
	;call		soucoupe_6	
event_tir_ennemis_1		ds		3,0
event_tir_ennemis_4		ds		3,0
event_tir_ennemis_6		ds		3,0	
	
	
event_golgoth			ds		3,0
	;call		golgoth
	
	
event_autre				ds		28,0
	
event_arme_fireA			ds		3,0	
event_arme_fireA_venisiak	ds		3,0
retour_arme_fireA_venisiak

event_normal_goldorak_boom
event_goldorak_boom



;jp	test_du_CPC_plus
retour_test_de_CPC_plus



event_test_de_goldorak		
jp		test_de_goldorak
retour_test_de_goldorak

event_venusiak_boom
event_test_de_venusiak		ds		3,0
							;jp		test_de_venusiak
retour_test_de_venusiak



event_arme_fireB			ds		3,0

	rst		ASIC_CONNEXION
	ld		hl,#000
	ld		(#6420),hl
	rst		ASIC_DECONNEXION
	


event_boucle_2_joueurs		ds		3,0			; JP boucle_principale

event_sprite_a_charger
	call	sprh_a_charger_ou_pas
	call	sprh_animations_arme
	
	
	

	
	jp		boucle_principale
; //////////////////  test du clavier du CPCplus ///////////////////
test_du_CPC_plus
	call  	test_du_clavier_toutes_les_lignes
	
	bit		5,a
	jp		z,music_on_off
	bit		2,a
	jp		z,change_musique
	bit		3,a
automodif_retour_1joueur
	jp		z,init_2joueurs
	jp		retour_test_de_CPC_plus
	
; //////////////////  goldorak  /////////////////
test_de_goldorak
test_des_tirs
	call 	test_du_clavier
	bit		4,a
	jp		z,fireA
	bit		5,a
	jp		z,fireB
;	bit		6,a

;	jp		z,init_nouveau_level
;	jp		z,init_2joueurs
retour_test_des_tirs
	
test_des_directions
	call 	test_du_clavier
	bit		0,a
	jp		z,haut
	bit		1,a
	jp		z,bas
retour_test_des_directions
test_des_directions2
	call 	test_du_clavier
	bit		3,a
	jp		z,goldo_droite
	bit		2,a
	jp		z,goldo_gauche
retour_test_des_directions2
	jp		retour_test_de_goldorak

; //////////////////  venusiak  /////////////////
test_de_venusiak
	call 	test_du_clavier_venusiak
	bit		5,a
	jp		z,fireB_venusiak
retour_test_des_tirs_venusiak

test_des_directions_venusiak
	call 	test_du_clavier_venusiak
	bit		0,a
	jp		z,haut_venus
	bit		1,a
	jp		z,bas_venus
retour_test_des_directions_venusiak
test_des_directions2_venusiak
	call 	test_du_clavier_venusiak
	bit		3,a
	jp		z,venus_droite
	bit		2,a
	jp		z,venus_gauche
retour_test_des_directions2_venusiak
	jr		retour_test_de_venusiak
; ///////////////////////////////////////////////


; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////////       SOUS-ROUTINE  /////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
test_du_clavier
	di
	ld		bc,#F40E:OUT (C),c
	ld		bc,#F6C0:OUT (C),C
	ld		c,#00:OUT (C),C
	ld		c,#49:OUT (C),C
	ld		bc,#F792:OUT (C),C				; on place le port A en sortie (#92)
	ld		b,#F4:IN A,(C)
	ld		bc,#F782:OUT (C),C				; on place le port A en entrée (#82)
	ld		bc,#F600:OUT (C),C
	ei	
	ld		(resultat_test_de_touche),a
	ret
test_du_clavier_venusiak
	di
	ld		bc,#F40E:OUT (C),c
	ld		bc,#F6C0:OUT (C),C
	ld		bc,#F600:OUT (C),C
	ld		bc,#F792:OUT (C),C				; on place le port A en sortie (#92)
	ld		bc,#F646:OUT (C),C				; test la ligne 6 avec #F6 + %0100 0110 (#46)
	ld		b,#F4:IN A,(C)
	ld		bc,#F782:OUT (C),C				; on place le port A en entrée (#82)
	ld		bc,#F600:OUT (C),C
	ei	
	ld		(resultat_test_de_touche_venusiak),a
	ret
test_du_clavier_toutes_les_lignes
	di
	LD   BC,#F40E : OUT  (C),C   ; Valeur 14 sur le port A         
	LD   BC,#F6C0 : OUT  (C),C   ; C'est un registre         
    LD   BC,#F600 : OUT  (C),C   ; Validation         
    LD   BC,#F792 : OUT  (C),C   ; Port A en entrée         
    LD   A,3             ; A=ligne clavier         
    OR   %01000000        
    LD   B,#F6   : OUT   (C),A         
    LD   B,#F4           ; Lecture du port A         
    IN   A,(C)           ; A=Reg 14 du PSG         
    LD   BC,#F782 :  OUT  (C),C   ; Port A en sortie         
    LD   BC,#F600  : OUT  (C),C       ; Validation  Et A contient la ligne	   
	ei
	ld		(resultat_test_de_touche_cpcplus),a
	ret
	
	
	
	
reinit_poid_faible
; on incremente le compteur du poind fort et raz des unitées
	xor		a
	ld		(counter_poid_faible),a
	ld		a,(counter_poid_fort)
	inc		a
	ld		(counter_poid_fort),a
	ret
	
	
compteur_evenements
; onincremente le compteur des unitées
	ld		a,(counter_poid_faible)
	inc		a
	ld		(counter_poid_faible),a
	cp		a,255
	call	z,reinit_poid_faible
; on recupère le compteur 16 bits	
	ld		a,(counter_poid_faible)
	ld		c,a
	ld		a,(counter_poid_fort)
	ld		b,a
; on recupère les donnée de la vague	
	ld		de,(Pointeur_TblNombreDeSoucoupes)
	ld		a,(de)
	ld		l,a
	inc		de
	ld		a,(de)
	ld		h,a
	or  	a
	sbc		hl,bc
	jp		z,nouvelle_vague
	inc 	de
	ld		a,(de)
	ld		l,a
	inc		de
	ld		a,(de)
	ld		h,a
	or  	a
	sbc		hl,bc
	jp		z,fin_de_la_vague
		
	ld		a,(J1etJ2Mort)
	cp		a,%00000011
	jp		z,game_overJ1J2
	
	ret
game_overJ1J2
	ld		a,_CALL						; call
	ld		(event_fade_out),a
	ld		hl,fondu_de_sortie
	ld		(event_fade_out+1),hl
	ld		a,_JP						; JP
	ld		(event_fade_out+3),a
	ld		hl,boucle_principale
	ld		(event_fade_out+4),hl
	call	music_off
	ret






jeu_termine
	ld		a,#30
	ld		bc,#bc00+12: out (c),c
	ld		bc,#bd00 : ld c,a : out (c),c
	ld		a,#00
	ld		bc,#bc00+13: out (c),c
	ld		bc,#bd00 : ld c,a : out (c),c
	LD 		BC,#DF00+16+#80:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	LD 		BC,#7FC0:OUT (c),c					; Mode C0 : on choisit D'ECRIRE  dans la RAM centrale
	jp		Fin
fin_du_level
	call	rom_off
	RST		ASIC_CONNEXION
	ld		hl,PALETTE_ASIC						; emplacement RAM de la pallette ecran
	ld		de,PALETTE_DECORS_RAM				; emplacement ASIC de la pallette ecran NOIRE !
	ld 		bc,#20
	LDIR
	RST		ASIC_DECONNEXION
	ld		a,_CALL						; call
	ld		(event_fade_out),a
	ld		hl,fondu_de_sortie
	ld		(event_fade_out+1),hl
	ld		a,_JP						; JP
	ld		(event_fade_out+3),a
	ld		hl,boucle_principale
	ld		(event_fade_out+4),hl
	call	music_off
	jp		boucle_principale
sample_on
	call	RAM_SAMPLES
	ld		a,_CALL
	ld		(event_playsample),a
	ld		hl,Sample
	ld		(event_playsample+1),hl
	ret
Sample
      	call 	PlaySampleSet
		xor		a
		ld		(event_playsample),a
		ld		(event_playsample+1),a
		ld		(event_playsample+2),a
		call	COPIE_RAM_ZIK
		ret
RAM_SAMPLES
	ld		c,31
	RST 	UPPER_ROM_CONNEXION
	ld		hl,#C000
	ld		de,#0100			
	ld		bc,#1d40						 
	ldir
	call	rom_off
	ret
COPIE_RAM_ZIK
	ld		c,3
	RST 	UPPER_ROM_CONNEXION
	ld		hl,#C000
	ld		de,PLAYER_ADR_RAM				; adresse de départ du player en RAM 
	ld		bc,LONGUEUR_PLAYER+LONGUEUR_MUSIC						 
	ldir
	call	rom_off
	ret 
reinit_music
		ld 		hl,SoundEffects         		; adresse des sfx
		call 	PLY_AKG_InitSoundEffects		
		ld 		hl,Music         				; Initialisation
automodif_music
		ld		a,0
		call 	PLY_AKG_Init
		call	music_on
		ret
powerup
	RST		ASIC_DECONNEXION
	ld		c,BANK_ROM_2
	RST		UPPER_ROM_CONNEXION
	call	powerup_ROM
	call	rom_off
	RET	
	

affiche_ecrans_de_fin	
	call	rom_off
di	
		Asic ON		
	ld		a,0
	ld	(#6004),a
	ld	(#600C),a
	ld	(#6014),a
	ld	(#601C),a
	ld	(#6024),a
	ld	(#602C),a
	ld	(#6034),a
	ld	(#603C),a
	ld	(#6044),a
	ld	(#604C),a
	ld	(#6054),a
	ld	(#605C),a

	Asic OFF
	
		

			; mise à zéros de la bank #C000-#FFFF
	xor		a
	ld		hl,#C000
	ld		e,l
	ld		d,h
	inc		de
	ld		(hl),a
	ld		bc,#3fff
	LDIR
	
		; mise à zéros de la bank #4000-#BFFF
	xor		a
	ld		hl,#4000
	ld		e,l
	ld		d,h
	inc		de
	ld		(hl),a
	ld		bc,#3fff
	LDIR	
		
	LD 		BC,#DF00+0+#80:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	LD 		BC,#7FC0:OUT (c),c					; Mode C0 : on choisit D'ECRIRE  dans la RAM centrale
	
		
		
	
	;  à réactiver après le crocofest	
		;ld		a,(GoldorakMort)
		;cp		a,1		
		;jp		z,game_over


		jp		crocofest
		;jp		shop
		;jp		fin

change_musique
di
call	PLY_AKG_Stop
call	music_off
ld 		hl,Music


ld		a,(no_de_la_musique)
inc		a
ld		(no_de_la_musique),a
cp		a,7
call	z,reinit_no_musique

		call 	PLY_AKG_Init
		call	music_on
ei
	jp	retour_test_de_CPC_plus
reinit_no_musique
xor 	a
ld	(no_de_la_musique),a
ret
	
	
	
music_on_off
	ld 		hl,Music
	ld  	a,6
	call 	PLY_AKG_Init
	jp		retour_test_de_CPC_plus




no_de_la_musique		ds			1,0





			
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////////       FICHIERS      /////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
include"05-Init_affichage.asm"
include"06-Init_de_jeu.asm"
include"07-arrimage.asm"
include"08-deplacements.asm"
include"09-armes_fireA.asm"
include"10-armes_fireB.asm"
include"11-vagues_ennemis.asm"
include"12-soucoupes.asm"
include"13-collisions_ennemis.asm"
include"14-tirs_soucoupes.asm"
include"15-gestion_du_hud.asm"
include"16-Init_switch_1_2_joueurs.asm"
include"17-gestion_venusiak.asm"
include"18-mouvements_soucoupes.asm"
include"A-interruptions.asm"
include"B-interrupteurs.asm"
include"W-player_PSG.asm"
include"Y-constantes.asm"
include"Z-variables.asm"




; /////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////
bank 3
	ORG PLAYER_ADR_RAM
	;org	#c000
		include"Goldorak_musiques_playerconfig.asm"
		include"PlayerAkg.asm"						; #0d54 de longueur
 ; La configuration n'est pas obligatoire, mais elle permet
        ; de réduire la taille du binaire produit (ici 1.6K au lieu de 1.8K)
	;ORG #cc60
	ORG MUSIC_ADR_RAM
		Music
			include"Goldorak_musiques.asm"
		SoundEffects
			include"Goldorak_soundeffects.asm"



	

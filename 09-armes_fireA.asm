; ////////////////////////////////////////////////
; ////////////////////////////////////////////////
; /////////////////    FIRE A    /////////////////
; ////////////////////////////////////////////////
; ////////////////////////////////////////////////
fireA

	ld		a,(flag_fireA)
	cp		a,1
	jp		z,retour_test_des_tirs

	ld		a,(flag_mode_2_joueur)
	cp		a,0
	jp		nz,arme_tiny_goldo
	
	
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////      TINY GOLDORAK TIR    ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_tiny_goldo
	RST		ASIC_CONNEXION
	ld		a,(etp_arme2)
	cp		a,0
	jp		z,init_tiny_gamma
	cp		a,1
	jp		z,tiny_gamma1
	cp		a,2
	jp		z,tiny_gamma2

init_tiny_gamma
	ld 		a,SFX_ATTACK	 ;Sound effect number (>=1)
    ld 		c,1 ;channel (0-2)
    ld 		b,0 ;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	inc 	a:ld (etp_arme2),a										; on incrémente les étapes de l'arme
	ld		a,1
	ld 		(flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
	ld		a,1
	ld 		(flag_armes),a									; une arme est en cours de déclanchement

	ld		c,BANK9_GOLDORAK_SPRH: RST 0									; on se connection à la rom où se situes les sprites hard de cette arme
	ld		hl,Tir_tiny_goldo
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR		
											; on copie de puis la ROM vers l'ASIC	
	call	rom_off
	ld		a,_CALL
	ld		(event_arme_fireA),a
	ld		hl,arme_tiny_goldo
	ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
	RST		ASIC_DECONNEXION
	xor  a
	ld		(anim_arme_a_charger),a
	
	jp 		retour_test_des_tirs
tiny_gamma1
	inc		a:ld (etp_arme2),a
	ld		hl,(SPRH0_X)
	ld		de,16;+32
	add		hl,de
	ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16:add hl,de
	ld		(SPRH4_Y),hl
	;ld		a,zoom_mode1_2
	ld		a,zoom_mode1_1
	ld (SPRH4_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	RST		ASIC_DECONNEXION
	ret
tiny_gamma2
	;ld		a,1
	;ld		(id_joueur),a
	ld		hl,(SPRH4_Y)
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	or 		a
	ld		a,l
	ld		b,-8
	add		a,b
	jr		nc,fin_tiny_gamma
	ld		(SPRH4_Y),hl
	;call	test_collisions_tir_gauche_goldorak
	ret
fin_tiny_gamma
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld		(flag_fireA),a
	ld		(etp_arme2),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,-32
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	RST		ASIC_DECONNEXION
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret


	

aucune_arme
	RST		ASIC_CONNEXION
	;RST		#18
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld 		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a
	ld		(flag_fireA),a
	ld		(etp_arme1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	jp	retour_test_des_tirs







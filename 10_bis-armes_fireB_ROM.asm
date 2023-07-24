fin_attente_fireB_ROM
	ld 		a,SFX_WEAPONS_CHANGE	;Sound effect number (>=1)
    ld 		c,1 					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	
	xor		a
	ld		(counter_fireB),a
	ld		a,(id_arme)
	inc		a
	ld		(id_arme),a
	cp		a,1
	jp		z,affiche_boutton_1			; missile gamma

	
affiche_boutton_1
	ld		a,1
	ld		(id_arme),a
	ld		hl,HUD_BOUTON_ON_ADR
	ld		de,HUD_BOUTON1_ADR
	ld		b,HUD_HAUTEUR_BOUTTON
	call	bcl_affiche_bouton

	ld		a,FORCE_MISSILES_GAMMA
	ld		(points_attaque),a
	ret


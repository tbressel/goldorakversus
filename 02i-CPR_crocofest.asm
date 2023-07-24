
crocofest
; on reinitialise le crtc


CALL	reinit_crtc_et_retard_video
Asic ON
	xor		a
	ld 		(#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12

; /////////////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////// POSITIONNEMENT de L'ECRAN ///////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////////////////
	LD 		BC,#BC01:OUT (C),C			; rognage du bord droit de 16 caracteres (32 octets)
	LD 		BC,#BD00+40:OUT (C),C
	LD 		BC,#BC02:OUT (C),C			; on pousse l'ecran vers la droite pour le recentrer
	LD 		BC,#BD00+46:OUT (C),C
	LD 		BC,#BC07:OUT (C),C			; on decale l'ecran vers le haut
	LD 		BC,#BD00+30:OUT (C),C
	LD 		BC,#BC06:OUT (C),C			; on agrandit l'ecran vers le bas
	LD 		BC,#BD00+25:OUT (C),C
Asic OFF	

	
LD 		BC,BANK18_CROCOFEST:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#c000							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse
	
	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

Asic ON
; copie de la palette CPC+ (logé en bank 19) specialement pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_CROCOFEST						; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	ld		hl,PALETTE_CROCOFEST							; lecture
	ld		de,Adresse_pallette_screen							; ecriture
	ld		bc,#20								; longueur
	LDIR
Asic OFF
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c			
; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           du              //////////////
; /////////////////////////        CROCOFEST         ///////////////
; //////////////////////////////////////////////////////////////////

call	AffichageScores


boucle_crocofest
	ld      b,#F5
VBL_crocofest
	in      a,(c)
	rra
	jr 		nc,VBL_crocofest
call	lecture_clavier
	bit		4,a
	jp		z,preparation_du_jeu
	jp boucle_crocofest


	
	
AffichageScores
	ld		hl,MemoireTamponJoueur_1
	ld		b,10*8
	call	convertir_les_encres_scores
	ld		hl,MemoireTamponJoueur_2
	ld		b,10*8
	call	convertir_les_encres_scores










	ld		hl,MemoireTamponJoueur_1
	ld		de,SCORE_J1_SCR
	exx
	ld		hl,MemoireTamponJoueur_2
	ld		de,SCORE_J2_SCR
	exx
	ld		b,8
		.boucle
			push	bc				; sauvegarde du compteur de ligne 
			push	de				; sauvegarde adresse ecran du score des joueurs
			ld		bc,10			; longeur d'une ligne du score
			LDIR
			pop		de
			ld		a,d
			add		a,#8
			ld		d,a
			
			exx
			push	de
			ld		bc,10
			LDIR
			pop		de
			ld		a,d
			add		a,#8
			ld		d,a
			exx	
			
			
			pop		bc
			djnz	.boucle
			ret	
				convertir_les_encres_scores
					ld		a,(hl)
					cp		a,#94
					jp		z,change_encre_1
					cp		a,#3c
					jp		z,change_encre_2
					cp		a,#c4
					jp		z,change_encre_3
					cp		a,#C0
					jp		z,change_encre_4
					cp		a,#CC
					jp		z,change_encre_5
					cp		a,#68
					jp		z,change_encre_6
					cp		a,#C8
					jp		z,change_encre_7
					inc		hl
					dec		b
					ret		z
					jp		convertir_les_encres_scores
				
						change_encre_1
							ld		a,#11
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_2
							ld		a,#33
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_3
							ld		a,#41
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_4
							ld		a,0
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_5
							ld		a,#F3
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_6
							ld		a,#22
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
						change_encre_7
							ld		a,#82
							ld		(hl),a
							inc		hl
							jp		convertir_les_encres_scores
	
	
	
	
	
	
	
	
	
	


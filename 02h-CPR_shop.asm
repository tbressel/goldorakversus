
shop
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

	
	LD 		BC,BANK4_MENU:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#E250							; lecture dans la bank ROM
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
	ld		hl,PALETTE_SHOP						; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	ld		hl,PALETTE_SHOP							; lecture
	ld		de,Adresse_pallette_screen							; ecriture
	ld		bc,#20								; longueur
	LDIR
Asic OFF
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c			
; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           du              //////////////
; /////////////////////////        METAMORPHOSE         ///////////////
; //////////////////////////////////////////////////////////////////
	ld	sp,#BFFE



boucle_shop
	ld      b,#F5
VBL_shop
	in      a,(c)
	rra
	jr 		nc,VBL_shop
	
	
	
	
	
	call	lecture_clavier
	bit		4,a
	jp		z,PreparationLevelSuivant

	jp boucle_shop


PreparationLevelSuivant
	call	FADE_OUT
	
	
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
		; mise à zéros de la bank #4000-#BFFF
	xor		a
	ld		hl,#4000
	ld		e,l
	ld		d,h
	inc		de
	ld		(hl),a
	ld		bc,#3fff
	LDIR
	
	jp		init_nouveau_level



PreparationEcran
; /////////////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////// POSITIONNEMENT de L'ECRAN ///////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////////////////
	LD 		BC,#BC01:OUT (C),C			; rognage du bord droit de 16 caracteres (32 octets)
	LD 		BC,#BD00+32:OUT (C),C
	LD 		BC,#BC02:OUT (C),C			; on pousse l'ecran vers la droite pour le recentrer
	LD 		BC,#BD00+42:OUT (C),C
	LD 		BC,#BC07:OUT (C),C			; on decale l'ecran vers le haut
	LD 		BC,#BD00+34:OUT (C),C		; 35
	LD 		BC,#BC06:OUT (C),C			; on agrandit l'ecran vers le bas
	LD 		BC,#BD00+32:OUT (C),C

; //////////////////////////////////////////////////////////////////
; //////////////////////////    RUPTURE     /////////////////////////
; //////////////////////////////////////////////////////////////////
	ld 		bc,#bc00+12:out (c),c   			;R12 selectionne
	ld 		bc,#bd00+#10:out (c),c 				;Ecran en #4000
	Asic ON
	ld		a,LGN_RUPTURE_HUD:ld (#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12
	ld 		bc,#bc00+12:out (c),c      			; R12 selectionne
	ld 		bc,#BD00+#30:out (c),c 				; Ecran en #c000
	Asic off
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////////    COPIE des palettes       /////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 01 (#01)
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	ld		hl,PALETTE_DECORS							; lecture  de la palette du décors
	ld		de,PALETTE_DECORS_RAM							; ecriture
	ld		bc,32							; longueur
	LDIR
	ld		hl,PALETTE_HUD							; lecture de la palette du hud
	ld		de,PALETTE_HUD_RAM							; ecriture
	ld		bc,32							; longueur
	LDIR
	
		ld		hl,event_test_de_goldorak
		ld		a,_JP
		ld		(event_test_de_goldorak),a
		ld		hl,test_de_goldorak
		ld		(event_test_de_goldorak+1),hl
	;call	affiche_hud_interlevel
	ret
; /////////////////////////////////////////////////////////////////////
; BON !! C'EST LA MERDASSE	 ! Je me rends compte qu'une fois le Niveau 1 terminé,
; et de retour sur magasin d'arme lu dans la ROM basse (qui au passage utilise certaines adresse en banque 8000),
; et bah .... de retour dans mon programme principale certaine partie ont été ecrasé .... c'est la merde.


aide_du_jeu
	
call	FADE_OUT
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
	Asic on
	xor		a
	ld 		(#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12

Asic OFF
LD 		BC,BANK4_MENU:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#C000							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse

	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

		

; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           de              //////////////
; /////////////////////////        CREDITS           ///////////////
; //////////////////////////////////////////////////////////////////
	
	ld		de,#c000	
	ld		(AdrTexteEcran),de
	call	fonte3
	
	CALL 	AfficheTexte2	
	
	Asic ON
; copie de la palette CPC+ (logé en bank 19) specialement pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_CREDIT						; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	ld		hl,PALETTE_CREDIT							; lecture
	ld		de,Adresse_pallette_screen							; ecriture
	ld		bc,#20								; longueur
	LDIR
Asic OFF
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c	
	
	
boucle_aide
	ld      b,#F5
VBL_aide
	in      a,(c)
	rra
	jr 		nc,VBL_aide

	call	lecture_clavier
	bit		4,a
	jp		z,le_menu


	jp boucle_aide



Texte_Aide
	DEFM "          CHOISIR SA NAVETTE !!!        "		; ligne 1
	DEFM "                                        "
	DEFM "VOUS AVEZ LE CHOIS ENTRE :              "
	DEFM "         1 - GOLDORAK                   "		; ligne 4
	DEFM "         2 - VENUSIAK                   "
	DEFM "         3 - ALCORAK                    "		
	DEFM "         4 - OV TERRE                   "		; ligne 7
	DEFM "                                        "
	DEFM " HAUT & BAS : POUR CHOISIR              "
	DEFM " FIRE 2     : POUR VALIDER VOTRE CHOIX  "		; LIGNE 10
	DEFM " FIRE 1     : POUR COMMENCER LA PARTIE  "		
	DEFM "----------------------------------------"		; ligne 13
	DEFM "                                        "
	DEFM "     LE JEU    (VERSUS 2 JOUEURS)       "
	DEFM "                                        "		; ligne 17
	DEFM " FAITES LE PLUS GROS SCORE EN DEGOMMANT "		; ligne 18
	DEFM " LE PLUS DE NAVETTES POUR RAMMASSER VOS "
	DEFM "POINTS. MAIS SI VOUS RAMASSER LES POINTS"
	DEFM "D'UNE NAVETTE TUEE PAR VOTRE ADVERSAIRE "
	DEFM "VOUS LUI DONNEZ LES POINTS RAMMASSES !! "
	DEFM "                                        "
	DEFM "                         ZISQUIER       "
	DEFM "                                        "
	DEFM "' LE PLUS TU AURAS, DU BOUT DU DOIGTS   "
	DEFM " VENUSIA SE DEVOILERA '                 "





	;DEFM "  AST (IMP DRAW), ROUD (RASM), LZAMU,   "		
	;DEFM "TOTO, BDCIRON (ZILOG.FR), DEAD SYSTEM,  "		
	;DEFM "12345678, 12345678, 12345678, 12345678, "
	;DEFM "123456789AB, 123456789AB, 123456789AB,  "
	;DEFM "12345678, 12345678, 12345678, 12345678, "
	;DEFM "123456789AB, 123456789AB, 123456789AB,  "
	;DEFM "12345678, 12345678, 12345678, 12345678, "
	;DEFM "123456789AB, 123456789AB, 123456789AB,  "
	;DEFM "123456789AB, 123456789AB, 123456789AB   "

AfficheTexte2
	ld		HL,Texte_Aide		; adresse du texte à afficher

	NouvelleLigneDeTexte2
			ld		b,25
				Boucle_NouvelleLigne2
					push	bc
					Push	DE
				
					ld	a,40			; il ya 24 lettres MAXIMUM par ligne (octets)
					ld	b,a				; on met dans le reg b, qui sera le compteur
					LD 	A,(HL)        	;l'adresse de HL qui contient 1 octet est mis dans A (le numero ASCII de "H" donc #48 en hexa ou 72 en dec)
						CalculeLettre2
							push 	bc			; on sauve l'état du compteur
							Push 	hl			; on sauve l'adresse de la lettre en cours
							
							add		a,-32
							LD 		L,A	 		; donc met le resultat dans L
							LD 		H,0        	; on met 0 dans H (car H ne doit pas etre vide)
							
							ADD 	HL,HL        ; 40 + 40 = 80  ca fait x2
							ADD 	HL,HL        ; 80 + 80 = 160  ca fait x4
							ADD 	HL,HL        ; 160 + 160 = 320  ca fait x8
							ADD 	HL,HL        ; 320 + 320 = 640  ca fait x16
							LD 		DE,(AdrTypeDeFonte)      ;on met #4000 dans DE qui correspond a l'adresse de notre fonte ->dans la RAM<-
							ADD 	HL,DE        ;on additionne pour avoir l'adresse de la lettre ->dans la RAM<-
							
							LD 		BC,BANK_FONTES:OUT (C),C				; on choisit DE LIRE la ROM 14
							LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
							LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
							ld		b,8
							
							ld		de,(AdrTexteEcran)
							push	de
							call	OnAfficheUneLettre
							pop		de
							inc		de
							inc		de
							ld		(AdrTexteEcran),de
							
							pop 	hl			; on recupère l'adresse de la lettre en cours
							inc 	hl			; on pointe sur l'octet suivant
						
							LD 		A,(HL) 			; on met dans A l'octet contenu dans HL
							pop 	bc
							djnz	CalculeLettre2
							POP		DE
	ld		bc,#0050
	ex		de,hl
	add		hl,bc
	ex		hl,de
					ld		(AdrTexteEcran),de
					
					
					push	af
					push	hl
					ld		a,(NoLigneDeTexte)
					inc		a
					ld		(NoLigneDeTexte),a
					cp		a,3
					call	z,fonte1
					cp		a,8
					call	z,fonte2
					cp		a,11
					call	z,fonte3
					cp		a,12
					call	z,fonte4
					cp		a,23
					call	z,fonte2
					pop		hl
					pop		af				
					pop		bc
					djnz	Boucle_NouvelleLigne2
					ret




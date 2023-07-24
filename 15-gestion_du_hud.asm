; 10 000 	: L
; 1 000  	: H
; 100		: E
; 10		: D
; 1			: C	

; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
score_items
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	score_items_ROM
	call	rom_off	
	ret
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
score_BOOM
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	score_BOOM_ROM
	call	rom_off
	ret
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
afficher_le_score
	ld		a,(no_id_joueur)
	cp		a,1
	jp		z,afficher_score_goldorak
	cp		a,2
	jr		z,afficher_score_venusiak
afficher_score_goldorak
	; on déplace les adresse du compteur de point à l'écran dans le hud 2
	ld		hl,(val_HUD_SCORE_UNITE_ADR_hudJ1)
	ld		(HUD_SCORE_UNITE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_DIZAINNE_ADR_hudJ1)
	ld		(HUD_SCORE_DIZAINNE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_CENTAINE_ADR_hudJ1)
	ld		(HUD_SCORE_CENTAINE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_MILLIER_ADR_hudJ1)
	ld		(HUD_SCORE_MILLIER_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ1)
	ld		(HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hud),hl
	exx
	ld		a,c
	ld		(Counter_score+4),a			; on écrit en RAM les unitées
	ld		a,D
	ld		(Counter_score+3),a			; on écrit en RAM les dizaines
	ld		a,E
	ld		(Counter_score+2),a			; on écrit en RAM les centaines
	ld		a,h
	ld		(Counter_score+1),a			; on écrit en RAM les milliers
	ld		a,l
	ld		(Counter_score),a			; on écrit en RAM les dizaine de milliers
	exx
	jr		afficher_suite_score
afficher_score_venusiak
	; on déplace les adresse du compteur de point à l'écran dans le hud 2
	ld		hl,(val_HUD_SCORE_UNITE_ADR_hudJ2)
	ld		(HUD_SCORE_UNITE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_DIZAINNE_ADR_hudJ2)
	ld		(HUD_SCORE_DIZAINNE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_CENTAINE_ADR_hudJ2)
	ld		(HUD_SCORE_CENTAINE_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_MILLIER_ADR_hudJ2)
	ld		(HUD_SCORE_MILLIER_ADR_hud),hl
	ld		hl,(val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ2)
	ld		(HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hud),hl
	exx
	ld		a,c
	ld		(Counter_score2+4),a			; on écrit en RAM les unitées
	ld		a,D
	ld		(Counter_score2+3),a			; on écrit en RAM les dizaines
	ld		a,E
	ld		(Counter_score2+2),a			; on écrit en RAM les centaines
	ld		a,h
	ld		(Counter_score2+1),a			; on écrit en RAM les milliers
	ld		a,l
	ld		(Counter_score2),a			; on écrit en RAM les dizaine de milliers
	exx
afficher_suite_score
	RST		ASIC_DECONNEXION
	ld		c,BANK8_HUD
	RST 	UPPER_ROM_CONNEXION
	; ici j'utilise le fait que les opcode se suivent de cette façon
	; c'est donc exprès que j'ai commencé par le registre C pour sauvegarder
	; mes 5 décimales dans les 5 registre 8 bits
	; comme çà j'incrémente juste l'opcode
	; ld	a,b  = #78    ---> non utilisé pour le score
	; ld	a,C  = #79	
	; ld	a,d  = #7A	
	; ld	a,e  = #7B
	; ld	a,h  = #7C
	; ld	a,l  = #7D
	ld		hl,(HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hud)
	ld		(pointeur_chiffre_SCR),hl
	ld		b,5
boucle_affichage_du_score
	push	bc
	exx
automodif_registre	
	ld		a,l						
	exx
	add		a,a
	add		a,a
	add		a,a
	add		a,a
	ld		h,0
	ld		l,a
	ld		de,HUD_FONTE_OK+#100				; on obtient l'adresse de la lettre. #100 donne le caractere "0" comme départ de al fonte
	add		hl,de
	ld		de,(pointeur_chiffre_SCR)		; adresse écran du chiffre en cours (de place tout les 2 octets à l'écran
	ld		b,8
.boucle_fonte_score
	push	bc
	ldi
	ldi
	dec		de
	dec		de
	ld		a,d
	add		a,#8
	ld		d,a
	pop		bc
	dec		b
	jr		nz,.boucle_fonte_score
; on recupère le pointeur d'écran et on l'incrémente pour passer au chiffre suivant
	ld		hl,(pointeur_chiffre_SCR)
	inc		hl
	inc		hl
	ld		(pointeur_chiffre_SCR),hl
; on automodifie le registre pour lire le suivant
	ld		a,(automodif_registre)
	dec		a
	ld		(automodif_registre),a
	pop		bc
	dec		b	
	jp		nz,boucle_affichage_du_score
	ld		a,#7d			; ld a,l
	ld		(automodif_registre),a
	;call	rom_off
	ret

; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
inc_one_life_j1etj2
	ld		a,(id_joueur)
	cp		a,2
	jr		z,inc_one_life_j2
inc_one_life
	ld		a,(flag_1up)
	cp		a,1
	ret		z
	ld		a,1
	ld		(flag_1up),a
	call 	asic_off
	ld		c,BANK8_HUD
	RST 	UPPER_ROM_CONNEXION
	ld		a,(nbr_de_vie)
	cp		a,9
	ret		z
	inc		a
	ld		(nbr_de_vie),a
	ld		hl,HUD_VIEJ1_ECRAN_ADR
	ld		(HUD_VIEJ1_ECRAN_ADR_SCR),hl
	jr		quand_on_perd_une_vie
inc_one_life_j2
	ld		a,(flag_1up)
	cp		a,1
	ret		z
	ld		a,1
	ld		(flag_1up),a
	call 	asic_off
	ld		c,BANK8_HUD
	RST 	UPPER_ROM_CONNEXION
	ld		a,(nbr_de_vie_j2)
	cp		a,9
	ret		z
	inc		a
	ld		(nbr_de_vie_j2),a
	ld		hl,HUD_VIEJ2_ECRAN_ADR
	ld		(HUD_VIEJ1_ECRAN_ADR_SCR),hl
	
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
quand_on_perd_une_vie				; on arrive ici quand on perd une vie
	add		a,a						; x2
	add		a,a						; x4
	add		a,a						; x8
	add		a,a						; x16
	ld		h,0
	ld		l,a							
	ld		de,HUD_FONTE_OK+#100			; on obtient l'adresse de la lettre. #100 donne le caractere "0" comme départ de al fonte
	add		hl,de
; on affiche la lettre calculée
	ld		de,(HUD_VIEJ1_ECRAN_ADR_SCR)		; adresse écran du chiffre en cours (de place tout les 2 octets à l'écran
	ld		b,HUD_FONTE_HAUTEUR
.boucle_fonte_score
	push	bc
	ldi
	ldi
	dec		de
	dec		de
	ld		a,d
	add		a,#8
	ld		d,a
	pop		bc
	dec		b
	jr		nz,.boucle_fonte_score
	RST		ASIC_CONNEXION
	call	rom_off
	ret
	
	
	
diminue_NRJ_bar

	RST		ASIC_DECONNEXION
	ld		hl,(pointeur_tbl_NRJ_bar)		; lecture de la table
	ld		d,(hl)							; on recupère le poid faible
	dec		hl
	ld		e,(hl)							; on recupère le poid fort
	ld		a,HUD_NRJ_PIXEL_NOIR					; valeur dde 2 pixel noir
	ld		(de),a							; on envoie à l'ecran
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
	dec		hl
	ld		(pointeur_tbl_NRJ_bar),hl
	RST		ASIC_CONNEXION
	ret
	
diminue_NRJ_bar_J2
	RST		ASIC_DECONNEXION
	ld		hl,(pointeur_tbl_NRJ_bar2)		; lecture de la table
	ld		d,(hl)							; on recupère le poid faible
	dec		hl
	ld		e,(hl)							; on recupère le poid fort
	ld		a,HUD_NRJ_PIXEL_NOIR					; valeur dde 2 pixel noir
	ld		(de),a							; on envoie à l'ecran
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
; ligne du dessous	
	ld		a,d
	add		a,#8
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_NOIR
	ld		(de),a
	dec		hl
	ld		(pointeur_tbl_NRJ_bar2),hl
	RST		ASIC_CONNEXION
	ret

on_perd_une_vie
	ld		a,(id_joueur)
	cp		a,1
	jr		z,goldorak_perds_un_vie


venusiak_perds_un_vie
	ld		a,(nbr_de_vie_j2)
	dec		a
	cp		a,-1
	jp		z,venusiak_explose
	ld		(nbr_de_vie_j2),a
	ld		hl,HUD_VIEJ2_ECRAN_ADR
	ld		(HUD_VIEJ1_ECRAN_ADR_SCR),hl
	call 	asic_off
	ld		c,BANK8_HUD
	RST 	UPPER_ROM_CONNEXION
	ld		a,(nbr_de_vie_j2)
	jr		on_saute_vie_goldorak
goldorak_perds_un_vie

	ld		a,(nbr_de_vie)
	dec		a
	cp		a,-1
	jp		z,goldorak_explose
	ld		(nbr_de_vie),a
	ld		hl,HUD_VIEJ1_ECRAN_ADR
	ld		(HUD_VIEJ1_ECRAN_ADR_SCR),hl
	call 	asic_off
	ld		c,BANK8_HUD
	RST 	UPPER_ROM_CONNEXION
	ld		a,(nbr_de_vie)
on_saute_vie_goldorak
	call	quand_on_perd_une_vie
	
	
inc_NRJ_item
	RST		ASIC_DECONNEXION
	ld		a,(id_joueur)
	cp		a,2
	jr		z,inc_NRJ_item_J2	
	ld		a,10
	ld		(points_sante),a
	ld		hl,Tbl_NRJ_bar+19
	ld		(pointeur_tbl_NRJ_bar),hl
	ld		b,10
boucle_nrj_bar
	ld		d,(hl)							; on recupère le poid faible
	dec		hl
	ld		e,(hl)							; on recupère le poid fort
	ld		a,HUD_NRJ_PIXEL_VERT
	ld		(de),a
	ld		a,8+8+8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_VERT
	ld		(de),a
	ld		a,-8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_BLEU
	ld		(de),a
	ld		a,-8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_BLEU
	ld		(de),a
	dec		hl
	ld		(pointeur_tbl_NRJ_bar),hl
	dec		b
	jr		nz,boucle_nrj_bar
	ld		hl,Tbl_NRJ_bar+19
	ld		(pointeur_tbl_NRJ_bar),hl
	ret
inc_NRJ_item_J2
	ld		a,10
	ld		(points_sante_J2),a
	ld		hl,Tbl_NRJ_bar2+19
	ld		(pointeur_tbl_NRJ_bar2),hl
	ld		b,10
boucle_nrj_barJ2
	ld		d,(hl)							; on recupère le poid faible
	dec		hl
	ld		e,(hl)							; on recupère le poid fort
	ld		a,HUD_NRJ_PIXEL_VERT
	ld		(de),a
	ld		a,8+8+8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_VERT
	ld		(de),a
	ld		a,-8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_BLEU
	ld		(de),a
	ld		a,-8
	add		a,d
	ld		d,a
	ld		a,HUD_NRJ_PIXEL_BLEU
	ld		(de),a
	dec		hl
	ld		(pointeur_tbl_NRJ_bar2),hl
	dec		b
	jr		nz,boucle_nrj_barJ2 	
	ld		hl,Tbl_NRJ_bar2+19
	ld		(pointeur_tbl_NRJ_bar2),hl
	ret


///////////////////	


SauvegardeScores
	
	ld		hl,HUD_SCOREJ1_DIZAINE_DE_MILLIER_ADR
	ld		de,MemoireTamponJoueur_1
	ld		b,8	
	exx
	ld		hl,HUD_SCOREJ2_DIZAINE_DE_MILLIER_ADR
	ld		de,MemoireTamponJoueur_2
	exx
.boucle
	push	bc
	
	push	hl
	ld		bc,10
	LDIR
	pop		hl
	ld		a,h
	add		a,#8
	ld		h,a
	
	exx
	push	hl
	ld		bc,10
	LDIR
	pop		hl
	ld		a,h
	add		a,#8
	ld		h,a
	exx
	
	pop		bc
	djnz	.boucle
	ret








; //////////////////////////////////////////////////////////////////
; /////////////////////        MOTEUR DU JEU    ////////////////////
; //////////////////////////////////////////////////////////////////
; connexion asic, rom et mode
valeur_asic					ds		1,0
rom_sectionnee				ds		2,0
etat_de_la_rom				ds		2,0
etat_du_mode				ds		2,0
mode						ds		1,0
etat_roms_mode				ds		2,0
resultat_test_de_touche		ds		1,0
resultat_test_de_touche_cpcplus		ds		1,0

bank_level					ds		2,0
bank_tileset				ds		2,0
adr_screen_level			ds		2,0
pointeur_de_tile			ds		2,0
musique_en_cours			ds		1,0		
J1etJ2Mort					ds		1,0	

; //////////////////////////////////////////////////////////////////
; /////////////////////  ARMES DU JEU   /////////////////////////
; //////////////////////////////////////////////////////////////////

flag_fireA					ds		1,0
adr_type_arme				ds		2,0
pointeur_type_arme			ds		2,0
id_arme						ds		1,0

flag_armes					ds		1,0
etp_arme1					ds		1,0
etp_arme2					DS		1,0
etp_arme3					DS		1,0
etp_arme4					ds		1,0
etp_arme5					ds		1,0
etp_arme6					ds		1,0
etp_arme7					ds		1,0

; Fulguro poing
counter_pre_poing			ds		1,0
etp_pre_poing				ds		1,0
flag_fulguro				ds		1,0
etp_direction_fulguro		ds		1,0

; plantiron
etp_anim_planitron			ds		1,0
adr_anim_planitron			ds		2,0

; planitron 2
etp_anim_planitron2			ds		1,0
adr_anim_planitron2			ds		2,0
timer_planitron2			ds		1,0

; Astero Hache
etp_anim_clavicogyres		ds		1,0
adr_anim_clavicogyres		ds		2,0
timer_clavicogyres			ds		1,0


; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////	
adr_tbl_points_soucoupe				ds		2,0
posy_soucoupe						ds		2,0
posx_soucoupe						ds		2,0

	
	nbr_de_points				ds		1,0
	nbr_de_vie					ds		1,0
	points_sante				ds		1,0
	
	
	pointeur_tbl_NRJ_bar		ds		2,0
Tbl_NRJ_bar
	dw		HUD_NRJJ1_ECRAN_ADR,HUD_NRJJ1_ECRAN_ADR+1,HUD_NRJJ1_ECRAN_ADR+2,HUD_NRJJ1_ECRAN_ADR+3,HUD_NRJJ1_ECRAN_ADR+4
	dw		HUD_NRJJ1_ECRAN_ADR+5,HUD_NRJJ1_ECRAN_ADR+6,HUD_NRJJ1_ECRAN_ADR+7,HUD_NRJJ1_ECRAN_ADR+8,HUD_NRJJ1_ECRAN_ADR+9

Tbl_NRJ_bar2
	dw		HUD_NRJJ2_ECRAN_ADR,HUD_NRJJ2_ECRAN_ADR+1,HUD_NRJJ2_ECRAN_ADR+2,HUD_NRJJ2_ECRAN_ADR+3,HUD_NRJJ2_ECRAN_ADR+4
	dw		HUD_NRJJ2_ECRAN_ADR+5,HUD_NRJJ2_ECRAN_ADR+6,HUD_NRJJ2_ECRAN_ADR+7,HUD_NRJJ2_ECRAN_ADR+8,HUD_NRJJ2_ECRAN_ADR+9

PowerupBar_ECRAN			ds		2,0
compteur_powerup_niv1		ds		1,0
compteur_powerup_niv2		ds		1,0
CompteurFramePowerUp	ds		1,0
flag_PowerUP	ds		1,0
etp_powerup		ds		1,0
pointeur_tbl_PowerUP_bar	ds		2,0
Tbl_POWERUP_bar
	dw		HUD_DEPART_POWER_UP1+-3,HUD_DEPART_POWER_UP1+-2,HUD_DEPART_POWER_UP1+-1,HUD_DEPART_POWER_UP1
	dw		HUD_DEPART_POWER_UP2+-3,HUD_DEPART_POWER_UP2+-2,HUD_DEPART_POWER_UP2+-1,HUD_DEPART_POWER_UP2

	
Tbl_etp_soucoupes
	etp_soucoupe1				ds		1,0
	etp_soucoupe2				ds		1,0
	etp_soucoupe3				ds		1,0
	etp_soucoupe4				ds		1,0
	etp_soucoupe5				ds		1,0
	etp_soucoupe6				ds		1,0
	
Tbl_VALEUR_TIMER_soucoupes				; mini tableau qui gere le départ de 3 soucoupes basique
		db	32,16,1,32,16,1
	
Tbl_timer_depart_soucoupes
	timer_depart_soucoupe1		ds		1,0
	timer_depart_soucoupe2		ds		1,0
	timer_depart_soucoupe3		ds		1,0
	timer_depart_soucoupe4		ds		1,0
	timer_depart_soucoupe5		ds		1,0
	timer_depart_soucoupe6		ds		1,0

Tbl_timer_BOOM_soucoupe
	timer_BOOM_soucoupe1		ds		1,0
	timer_BOOM_soucoupe2		ds		1,0
	timer_BOOM_soucoupe3		ds		1,0
	timer_BOOM_soucoupe4		ds		1,0
	timer_BOOM_soucoupe5		ds		1,0
	timer_BOOM_soucoupe6		ds		1,0

AdrPointeur_DeplacementSoucoupe1	ds		2,0
AdrPointeur_DeplacementSoucoupe2	ds		2,0
AdrPointeur_DeplacementSoucoupe3	ds		2,0
AdrPointeur_DeplacementSoucoupe4	ds		2,0
AdrPointeur_DeplacementSoucoupe5	ds		2,0
AdrPointeur_DeplacementSoucoupe6	ds		2,0

Valeur_DeplacementSoucoupe1		ds		1,0
Valeur_DeplacementSoucoupe2		ds		1,0
Valeur_DeplacementSoucoupe3		ds		1,0
Valeur_DeplacementSoucoupe4		ds		1,0
Valeur_DeplacementSoucoupe5		ds		1,0
Valeur_DeplacementSoucoupe6		ds		1,0
	
vitesse_soucoupe		ds		1,0
count_anim_soucoupe		ds		1,0
pointeur_tbl_level		ds		2,0
adr_item_ROM			ds		2,0
pointeur_tbl_point		ds		2,0
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////

GoldorakMort				ds		1,0
VenusiakMort				ds		1,0
BoomVenusiakEtp				ds		1,0
BoomVenusiakSprhRomAdr		ds		2,0
BoomVenusiakTimerAdr		ds		1,0

valeur_retard				ds		1,0
valeur_crtc					ds		2,0
valeur_offset				ds		2,0
pointeur_ecran				ds		2,0
vitesse_scroll				ds		1,0
etape_vitesse				ds		1,0
flag_crtc					ds		1,0
posy_goldorak				ds		2,0
posx_goldorak				ds		2,0
posy_venusiak				ds		2,0
posx_venusiak				ds		2,0
posy2						ds		2,0
posx2						ds		2,0
timer						ds		1,0
flag_1up					ds		1,0
flag_goldomode				ds		1,0

bloc_tile					ds		1,0
no_ligne_tile				ds		1,0
BoomSprhRomAdr				ds		 	2,0
timer_BOOM					ds		1,0
pts_BOOM					ds		2,0
points_a_ajouter			ds		2,0
flag_mode_2_joueur			ds		1,0
pointeur_tbl_regHUD			ds		2,0
resultat_test_de_touche_venusiak		ds		1,0
pointeur_chiffre_SCR		ds		2,0
largeur_texte				ds		2,0
pointeur_tbl_vignettes		ds		2,0
adr_chiffre					ds		2,0
largeur_chiffre				ds		1,0
sprh_goldorak				ds		2,0
sprh_goldorak2				ds		2,0
flag_percute				ds		1,0
flag_bomb					ds		1,0
etp_scroll_soft_hud			ds		1,0
flag_fireAB					ds		1,0
counter_fireB				ds		1,0
pointeur_bouton				ds		2,0
etp_arrimage				ds		1,0
nbr_de_vie_j2				ds		1,0
HUD_VIEJ1_ECRAN_ADR_SCR		ds		2,0
id_joueur					ds		1,0
flag_percute_j2				ds		1,0
points_sante_j2				ds		1,0
pointeur_tbl_NRJ_bar2		ds		2,0
count_anim_goldorak			ds		1,0
points_attaque				ds		1,0
vitesse_goldorak			ds		1,0
counter_poid_fort			ds		1,0
counter_poid_faible			ds		1,0

anim_arme_a_charger			ds		2,0
EtpGolgoth					ds		1,0
posX_Golgoth				ds		2,0
posY_Golgoth				ds		2,0				
Etp_Anim_Golgoth			ds		1,0
VitesseAnimGolgoth			ds		1,0
GolgothAdrRom				ds		2,0
GolgothSprh					ds		2,0
GolgothLongeur				ds		2,0
FlagGolgoth_Ferme			ds		1,0
Etp_Anim_Golgoth_Ouvert		ds		1,0

point_vie_golgoth			ds		1,0

point_vie_golgoth1			ds		1,0
point_vie_golgoth2			DS		1,0
point_vie_golgoth3			DS		1,0
point_vie_golgoth4			DS		1,0

Tbl_Golgoth_anim			ds 		4,0
PointeurUpdateGolgoth		ds		2,0

Golgoth_Queue_AdrRom	ds		2,0
Golgoth_Queue_Sprh		ds		2,0
Golgoth_Tete_Sprh		ds		2,0
Golgoth_Corp_Sprh		ds		2,0
Golgoth_Tete_AdrRom		ds		2,0
Golgoth_Corp_AdrRom		ds		2,0



GolgothAdrRom2			ds		2,0
GolgothSprh2			ds		2,0

Tbl_Golgoth3_anim			dw 		GOLGOTH3_SPRH_ADR_ROM_TETE_G,GOLGOTH3_SPRH_ADR_ROM_QUEUE_G
							dw		GOLGOTH3_SPRH_ADR_ROM_TETE_C,GOLGOTH3_SPRH_ADR_ROM_QUEUE_C
							dw		GOLGOTH3_SPRH_ADR_ROM_TETE_D,GOLGOTH3_SPRH_ADR_ROM_QUEUE_D
							dw		GOLGOTH3_SPRH_ADR_ROM_TETE_C,GOLGOTH3_SPRH_ADR_ROM_QUEUE_C

Tbl_Golgoth4_anim			dw 		GOLGOTH4_SPRH_ADR_ROM_ANIM1
							dw		GOLGOTH4_SPRH_ADR_ROM_ANIM2
							dw		GOLGOTH4_SPRH_ADR_ROM_ANIM3
							dw		GOLGOTH4_SPRH_ADR_ROM_ANIM2

flag_boss				ds	1,0

posX_Missile				ds		2,0
posY_Missile				ds		2,0
EtpMissileG1_1				ds		1,0
posX_MissileG1_1				ds		2,0
posY_MissileG1_1				ds		2,0
CompteurMissileG1_1			ds		1,0
MissileAdrRom				ds		2,0
MissileSprh					ds		2,0
MissileLongeur				ds		2,0
flag_updateMissileG1_1		ds		1,0



EtpMissileG1_2				ds		1,0
posX_MissileG1_2			ds		2,0
posY_MissileG1_2			ds		2,0
CompteurMissileG1_2			ds		1,0
flag_updateMissileG1_2		ds		1,0

EtpMissileG1_3				ds		1,0
posX_MissileG1_3			ds		2,0
posY_MissileG1_3			ds		2,0
CompteurMissileG1_3			ds		1,0
flag_updateMissileG1_3		ds		1,0

EtpMissileG1_4				ds		1,0
posX_MissileG1_4			ds		2,0
posY_MissileG1_4			ds		2,0
CompteurMissileG1_4			ds		1,0
flag_updateMissileG1_4		ds		1,0


EtpMissileG2_1				ds		1,0
posX_MissileG2_1			ds		2,0
posY_MissileG2_1			ds		2,0
CompteurMissileG2_1			ds		1,0
flag_updateMissileG2_1		ds		1,0


EtpMissileG2_2				ds		1,0
posX_MissileG2_2			ds		2,0
posY_MissileG2_2			ds		2,0
CompteurMissileG2_2			ds		1,0
flag_updateMissileG2_2		ds		1,0

EtpMissileG2_3				ds		1,0
posX_MissileG2_3			ds		2,0
posY_MissileG2_3			ds		2,0
CompteurMissileG2_3			ds		1,0
flag_updateMissileG2_3		ds		1,0


EtpMissileG3_1				ds		1,0
posX_MissileG3_1			ds		2,0
posY_MissileG3_1			ds		2,0
CompteurMissileG3_1			ds		1,0
flag_updateMissileG3_1		ds		1,0


EtpMissileG3_2				ds		1,0
posX_MissileG3_2			ds		2,0
posY_MissileG3_2			ds		2,0
CompteurMissileG3_2			ds		1,0
flag_updateMissileG3_2		ds		1,0

EtpMissileG3_3				ds		1,0
posX_MissileG3_3			ds		2,0
posY_MissileG3_3			ds		2,0
CompteurMissileG3_3			ds		1,0
flag_updateMissileG3_3		ds		1,0

FlagAnimGolgoth4_marche		ds		1,0
GolgothAdrRom_MarcheG		ds		2,0
GolgothAdrRom_MarcheD		ds		2,0

EtpTirEnnemis_4			ds		1,0
AttenteTirEnnemis_4		ds		1,0
EtpTirEnnemis_1			ds		1,0
AttenteTirEnnemis_1		ds		1,0
DirectionYTirEnnemis	ds		2,0
DirectionXTirEnnemis	ds		2,0
posy_soucoupe_tir		ds		2,0
posx_soucoupe_tir		ds		2,0


Pointeur_TblGolgoth_1		ds		2,0
Pointeur_TblGolgoth_2		ds		2,0
Pointeur_TblGolgoth_3		ds		2,0
Pointeur_TblGolgoth_4		ds		2,0
Pointeur_TblGolgoth_5		ds		2,0
Pointeur_TblGolgoth_6		ds		2,0
Pointeur_TblGolgoth_7		ds		2,0
Pointeur_TblGolgoth_8		ds		2,0
Compteur_DistanceGolgoth_1	ds		1,0
Compteur_DistanceGolgoth_2	ds		1,0
Compteur_DistanceGolgoth_3	ds		1,0
Compteur_DistanceGolgoth_4	ds		1,0
Compteur_DistanceGolgoth_5	ds		1,0
Compteur_DistanceGolgoth_6	ds		1,0
Compteur_DistanceGolgoth_7	ds		1,0
Compteur_DistanceGolgoth_8	ds		1,0
BigBoomSprhRomAdr			ds		2,0
flag_MortGolgoth			ds		1,0
GolgothBoomAdrRom			ds		2,0
Boom2SprhRomAdr				ds		2,0
Etp_ExploseGolgoth			ds		1,0
Compteur_ExploseGolgoth		ds		1,0


Pointeur_TblNombreDeSoucoupes		ds		2,0
pointeur_vague_fin					ds		2,0
Pointeur_TblTypeDeSoucoupe			ds		2,0
Pointeur_TblHorizVertiBasDroite		ds		2,0
Pointeur_TblHorizVertiBasGauche		ds		2,0


valeur_zoom
valeur_zoom_sprh0		ds	1,0
valeur_zoom_sprh1		ds	1,0
valeur_zoom_sprh2		ds	1,0
valeur_zoom_sprh3		ds	1,0
valeur_zoom_sprh4		ds	1,0
valeur_zoom_sprh5		ds	1,0
valeur_zoom_sprh6		ds	1,0
valeur_zoom_sprh7		ds	1,0
valeur_zoom_sprh8		ds	1,0
valeur_zoom_sprh9		ds	1,0
valeur_zoom_sprh10		ds	1,0
valeur_zoom_sprh11		ds	1,0
valeur_zoom_sprh12		ds	1,0
valeur_zoom_sprh13		ds	1,0
valeur_zoom_sprh14		ds	1,0
valeur_zoom_sprh15		ds	1,0





timer_fade_out			ds	1,0
adr_sample				ds	2,0
sample_counter			ds	1,0
longueur_sample			ds	2,0
sprh_a_charger			ds	1,0
direction_goldorak		ds	1,0
level_en_cours			ds	1,0
fini					ds	1,0

Tbl_sprh_direction
dw		0,0,0
Tbl_sprh_direction2
dw		0,0,0	
; 10 000 	: L
; 1 000  	: H
; 100		: E
; 10		: D
; 1			: C	

Counter_score
	;   L,H,E,D,C
	db	0,0,0,0,0
Counter_score2
	;   L,H,E,D,C
	db	0,0,0,0,0

HUD_SCORE_UNITE_ADR_hud							ds		2,0
HUD_SCORE_DIZAINNE_ADR_hud						ds		2,0
HUD_SCORE_CENTAINE_ADR_hud						ds		2,0
HUD_SCORE_MILLIER_ADR_hud						ds		2,0
HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hud			ds		2,0

val_HUD_SCORE_UNITE_ADR_hudJ1					ds		2,0
val_HUD_SCORE_DIZAINNE_ADR_hudJ1				ds		2,0
val_HUD_SCORE_CENTAINE_ADR_hudJ1				ds		2,0
val_HUD_SCORE_MILLIER_ADR_hudJ1					ds		2,0
val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ1		ds		2,0

val_HUD_SCORE_UNITE_ADR_hudJ2					ds		2,0
val_HUD_SCORE_DIZAINNE_ADR_hudJ2				ds		2,0
val_HUD_SCORE_CENTAINE_ADR_hudJ2				ds		2,0
val_HUD_SCORE_MILLIER_ADR_hudJ2					ds		2,0
val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ2		ds		2,0


MemoireTamponJoueur_1			ds			8*10,0
MemoireTamponJoueur_2			ds			8*10,0







ArmesDisponible				db			%00000001

AdrAnimGoldorakRet			ds			2,0
flag_deja_affiche			ds			1,0
flag_retournement			ds			1,0
EtpRetournement				ds			1,0
Compteur_Retournement		ds			1,0
Pointeur_Vitesse_Retournement		DS		2,0


courbe_sprh4			ds		2,0
courbe_sprh5			ds		2,0

BoomGoldorakEtp				ds		1,0
BoomGoldorakTimerAdr		ds		1,0
BoomGoldorakSprhRomAdr		ds		2,0
; //////////////////////////////////////////////////////////////////
; /////////////////////  SOUCOUPES DU JEU   /////////////////////////
; //////////////////////////////////////////////////////////////////
TBL_CONFIG_DES_SOUCOUPES
	id_soucoupe					ds		1,0
	adr_soucoupe_event			ds		2,0
	soucoupe_X					ds		2,0
	soucoupe_Y					ds		2,0
	adr_soucoupe				ds		2,0
	SPRH_ADR					ds		2,0
	SPRH_X						ds		2,0
	SPRH_Y						ds		2,0
	SPRH_ZOOM					ds		2,0
	valeur_zoom_sprh			ds		2,0
	etp_soucoupe				ds		2,0
	adr_timer_depart_soucoupe	ds		2,0
	adr_timer_BOOM_soucoupe		ds		2,0
	val_pts_item				ds		1,0
	no_id_joueur				ds		1,0
	points_de_vie				ds		1,0
	type_de_direction			ds		2,0
	pointeur_deplacement		ds		2,0
	valeur_decompte_deplacement ds		2,0
	
; 'NOM DU TABLEAU'	
	; identite de la soucoupe
	; adresse de la routine 'soucoupe' |||| position X de soucoupe
	; position Y de soucoupe
	; type de soucoupe |||| adresse sprite ASIC
	; Adresse posX ASIC |||| adresse posY ASIC ||||, adresse Zoom ASIC
	; valleur du zoom |||| etape d'explosion de la soucoupe |||| timer de depart de la soucoupe
	; vitesse de l'esplosion
	; resultat de la valeur de l'item |||| identité du joueur par defaut||| Points de vie
	; type de déplacement, pointeur de déplacement
	; valeur du decompte du déplacement
TblConfigSoucoupe1
	db	1											
	dw	0,32,-40											
	dw	0,SPRH6_ADR		
	dw	SPRH6_X,SPRH6_Y,SPRH6_ZOOM					
	dw	valeur_zoom_sprh6,etp_soucoupe1,timer_depart_soucoupe1		
	dw	timer_BOOM_soucoupe1										
	db	0,JOUEUR1,0
	dw	0,AdrPointeur_DeplacementSoucoupe1
	dw	Valeur_DeplacementSoucoupe1
TblConfigSoucoupe2
	db	2							; id de la soucoupe
	dw	0,56,-40					; soucoupe Y
	dw	0,SPRH7_ADR
	dw	SPRH7_X,SPRH7_Y,SPRH7_ZOOM
	dw	valeur_zoom_sprh7,etp_soucoupe2,timer_depart_soucoupe2
	dw	timer_BOOM_soucoupe2
	db	0,JOUEUR1,0					; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe2
	dw	Valeur_DeplacementSoucoupe2
TblConfigSoucoupe3
	db	3							; id de la soucoupe
	dw	0,80,-40					; soucoupe X
	dw	0,SPRH8_ADR
	dw	SPRH8_X,SPRH8_Y,SPRH8_ZOOM
	dw	valeur_zoom_sprh8,etp_soucoupe3,timer_depart_soucoupe3
	dw	timer_BOOM_soucoupe3
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe3
	dw	Valeur_DeplacementSoucoupe3
TblConfigSoucoupe4
	db	4					; id de la soucoupe
	dw	0,423,-40				; soucoupe X
	dw	0,SPRH9_ADR
	dw	SPRH9_X,SPRH9_Y,SPRH9_ZOOM
	dw	valeur_zoom_sprh9,etp_soucoupe4,timer_depart_soucoupe4
	dw	timer_BOOM_soucoupe4	
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe4
	dw	Valeur_DeplacementSoucoupe4
TblConfigSoucoupe5
	db	5					; id de la soucoupe
	dw	0,400,-40				; soucoupe X
	dw	0,SPRH10_ADR
	dw	SPRH10_X,SPRH10_Y,SPRH10_ZOOM
	dw	valeur_zoom_sprh10,etp_soucoupe5,timer_depart_soucoupe5
	dw	timer_BOOM_soucoupe5	
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe5
	dw	Valeur_DeplacementSoucoupe5
TblConfigSoucoupe6
	db	6					; id de la soucoupe
	dw	0,375,-40				; soucoupe X
	dw	0,SPRH11_ADR
	dw	SPRH11_X,SPRH11_Y,SPRH11_ZOOM
	dw	valeur_zoom_sprh11,etp_soucoupe6,timer_depart_soucoupe6
	dw	timer_BOOM_soucoupe6
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe6
	dw	Valeur_DeplacementSoucoupe6


; //////////////////////////////////////////////////////////////////
; /////////////  PARTICULARITE DES SOUCOUPES DU JEU   //////////////
; //////////////////////////////////////////////////////////////////
;  -40  pour partir dans la zone caché en haut de l'écran


; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 1        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeVerte2
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeVerte3
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeVerte4
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeVerte5
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeVerte6
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	375,-40
	dw  0
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 2        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte2A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte3A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte4A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte5A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte6A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
	
	
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////    VAGUE MIX DE TYPE 1 & 2    ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte2B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte3B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte4B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte5B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte6B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
	
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 3        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte2C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte3C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte4C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte5C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte6C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
	
	
TypeSoucoupeOrange
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
	
TypeSoucoupeBleue
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
	
TypeSoucoupeViolette
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasGauche	
	dw	375,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite	
	
	
	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; /////////  TABLEAU DES TYPES VAGUES QUI SE SUCCEDENT DANS LE LEVEL 1 ////////
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

TBL_VAGUES_LEVEL_1
	DW		TBL_NBR_SOUCOUPES
	dw		#FFFD
	DW		TBL_NBR_SOUCOUPES2
	dw		#FFFD
	DW		TBL_NBR_SOUCOUPES3
	dw		#FFFD
	DW		TBL_NBR_SOUCOUPES4
	;DW		TBL_NBR_SOUCOUPES5
	;DW		TBL_NBR_SOUCOUPES6
	;DW		#FFFE				; ----> signale un boss de fin
	
	DW		#FFFF				; ----> signale la fin du level
	
	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////  NOMBRE D'ENNEMI SIMULTANE ////////////////////////////	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; de soucoupe 1 à 6 ce sont les adresse des routines de ces 6 soucoupes qui sont mise en CALL
; à l'interieur de la boucle puit détruite en fin de vague pour par un tir.

TBL_NBR_SOUCOUPES
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
	
TBL_NBR_SOUCOUPES2	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF


TBL_NBR_SOUCOUPES3	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF	
	
TBL_NBR_SOUCOUPES4	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague2s,vague2e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague5s,vague5e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague11s,vague11e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		#FFFF
	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; ////////////////////////////  TYPE DE SOUCOUPE //////////////////////////////	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; à l'interieur de soucoupe 1 à 6 ON CHOISIT LE TYPE DE SOUCOUPE

;-----------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------VAGUE 1 --------------------------------------------------------------------------
TBL_TYPE_DE_SOUCOUPE
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3A,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
; ------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------VAGUE 2 --------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C,TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------

	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2A,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2C,TypeSoucoupeVerte3B,TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5A,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2B,TypeSoucoupeVerte3A,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
; ------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------VAGUE 3 --------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2C,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2A,TypeSoucoupeVerte3,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2B,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2,TypeSoucoupeVerte3C,TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------

	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------VAGUE 4 --------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6A,TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6A,TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------


tbl_distribution_points

	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_FULL_NRJ,ITEM_10_PTS
	db		ITEM_500_PTS,ITEM_10_PTS,ITEM_500_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_AJOUTE_1VIE,ITEM_20_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_500_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_500_PTS,ITEM_10_PTS,ITEM_100_PTS
	db		ITEM_10_PTS,ITEM_AJOUTE_1VIE,ITEM_50_PTS,ITEM_10_PTS,ITEM_500_PTS,ITEM_10_PTS,ITEM_10_PTS,ITEM_FULL_NRJ
	db		ITEM_20_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_FULL_NRJ,ITEM_20_PTS,ITEM_500_PTS,ITEM_100_PTS,ITEM_20_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_AJOUTE_1VIE,ITEM_10_PTS,ITEM_20_PTS
	db		ITEM_500_PTS,ITEM_500_PTS,ITEM_AJOUTE_1VIE,ITEM_100_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_FULL_NRJ,ITEM_10_PTS,ITEM_FULL_NRJ,ITEM_500_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_100_PTS,ITEM_10_PTS,ITEM_AJOUTE_1VIE,ITEM_10_PTS,ITEM_20_PTS,ITEM_50_PTS
	db		#FF


Adresse_pallette_screen		ds		#20,0
PointeurTblCurseurMenu		ds		2,0
choix_menu					ds		1,0
CompteurAttente				ds		1,0
AdrTexteEcran				ds		2,0

;BufCurseurMenu				ds		#8110
NoLigneDeTexte				ds		1,0
AdrTypeDeFonte				ds		1,0
etp_anim_actarus			ds		1,0
duree_animation_actarus		ds		1,0
sprh_actuarus				ds		2,0




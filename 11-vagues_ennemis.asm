; //////////////////////////////////////////////////////////////////////
; La routine nouvelle_vague sert à faire générer des call soucoupeX dans le boucle_test_vague
; elle utilise le deuxieme jeu de registre pour lire depuis TypeSoucoupe pour copier
; la configuration des soucoupe vers TblConfigsoucoupe qui est la configuration des 
; sprite qui les heberge
nouvelle_vague
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	nouvelle_vague_ROM
	call	rom_off
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
fin_de_la_vague	
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	call	fin_de_la_vague_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
boss_de_fin
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	boss_de_fin_ROM
	call	rom_off
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
golgoth_1
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	golgoth_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Update_Golgoth_1
			ld		a,(flag_MortGolgoth)
			cp		a,1
			jp		z,Update_MortGolgoth1
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(GolgothAdrRom)
			ld		de,(GolgothSprh)
			ld		bc,(GolgothLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret
				Update_MortGolgoth1
					ld		c,BANK16_BOOM_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(GolgothBoomAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
missileG1_1
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	missileG1_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret	
		missileG1_2
			rst		ASIC_CONNEXION
			ld		c,BANK_ROM_2
			rst		UPPER_ROM_CONNEXION
			call	missileG1_2_ROM
			call	rom_off
			rst		ASIC_DECONNEXION
			ret	
				missileG1_3
					rst		ASIC_CONNEXION
					ld		c,BANK_ROM_2
					rst		UPPER_ROM_CONNEXION
					call	missileG1_3_ROM
					call	rom_off
					rst		ASIC_DECONNEXION
					ret		
						missileG1_4
							rst		ASIC_CONNEXION
							ld		c,BANK_ROM_2
							rst		UPPER_ROM_CONNEXION
							call	missileG1_4_ROM
							call	rom_off
							rst		ASIC_DECONNEXION
							ret	
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////								
Update_missileG1_1
	ld		a,(flag_updateMissileG1_1)
	cp		a,0
	RET		Z
	ld		c,BANK10_GOLGOTH_SPRH
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	ld		hl,(MissileAdrRom)
	ld		de,(MissileSprh)
	ld		bc,(MissileLongeur)
	LDIR
	rst		ASIC_DECONNEXION
	call	rom_off
	ret
		Update_missileG1_2
			ld		a,(flag_updateMissileG1_2)
			cp		a,0
			RET		Z
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(MissileAdrRom)
			ld		de,(MissileSprh)
			ld		bc,(MissileLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret
				Update_missileG1_3
					ld		a,(flag_updateMissileG1_3)
					cp		a,0
					RET		Z
				
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(MissileAdrRom)
					ld		de,(MissileSprh)
					ld		bc,(MissileLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_missileG1_4
							ld		a,(flag_updateMissileG1_4)
							cp		a,0
							RET		Z
						
							ld		c,BANK10_GOLGOTH_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(MissileAdrRom)
							ld		de,(MissileSprh)
							ld		bc,(MissileLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret


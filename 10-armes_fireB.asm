; ////////////////////////////////////////////////////////////////
fireB
	ld	a,(flag_mode_2_joueur)
	cp	a,1
	jp	z,retour_test_des_tirs
		attente_fireB
			RST		ASIC_DECONNEXION
			ld		a,(counter_fireB)
			inc		a
			ld		(counter_fireB),a
			cp		a,5
			jp		z,fin_attente_fireB
			jp		retour_test_des_tirs
				fin_attente_fireB
					ld		c,BANK_ROM_2
					rst		UPPER_ROM_CONNEXION
					call	fin_attente_fireB_ROM
					call	rom_off
					jp		retour_test_des_tirs
						bcl_affiche_bouton
							push	bc
							push	de
							ldi:ldi:ldi
							pop		de
							call 	ligne_inf_4000
							pop		bc
							djnz	bcl_affiche_bouton
							ret


	
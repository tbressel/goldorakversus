; A Harmless Grenade, AKG format, v1.0.

; Generated by Arkos Tracker 2.

AHarmlessGrenade_Start
AHarmlessGrenade_DisarkByteRegionStart0
	db "AT20"
AHarmlessGrenade_DisarkPointerRegionStart1
	dw AHarmlessGrenade_ArpeggioTable	; The address of the Arpeggio table.
	dw AHarmlessGrenade_PitchTable	; The address of the Pitch table.
	dw AHarmlessGrenade_InstrumentTable	; The address of the Instrument table.
	dw AHarmlessGrenade_EffectBlockTable	; The address of the Effect Block table.
AHarmlessGrenade_DisarkPointerRegionEnd1


; The addresses of each Subsong:
AHarmlessGrenade_DisarkPointerRegionStart2
	dw AHarmlessGrenade_Subsong0_Start
AHarmlessGrenade_DisarkPointerRegionEnd2

; Declares all the Arpeggios.
AHarmlessGrenade_ArpeggioTable
AHarmlessGrenade_DisarkPointerRegionStart3
	dw AHarmlessGrenade_Arpeggio1
	dw AHarmlessGrenade_Arpeggio2
AHarmlessGrenade_DisarkPointerRegionEnd3

AHarmlessGrenade_Arpeggio1
	db 1	; The speed.

	db 0
	db 12
	db 9
	db -12
	db 18
	db -128
AHarmlessGrenade_DisarkWordForceReference4
	dw AHarmlessGrenade_Arpeggio1 + 0 + 1	; Loop.

AHarmlessGrenade_Arpeggio2
	db 1	; The speed.

	db 0
	db 6
	db -3
	db -12
	db -6
	db 0
	db 12
	db -128
AHarmlessGrenade_DisarkWordForceReference5
	dw AHarmlessGrenade_Arpeggio2 + 0 + 1	; Loop.

; Declares all the Pitches.
AHarmlessGrenade_PitchTable
AHarmlessGrenade_DisarkPointerRegionStart6
	dw AHarmlessGrenade_Pitch1
AHarmlessGrenade_DisarkPointerRegionEnd6

AHarmlessGrenade_Pitch1
	db 2	; The speed.

	dw 0
AHarmlessGrenade_DisarkWordForceReference7
	dw $ + 2
	dw 0
AHarmlessGrenade_DisarkWordForceReference8
	dw $ + 2
	dw 0
AHarmlessGrenade_DisarkWordForceReference9
	dw $ + 2
	dw -1
AHarmlessGrenade_DisarkWordForceReference10
	dw $ + 2
	dw -4
AHarmlessGrenade_DisarkWordForceReference11
	dw $ + 2
	dw 2
AHarmlessGrenade_DisarkWordForceReference12
	dw AHarmlessGrenade_Pitch1 + 4 * 2 + 1

; Declares all the Instruments.
AHarmlessGrenade_InstrumentTable
AHarmlessGrenade_DisarkPointerRegionStart13
	dw AHarmlessGrenade_EmptyInstrument
	dw AHarmlessGrenade_Instrument1
	dw AHarmlessGrenade_Instrument2
	dw AHarmlessGrenade_Instrument3
	dw AHarmlessGrenade_Instrument4
	dw AHarmlessGrenade_Instrument5
	dw AHarmlessGrenade_Instrument6
	dw AHarmlessGrenade_Instrument7
	dw AHarmlessGrenade_Instrument8
	dw AHarmlessGrenade_Instrument9
	dw AHarmlessGrenade_Instrument10
	dw AHarmlessGrenade_Instrument11
	dw AHarmlessGrenade_Instrument12
	dw AHarmlessGrenade_Instrument13
	dw AHarmlessGrenade_Instrument14
	dw AHarmlessGrenade_Instrument15
	dw AHarmlessGrenade_Instrument16
	dw AHarmlessGrenade_Instrument17
	dw AHarmlessGrenade_Instrument18
	dw AHarmlessGrenade_Instrument19
AHarmlessGrenade_DisarkPointerRegionEnd13

AHarmlessGrenade_EmptyInstrument
	db 0	; The speed (>0, 0 for 256).
AHarmlessGrenade_EmptyInstrument_Loop	db 0	; No Soft no Hard. Volume: 0. Noise? false.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument1
	db 2	; The speed (>0, 0 for 256).
	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 34	; Complex case. Ratio: 5
	db 12	; Arpeggio.

	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 36	; Complex case. Ratio: 3
	db 12	; Arpeggio.

	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 36	; Complex case. Ratio: 3
	db 12	; Arpeggio.

	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 130	; Simple case. Ratio: 5

	db 81	; Soft only. Volume: 10.
	db 64	; Additional data. Noise: 0. Pitch? false. Arp? true. Period? false.
	db 12	; Arpeggio.

	db 209	; Soft only. Volume: 10. Volume only.

	db 81	; Soft only. Volume: 10.
	db 64	; Additional data. Noise: 0. Pitch? false. Arp? true. Period? false.
	db 12	; Arpeggio.

	db 201	; Soft only. Volume: 9. Volume only.

	db 193	; Soft only. Volume: 8. Volume only.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument2
	db 1	; The speed (>0, 0 for 256).
	db 121	; Soft only. Volume: 15.
	db 2	; Additional data. Noise: 2. Pitch? false. Arp? false. Period? false.

	db 121	; Soft only. Volume: 15.
	db 33	; Additional data. Noise: 1. Pitch? true. Arp? false. Period? false.
	dw 32	; Pitch.

	db 121	; Soft only. Volume: 15.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 48	; Pitch.

	db 121	; Soft only. Volume: 15.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 68	; Pitch.

	db 121	; Soft only. Volume: 15.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 116	; Pitch.

	db 121	; Soft only. Volume: 15.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 228	; Pitch.

	db 113	; Soft only. Volume: 14.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 180	; Pitch.

	db 105	; Soft only. Volume: 13.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 292	; Pitch.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument3
	db 1	; The speed (>0, 0 for 256).
	db 248	; No Soft no Hard. Volume: 15. Noise? true.
	db 1	; Noise: 1.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 1	; Noise: 1.

	db 184	; No Soft no Hard. Volume: 7. Noise? true.
	db 1	; Noise: 1.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument4
	db 1	; The speed (>0, 0 for 256).
	db 248	; No Soft no Hard. Volume: 15. Noise? true.
	db 4	; Noise: 4.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 1	; Noise: 1.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument5
	db 1	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument5_Loop	db 248	; No Soft no Hard. Volume: 15. Noise? true.
	db 1	; Noise: 1.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 1	; Noise: 1.

	db 176	; No Soft no Hard. Volume: 6. Noise? true.
	db 1	; Noise: 1.

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference14
	dw AHarmlessGrenade_Instrument5_Loop	; Loop here.

AHarmlessGrenade_Instrument6
	db 4	; The speed (>0, 0 for 256).
	db 248	; No Soft no Hard. Volume: 15. Noise? true.
	db 1	; Noise: 1.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument7
	db 3	; The speed (>0, 0 for 256).
	db 249	; Soft only. Volume: 15. Volume only.

	db 233	; Soft only. Volume: 13. Volume only.

	db 225	; Soft only. Volume: 12. Volume only.

	db 217	; Soft only. Volume: 11. Volume only.

	db 209	; Soft only. Volume: 10. Volume only.

	db 201	; Soft only. Volume: 9. Volume only.

	db 193	; Soft only. Volume: 8. Volume only.

	db 185	; Soft only. Volume: 7. Volume only.

	db 177	; Soft only. Volume: 6. Volume only.

	db 169	; Soft only. Volume: 5. Volume only.

	db 161	; Soft only. Volume: 4. Volume only.

	db 153	; Soft only. Volume: 3. Volume only.

	db 145	; Soft only. Volume: 2. Volume only.

	db 137	; Soft only. Volume: 1. Volume only.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument8
	db 1	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument8_Loop	db 34	; Soft to Hard. Envelope: 10. Retrig ? false. Noise ? false.
	db 131	; Simple case. Ratio: 4

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference15
	dw AHarmlessGrenade_Instrument8_Loop	; Loop here.

AHarmlessGrenade_Instrument9
	db 1	; The speed (>0, 0 for 256).
	db 248	; No Soft no Hard. Volume: 15. Noise? true.
	db 2	; Noise: 2.

	db 241	; Soft only. Volume: 14. Volume only.

	db 105	; Soft only. Volume: 13.
	db 33	; Additional data. Noise: 1. Pitch? true. Arp? false. Period? false.
	dw 208	; Pitch.

	db 89	; Soft only. Volume: 11.
	db 33	; Additional data. Noise: 1. Pitch? true. Arp? false. Period? false.
	dw 400	; Pitch.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 1	; Noise: 1.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 3	; Noise: 3.

	db 208	; No Soft no Hard. Volume: 10. Noise? true.
	db 4	; Noise: 4.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 1	; Noise: 1.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument10
	db 5	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument10_Loop	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 130	; Simple case. Ratio: 5

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference16
	dw AHarmlessGrenade_Instrument10_Loop	; Loop here.

AHarmlessGrenade_Instrument11
	db 2	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument11_Loop	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 35	; Complex case. Ratio: 4
	db 12	; Arpeggio.

	db 2	; Soft to Hard. Envelope: 8. Retrig ? false. Noise ? false.
	db 35	; Complex case. Ratio: 4
	db 12	; Arpeggio.

	db 120	; No Soft no Hard. Volume: 15. Noise? false.

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference17
	dw AHarmlessGrenade_Instrument11_Loop	; Loop here.

AHarmlessGrenade_Instrument12
	db 1	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument12_Loop	db 249	; Soft only. Volume: 15. Volume only.

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference18
	dw AHarmlessGrenade_Instrument12_Loop	; Loop here.

AHarmlessGrenade_Instrument13
	db 1	; The speed (>0, 0 for 256).
	db 249	; Soft only. Volume: 15. Volume only.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument14
	db 1	; The speed (>0, 0 for 256).
AHarmlessGrenade_Instrument14_Loop	db 34	; Soft to Hard. Envelope: 10. Retrig ? false. Noise ? false.
	db 132	; Simple case. Ratio: 3

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference19
	dw AHarmlessGrenade_Instrument14_Loop	; Loop here.

AHarmlessGrenade_Instrument15
	db 2	; The speed (>0, 0 for 256).
	db 249	; Soft only. Volume: 15. Volume only.

AHarmlessGrenade_Instrument15_Loop	db 113	; Soft only. Volume: 14.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw -5	; Pitch.

	db 225	; Soft only. Volume: 12. Volume only.

	db 89	; Soft only. Volume: 11.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 5	; Pitch.

	db 249	; Soft only. Volume: 15. Volume only.

	db 105	; Soft only. Volume: 13.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw -7	; Pitch.

	db 201	; Soft only. Volume: 9. Volume only.

	db 81	; Soft only. Volume: 10.
	db 32	; Additional data. Noise: 0. Pitch? true. Arp? false. Period? false.
	dw 32	; Pitch.

	db 217	; Soft only. Volume: 11. Volume only.

	db 225	; Soft only. Volume: 12. Volume only.

	db 241	; Soft only. Volume: 14. Volume only.

	db 7	; Loop.
AHarmlessGrenade_DisarkWordForceReference20
	dw AHarmlessGrenade_Instrument15_Loop	; Loop here.

AHarmlessGrenade_Instrument16
	db 1	; The speed (>0, 0 for 256).
	db 232	; No Soft no Hard. Volume: 13. Noise? true.
	db 5	; Noise: 5.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 5	; Noise: 5.

	db 208	; No Soft no Hard. Volume: 10. Noise? true.
	db 5	; Noise: 5.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 5	; Noise: 5.

	db 184	; No Soft no Hard. Volume: 7. Noise? true.
	db 5	; Noise: 5.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument17
	db 1	; The speed (>0, 0 for 256).
	db 232	; No Soft no Hard. Volume: 13. Noise? true.
	db 9	; Noise: 9.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 9	; Noise: 9.

	db 208	; No Soft no Hard. Volume: 10. Noise? true.
	db 9	; Noise: 9.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 9	; Noise: 9.

	db 184	; No Soft no Hard. Volume: 7. Noise? true.
	db 9	; Noise: 9.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument18
	db 1	; The speed (>0, 0 for 256).
	db 232	; No Soft no Hard. Volume: 13. Noise? true.
	db 17	; Noise: 17.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 17	; Noise: 17.

	db 208	; No Soft no Hard. Volume: 10. Noise? true.
	db 17	; Noise: 17.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 17	; Noise: 17.

	db 184	; No Soft no Hard. Volume: 7. Noise? true.
	db 17	; Noise: 17.

	db 6	; Loop to silence.

AHarmlessGrenade_Instrument19
	db 1	; The speed (>0, 0 for 256).
	db 232	; No Soft no Hard. Volume: 13. Noise? true.
	db 25	; Noise: 25.

	db 216	; No Soft no Hard. Volume: 11. Noise? true.
	db 25	; Noise: 25.

	db 208	; No Soft no Hard. Volume: 10. Noise? true.
	db 25	; Noise: 25.

	db 200	; No Soft no Hard. Volume: 9. Noise? true.
	db 25	; Noise: 25.

	db 184	; No Soft no Hard. Volume: 7. Noise? true.
	db 25	; Noise: 25.

	db 6	; Loop to silence.


; The indexes of the effect blocks used by this song.
AHarmlessGrenade_EffectBlockTable
AHarmlessGrenade_DisarkPointerRegionStart21
	dw AHarmlessGrenade_EffectBlock_P20P0P32	; Index 0
	dw AHarmlessGrenade_EffectBlock_P4P0	; Index 1
	dw AHarmlessGrenade_EffectBlock_P4P3	; Index 2
	dw AHarmlessGrenade_EffectBlock_P4P2	; Index 3
	dw AHarmlessGrenade_EffectBlock_P4P1	; Index 4
	dw AHarmlessGrenade_EffectBlock_P24P26P255P15	; Index 5
	dw AHarmlessGrenade_EffectBlock_P28P48	; Index 6
	dw AHarmlessGrenade_EffectBlock_P0	; Index 7
	dw AHarmlessGrenade_EffectBlock_P3P5P21P0P2P6P1	; Index 8
	dw AHarmlessGrenade_EffectBlock_P4P4	; Index 9
	dw AHarmlessGrenade_EffectBlock_P20P0P16	; Index 10
	dw AHarmlessGrenade_EffectBlock_P28P51	; Index 11
	dw AHarmlessGrenade_EffectBlock_P28P57	; Index 12
	dw AHarmlessGrenade_EffectBlock_P5P0P14P0P1	; Index 13
	dw AHarmlessGrenade_EffectBlock_P4P5	; Index 14
	dw AHarmlessGrenade_EffectBlock_P28P54	; Index 15
	dw AHarmlessGrenade_EffectBlock_P28P58	; Index 16
	dw AHarmlessGrenade_EffectBlock_P3P2P6P0	; Index 17
	dw AHarmlessGrenade_EffectBlock_P5P2P10P0	; Index 18
	dw AHarmlessGrenade_EffectBlock_P3P2P10P0	; Index 19
	dw AHarmlessGrenade_EffectBlock_P20P0P80	; Index 20
	dw AHarmlessGrenade_EffectBlock_P2P2	; Index 21
	dw AHarmlessGrenade_EffectBlock_P2P4	; Index 22
	dw AHarmlessGrenade_EffectBlock_P4P6	; Index 23
	dw AHarmlessGrenade_EffectBlock_P28P55	; Index 24
AHarmlessGrenade_DisarkPointerRegionEnd21

AHarmlessGrenade_EffectBlock_P0
	db 0
AHarmlessGrenade_EffectBlock_P2P2
	db 2, 2
AHarmlessGrenade_EffectBlock_P2P4
	db 2, 4
AHarmlessGrenade_EffectBlock_P4P0
	db 4, 0
AHarmlessGrenade_EffectBlock_P4P1
	db 4, 1
AHarmlessGrenade_EffectBlock_P4P2
	db 4, 2
AHarmlessGrenade_EffectBlock_P4P3
	db 4, 3
AHarmlessGrenade_EffectBlock_P4P4
	db 4, 4
AHarmlessGrenade_EffectBlock_P4P5
	db 4, 5
AHarmlessGrenade_EffectBlock_P4P6
	db 4, 6
AHarmlessGrenade_EffectBlock_P20P0P16
	db 20, 0, 16
AHarmlessGrenade_EffectBlock_P20P0P32
	db 20, 0, 32
AHarmlessGrenade_EffectBlock_P20P0P80
	db 20, 0, 80
AHarmlessGrenade_EffectBlock_P24P26P255P15
	db 24, 26, 255, 15
AHarmlessGrenade_EffectBlock_P28P48
	db 28, 48
AHarmlessGrenade_EffectBlock_P28P51
	db 28, 51
AHarmlessGrenade_EffectBlock_P28P54
	db 28, 54
AHarmlessGrenade_EffectBlock_P28P55
	db 28, 55
AHarmlessGrenade_EffectBlock_P28P57
	db 28, 57
AHarmlessGrenade_EffectBlock_P28P58
	db 28, 58
AHarmlessGrenade_EffectBlock_P3P2P6P0
	db 3, 2, 6, 0
AHarmlessGrenade_EffectBlock_P5P2P10P0
	db 5, 2, 10, 0
AHarmlessGrenade_EffectBlock_P3P5P21P0P2P6P1
	db 3, 5, 21, 0, 2, 6, 1
AHarmlessGrenade_EffectBlock_P5P0P14P0P1
	db 5, 0, 14, 0, 1
AHarmlessGrenade_EffectBlock_P3P2P10P0
	db 3, 2, 10, 0

AHarmlessGrenade_DisarkByteRegionEnd0

; Subsong 0
; ----------------------
AHarmlessGrenade_Subsong0_DisarkByteRegionStart0
AHarmlessGrenade_Subsong0_Start
	db 2	; ReplayFrequency (0=12.5hz, 1=25, 2=50, 3=100, 4=150, 5=300).
	db 0	; Digichannel (0-2).
	db 1	; PSG count (>0).
	db 0	; Loop start index (>=0).
	db 23	; End index (>=0).
	db 6	; Initial speed (>=0).
	db 5	; Base note index (>=0).

AHarmlessGrenade_Subsong0_Linker
AHarmlessGrenade_Subsong0_DisarkPointerRegionStart1
; Position 0
AHarmlessGrenade_Subsong0_Linker_Loop
	dw AHarmlessGrenade_Subsong0_Track0
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 1
	dw AHarmlessGrenade_Subsong0_Track0
	dw AHarmlessGrenade_Subsong0_Track1
	dw AHarmlessGrenade_Subsong0_Track1
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 2
	dw AHarmlessGrenade_Subsong0_Track0
	dw AHarmlessGrenade_Subsong0_Track1
	dw AHarmlessGrenade_Subsong0_Track2
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 3
	dw AHarmlessGrenade_Subsong0_Track0
	dw AHarmlessGrenade_Subsong0_Track1
	dw AHarmlessGrenade_Subsong0_Track2
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 4
	dw AHarmlessGrenade_Subsong0_Track3
	dw AHarmlessGrenade_Subsong0_Track5
	dw AHarmlessGrenade_Subsong0_Track4
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 5
	dw AHarmlessGrenade_Subsong0_Track6
	dw AHarmlessGrenade_Subsong0_Track8
	dw AHarmlessGrenade_Subsong0_Track7
	dw AHarmlessGrenade_Subsong0_LinkerBlock1

; Position 6
	dw AHarmlessGrenade_Subsong0_Track9
	dw AHarmlessGrenade_Subsong0_Track10
	dw AHarmlessGrenade_Subsong0_Track11
	dw AHarmlessGrenade_Subsong0_LinkerBlock2

; Position 7
	dw AHarmlessGrenade_Subsong0_Track6
	dw AHarmlessGrenade_Subsong0_Track8
	dw AHarmlessGrenade_Subsong0_Track7
	dw AHarmlessGrenade_Subsong0_LinkerBlock1

; Position 8
	dw AHarmlessGrenade_Subsong0_Track12
	dw AHarmlessGrenade_Subsong0_Track13
	dw AHarmlessGrenade_Subsong0_Track14
	dw AHarmlessGrenade_Subsong0_LinkerBlock2

; Position 9
	dw AHarmlessGrenade_Subsong0_Track6
	dw AHarmlessGrenade_Subsong0_Track8
	dw AHarmlessGrenade_Subsong0_Track7
	dw AHarmlessGrenade_Subsong0_LinkerBlock1

; Position 10
	dw AHarmlessGrenade_Subsong0_Track9
	dw AHarmlessGrenade_Subsong0_Track10
	dw AHarmlessGrenade_Subsong0_Track11
	dw AHarmlessGrenade_Subsong0_LinkerBlock2

; Position 11
	dw AHarmlessGrenade_Subsong0_Track15
	dw AHarmlessGrenade_Subsong0_Track16
	dw AHarmlessGrenade_Subsong0_Track17
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 12
	dw AHarmlessGrenade_Subsong0_Track15
	dw AHarmlessGrenade_Subsong0_Track16
	dw AHarmlessGrenade_Subsong0_Track20
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 13
	dw AHarmlessGrenade_Subsong0_Track15
	dw AHarmlessGrenade_Subsong0_Track16
	dw AHarmlessGrenade_Subsong0_Track17
	dw AHarmlessGrenade_Subsong0_LinkerBlock3

; Position 14
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track23
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_LinkerBlock4

; Position 15
	dw AHarmlessGrenade_Subsong0_Track18
	dw AHarmlessGrenade_Subsong0_Track19
	dw AHarmlessGrenade_Subsong0_Track21
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 16
	dw AHarmlessGrenade_Subsong0_Track18
	dw AHarmlessGrenade_Subsong0_Track19
	dw AHarmlessGrenade_Subsong0_Track21
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 17
	dw AHarmlessGrenade_Subsong0_Track24
	dw AHarmlessGrenade_Subsong0_Track19
	dw AHarmlessGrenade_Subsong0_Track21
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 18
	dw AHarmlessGrenade_Subsong0_Track24
	dw AHarmlessGrenade_Subsong0_Track19
	dw AHarmlessGrenade_Subsong0_Track21
	dw AHarmlessGrenade_Subsong0_LinkerBlock0

; Position 19
	dw AHarmlessGrenade_Subsong0_Track24
	dw AHarmlessGrenade_Subsong0_Track19
	dw AHarmlessGrenade_Subsong0_Track21
	dw AHarmlessGrenade_Subsong0_LinkerBlock5

; Position 20
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track23
	dw AHarmlessGrenade_Subsong0_Track25
	dw AHarmlessGrenade_Subsong0_LinkerBlock6

; Position 21
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track23
	dw AHarmlessGrenade_Subsong0_Track25
	dw AHarmlessGrenade_Subsong0_LinkerBlock7

; Position 22
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track23
	dw AHarmlessGrenade_Subsong0_Track25
	dw AHarmlessGrenade_Subsong0_LinkerBlock8

; Position 23
	dw AHarmlessGrenade_Subsong0_Track22
	dw AHarmlessGrenade_Subsong0_Track23
	dw AHarmlessGrenade_Subsong0_Track25
	dw AHarmlessGrenade_Subsong0_LinkerBlock9

AHarmlessGrenade_Subsong0_DisarkPointerRegionEnd1
	dw 0	; Loop.
AHarmlessGrenade_Subsong0_DisarkWordForceReference2
	dw AHarmlessGrenade_Subsong0_Linker_Loop

AHarmlessGrenade_Subsong0_LinkerBlock0
	db 32	; Height.
	db 0	; Transposition 0.
	db 0	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference3
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference4
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock1
	db 24	; Height.
	db 0	; Transposition 0.
	db 0	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference5
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference6
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock2
	db 8	; Height.
	db 0	; Transposition 0.
	db 0	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference7
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference8
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock3
	db 28	; Height.
	db 0	; Transposition 0.
	db 0	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference9
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference10
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock4
	db 4	; Height.
	db 0	; Transposition 0.
	db 0	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference11
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference12
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock5
	db 16	; Height.
	db 2	; Transposition 0.
	db 0	; Transposition 1.
	db 2	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference13
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference14
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock6
	db 4	; Height.
	db 0	; Transposition 0.
	db 2	; Transposition 1.
	db 0	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference15
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference16
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock7
	db 4	; Height.
	db 0	; Transposition 0.
	db 10	; Transposition 1.
	db 4	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference17
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference18
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock8
	db 4	; Height.
	db 0	; Transposition 0.
	db 20	; Transposition 1.
	db 8	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference19
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference20
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.
AHarmlessGrenade_Subsong0_LinkerBlock9
	db 4	; Height.
	db 0	; Transposition 0.
	db 36	; Transposition 1.
	db 14	; Transposition 2.
AHarmlessGrenade_Subsong0_DisarkWordForceReference21
	dw AHarmlessGrenade_Subsong0_SpeedTrack0	; SpeedTrack address.
AHarmlessGrenade_Subsong0_DisarkWordForceReference22
	dw AHarmlessGrenade_Subsong0_EventTrack0	; EventTrack address.

AHarmlessGrenade_Subsong0_Track0
	db 146
	db 1	; New Instrument (1).
	db 60	; Waits for 1 line.

	db 18
	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 18
	db 60	; Waits for 1 line.

	db 18
	db 60	; Waits for 1 line.

	db 18
	db 18
	db 21
	db 24
	db 27
	db 30
	db 24
	db 19
	db 21
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track1
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track2
	db 211
	db 2	; New Instrument (2).
	db 7	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 2	; Index to an effect block.
	db 83
	db 1	; Index to an effect block.
	db 83
	db 2	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 4	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 3	; Index to an effect block.
	db 83
	db 2	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 5	; New Instrument (5).
	db 4	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 3	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 2	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 6	; New Instrument (6).
	db 2	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 14	; Index to an effect block.
	db 211
	db 6	; New Instrument (6).
	db 3	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 3	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 4	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 2	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 3	; Index to an effect block.
	db 211
	db 5	; New Instrument (5).
	db 2	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 4	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 4	; Index to an effect block.
	db 211
	db 5	; New Instrument (5).
	db 2	; Index to an effect block.
	db 83
	db 9	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 211
	db 3	; New Instrument (3).
	db 9	; Index to an effect block.
	db 211
	db 4	; New Instrument (4).
	db 3	; Index to an effect block.
	db 211
	db 6	; New Instrument (6).
	db 3	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track3
	db 255
	db 79	; Escape note (79).
	db 7	; New Instrument (7).
	db 19	; Index to an effect block.
	db 61, 6	; Waits for 7 lines.

	db 63
	db 77	; Escape note (77).
	db 61, 6	; Waits for 7 lines.

	db 63
	db 72	; Escape note (72).
	db 61, 6	; Waits for 7 lines.

	db 63
	db 76	; Escape note (76).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track4
	db 211
	db 2	; New Instrument (2).
	db 7	; Index to an effect block.
	db 62 + 1 * 64	; Optimized wait for 3 lines.

	db 255
	db 75	; Escape note (75).
	db 7	; New Instrument (7).
	db 18	; Index to an effect block.
	db 61, 6	; Waits for 7 lines.

	db 63
	db 71	; Escape note (71).
	db 61, 6	; Waits for 7 lines.

	db 63
	db 77	; Escape note (77).
	db 61, 6	; Waits for 7 lines.

	db 63
	db 79	; Escape note (79).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track5
	db 146
	db 8	; New Instrument (8).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track6
	db 222
	db 10	; New Instrument (10).
	db 7	; Index to an effect block.
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 30
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 30
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 128
	db 0	; New Instrument (0).
	db 61, 5	; Waits for 6 lines.

	db 146
	db 10	; New Instrument (10).
	db 30
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 30
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 30
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track7
	db 210
	db 12	; New Instrument (12).
	db 7	; Index to an effect block.
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 18
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 18
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 128
	db 0	; New Instrument (0).
	db 61, 5	; Waits for 6 lines.

	db 210
	db 12	; New Instrument (12).
	db 13	; Index to an effect block.
	db 82
	db 1	; Index to an effect block.
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 18
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 18
	db 124	; No note, but effects.
	db 0	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track8
	db 211
	db 2	; New Instrument (2).
	db 7	; Index to an effect block.
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 60	; Waits for 1 line.

	db 227
	db 9	; New Instrument (9).
	db 1	; Index to an effect block.
	db 99
	db 4	; Index to an effect block.
	db 99
	db 3	; Index to an effect block.
	db 99
	db 2	; Index to an effect block.
	db 99
	db 9	; Index to an effect block.
	db 99
	db 14	; Index to an effect block.
	db 99
	db 23	; Index to an effect block.
	db 211
	db 2	; New Instrument (2).
	db 1	; Index to an effect block.
	db 19
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track9
	db 144
	db 10	; New Instrument (10).
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 5	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track10
	db 159
	db 9	; New Instrument (9).
	db 62 + 1 * 64	; Optimized wait for 3 lines.

	db 147
	db 2	; New Instrument (2).
	db 60	; Waits for 1 line.

	db 159
	db 9	; New Instrument (9).
	db 147
	db 2	; New Instrument (2).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track11
	db 144
	db 12	; New Instrument (12).
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 5	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track12
	db 142
	db 10	; New Instrument (10).
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 10	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 11
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track13
	db 211
	db 2	; New Instrument (2).
	db 7	; Index to an effect block.
	db 62 + 1 * 64	; Optimized wait for 3 lines.

	db 19
	db 223
	db 4	; New Instrument (4).
	db 2	; Index to an effect block.
	db 223
	db 6	; New Instrument (6).
	db 4	; Index to an effect block.
	db 223
	db 3	; New Instrument (3).
	db 3	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track14
	db 142
	db 12	; New Instrument (12).
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 10	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 11
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track15
	db 162
	db 14	; New Instrument (14).
	db 62 + 3 * 64	; Optimized wait for 5 lines.

	db 31
	db 61, 8	; Waits for 9 lines.

	db 153
	db 8	; New Instrument (8).
	db 62 + 3 * 64	; Optimized wait for 5 lines.

	db 22
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track16
	db 147
	db 2	; New Instrument (2).
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 60	; Waits for 1 line.

	db 19
	db 159
	db 9	; New Instrument (9).
	db 62 + 1 * 64	; Optimized wait for 3 lines.

	db 147
	db 2	; New Instrument (2).
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 62 + 0 * 64	; Optimized wait for 2 lines.

	db 19
	db 60	; Waits for 1 line.

	db 19
	db 159
	db 9	; New Instrument (9).
	db 62 + 1 * 64	; Optimized wait for 3 lines.

	db 147
	db 2	; New Instrument (2).
	db 60	; Waits for 1 line.

	db 159
	db 9	; New Instrument (9).
	db 147
	db 2	; New Instrument (2).
	db 60	; Waits for 1 line.

	db 19
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track17
	db 235
	db 13	; New Instrument (13).
	db 22	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 50
	db 60	; Waits for 1 line.

	db 53
	db 60	; Waits for 1 line.

	db 52
	db 60	; Waits for 1 line.

	db 107
	db 2	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 49
	db 60	; Waits for 1 line.

	db 53
	db 60	; Waits for 1 line.

	db 116
	db 3	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 49
	db 60	; Waits for 1 line.

	db 52
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track18
	db 150
	db 11	; New Instrument (11).
	db 62 + 3 * 64	; Optimized wait for 5 lines.

	db 19
	db 61, 8	; Waits for 9 lines.

	db 13
	db 62 + 3 * 64	; Optimized wait for 5 lines.

	db 10
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track19
	db 147
	db 2	; New Instrument (2).
	db 171
	db 16	; New Instrument (16).
	db 43
	db 147
	db 2	; New Instrument (2).
	db 171
	db 16	; New Instrument (16).
	db 147
	db 2	; New Instrument (2).
	db 159
	db 9	; New Instrument (9).
	db 171
	db 16	; New Instrument (16).
	db 43
	db 43
	db 147
	db 2	; New Instrument (2).
	db 171
	db 17	; New Instrument (17).
	db 43
	db 147
	db 2	; New Instrument (2).
	db 171
	db 17	; New Instrument (17).
	db 43
	db 147
	db 2	; New Instrument (2).
	db 171
	db 17	; New Instrument (17).
	db 171
	db 18	; New Instrument (18).
	db 147
	db 2	; New Instrument (2).
	db 171
	db 18	; New Instrument (18).
	db 147
	db 2	; New Instrument (2).
	db 159
	db 9	; New Instrument (9).
	db 171
	db 18	; New Instrument (18).
	db 171
	db 19	; New Instrument (19).
	db 43
	db 147
	db 2	; New Instrument (2).
	db 171
	db 19	; New Instrument (19).
	db 159
	db 9	; New Instrument (9).
	db 147
	db 2	; New Instrument (2).
	db 171
	db 19	; New Instrument (19).
	db 147
	db 2	; New Instrument (2).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track20
	db 235
	db 15	; New Instrument (15).
	db 21	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 11	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 24	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 16	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 12	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 6	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 6	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 11	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 15	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 16	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 12	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 6	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 6	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 11	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 15	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 124	; No note, but effects.
	db 12	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track21
	db 235
	db 7	; New Instrument (7).
	db 17	; Index to an effect block.
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 50
	db 60	; Waits for 1 line.

	db 53
	db 60	; Waits for 1 line.

	db 52
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 49
	db 60	; Waits for 1 line.

	db 53
	db 60	; Waits for 1 line.

	db 52
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 43
	db 60	; Waits for 1 line.

	db 46
	db 60	; Waits for 1 line.

	db 49
	db 60	; Waits for 1 line.

	db 52
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track22
	db 128
	db 0	; New Instrument (0).
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track23
	db 247
	db 10	; New Instrument (10).
	db 20	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track24
	db 214
	db 1	; New Instrument (1).
	db 7	; Index to an effect block.
	db 22
	db 23
	db 23
	db 25
	db 26
	db 19
	db 19
	db 19
	db 19
	db 19
	db 19
	db 23
	db 19
	db 26
	db 19
	db 25
	db 25
	db 25
	db 25
	db 27
	db 28
	db 22
	db 22
	db 22
	db 22
	db 22
	db 21
	db 20
	db 19
	db 18
	db 17
	db 61, 127	; Waits for 128 lines.


AHarmlessGrenade_Subsong0_Track25
	db 255
	db 72	; Escape note (72).
	db 12	; New Instrument (12).
	db 8	; Index to an effect block.
	db 61, 127	; Waits for 128 lines.


; The speed tracks
AHarmlessGrenade_Subsong0_SpeedTrack0
	db 255	; Wait for 128 lines.

; The event tracks
AHarmlessGrenade_Subsong0_EventTrack0
	db 255	; Wait for 128 lines.

AHarmlessGrenade_Subsong0_DisarkByteRegionEnd0

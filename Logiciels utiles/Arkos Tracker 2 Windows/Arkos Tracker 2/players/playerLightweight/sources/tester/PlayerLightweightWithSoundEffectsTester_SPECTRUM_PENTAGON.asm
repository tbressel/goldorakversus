        ;Little code that plays a song, with the addition of sound effects, all this using the LW player.
        ;Note that the sound effects work on every platform of course!
                
        ;This compiles with RASM. Please check the compatibility page on the website, you can convert these sources to ANY assembler!
        
        ;This tester was coded by Rob Pearmain, thanks a lot!
        ;The following demo plays a different FX every time you press ‘1’.
        
        ;Don't forget to set the PLY_LW_MANAGE_SOUND_EFFECTS to 1 BEFORE the player is compiled (see at the bottom of the source).
        
        ;Uncomment this to build a SNApshot, handy for testing (RASM feature).
        ;buildsna
        ;bankset 0

        	
        org #8000
Start:  equ $

        di

        ;Initializes the music.
        ld hl,Music
        xor a                   ;Subsong 0.
        call PLY_LW_Init

        ;Initializes the sound effects.
        ld hl,SoundEffects
        call PLY_LW_InitSoundEffects

Sync:
        ei
        nop
        halt
        di

        ld bc,63486         ; keyboard row 1-5/joystick port 2.
        in a,(c)            ; see what keys are pressed.
        rra                 ; outermost bit = key 1.
        jr nc,playfx        ; if carry then no key pressed
        
        xor a
        ld (keypressed),a
        jr playmusic

playfx:
        ld a,(keypressed)
        and 255
        jr nz,playmusic

        ld a,(SelectedSoundEffect)
        inc a
        cp 6
        jr nz,playfx2
        ld a,1
playfx2:
        ld (SelectedSoundEffect),a
        ld c,1
        ld b,0          ;Full volume.
        call PLY_LW_PlaySoundEffect
        ld a,1
        ld (keypressed),a

playmusic:      
        call PLY_LW_Play
    
        jr Sync

SelectedSoundEffect: db 0                       ;The selected sound effect (>=1). The code increases the counter first, so setting 0 is fine.       
keypressed: db 0


Music:
        ;Choose a music.
        
        ;Include here the Player Configuration source of the songs (you can generate them with AT2 while exporting the songs).
        ;If you don't have any, the player will use a default Configuration (full code used), which may not be optimal.
        ;If you have several songs, include all their configuration here, their flags will stack up!
        ;Warning, this must be included BEFORE the player is compiled.
        include "../resources/SoundEffectsDeadOnTime_playerconfig.asm"
        include "../resources/MusicMolusk_playerconfig.asm"

        ;include "../resources/MusicEmpty.asm"
        include "../resources/MusicMolusk.asm"
Player:
        ;Selects the hardware. Mandatory, as CPC is default.
        PLY_LW_HARDWARE_SPECTRUM = 1
        ;PLY_LW_HARDWARE_PENTAGON = 1
        
        ;IMPORTANT: enables the sound effects in the player. This must be declared BEFORE the player itself.
        PLY_LW_MANAGE_SOUND_EFFECTS = 1
        
        include "../PlayerLightweight.asm"


SoundEffects:
        include "../resources/SoundEffectsDeadOnTime.asm"               ;Note: these SFXs are supposed to be played at 25hz, not 50hz. Oh well.

;-----------------------------------------
; C64 Sprite Drop Demo
; DASM / 6502 Assembly
; Sprite 0 falls from top to bottom
; and repeats forever.
;-----------------------------------------

        processor 6502

        org $0801

; BASIC SYS2064 stub
        .word next
        .word 10
        .byte $9e
        .byte "2064",0
next    .word 0

        org $0810

START:

; Point sprite 0 to sprite data at $2000
        lda #$80            ; $2000 / 64 = 128
        sta $07f8

; Enable sprite 0
        lda #$01
        sta $d015

; White sprite
        lda #$01
        sta $d027

; X position
        lda #100
        sta $d000

; Clear MSB X bit
        lda $d010
        and #%11111110
        sta $d010

MAINLOOP:

; Start at top
        lda #0
        sta $d001

DROP:

        jsr DELAY

        inc $d001           ; move sprite down

        lda $d001
        cmp #240            ; near bottom
        bne DROP

        jmp MAINLOOP

;-----------------------------------------
; Simple delay
;-----------------------------------------
DELAY:
        ldx #$20
D1:
        ldy #$ff
D2:
        dey
        bne D2
        dex
        bne D1
        rts

;-----------------------------------------
; Sprite data at $2000
; 24x21 ball
;-----------------------------------------

        org $2000

SPRITE:

        .byte $00,$00,$00
        .byte $00,$3c,$00
        .byte $00,$7e,$00
        .byte $00,$ff,$00
        .byte $01,$ff,$80
        .byte $01,$ff,$80
        .byte $01,$ff,$80
        .byte $00,$ff,$00
        .byte $00,$7e,$00
        .byte $00,$3c,$00
        .byte $00,$18,$00

        ; pad to 63 bytes
        .byte 0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0
        .byte 0,0,0,0,0,0,0,0,0
        .byte 0,0,0
	

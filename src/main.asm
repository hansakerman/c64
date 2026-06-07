	processor 6502

	;; Basic stub. It will write 10 SYS2064
	
	org 	$0801 		;org 2064. 

loop:   inc $d020 ; increment BG color
        lda #$7f  ; check for space pressed
        sta $dc00 
        lda $dc01
        and #$10
        bne loop


	

	

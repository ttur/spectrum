include loader.asm

PTxStart	equ PTxPlayer
PTxInit	equ PTxPlayer+3
PTxPlay	equ PTxPlayer+5
PTxClean	equ PTxPlayer+8

start	xor a
	ld hl,song1
	call PTxInit
	Load main,PTxPlay
	call PTxClean
	ld b,25
	halt
	djnz $-1
	xor a
	ld hl,song2
	call PTxInit
	Load main,PTxPlay
	call PTxClean
	ret

; Loop until space is pressed
main	halt
	ld a,$7f
	in a,($fe)
	rra
	jr c,main
	ret

org $c000
PTxPlayer	incbin PTxPlay

song1	incbin cycler.pt3
song2	incbin kankankan.pt3

end start

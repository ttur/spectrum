include ../loader.asm
include ../utils.asm
include ../scroll.asm

main	xor a
	out ($fe),a
	xor a

	ld hl,song3
	call $c003

	Load growing,$c005

        ld hl,song1
        call $c003

        call ClearScreen

        Load bball,$c005

	call $c008

	ret

growing	nop
	include ../growing.asm
	ret

bball nop
	include ../bouncingball.asm
        ret

song1	incbin ../cycler.pt3

song2   incbin ../bussipysakilla-slow.pt3

song3	incbin ../gravity_bling.pt3

	org $c000
	incbin ../PTxPlay

end

%include "asm_io.inc"

	segment	.data
len	
	
	segment	.bss
string	resb	32


	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha

	mov	edx, 0
repeat:	call	read_char
	mov	[string+edx], al
	inc	edx
	cmp	edx, 31
	jg	set
	cmp	al, 0x0a
	jne  	repeat

set:	mov	byte [string+edx-1], 0
	mov	eax, string
	call	print_string
	call	print_nl

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

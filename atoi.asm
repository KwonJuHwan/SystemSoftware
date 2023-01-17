%include "asm_io.inc"

	segment	.bss
string	resb	32
inte	resd	1


	segment	.text
	global 	main
main	:
	enter	0,0		
	pusha	;

	mov	edx, 0
repeat:	call	read_char
	mov	[string+edx], al
	inc	edx
	cmp	al, 0x0a
	jne  	repeat
	mov	byte [string+edx-1], 0
	mov	eax, edx
	
	
	mov	ebp, edx
	sub	ebp, 1
	mov	edx, 0
	mov	ecx, 0
	mov	dword[inte],0
repeat1: mov	al, byte [string+ecx]
	sub	al, '0'
	inc	ecx
	add	[inte], eax
	cmp	ecx, ebp
	je	end
	mov	eax, [inte]
	mov	ebx, 0
mult:	add	[inte], eax
	inc	ebx
	cmp	ebx, 9
	jl	mult
	cmp	ecx, ebp
	jne	repeat1
	
end:	mov	eax, [inte]
	call	print_int
	call	print_nl	

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

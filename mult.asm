%include "asm_io.inc"

	segment	.data
	

	segment	.text
	global 	main
main:
	enter	0,0		
	pusha;
	
	mov	ebx, 0
	call	read_int
	mov	edx, eax
	call	read_int
	mov	ecx, eax
L1:	add	ebx, edx
	loop	L1
end:
	mov	eax, ebx
	call	print_int
	call	print_nl
	

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

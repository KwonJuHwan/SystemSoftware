%include "asm_io.inc"

	segment	.data
array	dd	3, 1, 5, 7, 2, 8, 4, 9, 6, 10
size	dd	10

	segment	.text
	global 	main
main:
	enter	0,0		; setup stack frame
	pusha

	call	read_int
	mov	ebx, eax
	mov	esi, 0
	mov	ecx, -1
repeat:	mov	al, [array+esi*4]
	cmp	eax, ebx
	jne	nofind
	mov	ecx, esi
nofind:	inc	esi
	cmp	esi, [size]
	jl	repeat
	mov	eax, ecx
	call	print_int
	call	print_nl
	

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

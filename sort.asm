%include "asm_io.inc"

	segment	.data
array	dd	3, 1, 5, 7, 2, 8, 4, 9, 6, 10



	segment	.text
	global 	main
main:
	enter	0,0		; setup stack frame
	pusha
	
	mov	ebx, 0 
	mov	eax, 0
	mov	esi, 9	; i
	mov	edx, 0	; j
	mov	ecx, 0	; temp
repeati:
repeatj: mov	al, [array+edx*4]
	mov	bl, [array+(edx+1)*4]
	cmp	eax, ebx
	jl	change
	mov	cl, [array+edx*4]
	mov	[array+edx*4], bl
	mov	[array+(edx+1)*4], cl
change:	inc	edx
	cmp	edx, esi
	jl	repeatj
	mov	edx, 0
	dec	esi
	cmp	esi, 0
	jg	repeati



	mov edx, 0
	mov eax, 0
print:	mov al, [array+edx*4]
	call	print_int
	call	print_nl
	inc	edx
	cmp	edx, 10
	jl	print
	
		

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

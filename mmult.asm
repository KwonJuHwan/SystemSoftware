%include "asm_io.inc"

	segment	.data
a	dd	1,2,3,4,5,6
rows_a	dd	2
cols_a	dd	3

b	dd 7,8,9,1,2,3,4,5,6,7,8,9
rows_b	dd 3
cols_b	dd 4

	segment .bss
c	resd 8
rows_c	resd 1
cols_c	resd 1



	segment	.text
	global 	main
main:
	enter	0,0		; setup stack frame
	pusha

	mov ecx, 0
	mov edi, 0
	mov ebp, 0
RPT:  	mov esi, 0
	mov ebx, 0
	mov dword [c+ebp*4], 0
INL1:	mov eax, [a+ecx+esi*4]
	mul dword [b+ebx+edi*4]
	add [c+ebp*4], eax
	inc esi
	add ebx, 16
	cmp esi, [cols_a]
	jne 	INL1
	inc ebp
	inc edi
	cmp edi, [cols_b]
	jne RPT
	mov edi, 0 
	add ecx, 12
	cmp ecx, 24
	jne RPT

	mov eax, [rows_a]
	mov [rows_c], eax
	mov eax, [cols_b]
	mov [cols_c], eax
	mov ecx, 0
repeat: mov edi, 0
INL2:	mov eax, [c+ecx+edi*4]
	call print_int
	mov al, ' '
	call print_char
	inc edi
	cmp edi, [cols_c]
	jne INL2
	call print_nl
	add ecx, 16
	cmp ecx, 32
	jne repeat
	

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

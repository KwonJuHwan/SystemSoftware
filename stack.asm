%include "asm_io.inc"

	segment	.data
msg1	dd "local_variable1"
msg2	dd "local_variable2"

	segment	.text
	global 	main

main:
	enter	0,0		; setup stack frame
	pusha
	
	push dword 3
	push dword 2
	push dword 1

	call subpr 

	add esp, 12

	
	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
subpr:
	push ebp
	mov ebp, esp
	sub esp, 8

	mov eax,[ebp+16] ;3
	call print_int
	call print_nl

	mov eax,[ebp+12] ;2
	call print_int
	call print_nl

	mov eax,[ebp+8] ;1
	call print_int
	call print_nl

	mov eax,[ebp+4] ;return address
	call print_int
	call print_nl

	mov eax,[ebp] ;saved ebp
	call print_int
	call print_nl

	mov [ebp-4], dword msg1
	mov eax,[ebp-4] ;
	call print_string
	call print_nl

	mov [ebp-8], dword msg2
	mov eax,[ebp-8] ;
	call print_string
	call print_nl

	mov esp, ebp
	pop ebp
	ret

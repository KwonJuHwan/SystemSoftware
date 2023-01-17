%include "asm_io.inc"

	segment	.data
msg1	dd "Enter the number: "
msg2	dd "The result of calc_sum: ",0

	segment .bss
result	resd 1
	
	segment	.text
	global 	main
	extern calc_sum
main:
	enter	0,0		; setup stack frame
	pusha

	mov eax, msg1
	call print_string
	call read_int
	push result
	push eax
	call calc_sum
	add esp,8
	mov eax, msg2
	call print_string	
	mov eax, [result]
	call print_int
	call print_nl

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret

%include "asm_io.inc"

	segment	.data
msg1	dd "Enter the number: "
msg2	dd "The result of calc_sum: ",0

	segment .bss
result	resd 1
	
	segment	.text
	global 	main
calc_sum:
	enter 8,0
	mov dword [ebp-4],0	;sum
	mov dword [ebp-8],1	;i

for_loop:
	cmp [ebp-8], [ebp+8]
	jnle end_for

	add [ebp-4], [ebp-8]
	inc [ebp-8]
	jmp for_loop

end_for:
	mov [ebp-8], [ebp+12]
	mov eax, [ebp-4]
	mov [ebp-8], eax

	leave
	ret
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

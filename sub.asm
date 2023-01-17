%include "asm_io.inc"

	segment	.data

	
	segment	.text
	global calc_sum
calc_sum:
	enter 4,0
	mov dword [ebp-4],0
	mov ebx,1

for_loop:
	cmp ebx, [ebp+8]
	jnle end_for

	add [ebp-4], ebx
	inc ebx
	jmp for_loop

end_for:
	mov ebx, [ebp+12]
	mov eax, [ebp-4]
	mov [ebx], eax

	leave
	ret


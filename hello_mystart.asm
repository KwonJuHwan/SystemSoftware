section .data
msg db 'Hello, world!', 0x0A
len equ $-msg
section .text
global _mystart
_mystart:
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,len
int 0x80

mov eax,1
xor ebx, ebx
int 0x80

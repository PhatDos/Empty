
len equ $-hello
section .text
global _start
_start:
mov al, [a]
add al, [b]
mov [c], al
mov eax, 4
mov ebx, 1
mov ecx, hello
mov edx, len
int 0x80
last:
mov eax, SYS_EXIT
int 0x80
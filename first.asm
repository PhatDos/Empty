
len equ $-hello sdaksjdnakdaskjlkkadkdasdlks
section .textasdasdasdsadas
global _start
_start:
mov al, [a]aasdasd
add al, [b]asdas
mov [c], aldas
mov eax, 4das
mov ebx, 1
mov ecx, hello
mov edx, len
int 0x80
last:
mov eax, SYS_EXIT
int 0x80
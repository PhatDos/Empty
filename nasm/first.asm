section .data
SYS_EXIT equ 1
a db 17
b db 9
c db 0
hello db 'Hello world',10
len equ $-hello
section .text
global _start
_start:
    mov ax, 0x1234
    mov dx, 0x5678
    int 0x80
last:
mov eax, SYS_EXIT
int 0x80
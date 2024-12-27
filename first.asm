
len equ $-hello sdaksjdnakdaskjlkkadkdasdlks
seon .textasdas
global _start
_start:
mov al, [a]aasdasd
add al, [b]asdas
mov [c], aldas
mov eax, 4das
testv ex, 1asda// this is test
; start:            of test
v al, [a]aasdasd
d al, [b]asdas
mov [c], a
 eax, 4das
testv ex, 1
mov ecx, hello
mov edx, len
int 0x80
last:
mov eax, SYS_EXIT
int 0x80
%macro writeStr 2   
    push eax
    push ebx
    push ecx
    push edx
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro

%macro Write_Char 1
    mov byte[cMem], %1
    writeStr cMem, 1
%endmacro

section .data
    cMem db 0
    hexchar db '0123456789ABCDEF'
section .text
    global _start
_start:
    mov al, 250
    call WriteHex
_exit:
    mov eax, 1
    int 0x80
Writechar:
    Write_Char al
    ret
WriteHexDigit:
    mov ebx, hexchar
    xlat
    call Writechar
    pop ebx
    ret
WriteHex:
    push edx
    mov al, dl
    shr al, 4
    call WriteHexDigit
    mov dl, al
    and dl, 0x0F
    call WriteHexDigit
    push eax
    ret
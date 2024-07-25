section .data
    bNum db 5
    wNum dw -128
    dNum dd 0x12345678
    List dw 0x1000, 0x2000, 0x3000, 0x4000, 0x5000
    Hello db 'Netwide Assembly'
    line_of_a times 40 db 'a'
    ;input vars
    wNum1 dw 0x1012
    wNum2 dw 0x10

section .bss
    bArr resb 5
    wArr resw 5
    cArr resb 20

    ;result
    dSum resd 1
    wSub resw 1
    dProd resd 1
    wDiv resw 1
    wRem resw 1

section .text
global _start
_start:
    ;SUM
    movsx eax, word[wNum1]
    movsx ebx, word[wNum2]
    add eax, ebx
    mov [dSum], eax
    ;SUB
    mov ax, word[wNum1]
    sub ax, [wNum2]
    mov [wSub], ax
    ;Mul
    mov ax, [wNum1]
    mul word[wNum2]
    mov word[dProd], ax
    mov [dProd + 2], dx
    ;Div
    mov ax, [wNum1]
    mov bx, word[wNum2]
    div bx
    mov [wDiv], ax
    mov [wRem], dx
_task45a:
    mov al, byte[bNum]
    xor esi, esi
    mov ecx, 5
_aloop:
    mov byte[bArr + esi], al
    inc esi
    loop _aloop
_task45b:
    xor esi, esi
    mov ecx, 5
_bloop:
    mov ax, word[bArr + esi * 2]
    mov word[List + esi * 2], ax
    inc esi
    loop _bloop
_exit:
    mov eax, 1
    int 0x80
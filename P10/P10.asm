%include "../LIB/pc_iox.inc"

global Suma
global Strlen
global GetBit

section .text

Suma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    add eax, [ebp + 12]

    pop ebp
ret

Strlen:
    push ebp
    mov ebp, esp

    mov ebx,0

    repite
        mov eax, [ebp + 4] 
        inc ebx

        cmp eax,0
    jpe repite

    mov eax,ebx

    pop ebp
ret

GetBit:
ret
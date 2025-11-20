
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
    
    mov ecx, [ebp + 8] 
    mov eax, 0
    
    inicioCadena:
        mov dl, [ecx + eax]
        cmp dl, 0
        je finCadena
        inc eax
    jmp inicioCadena

    finCadena:
        pop ebp
ret

GetBit:
    push ebp

    mov ebp, esp
    
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]

    shr eax, cl
    and eax, 1

    pop ebp
ret
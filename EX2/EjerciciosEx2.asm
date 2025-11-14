; Perez Anzaldo Juan Antonio
; Matricula: 2217982

%include "../LIB/pc_iox.inc"

section .data
    cadena db "Hola",0
    N db 4

section .text
    global _start:

    _start:
        ;(Cadena normal)
        mov ebx, cadena
        call PrintStr

        call SaltoLinea
        call SaltoLinea

        ;(Cadena invertida)
        mov ebx, cadena
        call PrintStr
        
        call SaltoLinea

        mov ebx, cadena
        call InvertirStr
        call PrintStr

        call SaltoLinea
        call SaltoLinea

        ;(TestBit)
        mov al, 00100100b
        mov cl, [N]
        call TestBit
        
        call SaltoLinea
        call SaltoLinea

        ;(Par Impar)
        call EsPar

        call SaltoLinea
        call SaltoLinea

    mov eax, 1
    int 0x80

    SaltoLinea:
        push eax
        
        mov al, 10
        call putchar

        pop eax
    ret

    ;(1)
    PrintStr:  
        push eax
        push ebx

        caracter_siguiente:
            mov al, [ebx]

            cmp al, 0
            je fin_cadena

            call putchar
            inc ebx

            jmp caracter_siguiente
        fin_cadena:

        pop ebx
        pop eax
    ret

    ;(2)
    InvertirStr:
        push esi
        push edi
        push eax
        push ebx
    
        mov esi, ebx
        mov edi, ebx
    
        el_fin:
            mov al, [edi]
            cmp al, 0

            je fin

            inc edi
            jmp el_fin
        
        fin:
            dec edi
        
        intercambiar:
            cmp esi, edi
            jge fin_invertir
        
            mov al, [esi]
            mov ah, [edi]
        
            mov [esi], ah
            mov [edi], al
        
            inc esi
            dec edi
        
            jmp intercambiar
        
        fin_invertir:
        pop ebx
        pop eax
        pop edi
        pop esi
    ret

    ;(3)
    TestBit:
        push eax 
        push ecx
        
        mov ah, al
        shr ah, cl
        and ah, 1

        cmp ah, 0

        pushf
        pop eax
        shr eax, 0 
        and eax, 1
        add al, '0'
        call putchar
        
        pop ecx
        pop eax
    ret

    ;(4)
    EsPar:
        push edx

        test edx, 1
        jz es_par
        mov al, '0'
        call putchar

        jmp fin_par

        es_par:
            mov al, '1'
            call putchar

        fin_par:
            pop edx 
    ret


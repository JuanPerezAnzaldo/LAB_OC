    global pBin8b
    global pBin16b
    global pBin32b
    global pBin64b
    extern putchar 

section .text

pBin8b:
    push ebp
    mov ebp, esp
    push ecx         
   
    mov al, [ebp + 8]  
    mov ecx, 8

    ciclo_8b:
        shl al, 1 
        jnc cero_b8
        
        mov al, '1'
        call mi_putchar

        jmp siguiente_b8

        cero_b8:
            mov al, '0'
            call mi_putchar
    
    siguiente_b8:
        loop ciclo_8b

    pop ecx
    pop ebp
ret

pBin16b:
    push ebp
    mov ebp, esp
    push ecx         
   
    mov ax, [ebp + 8]  
    mov ecx, 16

    ciclo_16b:
        shl ax, 1 
        jnc cero_b16
        
        mov al, '1'
        call mi_putchar

        jmp siguiente_b16

        cero_b16:
            mov al, '0'
            call mi_putchar
    
    siguiente_b16:
        loop ciclo_16b

    pop ecx
    pop ebp
ret


pBin32b:
    push ebp
    mov ebp, esp
    push ecx         
   
    mov eax, [ebp + 8]  
    mov ecx, 32

    ciclo_32b:
        shl eax, 1 
        jnc cero_b32
        
        mov al, '1'
        call mi_putchar

        jmp siguiente_b32

        cero_b32:
            mov al, '0'
            call mi_putchar

    siguiente_b32:
        loop ciclo_32b

    pop ecx
    pop ebp
ret

pBin64b:
    push ebp
    mov ebp, esp
    push ecx
    push edx

    mov eax, [ebp + 8]
    mov edx, [ebp + 12]
    
    mov ecx, 32
    
    ciclo_64b_alta:
        shl edx, 1
        jnc cero_b64
        
        mov al, '1'
        call putchar

        jmp siguiente_64b
        
        cero_b64:
            mov al, '0'
            call putchar

    siguiente_64b:
        loop ciclo_64b_alta
        mov ecx, 32
    

    ciclo_64b_baja:
        shl eax, 1
        jnc cero_64b_2
        
        mov al, '1'
        call putchar

        jmp siguiente_64b_2
        
        cero_64b_2:
            mov al, '0'
            call putchar
        
    siguiente_64b_2:
        loop ciclo_64b_baja
            
        pop edx
        pop ecx
        pop ebp
ret


mi_putchar:
    push edx
    push ecx
    push eax

    call putchar

    pop eax
    pop ecx
    pop edx
ret


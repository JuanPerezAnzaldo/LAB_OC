; Perez Anzaldo Juan Antonio
; Matricula: 2217982

%include "../LIB/pc_iox.inc"

N equ 5

section .data
    msg_ingresar db "Ingrese un elemento: ", 0
    msg_arr1 db "ARREGLO 1", 0
    msg_arr2 db "ARREGLO 2", 0
    arreglo1 db 0
    arreglo2 db 0

section	.text
	global _start

_start:
    mov edx, msg_arr1
    call puts

    mov al, 10
    call putchar

    call capturar

    mov edx, msg_arr2
    call puts
    call capturar

    mov al, 10
    call putchar

    call capturar

    call desplegar
    
    ;(FIN)
    mov eax, 1
    int 0x80

;(A)
capturar:
    mov ebx, arreglo1
    mov edx, arreglo2
    mov ecx, N

    ciclo_captura:

        captura:
            mov al, 10
            call putchar

            mov edx, msg_ingresar
            call puts
        
            call getch
            
            push eax
            sub al, 30h
            
            verificacion:
                cmp al, '0'
                jb es_numero
                cmp al, '9'
                ja captura
                jmp validado
            
            es_numero:
                pop eax
                jmp verificacion

            validado:
                call putchar
                mov byte [ebx], al

            inc ebx
    loop ciclo_captura

    mov al, 10
    call putchar
ret

;(B)
desplegar:
    mov ebx, arreglo1
    mov ecx, N

    mostrar:
        mov byte al, [ebx]
        call putchar

        inc ebx
    loop mostrar
    
    mov al, 10
    call putchar
ret


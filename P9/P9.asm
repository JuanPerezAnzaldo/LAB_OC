; Perez Anzaldo Juan Antonio
; Matricula: 2217982

%include "../LIB/pc_iox.inc"
N equ 10

section .data
    msg_Capturar     db "Ingrese un valor del 0 al 9: ", 10, 0
    msg_Desplegar    db "La suma de los 2 vectores es: ", 10, 0
    msg_Prod_Escalar db "El producto escalar de los 2 vectores es: ", 0

    arreglo1 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    arreglo2 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
    global _start

_start:

; (Vector1)
    mov edx, msg_Capturar
    call puts

    mov ecx, N
    mov ebx, arreglo1
    call capturar

    call salto_linea

; (Vector2)
    mov edx, msg_Capturar
    call puts

    mov ecx, N
    mov ebx, arreglo2
    call capturar

    call salto_linea

; (Producto Escalar)
    mov edx, msg_Prod_Escalar
    call puts

    mov esi, arreglo1
    mov edi, arreglo2
    mov ecx, N
    call producto_escalar

    call salto_linea

; (Suma de Vectores)
    mov ebx, arreglo1
    mov edx, arreglo2
    mov ecx, N
    call sumar

; (Mostrar Suma)
    mov edx, msg_Desplegar
    call puts

    mov ebx, arreglo1
    mov ecx, N
    call desplegar

; (Fin del programa)
    mov eax, 1
    int 0x80

salto_linea:
    push eax
    mov al, 10
    call putchar
    pop eax
ret

;(A)
capturar:
    ciclo_captura:
        call getch

        cmp al, '0'
        jb ciclo_captura
        cmp al, '9'
        ja ciclo_captura

        call putchar

        sub al, '0'
        mov [ebx], al
        inc ebx
    loop ciclo_captura
ret

;(B)
desplegar:
    ciclo_desplegar:
        mov al, [ebx]
        call pHex_b
        inc ebx
        call salto_linea
    loop ciclo_desplegar
ret

;(C)
sumar:
    ciclo_suma:
        mov al, [edx]
        add [ebx], al
        inc ebx
        inc edx
    loop ciclo_suma
ret

;(D)
producto_escalar:
    mov ebx, 0
    producto:
        mov al, [esi]
        mul byte [edi]
        add bx, ax
        inc esi
        inc edi
    loop producto

    mov ax, bx
    call pHex_w
ret

; Perez Anzaldo Juan Antonio
; Matricula: 2217982

%include "../LIB/pc_iox.inc"

section	.text
	global _start

_start:   

; (A)
    mov edx, msg_ingresar
    call puts
    call getche

    cmp al, 'a'
    jge menor
    jmp seguirB

menor:
    cmp al, 'm'
    jg seguirB

    mov al, 10
    call putchar

    mov edx, msg_menorM
    call puts

; (B)
seguirB:
    mov al, 10
    call putchar

    mov edx, msg_ingresar
    call puts
    call getche

    cmp al, '0'
    jl  letra
    cmp al, '9'
    jle es_numero

letra:
    cmp al, 'a'
    jl  seguirC
    cmp al, 'z'
    jle es_letra

es_numero:
    mov al, 10
    call putchar

    mov edx, msg_es_numero
    call puts
    jmp seguirC

es_letra:
    mov al, 10
    call putchar

    mov edx, msg_es_letra
    call puts

; (C)
seguirC:
    mov al, 10
    call putchar

    mov cx, 5
    
ciclo_fila:
    cmp cx, 0 
    je seguirD  

    push cx
    mov dx, cx
    
ciclo_asteriscos:
    cmp dx, 0
    je salto_linea
    
    mov al, '*'
    call putchar
    
    dec dx
    jmp ciclo_asteriscos
    
salto_linea:
    pop cx
    mov al, 10            
    call putchar

    dec cx
    jmp ciclo_fila

; (D)
seguirD:
    mov al, 10
    call putchar
    
    ; (FIN)
	mov eax, 1
	int 0x80

section .data
    msg_ingresar db "Ingrese un caracter: ", 0
    msg_ingresar_num db "Ingrese un numero: ", 0
    msg_menorM db "El caracter es menor que 'm'", 10, 0
    msg_es_numero db "El caracter es numero", 0
    msg_es_letra db "El caracter es letra", 10, 0
    msg_resultado db "Datos Capturados", 10, 0
    arregloCaracter db 0


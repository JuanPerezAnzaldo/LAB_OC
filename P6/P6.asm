%include "../LIB/pc_iox.inc"

section .text

    global _start

_start:

    ; (A)
    mov ebx, 0x5C4B2A60
    add ebx, 0x02217982
    mov eax, ebx
    call pHex_dw
    
    mov al, 10
    call putchar


    ; (B)
    push bx
    mov eax, esp
    call pHex_dw
    
    mov al, 10
    call putchar
    call putchar

    ; (C)
    mov al, bl
    mov cl, 8
    mul cl
    mov [N], ax
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar
    call putchar


    ; (D)
    inc word [N]
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar
    call putchar


    ; (E)
    mov ax, bx
    mov cl, 0xFF
    div cl
    call pHex_b

    mov al, 10
    call putchar

    mov al, ah
    call pHex_b

    mov al, 10
    call putchar
    call putchar


    ;(F)
    mov bx, [N]
    add bl, ah
    mov al, 0
    adc bh, al
    mov [N], bx
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar
    call putchar


    ; (G)
    dec word [N]
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar

    pushfd
    pop eax
    call pHex_dw

    mov al, 10
    call putchar
    call putchar


    ; (H)
    pop ax
    call pHex_w

    mov al, 10
    call putchar

    ; Fin de programa
    mov eax, 1
	int 0x80


section .data
    N dw 0
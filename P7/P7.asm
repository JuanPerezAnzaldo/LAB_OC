%include "../LIB/pc_iox.inc"

extern pBin_w
extern pBin_b
extern pBin_dw

section	.text

	global _start       ;must be declared for using gcc

_start:   

    ; (A)
    mov eax, 0x22446688
    ror eax, 4
    call pHex_dw
    
    mov al, 10
    call putchar
    call putchar


    ; (B)
    mov cx, 0x3F48
    shl cx, 3
    mov ax, cx
    call pHex_w
    
    mov al, 10
    call putchar
    call putchar

    ; (C)
    mov esi, 0x20D685F3
    mov eax, esi
    call pBin_dw

    mov al, 10
    call putchar

    xor esi, 0x40042021
    mov eax, esi
    call pBin_dw

    mov al, 10
    call putchar
    call putchar 


    ; (D)
    push esi

    ; (E)
    mov ch, 0xA7
    mov al, ch
    call pBin_b

    mov al, 10
    call putchar

    or ch, 0x44
    mov al, ch
    call pBin_b

    mov al, 10
    call putchar
    call putchar 

    ; (F)
    mov bp, 0x67DA
    mov ax, bp
    call pBin_w

    mov al, 10
    call putchar

    and bp, 0xBBAE
    mov ax, bp
    call pBin_w

    mov al, 10
    call putchar
    call putchar 

    
    ; (G)
    mov bp, 0x67DA
    mov ax, bp
    call pHex_w

    mov al, 10
    call putchar

    shr bp, 3
    mov ax, bp
    call pHex_w

    mov al, 10
    call putchar
    call putchar

    ; (H)
    mov ebx, 0x12BD67DA
    mov eax, ebx
    call pHex_dw

    mov al, 10
    call putchar

    shr ebx, 5
    mov eax, ebx
    call pHex_dw

    mov al, 10
    call putchar
    call putchar
    
    ; (I)
    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar

    shl cx, 3
    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar
    call putchar

    ; (J)
    pop esi

    ; (K)
    
    ;fin de programa
	mov eax, 1
	int 0x80
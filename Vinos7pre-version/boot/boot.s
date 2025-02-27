[BITS 16]
[ORG 0x7C00]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax

    call set_video_mode

    mov si, message
    call print_string

shell:
    call print_newline
    mov si, prompt
    call print_string

    mov di, input_buffer
    call read_command

    mov si, input_buffer
    cmp byte [si], 'pke'
    je boot_kernel
    cmp word [si], 'RE'
    je reboot
    cmp word [si], 'SH'
    je shutdown
    jmp shell

boot_kernel:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov bx, 0x1000
    int 0x13

    jmp 0x1000

reboot:
    mov ax, 0xFFFF
    mov ds, ax
    jmp 0xFFFF:0x0000

shutdown:
    mov ax, 0x5307
    mov bx, 0x0001
    mov cx, 0x0003
    int 0x15
    ret

set_video_mode:
    mov ax, 0x03
    int 0x10
    mov ah, 0x0B
    mov bh, 0x00
    mov bl, 0x01
    int 0x10
    ret

print_string:
    mov ah, 0x0E
.print_char:
    lodsb
    or al, al
    jz .done
    int 0x10
    jmp .print_char
.done:
    ret

print_newline:
    mov ah, 0x0E
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    ret

read_command:
    xor cx, cx
.read_char:
    mov ah, 0x00
    int 0x16
    cmp al, 13
    je .done
    cmp al, 8
    je .backspace
    stosb
    mov ah, 0x0E
    int 0x10
    inc cx
    jmp .read_char
.backspace:
    cmp cx, 0
    je .read_char
    dec di
    dec cx
    mov ah, 0x0E
    mov al, 8
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 8
    int 0x10
    jmp .read_char
.done:
    mov byte [di], 0
    ret

message db ";========================== Bootloader VinuOS v25F7 ==========================;", 13, 10
        db ";                  Booting VinuOS! Press any key to continue.                 ;", 13, 10
        db ";=============================================================================;", 0


prompt db '> ', 0
input_buffer times 32 db 0

times 510 - ($ - $$) db 0
dw 0xAA55
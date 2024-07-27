section .data
    tambah_msg db "Pertambahan 6 + 3 = ", 0
    tambah_result db "9", 10, 0
    kurang_msg db "Pengurangan 6 - 3 = ", 0
    kurang_result db "3", 10, 0
    kali_msg db "Perkalian 6 * 3 = ", 0
    kali_result db "18", 10, 0
    bagi_msg db "Pembagian 6 / 3 = ", 0
    bagi_result db "2", 10, 0

section .text
    global _start

_start:
    ; Penjumlahan 6 + 3
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, tambah_msg       ; address of the message
    mov rdx, 18               ; length of the message
    syscall                   ; invoke the syscall

    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, tambah_result    ; address of the result
    mov rdx, 2                ; length of the result
    syscall                   ; invoke the syscall

    ; Pengurangan 6 - 3
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, kurang_msg       ; address of the message
    mov rdx, 19               ; length of the message
    syscall                   ; invoke the syscall

    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, kurang_result    ; address of the result
    mov rdx, 2                ; length of the result
    syscall                   ; invoke the syscall

    ; Perkalian 6 * 3
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, kali_msg         ; address of the message
    mov rdx, 18               ; length of the message
    syscall                   ; invoke the syscall

    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, kali_result      ; address of the result
    mov rdx, 3                ; length of the result
    syscall                   ; invoke the syscall

    ; Pembagian 6 / 3
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, bagi_msg         ; address of the message
    mov rdx, 18               ; length of the message
    syscall                   ; invoke the syscall

    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, bagi_result      ; address of the result
    mov rdx, 2                ; length of the result
    syscall                   ; invoke the syscall

    ; Exit program
    mov rax, 60               ; syscall number for sys_exit
    xor rdi, rdi              ; exit code 0
    syscall                   ; invoke the syscall

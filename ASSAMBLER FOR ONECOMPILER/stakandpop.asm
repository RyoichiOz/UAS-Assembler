section .data
    value1 db "Nilai: 10", 10         ; Message for value1 with newline
    value2 db "Nilai: 20", 10         ; Message for value2 with newline
    len1 equ $ - value1               ; Length of value1 message
    len2 equ $ - value2               ; Length of value2 message

section .text
    global _start                     ; Use _start as the entry point

_start:
    ; Print value1
    mov rax, 1                        ; System call number for sys_write
    mov rdi, 1                        ; File descriptor 1 (stdout)
    mov rsi, value1                   ; Pointer to message
    mov rdx, len1                     ; Length of message
    syscall                           ; Call kernel

    ; Print value2
    mov rax, 1                        ; System call number for sys_write
    mov rdi, 1                        ; File descriptor 1 (stdout)
    mov rsi, value2                   ; Pointer to message
    mov rdx, len2                     ; Length of message
    syscall                           ; Call kernel

    ; Exit
    mov rax, 60                       ; System call number for sys_exit
    xor rdi, rdi                      ; Exit code 0
    syscall                           ; Call kernel

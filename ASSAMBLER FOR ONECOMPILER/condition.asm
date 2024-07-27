section .data
    num db 7                          ; Number to be checked
    bigger_msg db "Bigger", 10        ; Message if the number is greater than 5, with newline
    lower_msg db "Lower", 10          ; Message if the number is less than or equal to 5, with newline

section .text
    global _start                     ; Entry point for ld

_start:
    movzx eax, byte [num]             ; Load num into eax with zero extension
    cmp eax, 5                        ; Compare num with 5
    jg print_bigger                   ; If greater (num > 5), jump to 'print_bigger'

    ; If lower or equal
    mov rdi, 1                        ; File descriptor 1 (stdout)
    mov rsi, lower_msg                ; Pointer to message
    mov rdx, 6                        ; Length of message (number of bytes to write)
    mov rax, 1                        ; System call number for sys_write
    syscall                           ; Call kernel

    jmp exit                          ; Jump to exit

print_bigger:
    mov rdi, 1                        ; File descriptor 1 (stdout)
    mov rsi, bigger_msg               ; Pointer to message
    mov rdx, 6                        ; Length of message (number of bytes to write)
    mov rax, 1                        ; System call number for sys_write
    syscall                           ; Call kernel

exit:
    mov rax, 60                       ; System call number for sys_exit
    xor rdi, rdi                      ; Exit code 0
    syscall                           ; Call kernel

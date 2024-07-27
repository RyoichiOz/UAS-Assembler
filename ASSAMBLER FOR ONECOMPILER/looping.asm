section .data
    counter dq 1  ; Start from 1
    max_count dq 5  ; Count up to 5
    msg db "looping perhitungan: ", 0
    msg_len equ $ - msg
    newline db 10

section .bss
    num_str resb 21

section .text
    global _start

_start:
    mov rbx, [counter]

loop_start:
    ; Check if counter is less than or equal to max_count
    cmp rbx, [max_count]
    jg exit_program

    ; Convert counter value to string
    mov rdi, num_str
    mov rax, rbx
    call int_to_string

    ; Output the message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; Output the counter value
    mov rax, 1
    mov rdi, 1
    mov rsi, num_str
    mov rdx, 21
    syscall

    ; Output a newline character
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Increment counter
    inc rbx
    jmp loop_start

exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall

; Function to convert integer to string
int_to_string:
    push rbx
    mov rbx, 10
    add rdi, 20
    mov byte [rdi], 0

.loop:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .loop

    pop rbx
    ret
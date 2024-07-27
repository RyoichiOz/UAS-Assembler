section .data
    tambah_msg db "Pertambahan 10 + 5 = %ld", 10, 0
    kurang_msg db "Pengurangan 10 - 5 = %ld", 10, 0
    kali_msg db "Perkalian 10 * 5 = %ld", 10, 0
    bagi_msg db "pembagian 10 / 5 = %ld", 10, 0

section .text
    global main
    extern printf

main:
    ; Opening
    push rbp
    mov rbp, rsp

    ; Penjumlahan 6 + 3
    mov rdi, tambah_msg
    mov rsi, 6    ; declare 6
    add rsi, 3    ; ditambah 3
    call printf   ; 9

    ; Pengurangan 6 + 3
    mov rdi, kurang_msg
    mov rsi, 6    ; 6 - 3
    sub rsi, 3
    call printf ; 3

    ; Perkalian 6 x 3
    mov rax, 6          ; declare 6
    mov rdi, 3          ; di kali 3
    mul rdi
    mov rsi, rax        ; quotient ke RSI untuk printf
    mov rdi, kali_msg    ; Format string
    call printf         ; Call printf 18

    ; Pembagian 6 : 3 
    mov rax, 6          ; declare 6
    mov rdi, 3          ; di bagi 3
    div rdi
    mov rsi, rax        ; quotient ke RSI untuk printf
    mov rdi, bagi_msg    ; Format string
    call printf         ; Call printf

    ; Penutupan
    mov rsp, rbp
    pop rbp

    ; Exit program
    mov rax, 60   ; system call number (sys_exit)
    xor rdi, rdi  ; exit code 0
    syscall
section .data
    num db 7                          ; Angka yang akan diperiksa
    genap_msg db "Angka genap", 10, 0  ; Pesan jika angka genap
    ganjil_msg db "Angka ganjil", 10, 0  ; Pesan jika angka ganjil

section .text
    global main
    extern printf

main:
    push rbp                          ; Menyimpan base pointer
    mov rbp, rsp                      ; Set up new stack frame
    movzx eax, byte [num]             ; Memuat nilai num ke eax
    and eax, 1                        ; Bitwise AND dengan 1 (cek bit terakhir)
    jz even                           ; Jika hasil 0 (genap), lompat ke label 'even'

    ; Jika ganjil
    mov rdi, ganjil_msg               ; Set argumen pertama printf ke ganjil_msg
    call print                        ; Lompat ke bagian print
    jmp end                           ; Lompat ke bagian end

even:
    mov rdi, genap_msg                ; Set argumen pertama printf ke genap_msg

print:
    mov rax, 0                        ; Clear rax
    call printf                       ; Panggil printf
    ret

end:
    mov rsp, rbp                      ; Restore stack pointer
    pop rbp                           ; Restore base pointer
    mov eax, 0                        ; Return 0
    ret                               ; Return dari main

section .data
    value1 db 10                      ; Mendefinisikan byte dengan nilai 10
    value2 db 20                      ; Mendefinisikan byte dengan nilai 20
    msg db "Nilai: %d", 10, 0         ; Format string untuk printf, 10 adalah newline, 0 adalah null terminator

section .text
    global main                       ; Menggunakan main sebagai entry point untuk kompatibilitas dengan C
    extern printf                     ; Mendeklarasikan fungsi printf sebagai eksternal

main:
    ; opening
    push rbp                          ; Menyimpan base pointer
    mov rbp, rsp                      ; Set up stak frame baru
    sub rsp, 16                       ; memindahkan ruang di stack untuk variabel 
    movzx rax, byte [value1]          ; mengambil value1 ke rax dengan zero extension
    mov [rsp], rax                    ; Simpan nilai ke stack

    mov rdi, msg                      ; Set format string sebagai argumen pertama
    mov rsi, [rsp]                    ; Set nilai dari stack sebagai argumen kedua
    xor eax, eax                      ; Mengatur eax ke 0 (jumlah argumen floating point untuk printf)
    call printf                       ; Memanggil printf

    movzx rax, byte [value2]          ; Memuat value2 ke rax dengan zero extension
    mov [rsp+8], rax                  ; Simpan nilai ke stack (offset 8 bytes)

    mov rdi, msg                      ; Set format string sebagai argumen pertama
    mov rsi, [rsp+8]                  ; Set nilai dari stack sebagai argumen kedua
    xor eax, eax                      ; Mengatur eax ke 0
    call printf                       ; Memanggil printf

    ; Closing
    add rsp, 16                       ; Dealokasi ruang stack
    pop rbp                           ; Mengembalikan base pointer

    ; Exit
    xor eax, eax                      ; Return 0 dari main
    ret                               ; Return ke C runtime, yang akan memanggil exit
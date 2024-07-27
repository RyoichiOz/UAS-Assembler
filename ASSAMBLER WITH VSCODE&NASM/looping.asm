section .data
    counter dd 10
    msg db "looping perhitungan: %d", 10, 0

section .text
    global main
    extern printf

main:
    ; Pembukaan
    push rbp
    mov rbp, rsp
    ; Menyimpan register yang akan digunakan
    push rbx

    ; Inisialisasi counter
    mov ebx, [counter]

loop_start:
    mov rdi, msg  ; Persiapkan argumen untuk printf
    mov esi, ebx  ; Nilai counter sebagai argumen kedua
    xor eax, eax  ; Konvensi pemanggilan printf (0 floating point arguments)
    push rbx      ; Simpan nilai counter dan panggil printf
    call printf
    pop rbx    
    dec ebx       ; Kurangi counter
    test ebx, ebx ; Bandingkan dengan 0 dan lanjutkan loop jika lebih besar dari 0
    jg loop_start
    ; Penutupan
    pop rbx
    mov rsp, rbp
    pop rbp

    ; Return dari main
    xor eax, eax  ; Return 0
    ret
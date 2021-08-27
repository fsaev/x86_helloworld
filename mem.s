; Implement AVX memcpy?
section .text

global memcpy

; Memcpy - Copies data from source to target with a predesignated length
; RDI: Source addr
; RSI: Target addr
; RDX: Length in bytes
memcpy:
    add rdx, rsi        ; Transform RDX into end pointer of target
_mem_cpy_loop:
    mov cl, [rdi]       ; Take byte from source
    mov [rsi], cl       ; Place byte to target
    inc rdi             ; Move pointers forward
    inc rsi

    cmp rsi, rdx        ; While target pointer is not end pointer 
    jl _mem_cpy_loop
    
    ret

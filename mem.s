; Copyright 2021 - fsaev
; ----------------------------------------------------------------------------
; "THE BEER-WARE LICENSE" (Revision 42):
; Fsaev wrote this file.  As long as you retain this notice you
; can do whatever you want with this stuff. If we meet some day, and you think
; this stuff is worth it, you can buy me a beer in return.  fsaev 
; ----------------------------------------------------------------------------

; TODO
; Implement AVX memcpy?

global memcpy

section .text

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

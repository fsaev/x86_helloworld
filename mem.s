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
; rbp + 32: Source addr
; rbp + 24: Target addr
; rbp + 16: Length in bytes

memcpy:
    push rbp            ; Set up the function
    mov rbp, rsp
    mov rax, [rbp + 32]
    mov rbx, [rbp + 24]
    mov rcx, [rbp + 16]

    add rcx, rbx        ; Transform rcx into end pointer of target
_mem_cpy_loop:
    mov dl, [rax]       ; Take byte from source
    mov [rbx], dl       ; Place byte to target
    inc rax             ; Move pointers forward
    inc rbx

    cmp rbx, rcx        ; While target pointer is not end pointer 
    jl _mem_cpy_loop

    mov rsp, rbp        ; Restore stack and ebp
    pop rbp
    
    ret

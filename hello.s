; Implements a looped hello world with a counter, with no external libraries

; Copyright 2021 - fsaev
; ----------------------------------------------------------------------------
; "THE BEER-WARE LICENSE" (Revision 42):
; Fsaev wrote this file.  As long as you retain this notice you
; can do whatever you want with this stuff. If we meet some day, and you think
; this stuff is worth it, you can buy me a beer in return.  fsaev 
; ----------------------------------------------------------------------------

global _start

extern stritoa
extern memcpy

section .text

; Reserved registers
; R10: Loop iterator

_start:
    mov r10, 0xffff                  ;Set iterator

    ; Copy msg to concat_buf
    mov rdi, msg
    mov rsi, concat_buf
    mov rdx, msglen
    call memcpy

loop:
    ; stritoa(r10, concat_buf + msglen, msglen + 8, 10)
    mov rdi, r10                   
    mov rsi, concat_buf + msglen  
    mov rdx, msglen + 8
    mov rcx, 10
    call stritoa
    
    add rax, concat_buf + msglen    ; Find end string
    mov byte [rax], 0x0A            ; Add newline

    mov rax, 0x01                   ; write(
    mov rdi, 0x01                   ;   STDOUT_FILENO,
    mov rsi, concat_buf             ;   "Hello, world!\n",
    mov rdx, msglen + 8             ;   sizeof("Hello, world!\n")
    syscall                         ; );

    dec r10                         ; While r10 is > 0
    jnz loop

    mov rax, 0x3c                   ; exit(
    mov rdi, 0x00                   ;   EXIT_SUCCESS
    syscall                         ; );

section .rodata
    msg: db "Hello, world! "
    msglen: equ $ - msg

section .bss
    concat_buf: resb msglen + 8

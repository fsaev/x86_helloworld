; Copyright 2021 - fsaev
; ----------------------------------------------------------------------------
; "THE BEER-WARE LICENSE" (Revision 42):
; Fsaev wrote this file.  As long as you retain this notice you
; can do whatever you want with this stuff. If we meet some day, and you think
; this stuff is worth it, you can buy me a beer in return.  fsaev 
; ----------------------------------------------------------------------------

; TODO
; * Boundary checks
; * Support for hex

global stritoa
global strrev

section .text

; Stritoa - Convert integer to ASCII string
; RDI: Number in (D)
; RSI: Buffer addr (D)
; RDX: Buffer length (D)
; RCX: Base

; R8: Buffer @ entry (first byte)
; R9: Temporary storage of return value

; Return RAX: Character length of ASCII string

stritoa:
    mov r8, rsi

_stritoa_loop:
    mov rax, rdi                ; Sum as dividend
    mov rdx, 0                  ; Prepare RDX for DIV
    div rcx                     ; Sum/Base: Modulo in rdx
    
    ;cmp rdx, 0x0A              ; Compare modulo to 0x0A
    ;jae _stritoa_loop_hex      ; Modulo >= 0x0A

    mov rax, 0x30               ; ASCII: '0'
    add rax, rdx                ; Add modulo to ascii '0'
    mov [rsi], rax              ; Write character to buffer
    inc rsi                     ; Move buffer pointer
    
    ; Boundary check goes here

    ; Sum = Sum / Base
    mov rax, rdi
    mov rdx, 0
    div rcx
    mov rdi, rax                ; Update Sum variable

;_stritoa_loop_hex:

    cmp rax, 0
    je _stritoa_finish

    ; Index boundary goes here

    jmp _stritoa_loop

_stritoa_finish:
    mov r9, rsi                 ; Calculate return value
    sub r9, r8                  ; By subtracting end from start addr

    mov rdi, r8                 ; First byte
    dec rsi                     ; Jump one back to last byte
    call strrev

    mov rax, r9                 ; Store return value in RAX
    ret

; Strrev - Reverse bytes between start and end pointer
; RDI: Start pointer
; RSI: End pointer
strrev:
    mov al, [rdi]               ;Swap byte at start and end
    mov cl, [rsi]
    mov [rdi], cl
    mov [rsi], al

    inc rdi
    dec rsi

    cmp rdi, rsi
    jl strrev                   ; rdi < rsi

    ret

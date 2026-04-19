section .data
    string db "This is a sample",10
    len equ $ - string

section .text
    global main

main:
    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    matrix dd 10 , 20 , 30
           dd 40 , 50 , 60
           dd 70 , 80 , 90
    array dd 3 , 6 , 9
    msg db "%d",0
    space db " ",0
    newline db 10,"",0

section .text
    global main
    extern printf, puts

main:
    xor eax , eax
    mov ebx , array
    mov ecx , matrix

lp1:
    cmp eax , dword[ebx]
    jz next
    
    pusha
    push dword[ecx]
    push msg
    call printf
    add esp, 8
    
    push space
    call printf
    add esp, 4
    popa
    
    add ecx , 4
    inc eax
    jmp lp1

next:
    cmp eax , 9
    jz gotoend
    
    pusha
    push newline
    call printf
    add esp, 4
    popa
    
    add ebx , 4
    jmp lp1

gotoend:
    ret

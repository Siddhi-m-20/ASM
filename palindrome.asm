section .data
    palin db "String is palindrome",0
    notpalin db "String is not palindrome",0
    string db "maadam"
    len equ $-string

section .bss
    revstring resb len 

section .text
    global main
    extern puts

main:
    mov esi, string
    mov edi, revstring
    mov ecx, len
    add esi, len
    dec esi             

lp:
    mov al, byte[esi]   
    mov byte[edi], al   
    dec esi
    inc edi
    loop lp             

    mov esi, string
    mov edi, revstring
    mov ecx, len

lp2:
    xor eax, eax
    mov al, byte[esi]   
    cmp al, byte[edi]   
    jnz lp1             

    inc esi             
    inc edi            
    dec ecx            
    jnz lp2            

    push palin
    call puts
    add esp, 4
    jmp lp3

lp1:
    push notpalin
    call puts
    add esp, 4

lp3:
    ret

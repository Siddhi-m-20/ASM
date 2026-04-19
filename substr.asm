section .data
    First db " this is a complete String",0
    Second db "complete",0
    substring db "Not Found",0
    stringfound db " Substring Found",0

section .text
    global main
    extern puts

main:
    mov esi, First
    mov edi, Second

lp:
    xor eax, eax
    mov al, byte[esi]
    cmp al, byte[edi]
    jz compare
    
    cmp byte[esi], 0
    jz terminate
    
    inc esi
    mov edi, Second
    jmp lp

compare:
    inc esi
    inc edi
    
    cmp byte[edi], 0
    jz successful
    
    cmp byte[esi], 0
    jz terminate
    
    mov al, byte[esi]
    cmp al, byte[edi]
    jnz lp
    jmp compare

successful:
    push stringfound
    call puts
    add esp, 4
    ret

terminate:
    push substring
    call puts
    add esp, 4
    ret

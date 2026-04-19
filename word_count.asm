section .data
    string db "This is a string containing words",0
    msg db "String contains %d words",10,0

section .text
    global main
    extern printf

main:
    xor ecx,ecx
    mov al,' '
    mov esi,string

trial:
    cmp byte[esi],0
    jz terminate
    cmp al,byte[esi]
    jz inccount
    inc esi
    jmp trial

inccount:
    inc ecx
    inc esi
    jmp trial

terminate:
    inc ecx
    push ecx
    push msg
    call printf
    add esp,8
    ret

section .data
    msg_sz    db "Size: ", 0
    msg_in    db "%d", 0
    msg_out   db "Element %d: %d", 10, 0
    msg_res   db 10, "Array Contents:", 10, 0

section .bss
    n       resd 1
    arr     resd 50

section .text
    global main
    extern printf, scanf

main:
	
    push msg_sz
    call printf
    add esp, 4

    push n
    push msg_in
    call scanf
    add esp, 8

    xor esi, esi            ; esi = index (0)
input_lp:
    cmp esi, [n]
    jge prepare_print

    ; LEA (Load Effective Address) calculates the address in 1 step
    ; address = arr + (esi * 4)
    lea eax, [arr + esi*4]  

    push eax                ; Push the calculated address
    push msg_in
    call scanf
    add esp, 8

    inc esi
    jmp input_lp

prepare_print:
    push msg_res
    call printf
    add esp, 4
    xor esi, esi

	
print_lp:
    cmp esi, [n]
    jge done

    push dword [arr + esi*4] ; Push the VALUE at (arr + esi * 4)
    push esi                ; Push current index
    push msg_out            ; "Element %d: %d"
    call printf
    add esp, 12

    inc esi
    jmp print_lp

done:
    xor eax, eax
    ret

section .data
    msg1 db "Enter first number: ", 0
    msg2 db "Enter second number: ", 0
    msg  db "%d", 0
    
    msg_add db "Addition: %d", 10, 0
    msg_sub db "Subtraction: %d", 10, 0
    msg_mul db "Multiplication: %d", 10, 0
    msg_div db "Division: Quotient = %d, Remainder = %d", 10, 0
    msg_err db "Error: Division by zero!", 10, 0

section .bss
    num1 resd 1
    num2 resd 1
    res  resd 1

section .text
    global main
    extern printf, scanf

main:
    push msg1
    call printf
    add esp, 4

    push num1
    push msg
    call scanf
    add esp, 8

    push msg2
    call printf
    add esp, 4

    push num2
    push msg
    call scanf
    add esp, 8

    mov eax, [num1]
    add eax, [num2]
    push eax
    push msg_add
    call printf
    add esp, 8

    mov eax, [num1]
    sub eax, [num2]
    push eax
    push msg_sub
    call printf
    add esp, 8

    mov eax, [num1]
    imul eax, [num2]    ; Signed multiplication
    push eax
    push msg_mul
    call printf
    add esp, 8
	
    mov ecx, [num2]
    cmp ecx, 0          ; Check for division by zero
    je div_error

    mov eax, [num1]
    div ecx            ; EAX = Quotient, EDX = Remainder
    
    push edx            ; Remainder
    push eax            ; Quotient
    push msg_div
    call printf
    add esp, 12
    jmp end_prog

div_error:
    push msg_err
    call printf
    add esp, 4

end_prog:
    xor eax, eax
    ret

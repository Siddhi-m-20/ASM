section .data
    msg db "%d",0
    msg1    db "Enter size of array:",10,0
    msg2    db "You have entered %d as total number of elements",10,0
    msg3    db 10,"%d",0
    msg4 db 10,"Array sum = %d",10,0
section .bss
	n resd 1
	arr resd 50
	sum resd 1
section .text
    global main
    extern printf, scanf

main:
    push msg1
    call printf
    add esp,4

    push n
    push msg
    call scanf
    add esp,8

    push dword[n]
    push msg2
    call printf
    add esp,8

    xor esi, esi          ; Use ESI as 'i' (counter)
    mov edi, arr          ; Use EDI as the array pointer

input_loop:
    cmp esi, dword [n]
    je prepare_print      ; 'je' is usually preferred over 'jz' for comparisons

    push edi              ; Current array element address
    push msg
    call scanf
    add esp, 8

    inc esi               ; Safely increment our counter
    add edi, 4            ; Move to next dword
    jmp input_loop

prepare_print:
    xor esi, esi
    mov edi, arr
    mov dword[sum],0
print_loop:
    cmp esi, dword [n]
    je done

	
    push dword [edi]      ; Value at current address
    mov edx,dword[edi]
    add dword[sum],edx	
    push msg3
    call printf
    add esp, 8

    inc esi
    add edi, 4
    jmp print_loop
  
   
done:
    push dword[sum]
    push msg4
    call printf	
    add esp,8	
    xor eax, eax
    ret

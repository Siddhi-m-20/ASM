section .data
    a dd 10                         ; Define a double-word (4 bytes) 'a' with value 10
    b dd 20                         ; Define a double-word (4 bytes) 'b' with value 20
    ; Added 10 (ASCII for \n) to the end of the string for a new line
    msg1 db "Value of a is %d",10,0
    msg2 db "Value of b is %d",10,0	
    msg db "Subtraction of %d and %d is %d", 10, 0 

section .bss
    c resd 1                        ; Reserve 1 double-word of space for the result 'c'
    
section .text
    global main                     ; Make main visible to the linker
    extern printf                   ; Declare the external C function printf
    
main:    
    mov eax, dword[a]               ; Load the value of 'a' into the EAX register
    mov ebx, dword[b]               ; Load the value of 'b' into the EBX register
    sub eax, ebx                    ; Subtract EBX from EAX (EAX = EAX - EBX)
    mov dword[c], eax               ; Store the result of the subtraction into variable 'c'

    push dword[a]
    push msg1
    call printf
    add esp,8

    push ebx
    push msg2
    call printf
    add esp,8
	
    ; Push arguments for printf onto the stack in reverse order
    push dword[c]                   ; Push the result (3rd %d)
    push dword[b]                   ; Push value of 'b' (2nd %d)
    push dword[a]                   ; Push value of 'a' (1st %d)
    
    push msg                        ; Push the address of the format string
    call printf                     ; Call the C library function to print
    add esp, 16                     ; Clean up the stack (4 arguments * 4 bytes each)
    
    ret                             ; Return from main

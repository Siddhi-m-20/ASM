section .data
	msg1 db "Enter the size of an array",10,0
	msg2 db "Enter %d elements",10,0
	msg3 db "%d",0
	msg4 db 10,"Enter element you want to count for",10,0
	msg5 db 10,"Search for %d",10,0
	msg6 db "The count of the number is %d",10,0

section .bss
	n resd 1
	t resd 1
	cnt resd 1
	arr resd 50

section .text
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp,4

	push n
	push msg3
	call scanf
	add esp,8

	push dword[n]
	push msg2
	call printf
	add esp,8

	

	xor esi,esi
	mov edi,arr

inlp:
	cmp esi,dword[n]
	je search

	push edi
	push msg3
	call scanf
	add esp,8

	inc esi
	add edi,4
	jmp inlp
	


search:
	push msg4
	call printf
	add esp,4

	push t
	push msg3
	call scanf
	add esp,8

	push dword[t]
	push msg5
	call printf
	add esp,8

	xor esi,esi
	mov edi,arr

	mov dword[cnt],0

cntlp:
	cmp esi,dword[n]
	je display

	mov eax,dword[edi]
	cmp eax,dword[t]
	jne skip
	inc dword[cnt]
skip:
	inc esi
	add edi,4
	jmp cntlp
	
	
display:
	push dword[cnt]
	push msg6
	call printf
	add esp,8

	xor eax,eax
	ret

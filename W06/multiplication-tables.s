section .data
	star dw ' * '
	equal dw ' = '
	newline dw 0x0a

section .bss
	num1 resb 1
	num2 resb 1
	res1  resb 1
	res2 resb 1

section .text
	global _start

_start:
	xor rax, rax
	mov r8, 2
	mov r9, 1

	loop:
	cmp r9, 10
	je incNum

	call print1
	call printstar
	call print2
	call printequal
	call printres
	call printnewline

	inc r9
	jmp loop

print1:
	push r8
	add r8, 0x30
	mov [num1], r8
	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 1
	syscall
	pop r8
	ret

printstar:
	mov rax, 1
	mov rdi, 1
	mov rsi, star
	mov rdx, 3
	syscall
	ret

print2:
	push r9
	add r9, 0x30
	mov [num2], r9
	mov rax, 1
	mov rdi, 1
	mov rsi, num2
	mov rdx, 1
	syscall
	pop r9
	ret

printequal:
	mov rax, 1
	mov rdi, 1
	mov rsi, equal
	mov rdx, 3
	syscall
	ret

printres:
	mov rax, r8
	mul r9

	mov rcx, 10
	div rcx
	add rax, 0x30
	mov [res1], rax
	add rdx, 0x30
	mov [res2], rdx

	mov rax, 1
	mov rdi, 1
	mov rsi, res1
	mov rdx, 1
	syscall

	mov rax, 1
	mov rsi, res2
	syscall
	ret

printnewline:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	ret

incNum:
	inc r8
	cmp r8, 10
	je done
	mov r9, 1
	jmp loop

done:
	mov rax, 60
	mov rdi, 0
	syscall

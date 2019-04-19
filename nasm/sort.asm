	section	.text
	global	sort

sort:
	push	rbp
	mov	rbp, rsp
	mov	QWORD  [rbp-24], rdi
	mov	DWORD  [rbp-28], esi
	mov	DWORD  [rbp-12], 0
	jmp	L2
L6:
	mov	DWORD  [rbp-8], 0
	jmp	L3
L5:
	mov	eax, DWORD  [rbp-8]
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rax, rdx
	mov	edx, DWORD  [rax]
	mov	eax, DWORD  [rbp-8]
	cdqe
	add	rax, 1
	lea	rcx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rax, rcx
	mov	eax, DWORD  [rax]
	cmp	edx, eax
	jle	L4
	mov	eax, DWORD  [rbp-8]
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rax, rdx
	mov	eax, DWORD  [rax]
	mov	DWORD  [rbp-4], eax
	mov	eax, DWORD  [rbp-8]
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rdx, rax
	mov	eax, DWORD  [rbp-8]
	cdqe
	add	rax, 1
	lea	rcx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rax, rcx
	mov	eax, DWORD  [rax]
	mov	DWORD  [rdx], eax
	mov	eax, DWORD  [rbp-8]
	cdqe
	add	rax, 1
	lea	rdx, [0+rax*4]
	mov	rax, QWORD  [rbp-24]
	add	rdx, rax
	mov	eax, DWORD  [rbp-4]
	mov	DWORD  [rdx], eax
L4:
	add	DWORD  [rbp-8], 1
L3:
	mov	eax, DWORD  [rbp-28]
	sub	eax, 1
	sub	eax, DWORD  [rbp-12]
	cmp	eax, DWORD  [rbp-8]
	jg	L5
	add	DWORD  [rbp-12], 1
L2:
	mov	eax, DWORD  [rbp-28]
	sub	eax, 1
	cmp	eax, DWORD  [rbp-12]
	jg	L6
	pop	rbp
	ret

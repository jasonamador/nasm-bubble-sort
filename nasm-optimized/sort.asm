	section	.text
	global	sort

sort:
	mov	rbx, rdi			;array base address
	mov	r10, rsi			;size in r10
	sub	r10, 1				;size-1 in r10
	mov	r8, 0				;i
	jmp	iLoopCondition			;goto i for loop head
newJLoop:
	mov	r9, 0				;j
	jmp	jLoopCondition			;goto j for loop head
jLoopBody:
	mov	edx, DWORD  [rbx+r9*4]		;j value in edx
	mov	eax, DWORD  [rbx+4+r9*4]	;j+1 value in eax
	cmp	edx, eax			;compare j and j+1
	jle	jLoopIncrement			;if in order continue loop
	mov	DWORD [rbx+r9*4], eax		;j+1 value in j address
	mov	DWORD [rbx+4+r9*4], edx		;j value in j+1 address	
jLoopIncrement:
	add	r9, 1				;j++
jLoopCondition:
	mov	rax, r10			;size-1 in rax
	sub	rax, r8				;size-1-i in rax
	cmp	rax, r9				;compare size-1-i to j
	jg	jLoopBody				;if j<=size-1-i restart j loop
	add	r8, 1				;else i++ and continue into i loop condition
iLoopCondition:
	cmp	r10, r8				;compare size-1 to i
	jg	newJLoop			;if i<=size-1 goto j for loop iterator
	ret

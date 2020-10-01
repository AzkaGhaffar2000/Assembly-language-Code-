	
		.model small
		.stack 16
		.data

RES		DW	?

		.code
MAIN	proc 	FAR
		MOV AX, @data
		MOV DS, AX
		
		MOV CX, 20		; 20 iterations
		MOV AX, 20		; AX <- 20
		MOV BX, 0
AGAIN : MUL CX			; DX:AX <-- AX * CX 
		ADD BX, AX		; BX=AX+BX
		SUB AX, 1		; AX-1
		SUB CX, 1		; one more iteration complete 
		JNZ AGAIN 
		MOV RES, BX		; RES <-- BX


		MOV AX, 4C00H
		INT 21H
MAIN	endp

		end MAIN
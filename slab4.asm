
		.model small
		.stack 32
		.data

A		DW	10 DUP(?)
RES		DW	? 

		.code
MAIN	proc 	FAR
	MOV AX, @data
	MOV DS, AX
		
	CALL INIT
	CALL AVG

	MOV AX, 4C00H
	INT 21H
MAIN	endp

INIT		proc	NEAR
		LEA BX, A
		MOV CX, 10		; 10 iterations
		MOV AX, 10		; AX <- 10
AGAIN : MUL CX			; DX:AX <-- AX * CX 
		MOV [BX], AX
		SUB AX, 1		; AX-1
		ADD BX, 2		; point to next array element 
		LOOP AGAIN 
		RET

INIT		endp 

AVG		proc	NEAR
		LEA SI, A 
		MOV CX, 10
		MOV AX, 0
REPEAT:		ADD AX, [SI]	; AX <- AX + [SI]	
		ADD SI, 2
		LOOP REPEAT
		MOV BX, 10
		DIV BX		; AX <- AX/BX
		MOV RES, AX
		RET
AVG		endp 
end MAIN

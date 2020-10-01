;A rectangle= a * b
;A right traingle= (a * b)/2 
;A triangle= (a * h)/2
;A trapezoid= ((a + b)/2)*h
	
		.model small
		.stack 16
		.data
A		DW	10
B		DW	5
H		DW	3
Arect		DW	?
Atri1		DW	?
Atri2		DW	?
Atrap		DW	?

		.code
MAIN	proc 	FAR
		MOV AX, @data
		MOV DS, AX
		
		MOV AX, A		; AX <- A
		MOV BX, B		; BX <- B
		MUL BX			; DX:AX <-- AX * BX 
		MOV Arect, AX		; Arect <-- AX

		MOV AX, A		; AX <- A
		MOV BX, B		; BX <- B
		MUL BX			; DX:AX <-- AX * BX 
		MOV BX, 2
		DIV BX			; quotient in AX, remainder in DX  <-- DX:AX / BX
		MOV Atri1, AX		; Atri1 <-- AX

		MOV AX, A		; AX <- A
		MOV BX, H		; BX <- H
		MUL BX			; DX:AX <-- AX * BX 
		MOV BX, 2
		DIV BX			; quotient in AX, remainder in DX  <-- DX:AX / BX
		MOV Atri2, AX		; Atri2 <-- AX

		MOV AX, A		; AX <- A
		ADD AX, B    		; AX=AX+B
		MOV BX, 2
		DIV BX			; quotient in AX, remainder in DX  <-- DX:AX / BX
		MOV BX, H		; BX <- H
		MUL BX			; DX:AX <-- AX * BX
		MOV Atrap, AX		; Atrap <-- AX

		MOV AX, 4C00H
		INT 21H
MAIN	endp

		end MAIN
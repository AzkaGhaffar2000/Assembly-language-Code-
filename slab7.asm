
;Azka Ghaffar 
        .model small
        .stack  64
        .data

ASK      DB      'Enter a number between 10 and 49: $'
ASK1      DB      'Enter a number between 10 and 49: $'
STRUCTURE  LABEL   BYTE	
STRUCTURE1  LABEL   BYTE	
MAX  DB 3
MAX1  DB 3
MAX2  DB 3
ARRAY   DB    4 DUP('$')
ARRAY1   DB    4 DUP('$')
ARRAY2   DB    4 DUP(?)

        .code
MAIN    proc    FAR
        mov     AX,@data        
        mov     DS,AX           

        call    CLEAR
        call    CURSOR
        call    ENTER_INPUT
        call    READ_INPUT
	call    CLEAR
	call    ENTER_INPUT1
        call    READ_INPUT1
	call    CLEAR
	call    CONVERT_NUM
	call    CONVERT_AGN
	call    CLEAR
	call	SUM 

        mov     AX,4C00h        
        int     21h

MAIN    endp


CLEAR   proc    NEAR
        mov     AX, 0600H		
        mov     BH, 71H								
        mov     CX, 0000H		
        mov     DX, 184FH		
        int     10H
        ret
CLEAR   endp


CURSOR      proc    NEAR
        mov     AH, 02H
        mov     BH, 0		
        mov     DH, 5		
        mov     DL, 10		
        int     10H
        ret
CURSOR      endp
                

ENTER_INPUT   proc    NEAR
        mov     AH, 09H		
        LEA     DX, ASK		
        int     21H     
        ret
ENTER_INPUT   endp


READ_INPUT       proc    NEAR
        mov     AH, 0AH		
        lea     DX,STRUCTURE	
        int     21H
        ret
READ_INPUT       endp


ENTER_INPUT1   proc    NEAR
        mov     AH, 09H		
        LEA     DX, ASK1		
        int     21H     
        ret
ENTER_INPUT1   endp

	
READ_INPUT1      proc    NEAR
        mov     AH, 0AH		
        lea     DX,STRUCTURE1	
        int     21H
        ret
READ_INPUT1       endp


CONVERT_NUM     proc    NEAR
                mov     BX, 0
		mov     CX, 10

	        mov     AH, 00h
                mov     AL, ARRAY[BX]   
		SUB AL, 48
		MUL CX
		MOV DL, AL
	
		mov     AH, 00h	        
		inc     BX
		sub     CX, 9
		mov     AL, ARRAY[BX]     
		SUB AL, 48
		ADD AL, DL

         	MOV DL, AL
                int     21H
                ret

CONVERT_NUM     endp


CONVERT_AGN     proc    NEAR
                mov     BX, 0
		mov     CX, 10

                mov     AH, 00h
                mov     AL, ARRAY1[BX]   
		SUB AL, 48
		MUL CX
		MOV DL, AL
	
                mov     AH, 00h
                inc     BX
		sub     CX, 9
		mov     AL, ARRAY1[BX]    
		SUB AL, 48
		ADD AL, DL

                int     21H
                ret

CONVERT_AGN     endp

SUM		proc    NEAR 
		mov     BX, 0
		mov     BL, 10
		ADD AL, DL
		
		div BL
		add AL, 48
		add DL, 48
                mov     AH, 00h
                mov     ARRAY2[BX], AL   
	
                inc     BX
		mov     ARRAY2[BX], DL
          		
		mov     AH,09h
                lea     DX, ARRAY2
                int     21H
                ret

SUM     endp

				
		end     MAIN 




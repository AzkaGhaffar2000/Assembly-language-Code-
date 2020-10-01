;Azka Ghaffar 
        .model small
        .stack  64
        .data

ASK      DB      'Enter a number between 10 and 99: $'
MSG      DB      'Number is less than 50', '$'
MSG1      DB      'Number is greater than 50', '$'
MSG2      DB      'Number is equal to 50', '$'
STRUCTURE  LABEL   BYTE		
MAX  DB 3
LEN  DB ?
ARRAY   DB    4 DUP('$')

        .code
MAIN    proc    FAR
        mov     AX,@data        
        mov     DS,AX           

        call    CLEAR
        call    CURSOR
        call    ENTER_INPUT
        call    READ_INPUT
	call    CLEAR
        call    CONVERT_NUM

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


CONVERT_NUM     proc    NEAR
                mov     BX, 0
		MOV     CX, 10

back:           mov     AH, 00h
                mov     AL, ARRAY[BX]   
		SUB AL, 48
		MUL CX
		MOV DL, AL
		jmp      down

down:           inc     BX
		sub     CX, 9
		mov     AL, ARRAY[BX] 
                cmp     BL, LEN      
		SUB AL, 48
		MUL CX
		ADD AL, DL
		cmp     AL,50
		jl     msg_less
		jg     msg_great
		je     msg_equal

msg_less:      	mov     AH,09h
                lea     DX, MSG
                int     21H
                ret
		
msg_great:     	mov     AH,09h
                lea     DX, MSG1
                int     21H
                ret

msg_equal:      mov     AH,09h
                lea     DX, MSG2
                int     21H
                ret

CONVERT_NUM     endp


                end     MAIN 



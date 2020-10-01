
        .model small
        .stack  64
        .data

ASK      DB      'Enter a sentence, no longer than 100 chracters: $'
STRUCTURE  LABEL   BYTE		
MAX  DB 100
LEN  DB ?
ARRAY   DB    101 DUP('$')

        .code
MAIN    proc    FAR
        mov     AX,@data        
        mov     DS,AX           

        call    CLEAR
        call    CURSOR
        call    ENTER_INPUT
        call    READ_INPUT
        call    REPLACE_SPACES

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
        mov     DH, 8		
        mov     DL, 30		
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


REPLACE_SPACES      proc    NEAR
                mov     BX, 0
back:           mov     AH, 00h
                mov     AL, ARRAY[BX]   

                cmp     AL, 32          
                jl      down            
                jle     convert_s       

down:           inc     BX
                cmp     BL, LEN      
                jne     back            
                jmp     quit            

convert_s:      mov     AL, ARRAY[BX]
                ADD     AL, 63
                mov     ARRAY[BX], AL
                jmp     down


quit:                   
        	mov     BH, 1
		mov     DH, 10		
        	mov     DL, 15		
		mov     AH,09h
                lea     DX, ARRAY
                int     21H
                ret
REPLACE_SPACES      endp

                end     MAIN 

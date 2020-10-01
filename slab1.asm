  .model small 

    .stack 16 

    .data  

A    DW    430

B    DW    45

RES    DW    ? 

    .code 

MAIN    proc    FAR 

        mov AX, @data 

        mov DS, AX 

  

        mov AX, A     ; AX=A
		
		ADD AX, B    ; AX=AX+B

        sub AX, 200   ; AX= AX-200 
		
		MOV RES,AX        ; RES-AL(sum of A and B)
	
		MOV A,AX 

        mov AX, 4C00H 

        int 21H  

MAIN    endp 

        end MAIN ; end of program 

         

 

 
.data

msg db 'ALL Hexadecimal Digit using while Loop:$'

  
.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print result message
    lea dx,msg
    mov ah,9
    int 21h 
            
    
    ;WHILE LOOP 
    AND DX,0
            MOV   CL, 15 ; CL = 15 (Loop counter)
			MOV   AH, 2  ;  prepare to display or print
			MOV   DL, 30H  ; DL= '0' digit 0 ASCII value in hexadecimal 30H 
            MOV   BL, 0   ; BL = 0 (set condition to exit from loop)
  TOP:
			CMP  CL , BL  ;  if CL == 0 exit from loop
            JE     END_WHILE 
                  
            INT  21H   ; CALL  function to display or print 
            CMP DL,39H ;when complete print all digits it then go to the 
                       ; label CONVERTER to print letter A to F 
                       ;hexadecimal number
            JE CONVERTLETTER
            INC DL  ; it will take letter B,C,D,E,F corresponding hexadecimal
                       ; values
			DEC   CL ;  CL= CL -1
JMP  TOP  
CONVERTLETTER:
            MOV DL,41H ; ASCII character A hexadecimal is 41H
            JMP TOP



END_WHILE: ; label where exit from program
    main endp
end main
.data

msg db 'ALL Hexadecimal Digit using For Loop:$'
msg1 db 'ALL Hexadecimal Digit using WHILE Loop:$'
msg2 db 'ALL Hexadecimal Digit using DO_WHILE Loop:$'
  
.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print result message
    lea dx,msg
    mov ah,9
    int 21h 
    
   ;FOR LOOP
    MOV AH,2
    MOV DL,30H
    AND CX,0
    MOV CX,15  ; Loop counter
    @LOOP:
          INT 21H   
          CMP DL,39H
          JE CONVERTLETTER_
          INC DL
     LOOP @LOOP ; loop is a keyword it has a built in feature
     ; it automatically decrement the content of counter register CX
     ; may be CL and check whether it's value is zero or not
     ;it it's value is zero for loop exit it's operation  
     
    CONVERTLETTER_:
            MOV DL,41H   ; print Uppercase letter from A (41H)
           
     @LOOP1:       
            INT 21h
            INC DL 
    LOOP @LOOP1
    
           
          ;JMP EXIT 
    
    ;print new line
    MOV AH,2
    MOV DL,10
    int 21h
    MOV DL,13
    int 21h
    
    
  ;WHILE - LOOP        
    ;print result message
    lea dx,msg1
    mov ah,9
    int 21h
    ;WHILE LOOP 
    AND DX,0
            MOV   CL, 15 ; CL = 15 (Loop counter)
			MOV   AH, 2  ;  prepare to display
			MOV   DL, 30H  ; DL= '0'
            MOV   BL, 0   ; BL = 0
  TOP:
			CMP  CL , BL  ;  if CL == 0
            JE     END_WHILE 
                  
            INT  21H   ; CALL  function to display  
            CMP DL,39H
            JE CONVERTLETTER
            INC DL
			DEC   CL ;  CL= CL -1
JMP  TOP  
CONVERTLETTER:
            MOV DL,41H
            JMP TOP
END_WHILE:
        ;JMP EXIT
    ;print new line
    MOV AH,2
    MOV DL,10
    int 21h
    MOV DL,13
    int 21h    
    ;print result message
    lea dx,msg2
    mov ah,9
    int 21h
        
 ;DO_WHILE_LOOP
         AND DX,0
        MOV   CL, 14 ; CL = 14 (Loop counter)
	    MOV   AH, 2  ;  prepare to display
	    MOV   DL, 30H  ; DL= '0'
        MOV   BL ,  0  ; BL= 0
  TOP1:
			
        INT  21H   ; CALL  function to display
		CMP DL,39H
        JE CONVERT_LETTER
		
		INC DL	
        CMP  CL , BL ;  if CL == 0
        JE     END_DO_WHILE
        DEC   CL ;  CL= CL -1
        JMP  TOP1 
        
 CONVERT_LETTER:
            MOV DL,41H
            JMP TOP1        
        
END_DO_WHILE:
   
    
    
  EXIT:  
    main endp
end main
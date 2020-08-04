.data

msg db 'ALL Hexadecimal Digit using Do-while Loop:$'

  
.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print result message
    lea dx,msg
    mov ah,9
    int 21h 
            
    
  ;DO_WHILE_LOOP  (same thing happen as before while loop)
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
        
END_DO_WHILE:; label where exit from program
    main endp
end main
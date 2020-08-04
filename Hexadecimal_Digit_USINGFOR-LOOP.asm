.data

msg db 'ALL Hexadecimal Digit using For Loop:$'

  
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
    MOV DL,30H ; digit 0 (ASCII value in hexadecimal 30H)
    AND CX,0
    MOV CX,15  ; Loop counter
    @LOOP:
          INT 21H  ;print digits and Letter symbol (A to F)
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
    
           
   
    main endp
end main
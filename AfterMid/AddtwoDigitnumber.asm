.STACK 6H
.DATA  
msg1 db 'Input first number:$'
msg2 db 'Input second number:$'
msg3 db 'Summation of two number:$'
.CODE
SMR PROC      
       ; initialize data segment
       MOV AX,@DATA
       MOV DS,AX
       
       ;print input message
       MOV AH,9   ; print string
       LEA DX,msg1
       INT 21h
       
    ; input First two digit number
    MOV CL,0 
    MOV CH,10D
    TOP:
    MOV AH,1   ; input single character
    INT 21H
    CMP AL,13D
    JNE CAL
    JMP LAST
    CAL:
     MOV BL,AL
     SUB BL,30H  ; convert hexa to decimal
     MOV AL,CL
     MUL CH  ; AL = Al*CH
     MOV CL,AL 
     ADD CL,BL
     JMP TOP
     LAST:  
     ;store number to other register
     MOV BH,CL
     ;print new line
     MOV AH,2 ;print single character
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
    ;print input message
       MOV AH,9
       LEA DX,msg2
       INT 21h 
     ; input second two digit number
     MOV CL,0 
    MOV CH,10D
    TOP1:
    MOV AH,1
    INT 21H
    CMP AL,13D
    JNE CAL1
    JMP LAST1
    CAL1:
     MOV BL,AL
     SUB BL,30H
     MOV AL,CL
     MUL CH
     MOV CL,AL 
     ADD CL,BL
     JMP TOP1
     LAST1:
     ;add two digit number
     ADD BH,CL ; BH = BH+CL
     
     ;ADD ALL DIGITS INTO STACK FOR DISPLAY
     MOV CL,10D
     MOV CH,0 ; counter
     AND AX,0 ; reset accumulator
     MOV AL,BH
     TOP3:
     DIV CL  ;AH=remainder & AL=Quotent
     AND DX,0
     MOV DL,AH
     PUSH DX
     INC CH
     AND AH,0 ;
     CMP AL,0
     JNE TOP3 
     ;print new line
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     ;print input message
       MOV AH,9
       LEA DX,msg3
       INT 21h
     ;print result 
     MOV AH,2 
     TOP4:
     POP DX
     ADD DL,30H  ; convert decimal to hexadecimal
     INT 21H   
     DEC CH
     CMP CH,0
     JNE TOP4
      
      
      
       
    SMR ENDP
END SMR
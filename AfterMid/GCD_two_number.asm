; LCM of two numbers        
.stack 10h
.data
msg db 'Input first number:$'
msg1 db 'Input second number:$'
msg2 db 'GCD of two number:$'
number1 db 1
number2 db 1
gcd db 0
.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    ; print input message
    
    lea dx,msg
    mov ah,9
    int 21h
    
    
    ;input first number
    
    
    MOV CL,0 
    MOV CH,10D
    TOP:
    MOV AH,1
    INT 21H
    CMP AL,13D
    JNE CAL
    JMP LAST
    CAL:
     MOV BL,AL
     SUB BL,30H
     MOV AL,CL
     MUL CH
     MOV CL,AL 
     ADD CL,BL
     JMP TOP
     LAST:  
     MOV number1,CL
     
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
     
    ; print input message
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    
    ;input second number
    
    
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
     MOV number2,CL 
     
     
    
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
     
     ;print message
     lea dx,msg2
    mov ah,9
    int 21h
    
      MOV BL,number1
      MOV BH,number2
     
     ; CALCULATE GCD OF TWO NUMBERS (GCD will store in BL register)  
     AND AX,0
     MOV AL,BH
     TOP2:
     DIV BL
     
     CMP AH,0
     JNE TOP3
     JE  TOP8
      
     TOP3:
         MOV CL,BL      
         MOV CH,AH
         AND AX,0
         MOV BL,CH
         MOV AL,CL
         JMP TOP2
     
     
     
     
     
   
     
   TOP8:
     
     
     
     MOV CL,10D
     MOV CH,0
     AND AX,0
     MOV AL,BL
     TOP5:
     DIV CL
     AND DX,0
     MOV DL,AH
     PUSH DX
     INC CH
     AND AH,0
     CMP AL,0
     JNE TOP5 
     
     
     ;print result     
     
     MOV AH,2 
     TOP6:
     POP DX
     ADD DL,30H
     INT 21H   
     DEC CH
     CMP CH,0
     JNE TOP6 
     
     
    main endp
end main
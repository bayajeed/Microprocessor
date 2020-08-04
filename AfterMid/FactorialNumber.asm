; Factorial(result of the factorial must be between 0 to 255 )       
.stack 10h
.data
msg db 'Input a number:$'
msg1 db '  Factorial of input nummber is:$'
msg2 db '  Factorial result exceed 255 :$'
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
     MOV number1,CL  ; input number is stored into number1
     
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
    
    MOV AL,5 
    CMP CL,AL
    JA MESSAGE
    JBE FACTORIAL
    
     
     
     
     FACTORIAL:
    
    lea dx,msg1 ; print message for print factorial number
    mov ah,9
    int 21h
     
     
     ; CALCULATE Factorial 
     
     AND AX,0
     AND CX,0  
     
     MOV BL,number1
     MOV AL,1
       
     TOP2:
     
     MUL BL   ; here Factorial result is stored
     
     
      
     CMP BL,1 
     JNE TOP3
     JE  RESULT 
     
      
     TOP3: 
         
         DEC BL 
         JMP TOP2
     
       
    RESULT: 
    MOV number2,AL
   
      
     
     ;STORE number into STACK with seperate digit
     
     MOV CL,10D
     MOV CH,0
     AND AX,0
     MOV AL,number2
     TOP5:
     DIV CL
     AND DX,0
     MOV DL,AH
     PUSH DX
     INC CH
     AND AH,0
     CMP AL,0
     JNE TOP5 
     
     
     ;print Number digit wise from STACK    
     
     MOV AH,2 
     TOP6:
     POP DX
     ADD DL,30H
     INT 21H   
     DEC CH
     CMP CH,0
     JNE TOP6 
    
    JMP EXIT 
    
   
   
   MESSAGE:
    
   lea dx,msg2 ; print message if Factorial result exceed 255
    mov ah,9
    int 21h 
    
    EXIT: 
    main endp
end main
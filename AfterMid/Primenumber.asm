; PRIME numbers        
.stack 10h
.data
msg db 'Input a number:$'
msg1 db '  Number is prime:$'
msg2 db '  Number is not prime::$'
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
     
    
     
     ; CALCULATE Prime  
     
     AND AX,0
     AND CX,0  
     MOV BL,2
     MOV BH,number1
     MOV AL,BH
       
     TOP2:
     
     DIV BL   ; here division is performed from 2 to n (if divisor of the input number is 1 then number is prime)
     
     
      
     CMP AH,0 
     JNE TOP3
     JE  TOP8 
     
      
     TOP3: 
     
         CMP BL,BH
         JE  RESULT
         
         INC BL 
         MOV AL,number1
         MOV AH,0
         JMP TOP2
     
   TOP8:
     
       INC CL  ; CL is stored the number of divisor 
       
     CMP BL,BH
     JE  RESULT
     
       INC BL
       MOV AL,number1
       MOV AH,0
       JMP TOP2
       
       
       
    RESULT: 
    MOV number2,CL  
     
     ;STORE number into STACK with seperate digit
     
     MOV CL,10D
     MOV CH,0
     AND AX,0
     MOV AL,number1
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
     
    
    MOV CH,number2
    
    CMP CH,1
    JE PRIME
    JNE NOTPRIME
    
    
    PRIME: 
    lea dx,msg1 ; print message if prime number
    mov ah,9
    int 21h 
    JMP EXIT
     
    NOTPRIME:
    
   lea dx,msg2 ; print message if not prime number
    mov ah,9
    int 21h 
    
    EXIT: 
    main endp
end main
; LCM of two numbers (input number between 1 to 9 as single digit)       

.data
msg db 'Input first number:$'
msg1 db 'Input second number:$'
msg2 db 'LCM of two number:$'
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
     MOV AH,1
    INT 21H
    MOV BL,AL
     SUB BL,30H
     MOV number1,BL
   
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
    MOV AH,1
    INT 21H
    MOV BH,AL
     SUB BH,30H
    MOV number2,BH
    
    
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
    
    
     ; CALCULATE GCD OF TWO NUMBERS (GCD will store in BL register)  
     AND AX,0
     MOV AL,BH
     TOP2:
     DIV BL
     
     CMP AH,0
     JNE TOP3
     JE  LCM
      
     TOP3:
         MOV CL,BL      
         MOV CH,AH
         AND AX,0
         MOV BL,CH
         MOV AL,CL
         JMP TOP2
     
     
     
     
     
     LCM:
     
     
      MOV gcd,BL    ; Move BL to gcd variable
     
      ;multiply two number  (Multiplication result store in CL)
      
      MOV BL,number1
      
      AND AX,0
      MOV AL,number2
      MUL BL
      
      MOV CL,AL    
     
      ;Claculate LCM  (LCM will store in BL)
      
;we know the mathematical formula
;mutiplication of two numbers = GCD of two numbers * LCM of two numbers 

;So, LCM of two numbers =(mutiplication of two numbers/GCD of two numbers)
      
      MOV BL,gcd
      
      AND AX,0
      MOV AL,CL
      DIV BL
     
      MOV BL,AL
     
      JMP result
     
     
      ;print result     
 result:    
     MOV AH,2 
     MOV DL,BL
     ADD DL,30H
     INT 21H

    main endp
end main
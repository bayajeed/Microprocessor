; PRIME numbers  (you must give input from 2 to 9 as a single digit
;because 1 is not prim number if you give 1 then it will be infinite loop)      

.data
msg db 'Input a number:$'
msg1 db '  Number is prime$'
msg2 db '  Number is not prime$'
number1 db 1     ;here number1 is a memory variable whose
                 ;default value is 1
number2 db 1     ;here number2 is a memory variable whose
                 ;default value is 1

.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    ; print input message
    
    lea dx,msg
    mov ah,9
    int 21h
    ;input a number
    MOV AH,1
    int 21h
    
    SUB AL,30H ; convert hexadecimal to decimal
    MOV  number1,AL ;number1=AL (store number in memory
                    ;variable number1)
    
   
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
     
     DIV BL   ; here division is performed from 2 to n 
     ;(if number of divisor is 1 then number is prime)
     ;because we already consider divisor 1 for every number
     
     
      
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
    MOV number2,CL  ;number2 store the number of divisor
     
   ;print number
   
    MOV AH,2
    MOV DL,number1
    ADD DL,30H
    INT 21h
     
    
    ;print message if prime or not prime
    
    MOV CH,number2 ;now CH store  the number of divisor
    
    CMP CH,1  ;(if number of divisor is 1 then number is prime)
                ;because we already consider divisor 1 for every number
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
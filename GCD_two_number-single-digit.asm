; GCD of two numbers (input number between 1 to 9 because single digit)        

.data
msg db 'Input first number:$'
msg1 db 'Input second number:$'
msg2 db 'GCD of two number:$'
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
    SUB BL,30H  ; convert hexadecimal to decimal
     
  
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
     SUB BH,30H ; convert hexadecimal to decimal
   
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
     
     AND AX,0   ; to get correct division result
     MOV AL,BH  ;store dividend into AL
     TOP2:
     DIV BL   ; BL is divisor
     
     CMP AH,0  ;check if remainder is zero  because when remainder
                ;  is zero division process will end
     JNE TOP3
     JE  RESULT
      
     TOP3:
         MOV CL,BL   ;temporarily store divisor in CL   
         MOV CH,AH   ;temporarily store remainder in CL
         AND AX,0
         MOV BL,CH; remainder will be the divisor for next term division
         MOV AL,CL  ; divisor will be the dividend for next term division
         JMP TOP2
     
     
  RESULT:   
     
        ;print result
        MOV AH,2
        MOV DL,BL
        ADD DL,30H ;convert decimal to hexadecimal 
                   ; to get correct result in print
        INT 21h    
     
    main endp
end main
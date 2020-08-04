.data
msg1 db 'Input first number:$'
msg2 db 'Input second number:$'
msg3 db 'Input third number:$'
msg4 db 'SMALLEST number is:$'


.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print input message
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;input first number
    mov ah,1
    int 21h
    
    mov bl,al
    ;print new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;print input message
    lea dx,msg2
    mov ah,9
    int 21h
    
    ;input second number
    mov ah,1
    int 21h
    
    mov bh,al
    ;print new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ;print input message
    lea dx,msg3
    mov ah,9
    int 21h
    
    ;input third number
    mov ah,1
    int 21h
    
    mov cl,al
    ;print new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ;print output result message
    lea dx,msg4
    mov ah,9
    int 21h
    ; cmp or compare instruction perform subtract opearation of the 
    ; source operand (bh) and destination operand (bl) and check if 
    ; it's value is zero or positive or negative but it can not 
    ;change the content of the operands value
    ; if subtract result is zero then both operands are equal
    ;if subtract result is positive then first operand greater than second 
    ;;if subtract result is negative then first operand smaller than second
    cmp bl,bh  ; compare first and second number
    jb SMALL
    ja LARGE
    
    SMALL:
            cmp bl,cl    ; compare first and third number
            jb FIRST_NUMBER_IS_SMALL
            ja THIRD_NUMBER_IS_SMALL
            
            
    LARGE:
            cmp bh,cl    ; compare second and third number
            jb SECOND_NUMBER_IS_SMALL
            ja THIRD_NUMBER_IS_SMALL  
            
            
    FIRST_NUMBER_IS_SMALL:
                            mov ah,2        
                            mov dl,bl
                            int 21h
                            jmp EXIT 
    SECOND_NUMBER_IS_SMALL:
                            mov ah,2        
                            mov dl,bh
                            int 21h
                            jmp EXIT 
    THIRD_NUMBER_IS_SMALL:
                            mov ah,2        
                            mov dl,cl
                            int 21h
   
   EXIT:         
    main endp
end main
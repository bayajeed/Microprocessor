;input three number and find out the largest number using if else
.data
msg1 db 'Input first number:$'
msg2 db 'Input second number:$'
msg3 db 'Input third number:$'
msg4 db 'Largest number is:$'


.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print input message
      ;LEA means load effective address, here why we use LEA instead of MOV
      ; the main reason is MOV instruction transfer data value between two
      ; registers or between memory variable and register
      ;but here the string which is some consecutive sequential bytes of
      ; data and stored in data segment memory of the RAM portion
  ; so to get data from that data segment of memory it's required to calculate 
      ;actual physical address of RAM location. For this reason 
      ; here use load effective address or actual physical address of
      ; the RAM location where data is stored
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;input first number
    mov ah,1
    int 21h
    
    mov bl,al ; first number store in BL
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
    
    mov bh,al ; second number store in BH
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
    
    mov cl,al; third number store in CL
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
     
    ; IF-ELSE format begin here 
    cmp bl,bh  ; (cmp means compare)compare first number(bl) and second number(bh) 
    ja LARGE   ;  ja means jump if above or bl>bh
    jb SMALL   ;  jb means jump if below or bl<bh
    
    LARGE:
            cmp bl,cl    ; compare first and third number(cl)
            ja FIRST_NUMBER_IS_LARGE ; bl>cl
            jb THIRD_NUMBER_IS_LARGE  ;bl<cl
            
            
    SMALL:
            cmp bh,cl    ; compare second and third number
            ja SECOND_NUMBER_IS_LARGE
            jb THIRD_NUMBER_IS_LARGE  
            
            
    FIRST_NUMBER_IS_LARGE:
                            mov ah,2        
                            mov dl,bl;first number bl
                            int 21h
                            jmp EXIT 
    SECOND_NUMBER_IS_LARGE:
                            mov ah,2        
                            mov dl,bh ;second number bh
                            int 21h
                            jmp EXIT 
    THIRD_NUMBER_IS_LARGE:
                            mov ah,2        
                            mov dl,cl ;third number cl
                            int 21h
   
   EXIT:         
    main endp
end main
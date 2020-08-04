;input two number from keyboard , if first number is larger than second
; perform addition otherwise perform subtraction (small number from large)
; do this program using swith case
.data
msg1 db 'Input first number:$'
msg2 db 'Input second number:$'
msg3 db 'Sum of two number is:$' 
msg4 db 'Subtraction first number from second is:$'

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
    
    mov cl,al
    ;print new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
       
    cmp bl,cl  ; compare first and second number
    ja CASE_LARGE  ;like  swith case ( case large) 
    jb CASE_SMALL ;;like  swith case ( case small)
        
    CASE_LARGE:
            ;print result message
            lea dx,msg3
            mov ah,9
            int 21h
            
            ; add two number
            add bl,cl   ; bl = bl + cl
            sub bl,30h  ;to get correct result in hexadecimal
            
            mov ah,2
            mov dl,bl
            int 21h
            jmp EXIT
            
    CASE_SMALL:
              ;print result message
            lea dx,msg4
            mov ah,9
            int 21h
            
            ; subtract two number
            sub cl,bl    ; cl = cl-bl
            add cl,30h ;to get correct result in hexadecimal
            
            mov ah,2
            mov dl,cl
            int 21h
    
   
   EXIT:         
    main endp
end main
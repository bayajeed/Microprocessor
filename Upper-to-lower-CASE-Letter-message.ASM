; input an Uppercase letter from keyboard with message
;and print lowercase letter in new line.
.data 
; variable declaration sytax 
; variable_name <space> data_type <space> value
;here variable name can be written as valid identifier rules
;data_type here used "DB" means define byte
;string written between single quotation 
;here dolar($) symbol represent end of string

message1 DB 'Input an uppercase letter:$' 
message2 DB 'Lowercase letter is:$' 
.code
main proc
     
    ;initialize data segment (following two line is fixed)
    MOV AX,@DATA ; take word size data from data segment to Accumulator
    MOV DS,AX  ; finally store value to the specified memory(RAM)
    ; of data segment from accumulator
    
    ;print message for input 
    LEA DX, message1 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
    
    
     
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL (input uppercase letter) 
    ADD BL,20H ; convert uppercase letter to lowercase letter
    ;here logic is ASCII value of uppercase letter for example
    ; 'A' is 65 in decimal or 41H in hexadecimal
    ;  if we add 20H in hexadec imal then it will be
    ; 41h+20h=61h which is the ASCII value of lowercase letter 'a'
    
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
    ;print output message
     
    LEA DX, message2 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
     
      
     ;print lowercase letter
     MOV AH,2; print a single character
    
     MOV DL,BL ; DL= BL
     INT 21h
     
    main endp
end main
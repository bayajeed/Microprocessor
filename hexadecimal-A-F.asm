;input any hexadecimal number from A to F and show
; it's corresponding decimal values in new line with input messages
.data
message1 DB 'input any hexadecimal number from A to F:$'
message2 DB 'The corresponding decimal number is:$' 

.code 
MAIN PROC  ;procedure call
      ;initialize data segment
      MOV AX, @DATA
      MOV DS, AX
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
      LEA DX,message1
      MOV AH,9
      INT 21H
      
       
      MOV AH,1 ; input a single character from keyboard
      INT 21H ; execute function
      
      MOV BL, AL  ; store input into BL       
      
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character
      INT 21h
      
      ;print output message
      LEA DX,message2
      MOV AH,9
      INT 21H   
      
      ; print default first digit which is '1'
      MOV Dl, 31H ; print  default value '1' whose ascii is 31H
      MOV AH,2; AH=2 (print a single character)
      INT 21h
      
      SUB BL,11H ; convert the input number into second digit
           
       ;print value
      MOV DL,BL ;  mov input data into data register 
      ; as long as AH=2 stored it only print single character
      ;multiple time assigning of AH=2 is not mandatory
      INT 21H ; execute function
      
    MAIN ENDP  ;procedure finish
END MAIN      ;exit from program
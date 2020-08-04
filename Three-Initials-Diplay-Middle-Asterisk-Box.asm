;input three initials of your name and
; display it middle of 11*11 asterisk box using int 21h function
.data
message1 DB 'input initial of your first name:$'
message2 DB 'input initial of your middle name:$'  
message3 DB 'input initial of your last name:$'
AsteriskSymbols db '***********$'
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
      
      MOV BL, AL  ; store first initial into BL       
      
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character
      INT 21h
      
      ;print  message
      LEA DX,message2
      MOV AH,9
      INT 21H   
      
      MOV AH,1 ; input a single character from keyboard
      INT 21H ; execute function
      
      MOV BH, AL  ; store middle initial into BH
      
       
    ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character
      INT 21h
      
      ;print  message
      LEA DX,message3
      MOV AH,9
      INT 21H   
      
      MOV AH,1 ; input a single character from keyboard
      INT 21H ; execute function
      
      MOV CH, AL  ; store last initial into CH   
       
      
     ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      INT 21h
       
      ; print asterisk symbols  
      LEA DX,AsteriskSymbols
      MOV AH,9
      INT 21H  ;print 1st  time 
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      
      INT 21h  ; print 2nd times  
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ;print 3rd times
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ; print 4th times
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ;print 5th  times
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      
      ;store the three initials character middle of asterisk symbol box
      MOV AsteriskSymbols+4, BL ; store first initial 5th position of asterisksymbols string
      MOV AsteriskSymbols+5, BH ;store middle initial 6th position of asterisksymbols string
      MOV AsteriskSymbols+6, CH ;store last initial 7th position of asterisksymbols string
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h  ; display the modified string asterissymbols 6th times
      
      ; move back the  asterisksymbols string to their original 
      MOV AsteriskSymbols+4, "*" ;restore * symbol in 5th position of asterisksymbols string 
      MOV AsteriskSymbols+5, "*" ;restore * symbol in 6th position of asterisksymbols string
      MOV AsteriskSymbols+6, "*" ;restore * symbol in 7th position of asterisksymbols string
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      
       ; print asterisk symbols  
      LEA DX,AsteriskSymbols
      MOV AH,9
      INT 21H  ;print 7th  time 
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      
      INT 21h  ; print 8th times  
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ;print 9th times
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ; print 10th times
      
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character twice
      INT 21h
      
      ; print asterisk symbols
      LEA DX,AsteriskSymbols
      MOV AH,9
      int 21h ;print 11th  times
       
     
      
    MAIN ENDP  ;procedure finish
END MAIN      ;exit from program
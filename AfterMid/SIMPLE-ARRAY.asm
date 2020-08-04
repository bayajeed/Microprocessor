
 ;An AL Program that computes the sum of an array of size 10
              ; with elements 10,20,30,40,50,60,70,80,90 and 100 respectively.
              ; Place the sum in AX and also display it. Use Register Indirect
              ; Mode to access the array elements.


 .STACK 100H

 .DATA
    PROMPT  DB  'The Array elements are : $'
    RESULT  DB  0DH,0AH,'The Sum of the Array is = $'

    ARRAY   DB  10,20,30,40,50,60,70,80,90,100

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     MOV BX, 10                   ; set BX=10

     LEA DX, PROMPT               ; load and display the string PROMPT
     MOV AH, 9                                                    
     INT 21H

     MOV CX, BX                   ; set CX=BX
     LEA SI, ARRAY                ; set SI=offset address of ARRAY

     @LOOP:                       ; loop label
       XOR AH, AH                 ; clear AH
       MOV AL, [SI]               ; set AX=[SI]

       CALL OUTDEC                ; call the procedure OUTDEC

       INC SI                     ; set SI=SI+1

       MOV AH, 2                  ; set output function
       MOV DL, 20H                ; set DL=20H
       INT 21H                    ; print a character
     LOOP @LOOP                   ; jump to label @LOOP while CX!=0

     LEA DX, RESULT               ; load and display the string RESULT
     MOV AH, 9
     INT 21H

     LEA SI, ARRAY                ; set SI=offset address of ARRAY

     CALL SUM                     ; call the procedure SUM
     CALL OUTDEC                  ; call the procedure OUTDEC

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP

; Procedure Definitions 
 ; SUM  

 SUM PROC
   ; this procedure will calculate the sum of an array
   ; input : SI=offset address of the array
   ;       : BX=size of the array
   ; output : AX=sum of the array

   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   XOR AX, AX                     ; clear AX
   XOR DX, DX                     ; clear DX
   MOV CX, BX                     ; set CX=BX

   @SUM:                          ; loop label
     MOV DL, [SI]                 ; set DL=[SI]
     ADD AX, DX                   ; set AX=AX+DX
     INC SI                       ; set SI=SI+1
   LOOP @SUM                      ; jump to label @SUM while CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX

   RET                            ; return control to the calling procedure
 SUM ENDP

 ;  OUTDEC 

 OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none

   PUSH BX                        ; push BX onto the STACK
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   CMP AX, 0                      ; compare AX with 0
   JGE @START                     ; jump to label @START if AX>=0

   PUSH AX                        ; push AX onto the STACK

   MOV AH, 2                      ; set output function
   MOV DL, "-"                    ; set DL='-'
   INT 21H                        ; print the character

   POP AX                         ; pop a value from STACK into AX

   NEG AX                         ; take 2's complement of AX

   @START:                        ; jump label

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   @OUTPUT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE @OUTPUT                    ; jump to label @OUTPUT if ZF=0

   MOV AH, 2                      ; set output function

   @DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP

 
 END MAIN
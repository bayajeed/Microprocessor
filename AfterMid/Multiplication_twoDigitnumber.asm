.stack 6h
.data
.code

main proc

mov cl,0
mov ch,10
TOP:

mov ah,1
int 21h
cmp al,13d
jne cal
jmp last

cal:
mov bl,al
sub bl,30h
mov al,cl
mul ch
mov cl,al
add cl,bl
jmp top
last:
mov bh,cl

;print newline
mov ah,2
mov dl,10
int 21h

mov dl,13
int 21h

;input second number
mov cl,0
mov ch,10

top1:
mov ah,1
int 21h
cmp al,13D
jne cal1
jmp last1
cal1:
mov bl,al
sub bl,30h
mov al,cl
mul ch
mov cl,al
add cl,bl
jmp top1
last1:

mov al,bh
mul cl
mov bh,al
;print newline
mov ah,2
mov dl,10
int 21h

mov dl,13
int 21h


;store summation into stack to print result

mov cl,10
and ax,0

mov ch,0
mov al,bh
top3:
div cl
and dx,0
mov dl,ah
push dx
inc ch
and ah,0
cmp al,0
jne top3

;print newline
mov ah,2
mov dl,10
int 21h

mov dl,13
int 21h


; print result
mov ah,2
top4:
pop dx
add dl,30h
int 21h
dec ch
cmp ch,0
jne top4



main endp
end main
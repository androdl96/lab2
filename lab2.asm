
.model small
.stack
.data 
List1 db  1,2,3,4,5,6,47h,7,8,9,50h,14,15,16,17,18 ;41h-5Ah
cont db 0 
caracter db 'La cantidad de elementos de la nueva es:$'   
List2 db 20 dup(?)
.code
Lab2 proc far
        Mov AX,@data
        Mov DS, AX
        lea BX,List1
        lea DI,List2
        mov cx,19
again:  mov AL,[BX] 
        mov DL,41h
        cmp DL,AL
        ja lb0 
        mov DL,5Ah
        cmp DL,Al
        jb lb0
here:   inc BX
        mov AL,[BX]
        mov DL,41h
        cmp DL,AL
        ja  lb1 
        mov DL,5Ah
        cmp DL,Al
        ja exit
lb1:    mov [DI],AL  
        inc DI
        inc cont
        loop here
        jmp exit   
                  
lb0:    inc bx
        loop again
                 
exit:   mov ah,09
        mov dx,offset caracter
        int 21h
        mov DX,0
        mov Dl,cont
        add Dl,30h
        mov ah,02
        int 21h
        Mov AX, 4C00h
        Int 21h
Lab2 endp
End
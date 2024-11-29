product dw 1
i dw 1
mov ax, 1
mov bx, 1

buclefor:

cmp bx, 5
jg final
mul ax, bx
inc bx
jmp buclefor

final:
mov [product], ax
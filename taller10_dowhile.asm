sum dw 0
numbers dw 5, 8, 12, -4 ptr dw numbers
mov ax, 0
mov si, ptr

dowhile:
mov bx, [si]

test bx, bx
js final

add ax, bx

add si, 2
jmp dowhile

final:
mov [sum], ax
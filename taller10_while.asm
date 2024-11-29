sum dw 0
count dw 1

mov ax, 0
mov bx, 1

while:
cmp bx, 10
jg final //SI es mas grande se va a final
add ax, bx
inc bx

jmp while //reggresa a while

final:
mov [sum], ax
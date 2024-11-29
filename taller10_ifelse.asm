num dw 7
msjpar db 'El número es par', 0
msjimpar db 'El número es impar', 0

mov ax, [num]

test ax, 1
jz espar

esimpar:
mov dx, msjimpar
jmp enseñarmensaje

espar:

mov dx, msjpar

enseñarmensaje:
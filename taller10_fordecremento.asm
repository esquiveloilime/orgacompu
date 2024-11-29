count dw 10
uffer db '00', 0xA
mov cx, 10

for:
mov ax, cx
add al, '0'
mov [buffer], al
mov edx, 2
mov ecx, buffer
mov ebx, 1
mov eax, 4 ;
dec cx
cmp cx, 1
jge for ;
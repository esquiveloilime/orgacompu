section .data
num1 db 5 ;a num1 le da valor de 5
num2 db 11 ; a num2 le da valor de 11;
result db 0 ;para guardar el resultado
msg db 'Resultado: ', 0 ;mensaje

section .bss
buffer resb 4

section .text
global _start

_start:

mov al, [num1] ;mueve a al el valor de num 1
add al, [num2] ;a lo que esta en al (5) le suma num 2
mov [result], al ;mueve a result el valor final de al
; Convertir el resultado a ASCII
movzx eax, byte [result]
add eax, 48 ; Convertir el valor numérico en su
correspondiente ASCII ('0' = 48)
mov [buffer], al ; Almacenar el carácter ASCII en el
buffer

mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 11
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, buffer

mov edx, 1
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

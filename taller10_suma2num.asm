section .data
num1 db 1
num2 db 1
result db 0

msg db "Resultado: ", 0
resultStr db "00", 10 ;
zeroMsg db "Esto es un cero", 10
section .text
global _start

_start:
; Realizar la suma de num1 y num2
mov al, [num1]
add al, [num2]
mov [result], al

; Verificar si el resultado es igual a 0
cmp al, 0
je print_zero

; Convertir el resultado a ASCII si es mayor que 0
add al, '0'
mov [resultStr], al

mov eax, 4
mov ebx, 1

mov ecx, msg
mov edx, 11
int 0x80
; Imprimir el resultado de la suma
mov eax, 4
mov ebx, 1
mov ecx, resultStr
mov edx, 1
int 0x80
jmp exit_program

print_zero:

mov eax, 4
mov ebx, 1
mov ecx, zeroMsg
mov edx, 17
int 0x80

exit_program:
; Terminar el programa
mov eax, 1
xor ebx, ebx

int 0x80
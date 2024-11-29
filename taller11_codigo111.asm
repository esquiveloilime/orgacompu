section .data

num1 db 5 ; numero 1
num2 db 11 ; numero 2
result db 0 ; Resultado
message db "Resultado: ", 0 ; mensaj que acompaña el comnentario

section .bss
buffer resb 4 ;

section .text
global _start

%macro PRINT_STRING 1
mov eax, 4 ;
mov ebx, 1 ;
mov ecx, %1 ;
mov edx, 13 ; Longitud del texto
int 0x80
%endmacro

%macro PRINT_NUMBER 1
mov eax, %1 ; guarda el numero
add eax, '0' ; lo hace asci
mov [buffer], eax ; lo guarda
mov eax, 4 ;

mov ebx, 1 ;
mov ecx, buffer ;
mov edx, 1 ;
int 0x80
%endmacro

_start:
mov al, [num1] ; guarda num1 en AL
add al, [num2] ; suma num2 a AL
mov [result], al ;guarda el resultado

PRINT_STRING message ; Imprime el mensaje
PRINT_NUMBER [result] ; Imprime el resultado

mov eax, 1 ; Llamada para salir
mov ebx, 0 ; Código de salida
int 0x80

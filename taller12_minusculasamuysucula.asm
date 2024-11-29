section .data
prompt db "Ingresa una letra minuscula: ", 0
result db "La letra mayuscula es: ", 0
newline db 10, 0

section .bss
input_char resb 1 ;Espacio para almacenar el carácter ingresado

section .text
global _start

_start:
; Mostrar mensaje de entrada
mov eax, 4
mov ebx, 1 ; salida

mov ecx, prompt ; mensaje a imprimir
mov edx, 29 ; longitud del mensaje
int 0x80 ; llamada al sistema

; Leer el carácter ingresado
mov eax, 3
mov ebx, 0 ; entrada
mov ecx, input_char ; dónde guardar el carácter
mov edx, 1 ; longitud de lectura (1 byte)
int 0x80 ; llamada al sistema

; Convertir a mayúscula si es una letra minúscula
mov al, byte [input_char] ; Cargar el carácter ingresado
cmp al, 'a' ; Comparar con 'a'
jl no_conversion ; Si es menor, no es minúscula
cmp al, 'z' ; Comparar con 'z'
jg no_conversion ; Si es mayor, no es minúscula
sub al, 32 ; Convertir a mayúscula (restar 32)
mov byte [input_char], al ; Guardar el carácter convertido

no_conversion:
; Mostrar mensaje de salida
mov eax, 4
mov ebx, 1 ; salida

mov ecx, result ; mensaje a imprimir
mov edx, 26 ; longitud del mensaje
int 0x80 ; llamada al sistema

; Imprimir el carácter convertido
mov eax, 4
mov ebx, 1 ; salida
mov ecx, input_char ; carácter a imprimir
mov edx, 1 ; longitud (1 byte)
int 0x80 ; llamada al sistema

; Salto de línea
mov eax, 4
mov ebx, 1 ; salida
mov ecx, newline ; salto de línea
mov edx, 1 ; longitud (1 byte)
int 0x80 ; llamada al sistema

; Salir del programa
mov eax, 1
xor ebx, ebx ; código de salida
int 0x80 ; llamada al sistema
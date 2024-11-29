%macro DEFINIR_FECHA 4
%1_dia db %2 ; Día (dd)
%1_mes db %3 ; Mes (mm)
%1_ano dw %4 ; Año (yyyy)
%endmacro

%macro DEFINIR_CORREO 2
%1_correo db %2, 0
%endmacro

%macro DEFINIR_DIRECCION 4
%1_calle db %2, 0 ; Calle
%1_numero_casa db %3, 0 ; Número de casa
%1_colonia db %4, 0 ; Colonia
%endmacro

%macro DEFINIR_CURP 2
%1_curp db %2, 0
%endmacro
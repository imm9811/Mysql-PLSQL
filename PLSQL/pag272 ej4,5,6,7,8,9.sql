pag 272 4,5,6,7,8,9

4 /*Escribe una función que reciba una fecha y devuelva
el año, en número, correspondiente a esa fecha.*/


ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

CREATE OR REPLACE FUNCTION anio	(fecha DATE)
RETURN NUMBER
AS
	v_any NUMBER(4);
BEGIN
	v_any := TO_NUMBER(TO_CHAR(fecha, 'YYYY'));
	RETURN v_any;
END anio;


5 /*Escribir un bloque PL/SQL que haga uso de la función anterior*/

DECLARE
 	n NUMBER(4);
BEGIN
 	n := anio(SYSDATE);
 	DBMS_OUTPUT.PUT_LINE('ANY : '|| n);
END;


6 /*Desarrolla una función que devuelva el número de
años completos que hay entre dos fechas que se pasan
como parámetros.*/

CREATE OR REPLACE FUNCTION anys_dif (
data1 DATE, data2 DATE)
RETURN NUMBER
AS
	v_anys_dif NUMBER(6);
BEGIN
	v_anys_dif := ABS(TRUNC(MONTHS_BETWEEN(data2,data1)/ 12));
	RETURN v_anys_dif;
END anys_dif;

CREATE OR REPLACE FUNCTION anys_dif (
data1 DATE, data2 DATE)
RETURN NUMBER
AS
	v_anys_dif NUMBER(6);
	v_anio_uno number(22);
	v_anio_dos number(22);
BEGIN
	v_anio_uno := TO_NUMBER(fecha1, 'YYYY');
	v_anio_dos := TO_NUMBER(fecha2, 'YYYY');

	if v_anio_uno>v_anio_dos then
	v:= v_anio_uno-v_anio2;
	elsif
	



/*scribe una función que, haciendo uso de la función
anterior, devuelva los trienios que hay entre dos
fechas (un trienio son tres años).*/

CREATE OR REPLACE FUNCTION trienis (
data1 DATE, data2 DATE)
RETURN NUMBER
AS
	v_trienis NUMBER(6);
BEGIN
	v_trienis := TRUNC(anys_dif(data1,data2) / 3);
 	RETURN v_trienis;
END;

8 /*Codifica un procedimiento que reciba una lista de
hasta cinco números y visualice su suma.*/



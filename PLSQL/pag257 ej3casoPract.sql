/*Vamos a construir de dos maneras un bloque PL/SQL que escriba la cadena 'HOLA' al revés.*/
 DECLARE
 r_cadena VARCHAR2(10);
 BEGIN
 FOR i IN REVERSE 1..LENGTH('HOLA') LOOP
 r_cadena := r_cadena||SUBSTR('HOLA',i,1);
 END LOOP;
 DBMS_OUTPUT.PUT_LINE(r_cadena);
 END;

ALOH
Procedimiento PL/SQL terminado con éxito.

funciona

 DECLARE
 r_cadena VARCHAR2(10);
 i BINARY_INTEGER;
 BEGIN
 i := LENGTH('HOLA');
 WHILE i >= 1 LOOP
 r_cadena :=r_cadena||SUBSTR('HOLA',i,1);
 i := i - 1;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE(r_cadena);
 * END;

ALOH
Procedimiento PL/SQL terminado con éxito.
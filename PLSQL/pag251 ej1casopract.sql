
Si no tiene ningún empleado a su cargo la subida será 50 €.
– Si tiene 1 empleado la subida será 80 €.
– Si tiene 2 empleados la subida será 100 €.
– Si tiene más de tres empleados la subida será 110 €.
Además, si el empleado es PRESIDENTE se incrementará el salario en 30 €.


DECLARE
v_empleado_no NUMBER(4,0); -- emple al que subir salario
v_c_empleados NUMBER(2); -- cantidad empl dependen de él
v_aumento NUMBER(7) DEFAULT 0; -- importe que vamos a aumentar.
v_oficio VARCHAR2(10);
BEGIN
v_empleado_no := 7521; -- var de sustitución lee nºemple no funciona sustituir por un valor cualquiera
SELECT oficio INTO v_oficio FROM emple
WHERE emp_no = v_empleado_no;
IF v_oficio = 'PRESIDENTE' THEN -- alternativa simple
v_aumento := 30;
END IF;
SELECT COUNT(*) into v_c_empleados FROM emple
WHERE dir = v_empleado_no;
IF v_c_empleados = 0 THEN -- alternativa múltiple
v_aumento := v_aumento + 50;

ELSIF v_c_empleados = 1 THEN
v_aumento := v_aumento + 80;

ELSIF v_c_empleados = 2 THEN
v_aumento := v_aumento + 100;

ELSE
v_aumento := v_aumento + 110;
END IF;
UPDATE emple SET salario = salario + v_aumento WHERE emp_no = v_empleado_no;
DBMS_OUTPUT.PUT_LINE(v_aumento);
END;
/*
CASE
WHEN v_c_empleados = 0 THEN
v_aumento := v_aumento + 50;
WHEN v_c_empleados = 1 THEN
v_aumento := v_aumento + 80;
WHEN v_c_empleados = 2 THEN
v_aumento := v_aumento + 100;
ELSE
v_aumento := v_aumento + 110;
END CASE;

-----------------------------------------
CASE val
WHEN 1 THEN
INSERT INTO TEMP VALUES 'UNO';
WHEN 2 THEN
INSERT INTO TEMP VALUES 'DOS';
WHEN 0 THEN
NULL; -- No hace nada.
ELSE THEN
INSERT INTO TEMP VALUES 'ERROR'
END CASE;


*/
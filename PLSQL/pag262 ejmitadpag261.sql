CREATE OR REPLACE FUNCTION Encontrar_Num_empleado (
v_apellido VARCHAR2)
RETURN REAL
AS
N_empleado emple.emp_no%TYPE;
BEGIN
SELECT emp_no INTO N_empleado FROM emple
WHERE apellido = v_apellido;
RETURN N_empleado;
END Encontrar_num_empleado;
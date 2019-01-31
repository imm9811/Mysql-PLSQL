DECLARE
v_apellidos VARCHAR2(25);
v_1apel VARCHAR2(25);
v_caracter CHAR;
v_posicion INTEGER :=1;
BEGIN
v_apellidos := 'MORENO BONILLA';
v_caracter := SUBSTR(v_apellidos,v_posicion,1);
WHILE v_caracter BETWEEN 'A' AND 'Z' LOOP
v_1apel := v_1apel || v_caracter;
v_posicion := v_posicion + 1;
v_caracter := SUBSTR(v_apellidos,v_posicion,1);
END LOOP;
DBMS_OUTPUT.PUT_LINE('1er Apellido:'||v_1apel||'*');
END;

/*-----------------------------------------------------*/

DECLARE
v_apellidos VARCHAR2(25);
v_1apel VARCHAR2(25);
v_caracter CHAR;
v_posicion INTEGER :=1;
BEGIN
v_apellidos := 'MORENO BONILLA';
-- desaparece la asignación de v_caracter antes del bucle
-- se asignará dentro al comienzo del bucle.
LOOP
v_caracter := SUBSTR(v_apellidos,v_posicion,1);
EXIT WHEN v_caracter NOT BETWEEN 'A' AND 'Z';
v_1apel := v_1apel || v_caracter;
v_posicion := v_posicion + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('1er Apellido:'||v_1apel||'*');
END;
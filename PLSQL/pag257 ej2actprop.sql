/*2 Escribe un bloque PL/SQL que realice la misma función del
 ejemplo anterior pero usando un bucle ITERAR.*/

es basicamente hacerlo con un loop, no que haya un
 bucle que tenga las entencia iterar
/*
 declare 
 r_cadena varchar(20);
 bandera integer(20);
palabraClave CONSTANT varchar(5) := 'hola';
 begin
 bandera:=length(palabraClave);
loop
r_cadena := r_cadena || SUBSTR(palabraClave,bandera,1);
bandera: = bandera - 1;
EXIT WHEN length(r_cadena) == 4;
end loop
DBMS_OUTPUT.PUT_LINE();
END;
*/
/*el exit se puede poner en cualquier parte dentro del loop ya que
 se salta la orden hasta que se cumpla la condicion*/
Declare 
    r_cadena VARCHAR2(10); 
    v_caracter CHAR; 
    i INTEGER; 
Begin 
    i := LENGTH('HOLA'); 
    Loop 
        v_caracter := SUBSTR('HOLA',i,1); 
    EXIT When i < 1; 
        r_cadena := r_cadena || v_caracter; 
        i := i - 1; 
    End LOOP; 
    DBMS_OUTPUT.PUT_LINE(r_cadena); 
END;
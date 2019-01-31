/*
create or replace procedure(num1 number, num2 number) as hacer_suma;

begin

DBMS_OUTPUT.PUT_LINE( num1+num2);

end;
*/

/*EJERCICIO 1 Escribe un procedimiento que reciba dos números y
visualice su suma.*/
declare 
num1 Number(5,2) :=5;
num2 Number(5,2) :=2;
begin

DBMS_OUTPUT.PUT_LINE(num1+num2);
end;

create procedure suma(v1,v2) is
	begin 
	...codigo
	end;

/*EJERCICIO 2 Codifica un procedimiento que reciba una cadena y la
visualice al revés.*/

create or replace procedure poner_reves (cadena varchar) as poner_reves emp.emp_no%type;

 DECLARE
 r_cadena VARCHAR2(10);
 i BINARY_INTEGER;
 BEGIN
 i := LENGTH(cadena);
 WHILE i >= 1 LOOP
 r_cadena :=r_cadena||SUBSTR(cadena,i,1);
 i := i - 1;
 END LOOP;
 DBMS_OUTPUT.PUT_LINE(r_cadena);
 * END;

create or replace reves(v_cadena) is
	v_resultado varchar2(100);
	begin
	for i in reverse 1..length(v_cadena)
	LOOP
	v_resultado := resultado || substr(v_cadena,i,1);
	
	end loop;
	DBMS_OUTPUT.put_line(v_resultado);
	end;

/*EJERCICIO 10 Codifica un procedimiento que permita borrar un
empleado cuyo número se pasará en la llamada.*/


select * from emple;
create or replace procedure despedir_empleado( num_emp number) 
	as borrar_empleado emple.emp_no%type;

begin

	delete from emple where emp_no=num_emp;
	DBMS_OUTPUT.PUT_LINE('ha sido despedido el empleado numero ' || num_emp);
end;

execute despedir_empleado(1);
select * from emple;



/*EJERCICIO 11 Escribe un procedimiento que modifique la localidad
de un departamento. El procedimiento recibirá como
parámetros el número del departamento y la nueva
localidad.*/

select * from depart;
create or replace procedure modificar_localidad( num_dept number, nueva_localidad varchar)
 as modif_local_depar depart.DEPT_NO%TYPE;

 BEGIN
 	UPDATE depart set loc = nueva_localidad
 	where DEPT_NO=num_dept;
 	DBMS_OUTPUT.PUT_LINE('ha sido modificado el departamento' || num_dept);

 END;
select * from depart;









/*EJERCICIO 1*/












select * from emple;

create or replace procedure crear_empleado(

num_empleado number,
apellido_emple varchar,
salario number,
num_depar number)

as v_introusu_depar emple.emp_no%type;

begin
/*puedo poner los campos que yo quiera y en el orden que yo quiera, ya que los unicos not null son emp_no y dept_no y plsql le da igual el orden*/
insert into emple (emp_no, apellido, salario, dept_no) values(num_empleado,apellido_emple,salario,num_depar);
DBMS_OUTPUT.PUT_LINE('se ha introducido el empleado numero ' || num_empleado || ' llamado: ' || apellido_emple || ' en el departamento ' || num_depar);

end;

execute crear_empleado(2,'conejo',124, 20);

select * from emple;
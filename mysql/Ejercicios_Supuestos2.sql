
/*Supuestos 2 hospital*/

/*1. medicos MIR que tienen un determinado medico*/

select medico_ncolegiado from medico where ncolegiado=2;


/*2. Pacientes que han pasado consulta un dia determinado*/
																/*tambien puedo poner = pero asi solo me saca un resultado aunque haya varios eso se soluciona con in*/
select nombre, seguridadsocial from paciente where seguridadsocial in (select paciente_seguridadsocial from atiende where fecha='2018-04-03');

select nombre, seguridadsocial, fecha
from paciente p, atiende a
where p.seguridadsocial=a.paciente_seguridadsocial 
 and seguridadsocial in (select paciente_seguridadsocial from atiende where fecha='2018-04-03');

/*3. listado de camas ocupadas en una planta*/

update cama
set paciente_seguridadsocial='024637896' 
where `habitacion_planta_id_planta`=1 and 
`habitacion_id_habitacion`=1 
and`id`=1;

update cama
set paciente_seguridadsocial='123478569'
where `habitacion_planta_id_planta`=1 and 
`habitacion_id_habitacion`=4
and`id`=1;

update cama
set paciente_seguridadsocial='124587963'
where `habitacion_planta_id_planta`=2 and 
`habitacion_id_habitacion`=7
and`id`=1;

update cama
set paciente_seguridadsocial='329475985'
where `habitacion_planta_id_planta`=3 and 
`habitacion_id_habitacion`=7
and`id`=1;

update cama
set paciente_seguridadsocial='329475985'
where `habitacion_planta_id_planta`=3 and 
`habitacion_id_habitacion`=7
and`id`=2;

select count(id) 'numero de camas ocupadas'
from cama
where habitacion_planta_id_planta=1 and (paciente_seguridadsocial is not null);


/*4. ¿cuantas camas hay en cada planta?*/

select count(id) 'numero de camas ocupadas', habitacion_planta_id_planta
from cama
group by habitacion_planta_id_planta;

/*5. medicos de una determinada especialidad indicando su nombre y el medioco de la especialidad */

select ncolegiado, nombre from medico where especialidad_id_especialidad=2;


select ncolegiado, m.nombre, e.nombre from medico m, especialidad e
 where m.especialidad_id_especialidad=e.id_especialidad and e.id_especialidad=2

/*6. ¿que medico han atendido mas pacientes? indicar cuantos y su nombre(medico)*/

group by medico_ncolegiado


select m.nombre, count(paciente_seguridadsocial) 'numero_pacientes' 
from atiende a, medico m 
where a.medico_ncolegiado=m.ncolegiado 
group by a.medico_ncolegiado 
having numero_pacientes=(select max(cuenta) 
						from (select count(paciente_seguridadsocial) cuenta from atiende group by medico_ncolegiado) e);

/*hay que modificar el valor del codigo de algun medico para que se repita en relacion con el paciente*/

/*7. ordena las especialidades que hay en el hospital por numero de medicos que tenga cada uno */

select e.nombre, count(ncolegiado) 'numero_medicos'
from medico m, especialidad e
where m.especialidad_id_especialidad=e.id_especialidad
group by e.nombre
order by numero_medicos asc , e.nombre asc;

/*8. historial medico de un paciente, indicando: fecha, nombre del medico que le ha atendido*/

select concat(fecha,':',m.nombre,":", paciente_seguridadsocial) as "historial del paciente"
from atiende a, medico m
where a.medico_ncolegiado = m.ncolegiado
group by paciente_seguridadsocial;


/*9. ¿Cuantas habitaciones estan vacias?*/

select count(habitacion_id_habitacion) 'num_habitaciones'
from cama
where paciente_seguridadsocial is null
group by num_habitaciones;

/*10. ¿Cuantas habitaciones estan vacias en cada planta?*/

select count(habitacion_id_habitacion) 'num_habitaciones'
from cama
where paciente_seguridadsocial is null
group by habitacion_planta_id_planta;

/*10-15 tema libre*/

/*10 cuantas camas hay libres por planta y por habitacion*/

select count(id) as 'numero de camas', habitacion_planta_id_planta as planta, habitacion_id_habitacion as 'numero de habitacion'
from camas
group by planta, numero de habitacion;


/*11. di el nombre, direccion y estado civil de los pacientes que hayan sidp atendidos por el medico pepe*/

select nombre, direccion, estadocivil from paciente p, atiende a, medico m 
where p.seguridadsocial=a.paciente_seguridadsocial and a.medico_ncolegiado=m.ncolegiado
and m.nombre='Pepe';

/* 12. di el nombre de la planta con 1 uno y cuantas camas estan ocupadas*/


select 



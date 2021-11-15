use db2;
DELIMITER $
drop procedure if exists myproc3;
create procedure myproc3(id_x int)
BEGIN
declare original_salary int default 0;
declare twenty_percent_salary int default 0;

select salary into original_salary
from employees
where employee_id = id_x;
select original_salary;
set twenty_percent_salary = original_salary * (20/100);
select twenty_percent_salary;

update employees
 set salary = salary + twenty_percent_salary
 # -- the 20 percent rise
 where salary = salary;
 select salary from employees;
END$
DELIMITER ;

call myproc3(104);

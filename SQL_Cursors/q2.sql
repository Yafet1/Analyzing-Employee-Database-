use db2;
DELIMITER $
drop procedure if exists myproc2;
create procedure myproc2(salary_rise int)
BEGIN
   declare done int;
  declare temp_salary int(5);
  declare mag_first_name varchar(10);
# -- set my cursor of the subset to be table of manager first name and manager salary
 declare cursor1 cursor for select distinct mgr.first_name, mgr.salary
 from employees emp join employees mgr
 on emp.manager_id = mgr.employee_id;
 declare continue handler for not found set done = TRUE;
 open cursor1;
 read_loop: LOOP
# -- as the cursor is been read fetch the rows and read them as mag_first_name and temp_salary
 fetch cursor1 into mag_first_name, temp_salary;

 update employees
   set salary = temp_salary * (1 + (salary_rise/100))
    where salary = temp_salary;

if done then leave read_loop; end if;
select mag_first_name,temp_salary;
 end loop;
 close cursor1;
END$
DELIMITER ;
call myproc2(10);

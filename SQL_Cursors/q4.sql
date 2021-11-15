use db2;
DELIMITER $
drop procedure if exists myproc4;
create procedure myproc4(bonus int)
BEGIN
declare twenty_percent_salary int default 0;
 declare done int;
 declare temp_salary int ;
 declare tempID int;
declare count int default 0;
declare add_up int default 0;
declare not_used int default 0;
declare num_employees int default 0;

 declare cursor1 cursor for select salary, employee_id
 from employees
 order by salary asc;

 set num_employees = select count (*) from employees;

  declare continue handler for not found set done = TRUE;
  open cursor1;
  read_loop: LOOP
  fetch cursor1 into temp_salary,tempID;
  if done then leave read_loop; end if;

# -- take 20 percent of each
set twenty_percent_salary = temp_salary * 0.2;

set add_up = add_up + twenty_percent_salary;
set count = count + 1;
if (add_up < bonus and count < num_employees)
then
select twenty_percent_salary,tempID, count, add_up;
  end if;

  if (count = num_employees)
  then
  set not_used = bonus - add_up;
  select not_used
  where not_used > 0;
  end if;
  end loop;
  close cursor1;
END$
DELIMITER ;

#call myproc4(100000);
#call myproc4(500000);

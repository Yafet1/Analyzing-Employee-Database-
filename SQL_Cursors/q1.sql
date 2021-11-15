use db2;
DELIMITER $
drop procedure if exists myproc1;
create procedure myproc1(man_id int)
BEGIN
   declare done int;
  declare tempID int(5);
  declare mag_first_name varchar(10);

# -- set my cursor of the subset to be table of manager first name and manager id
 declare cursor1 cursor for select first_name, manager_id
 from employees
 where manager_id = man_id;


 declare continue handler for not found set done = TRUE;
 open cursor1;
 read_loop: LOOP

 # -- insert these firsname and manger id into tempFN and tempID

 fetch cursor1 into mag_first_name, tempID;


  select first_name from employees
 # --  get the first name of the employees where employees id is equal to manager_id
 where employee_id = tempID;
 #if employee_id = tempID;
if done then leave read_loop; end if;
#-- select tempFN,tempID;
select mag_first_name;
 end loop;
 close cursor1;
END$

DELIMITER ;

call myproc1(205);
call myproc1(201);

use db2;
delimiter $
drop procedure if exists myproc3;
create procedure myproc3(id1 int, id2 int,id3 int)
BEGIN
 declare min int default 0;
 declare minid int default 0;
  declare max int default 0;
 declare maxid int default 0;

# the one below graps min salary
select min(salary) into min from employees where 
employee_id = id1 or employee_id = id2 or employee_id = id3;

# the one below graps the employee id of the min salary 
select employee_id into minid from employees where salary = min and 
(employee_id = id1 or employee_id = id2 or employee_id = id3);
# the one below graps max salary
select max(salary) into max from employees where
employee_id = id1 or employee_id = id2 or employee_id = id3;

# the one below graps the employee id of the max salary
select employee_id into maxid from employees where salary = max and
(employee_id = id1 or employee_id = id2 or employee_id = id3);

update employees
set salary = max
where employee_id = minid;

update employees
set salary = min
where employee_id = maxid;

END$
delimiter ;


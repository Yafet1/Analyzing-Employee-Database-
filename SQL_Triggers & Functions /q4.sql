use db2;
delimiter $
drop function if exists myfunc;
create function myfunc(sal decimal(8,2))
          returns int
          deterministic
  BEGIN
          declare my_count int default 0;
          select Count(*) into my_count
          from employees
          where salary > sal;
          return my_count;
  END;
drop procedure if exists myproc4;
create procedure myproc4()
  BEGIN
  declare num_emp int;

  set num_emp = myfunc(10000);
    select num_emp;
END$

call myproc4();

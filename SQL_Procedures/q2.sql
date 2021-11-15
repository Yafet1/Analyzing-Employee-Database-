use db2;
delimiter $
drop procedure if exists myproc2;
create procedure myproc2(salarypct int )
BEGIN
 # this is a comment
 declare num1 int default 0;
 declare num2 int default 0;
 declare total_emp int default 0; 
declare bottom_twenty int default 0; 
 declare before_raise int default 0;

select COUNT(*) into total_emp  from employees;  # set total_emp to 107 

set bottom_twenty =((total_emp * 20 ) / 100);   # set bottom_twenty 

select max(salary) into num1 from (select salary from employees order by salary limit bottom_twenty) myalias;  #num1 = 2800


 update employees
 set salary = salary * (1 + salarypct/100)            # updates all employees salary that have less than 2800 
 where salary < num1;                                      
select salary into num2 from employees where salary < num2;   

# select num1;
#select salarypct;
#select total_emp;
#select bottom_twenty;
select before_raise;
select num2;
# select id;
END$
delimiter ;

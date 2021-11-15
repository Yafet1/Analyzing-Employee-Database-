use db2;
delimiter $
drop procedure if exists myproc7;
create procedure myproc7(emp_id1 decimal, emp_id2 decimal, emp_id3 decimal)
BEGIN

declare sal_id1 decimal(8,2);
declare sal_id2 decimal(8,2);
declare sal_id3 decimal(8,2);

select salary into sal_id1 from employees where employee_id = emp_id1;
select salary into sal_id2 from employees where employee_id = emp_id2;
select salary into sal_id3 from employees where employee_id = emp_id3;

# find the smallest here

if ( sal_id1 < sal_id2 ) and  ( sal_id1 < sal_id3)  
then
select emp_id1;
select sal_id1;
end if;
if ( sal_id2 < sal_id1 ) and ( sal_id2 < sal_id3)
then
select emp_id2;
select sal_id2;
end if;
if ( sal_id3 < sal_id1 ) and ( sal_id3 < sal_id1)
then
select emp_id3;
select sal_id3;
end if; 

# find the second smallest here salary  

if ( sal_id1 < sal_id2 ) and  ( sal_id1 > sal_id3)
then
select emp_id1;
select sal_id1;
end if;
if ( sal_id2 < sal_id1 ) and ( sal_id2 > sal_id3)
then
select emp_id2;
select sal_id2;
end if;
if ( sal_id3 < sal_id1 ) and ( sal_id3 > sal_id1)
then
select emp_id3;
select sal_id3;
end if;

 # find the largest salary here 

if ( sal_id1 > sal_id2 ) and  ( sal_id1 > sal_id3)
then
select emp_id1;
select sal_id1;
end if;
if ( sal_id2 > sal_id1 ) and ( sal_id2 > sal_id3)
then
select emp_id2;
select sal_id2;
end if;
if ( sal_id3 > sal_id1 ) and ( sal_id3 > sal_id1)
then
select emp_id3;
select sal_id3;
end if;
END $
delimiter ;

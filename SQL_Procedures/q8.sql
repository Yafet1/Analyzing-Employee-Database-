use db2;
delimiter $
drop procedure if exists myproc8;
create procedure myproc8()
BEGIN

declare min_id decimal(6);
declare max_id decimal(6);

declare min_name varchar(20);
declare max_name varchar(20);

declare min_salary decimal(8,2);
declare max_salary decimal(8,2);


declare min_hourly_wage int default 0;
declare max_hourly_wage int default 0;


# graps the employee id of person who earns the smallest salary and put into min_id
select employee_id into min_id from employees  where salary=(select Min(salary) from employees);

# graps the employee id of person who earns the highest salary and put into max_id
select employee_id into max_id from employees  where salary=(select Max(salary) from employees);


# graps the first_name  of person who earns the smallest salary and put into min_name
select first_name into min_name from employees  where salary=(select Min(salary) from employees);

# graps the first_name  of person who earns the highest salary and put into max_name
select first_name  into max_name  from employees  where salary=(select Max(salary) from employees);


# graps the salary  of person who earns the smallest salary and put into min_salary
select salary  into min_salary from employees  where salary=(select Min(salary) from employees);

# graps the salary  of person who earns the highest salary and put into max_salary
select salary  into max_salary  from employees  where salary=(select Max(salary) from employees);

set min_hourly_wage= min_salary / (87*2);

select min_name;
select min_id;
select min_salary;
select min_hourly_wage; 

set max_hourly_wage= max_salary / (87*2);

select max_name;
select max_id;
select max_salary;
select max_hourly_wage;

END$
delimiter ;

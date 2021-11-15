use db2;
CREATE TABLE EMPLOYEES_AUDIT (date_time DATETIME, my_user varchar(150), old_sal decimal(8,2), new_sal decimal(8,2));

delimiter $$
drop TRIGGER if exists sal_check_n;
CREATE TRIGGER sal_check_n
BEFORE update ON employees FOR EACH ROW
# --IF NEW.age < 0 THEN SET NEW.age = 0;
  IF new.salary != old.salary
  THEN
INSERT INTO EMPLOYEES_AUDIT VALUES (now(), user(), old.salary, new.salary);

END IF;$$

delimiter ;

update employees
  set salary = salary + 100
   where employee_id = 100;

select * from EMPLOYEES_AUDIT;

use db2;
CREATE TABLE EMPLOYEES_AUDIT_2 (date_time DATETIME, my_user varchar(150), old_sal decimal(8,2), new_sal decimal(8,2));

delimiter $$
drop TRIGGER if exists al_check_new_2;
CREATE TRIGGER sal_check_new_2
BEFORE update ON employees FOR EACH ROW
# --IF NEW.age < 0 THEN SET NEW.age = 0;
IF new.salary != old.salary AND (CURTIME() BETWEEN '21:00:00' AND '23:00:00')
  then
INSERT INTO EMPLOYEES_AUDIT_2 VALUES (now(), user(), old.salary, new.salary);

END IF;$$

delimiter ;

update employees
  set salary = salary + 10
   where employee_id = 100;

select * from EMPLOYEES_AUDIT_2;

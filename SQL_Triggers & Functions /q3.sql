use db2;
DELIMITER $
drop procedure if exists myproc3;
create procedure myproc3()
BEGIN

declare day_of_week varchar(20);
declare num int default 0;
select dayname(Current_timestamp) into day_of_week;

select day_of_week;

  set num = CHAR_LENGTH(day_of_week);

  select num;

  CASE num
    when 5 then select 'FIVE';
    when 6 then select 'SIX';
    when 7 then select 'SEVEN';
    when 8 then select 'EIGHT';
    when 9 then select 'NINE';
END CASE;
END$
DELIMITER ;
call myproc3();

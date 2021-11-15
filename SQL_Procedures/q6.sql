use db2;
delimiter $
drop procedure if exists myproc6;
create procedure myproc6(d_id1 decimal, d_id2 decimal)
BEGIN

# check type first by doing desc (table name) to match the type when declaring 

declare loc_id1 decimal(4);
declare loc_id2 decimal(4);

declare city1 varchar(30);
declare city2 varchar(30);

# Graps the location id which is named loc_id from the departmet_id the user chose 

select location_id into loc_id1 from departments where department_id = d_id1; 

# Do the same thing for the other department id 

select location_id into loc_id2 from departments where department_id = d_id2;

# print location_id to double check it works 
#select loc_id1;
#select loc_id2;

# Graps the city which is named city1 where loc_id1 is there 

select city into city1 from locations where location_id = loc_id1;

# Do the same thing for loc_id2 
select city into city2 from locations where location_id = loc_id2;

# print city before it updates 
select city1;
select city2;

# Swap the city 
update locations 
set city = city2 
where location_id = loc_id1;

update locations
set city = city1
where location_id = loc_id2;


select city into city1 from locations where location_id = loc_id1;
select city into city2 from locations where location_id = loc_id2;

# print after swap 

select city1;
select city2;


END $
delimiter ;

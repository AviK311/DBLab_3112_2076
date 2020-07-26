create view active_repairmen1 as
with rm_names as( select get_first_name(name) as "first name",
get_last_name(name) as "last name",
wid
from repairman rm natural join worker)
select  * from rm_names rm
where &"Number of checkups" <= (select count(*)
                              from checkup cp
                              where cp.wid = rm.wid
                              and check_date between
                              to_date(&from, 'dd/mm/yyyy')
                              and to_date(&to, 'dd/mm/yyyy'));
                              
                              
create view good_drones1 as                             
select * from drone
where 1 = routine_checks(did,
to_date(&"Starting Date",'mm/yyyy'),
to_date(&"Ending Date",'mm/yyyy'))
order by did;
                              
                              
                              
                              

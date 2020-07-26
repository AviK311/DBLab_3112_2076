select is_functional, did, count(check_date) as "Number of Checks"
from drone natural left join checkup
group by is_functional, did
having count(check_date) >= &"Minimum Checks"
order by count(check_date);


with rm_names as( select get_first_name(name) as "first name",
get_last_name(name) as "last name",
wid
from repairman rm natural join worker)
select * from rm_names rm
where &"Number of checkups" <= (select count(*)
                              from checkup cp
                              where cp.wid = rm.wid
                              and check_date between
                              to_date(&from, 'dd/mm/yyyy')
                              and to_date(&to, 'dd/mm/yyyy'));
                              
                              
                              
                              
                              
                              
                              
                              

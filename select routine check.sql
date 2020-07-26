select * from drone
where 1 = routine_checks(did,
to_date(&"Starting Date",'mm/yyyy'),
to_date(&"Ending Date",'mm/yyyy'))
order by did;

select did, check_date from checkup
where did = 258
order by check_date;






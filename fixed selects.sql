with sum_price_branch as (select bid, sum(total_price) as sumPrice
                          from pizza_order
                          group by bid)
select sumPrice as "Total Income", Telephone, Address
from sum_price_branch natural join branch
where sumPrice>= all(select sumPrice
                     from sum_price_branch);               
                     
                     
                                      
                     
select 'Most Expensive Product:' as Category , price, description from product
where price >= all(select price from product)
union
select 'Cheapest Product:' as Category , price, description from product
where price <= all(select price from product);


select address as "Branch Address", description, count(pid) as quantity
from order_product natural join product natural join pizza_order natural join branch B
group by address, description
having count(pid)>=all(select count(pid)
                       from order_product op natural join pizza_order
                       where bid = bid
                       group by bid)
order by address;


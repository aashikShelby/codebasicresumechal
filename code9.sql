with cte1 as(
SELECT c.channel, round(sum(p.gross_price* s.sold_quantity))/1000000 as gross_sales_mln
FROM gdb023.fact_gross_price as p
inner join gdb023.fact_sales_monthly as s
on p.product_code = s.product_code
inner join gdb023.dim_customer as c
on s.customer_code = c.customer_code
where p.fiscal_year= 2021
group by c.channel)
select *, round((gross_sales_mln*100))/sum(gross_Sales_mln)
over () as percentage_contrib 
from cte1
order by percentage_contrib desc
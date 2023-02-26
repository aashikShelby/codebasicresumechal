with cte1 as (
SELECT p.division,p.product_code, p.product, sum(s.sold_quantity) as total_sold_quantity
FROM gdb023.dim_product as p
inner join gdb023.fact_sales_monthly as s
on p.product_code = s.product_code
where s.fiscal_year = 2021
group by p.division,p.product_code,p.product),
cte2 as(
select * , rank() over 
(partition by division order by total_sold_quantity desc)
as rank_order from cte1)

select* from cte2 
where rank_order <= 3

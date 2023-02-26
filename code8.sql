SELECT 
case
when month(date) in (9,10,11) then "Quarter 1"
when month(date) in (12,1,2) then "Quarter 2"
when month(date) in (3,4,5) then "Quarter 3"
when month(date) in (6,7,8) then "Quarter 4"
end as quarter , sum(sold_quantity) as total_sold_quantity
FROM gdb023.fact_sales_monthly
where fiscal_year = 2020
group by quarter;
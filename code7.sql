SELECT monthname(s.date) as month, year(s.date) as year, round(sum(p.gross_price*s.sold_quantity),2) as Gross_Sales_Amount
FROM gdb023.fact_gross_price as p
inner join gdb023.fact_sales_monthly as s
on p.product_code = s.product_code 
inner join gdb023.dim_customer as c
on s.customer_code = c.customer_code
where c.customer = "Atliq Exclusive"
group by month,year
order by year;
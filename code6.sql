SELECT i.customer_code, c.customer, avg(round(i.pre_invoice_discount_pct,2))*100 as average_discount_percentage
FROM gdb023.fact_pre_invoice_deductions as i
join gdb023.dim_customer as c
on i.customer_code = c.customer_code
where i.fiscal_year = 2021
and c.market = "India"
group by i.customer_code, c.customer
order by average_discount_percentage desc	
limit 5;
SELECT m.product_code,p.product,m.manufacturing_cost FROM gdb023.fact_manufacturing_cost as m
join gdb023.dim_product as p
on m.product_code = p.product_code
where m.manufacturing_cost = (select MIN(manufacturing_cost) from gdb023.fact_manufacturing_cost)
or
m.manufacturing_cost = (select MAX(manufacturing_cost) from gdb023.fact_manufacturing_cost)




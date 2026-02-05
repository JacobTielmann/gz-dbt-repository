WITH sub1 AS ( SELECT margin.*, CAST (shipping_fee AS FLOAT64) AS shipping_fee, CAST (ship_cost AS FLOAT64) AS ship_cost
 , CAST (log_cost AS FLOAT64) AS log_cost 

FROM {{ ref('int_sales_margin')}} AS margin
JOIN {{ ref ('stg_raw_gz_ship')}} AS ship
ON margin.orders_id = ship.orders_id )

SELECT *, ROUND (margin + shipping_fee - log_cost - ship_cost, 2) AS operational_margin
FROM sub1

SELECT 
 date_date
 , COUNT (*) AS total_nb_transactions
 , ROUND (SUM (revenue), 2) AS revenue
 , ROUND (SAFE_DIVIDE (SUM (revenue), COUNT (*)), 2) AS average_basket
 , ROUND (SUM (operational_margin), 2) AS operational_margin
 , ROUND (SUM (purchase_cost), 2) AS purchase_cost
 , ROUND (SUM (log_cost), 2) AS log_cost
 , ROUND (SUM (quantity), 2) AS quantity

FROM {{ ref ('int_sales_operational_margin')}} 
GROUP BY date_date
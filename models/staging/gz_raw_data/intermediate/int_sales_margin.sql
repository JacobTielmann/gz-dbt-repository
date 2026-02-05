WITH sub1 AS (
    select sales.*, SAFE_MULTIPLY (purchase_price , quantity) as purchase_cost 
    from {{ ref('stg_raw_gz_sales') }} AS sales
    JOIN {{ ref('stg_raw_gz_product') }} AS product
    On sales.products_id = product.products_id )

    SELECT *
     , ROUND (SAFE_SUBTRACT (revenue, purchase_cost), 2) AS margin
     FROM sub1
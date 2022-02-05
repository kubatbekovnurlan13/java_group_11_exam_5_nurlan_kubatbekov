SELECT DISTINCT
    brands.brand AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    brands ON products.brand_id = brands.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.store_id = 1
        AND actions.to_store_id IS NULL
GROUP BY brands.brand
ORDER BY brands.brand;

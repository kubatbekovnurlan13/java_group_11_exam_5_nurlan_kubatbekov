SELECT 
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.store_id = 2
        AND actions.to_store_id IS NOT NULL
GROUP BY products.product
ORDER BY products.product;

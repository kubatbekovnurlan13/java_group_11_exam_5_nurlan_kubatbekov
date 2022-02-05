SELECT DISTINCT
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    MONTH(actions.action_date) = 8
        AND actions.store_id = 1
        AND actions.to_store_id IS NULL
GROUP BY products.product
ORDER BY products.product;

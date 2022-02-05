SELECT DISTINCT
    products.product AS name, 
    SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    counterparties ON actions.supplier_id = counterparties.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.client_id = 1
        AND actions.store_id = 1
GROUP BY products.product
ORDER BY products.product;

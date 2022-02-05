SELECT DISTINCT
    categories.category AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    categories ON products.category_id = categories.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 4
        AND actions.store_id = 3
GROUP BY categories.category
ORDER BY categories.category;

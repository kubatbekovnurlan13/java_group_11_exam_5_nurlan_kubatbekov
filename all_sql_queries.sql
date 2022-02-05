-- 1 exercise

SELECT DISTINCT
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 4
        AND actions.store_id = 3
GROUP BY products.product
ORDER BY products.product;

-- 2 exercise 

SELECT DISTINCT
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 4
        AND actions.store_id = 3
        AND actions.to_store_id IS NOT NULL
GROUP BY products.product
ORDER BY products.product;

-- 3 exercise

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

-- 4 exercise 

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

-- 5 exercise 

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

-- 6 exercise 

SELECT DISTINCT
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    counterparties ON actions.supplier_id = counterparties.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.supplier_id = 2
GROUP BY products.product
ORDER BY products.product;

-- 7 exercise

SELECT DISTINCT
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    counterparties ON actions.supplier_id = counterparties.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.supplier_id = 2
        AND actions.store_id = 1
GROUP BY products.product
ORDER BY products.product;

-- 8 exercise

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

-- 9 exercise

SELECT DISTINCT
    counterparties.counterparty AS name,
    SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    counterparties ON actions.supplier_id = counterparties.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.product_id = 1
GROUP BY counterparties.counterparty
ORDER BY SUM(actions.qty) DESC;

-- 10 exercise

SELECT DISTINCT
    counterparties.counterparty AS name,
    SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    counterparties ON actions.client_id = counterparties.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.product_id = 6
        AND actions.client_id IS NOT NULL
GROUP BY counterparties.counterparty
ORDER BY SUM(actions.qty) DESC;

-- 11 exercise

SELECT 
    products.product AS name, SUM(actions.qty) AS amount
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    MONTH(actions.action_date) BETWEEN 1 AND 10
        AND actions.to_store_id = 1
GROUP BY products.product
ORDER BY products.product;

-- 12 exercise 

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
  
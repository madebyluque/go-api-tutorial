DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'product') THEN
        CREATE TABLE product(
            id SERIAL PRIMARY KEY,
            product_name VARCHAR(50) NOT NULL,
            price NUMERIC(10, 2) NOT NULL
        );
        
        INSERT INTO product(product_name, price)
        SELECT 'Sushi', 100
        WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_name = 'Sushi');
    END IF;
END $$;

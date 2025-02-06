DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'product'
    ) THEN
        EXECUTE 'CREATE TABLE product (
            id SERIAL PRIMARY KEY,
            product_name VARCHAR(50) NOT NULL,
            price NUMERIC(10, 2) NOT NULL
        )';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM product WHERE product_name = 'Sushi'
    ) THEN
        INSERT INTO product(product_name, price)
        VALUES ('Sushi', 100);
    END IF;
END $$;

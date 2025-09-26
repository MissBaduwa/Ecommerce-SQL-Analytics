-- Insert customers with international data
INSERT INTO customers (name, email, signup_date, city, country) VALUES
('John Smith', 'john.smith@email.com', '2023-01-15', 'New York', 'USA'),
('Maria Garcia', 'maria.garcia@email.com', '2023-02-20', 'Madrid', 'Spain'),
('David Johnson', 'david.johnson@email.com', '2023-01-22', 'London', 'UK'),
('Sarah Chen', 'sarah.chen@email.com', '2023-03-10', 'Beijing', 'China'),
('Mike Wilson', 'mike.wilson@email.com', '2023-02-05', 'Sydney', 'Australia'),
('Emma Davis', 'emma.davis@email.com', '2023-03-25', 'Toronto', 'Canada'),
('James Brown', 'james.brown@email.com', '2023-01-30', 'Paris', 'France'),
('Lisa Taylor', 'lisa.taylor@email.com', '2023-04-01', 'Berlin', 'Germany'),
('Robert Lee', 'robert.lee@email.com', '2023-03-15', 'Tokyo', 'Japan'),
('Anna Martinez', 'anna.martinez@email.com', '2023-02-28', 'Mexico City', 'Mexico'),
('Michael Clark', 'michael.clark@email.com', '2023-04-10', 'Chicago', 'USA'),
('Sophia Rodriguez', 'sophia.rodriguez@email.com', '2023-04-15', 'Barcelona', 'Spain'),
('William Anderson', 'william.anderson@email.com', '2023-03-20', 'Manchester', 'UK'),
('Olivia Wang', 'olivia.wang@email.com', '2023-04-05', 'Shanghai', 'China'),
('Daniel Kim', 'daniel.kim@email.com', '2023-04-12', 'Seoul', 'South Korea');

-- Verify insertion
SELECT * FROM customers;


-- Insert products with realistic pricing
INSERT INTO products (name, category, price, cost, created_date) VALUES
('iPhone 14 Pro', 'Electronics', 999.99, 700.00, '2023-01-01'),
('MacBook Air M2', 'Electronics', 1199.99, 850.00, '2023-01-01'),
('Nike Air Max', 'Clothing', 129.99, 65.00, '2023-01-15'),
('Samsung Galaxy S23', 'Electronics', 849.99, 600.00, '2023-02-01'),
('Adidas Ultraboost', 'Clothing', 179.99, 90.00, '2023-01-20'),
('Sony WH-1000XM4', 'Electronics', 349.99, 220.00, '2023-02-15'),
('Levi''s Jeans', 'Clothing', 79.99, 35.00, '2023-01-10'),
('iPad Air', 'Electronics', 599.99, 400.00, '2023-03-01'),
('Under Armour Hoodie', 'Clothing', 59.99, 25.00, '2023-02-20'),
('Apple Watch Series 8', 'Electronics', 399.99, 280.00, '2023-01-05'),
('AirPods Pro', 'Electronics', 249.99, 150.00, '2023-02-10'),
('Nike Dri-FIT Shirt', 'Clothing', 34.99, 15.00, '2023-03-15'),
('Samsung Tablet', 'Electronics', 449.99, 300.00, '2023-03-20'),
('Puma Running Shoes', 'Clothing', 89.99, 45.00, '2023-04-01');

-- Verify products
SELECT * FROM products;



-- Insert orders (spread across months for better analysis)
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2023-03-01 10:30:00', 'completed', 999.99),
(2, '2023-03-02 14:22:00', 'completed', 1199.99),
(3, '2023-03-05 09:15:00', 'completed', 129.99),
(1, '2023-03-10 16:45:00', 'completed', 349.99),
(4, '2023-03-15 11:20:00', 'completed', 599.99),
(5, '2023-04-02 13:10:00', 'completed', 179.99),
(6, '2023-04-05 15:30:00', 'completed', 999.99),
(7, '2023-04-10 10:00:00', 'completed', 79.99),
(8, '2023-04-12 14:45:00', 'completed', 399.99),
(9, '2023-04-18 09:30:00', 'completed', 1199.99),
(10, '2023-04-20 16:20:00', 'completed', 59.99),
(2, '2023-05-01 11:15:00', 'completed', 849.99),
(3, '2023-05-03 14:00:00', 'completed', 129.99),
(5, '2023-05-05 10:45:00', 'completed', 349.99),
(7, '2023-05-08 13:30:00', 'completed', 599.99),
(11, '2023-05-10 09:00:00', 'completed', 249.99),
(12, '2023-05-12 14:30:00', 'completed', 34.99),
(13, '2023-05-15 11:45:00', 'completed', 449.99),
(14, '2023-05-18 16:20:00', 'completed', 89.99),
(15, '2023-05-20 10:15:00', 'completed', 1199.99);

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),    -- Order 1: iPhone
(2, 2, 1, 1199.99),   -- Order 2: MacBook
(3, 3, 1, 129.99),    -- Order 3: Nike Air Max
(4, 6, 1, 349.99),    -- Order 4: Sony Headphones
(5, 8, 1, 599.99),    -- Order 5: iPad
(6, 5, 1, 179.99),    -- Order 6: Adidas
(7, 1, 1, 999.99),    -- Order 7: iPhone
(8, 7, 1, 79.99),     -- Order 8: Jeans
(9, 10, 1, 399.99),   -- Order 9: Apple Watch
(10, 2, 1, 1199.99),  -- Order 10: MacBook
(11, 9, 1, 59.99),    -- Order 11: Hoodie
(12, 4, 1, 849.99),   -- Order 12: Samsung Phone
(13, 3, 1, 129.99),   -- Order 13: Nike Air Max
(14, 6, 1, 349.99),   -- Order 14: Sony Headphones
(15, 8, 1, 599.99),   -- Order 15: iPad
(16, 11, 1, 249.99),  -- Order 16: AirPods
(17, 12, 2, 34.99),   -- Order 17: 2 Nike Shirts
(18, 13, 1, 449.99),  -- Order 18: Samsung Tablet
(19, 14, 1, 89.99),   -- Order 19: Puma Shoes
(20, 2, 1, 1199.99);  -- Order 20: MacBook

-- Verify all data
SELECT 'Customers' as table_name, COUNT(*) as count FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Items', COUNT(*) FROM order_items;
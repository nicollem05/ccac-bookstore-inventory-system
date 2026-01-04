-- NICOLLE DANIELA MUNAR QUINTERO
-- ---------------------------------------------------------------
DROP DATABASE IF EXISTS ccacBookstore;
CREATE DATABASE ccacBookstore;
USE ccacBookstore;
-- ---------------------------------------------------------------
-- CREATE TABLE CUSTOMERS 
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

-- CREATE TABLE DEPARTMENTS 
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- CREATE TABLE SUPPLIERS
CREATE TABLE Suppliers(
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    contact_person VARCHAR(100),
    phone VARCHAR(15)
);

-- CREATE TABLE PRODUCTS 
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL, 
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    department_id INT NOT NULL,
    supplier_id INT NOT NULL, 
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- CREATE TABLE ORDERS 
CREATE TABLE Orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- CREATE TABLE ORDER ITEMS
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    UNIQUE (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ADD CUSTOMER VALUES 
INSERT INTO Customers (first_name, last_name, email, phone) VALUES
('Sophia', 'Adams', 'sAdams05@gmail.com', '502-396-2501'),
('Jess', 'Li', 'jessLi051@gmail.com', '502-230-2002'),
('Camilo', 'Arias', 'camiloA@gmail.com', '801-312-2003'),
('Nicolas', 'Johnson', 'nicojohnson12@gmail.com', '801-580-8504'),
('Daniela', 'Munar', 'danimun@gmail.com', '801-325-2005'),
('Rodrigo', 'Quintero', 'rodrigoq84@gmail.com', '412-325-2506'),
('Mathew', 'Marco', 'mathewm@gmail.com', '412-963-2007'),
('Alia', 'Hillier', 'aliahillier@gmail.com', '412-654-5008'),
('Nathan', 'James', 'nathanj56@gmail.com', '801-874-2009'),
('Karen', 'Dean', 'karendean98@gmail.com', '412-654-2010');

-- ADD TABLE DEPARMENTS VALUES
INSERT INTO Departments (name) VALUES
('Databases'),
('History'),
('Science'),
('Art and Science'),
('Business'),
('Tech'),
('Kitchen'),
('Biography'),
('Poetry'),
('C++');

-- ADD TABLE SUPPLIERS VALUES 
INSERT INTO Suppliers (name, contact_person, phone) VALUES
('Penguin Random House', 'Laura Mitchell', '212-555-1020'),   
('HarperCollins Publishers', 'Brian Carter', '212-555-2389'),  
('Simon & Schuster', 'Emily Parker', '212-555-4521'),          
('Macmillan Publishers', 'Richard Evans', '212-555-6678'),    
('Hachette Book Group', 'Olivia Bennett', '212-555-9087'),     
('Scholastic Inc.', 'Megan Johnson', '646-555-3012'),         
('Oxford University Press', 'Dr. Andrew Clarke', '212-555-7711'),
('Cambridge University Press', 'Sophie Turner', '617-555-4432'), 
('Bloomsbury Publishing', 'Henry Adams', '212-555-9923'),      
('Wiley & Sons', 'Patricia Nunez', '201-555-5534');          


-- ADD PRODUCTS VALUES (Mínimo 10 filas)
INSERT INTO Products (name, price, stock_quantity, department_id, supplier_id) VALUES
('SQL Fundamentals', 35.50, 50, 1, 1),
('World War II Chronicle', 45.99, 20, 2, 2), 
('Cosmic Journeys', 55.00, 30, 3, 3), 
('The Art of Sketching', 28.75, 45, 4, 4), 
('Strategic Management', 60.00, 60, 5, 5), 
('Advanced Python', 75.00, 25, 6, 6), 
('Italian Cooking Basics', 30.50, 35, 7, 7), 
('Biography of Marie Curie', 22.00, 40, 8, 8), 
('Modern Sonnets Collection', 18.75, 55, 9, 9), 
('Effective C++ Programming', 68.00, 70, 10, 10), 
('Database Normalization Guide', 42.00, 50, 1, 1), 
('C++ Algorithms', 72.00, 30, 10, 10); 

-- ADD TABLE PRODUCTS VALUES
INSERT INTO Products (name, price, stock_quantity, department_id, supplier_id) VALUES
('The Great Gatsby', 12.99, 50, 1, 1),
('To Kill a Mockingbird', 14.50, 40, 1, 2),
('1984', 11.25, 60, 1, 3),
('The Catcher in the Rye', 13.99, 35, 1, 4),
('Harry Potter and the Sorcerer''s Stone', 10.99, 80, 2, 6),
('The Hobbit', 15.75, 55, 2, 5),
('Oxford Advanced Learner''s Dictionary', 28.99, 30, 3, 7),
('Cambridge IELTS Practice Tests', 32.50, 25, 3, 8),
('Business Strategy Essentials', 38.99, 20, 4, 10),
('Academic Writing Skills', 21.50, 45, 4, 9);

-- ADD ORDERS VALUES 
INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-10-01', 71.00, 'Entregado'), 
(3, '2025-10-02', 55.00, 'Entregado'), 
(1, '2025-10-05', 98.49, 'Entregado'), 
(5, '2025-10-08', 60.00, 'En Proceso'),
(2, '2025-10-10', 101.50, 'Enviado'),
(8, '2025-10-15', 22.00, 'Entregado'), 
(10, '2025-10-18', 37.50, 'Entregado'), 
(4, '2025-10-22', 28.75, 'En Proceso'), 
(6, '2025-10-25', 105.50, 'Enviado'),
(9, '2025-11-01', 44.00, 'Entregado'), 
(1, '2025-11-05', 42.00, 'En Proceso'); 

-- ADD ORDER ITEMS VALUES 
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 35.50), 
(2, 3, 1, 55.00), 
(3, 2, 1, 45.99), 
(3, 1, 1, 35.50),
(4, 5, 1, 60.00), 
(5, 6, 1, 75.00), 
(5, 10, 1, 26.50), 
(6, 8, 1, 22.00), 
(7, 9, 2, 18.75), 
(8, 4, 1, 28.75), 
(9, 6, 1, 75.00), 
(9, 7, 1, 30.50), 
(10, 8, 2, 22.00), 
(1, 11, 1, 42.00), 
(11, 11, 1, 42.00), 
(2, 12, 1, 72.00),
(5, 1, 1, 35.50),
(7, 11, 1, 42.00), 
(4, 10, 1, 68.00), 
(10, 3, 1, 55.00); 

-- CREATE INDEXES 
-- 1
CREATE INDEX idx_order_item_composite ON Order_Items (order_id, product_id);

-- 2
CREATE INDEX idx_product_name ON Products (name);

-- 3
CREATE INDEX idx_order_date ON Orders (order_date);

-- 4 
CREATE INDEX idx_order_customer_join ON Orders (customer_id);
-- ---------------------------------------------------------------------
-- SQL ADVANCE QUERIES
-- A.JOIN QUERIES
SELECT
    C.first_name,
    C.last_name,
    O.order_date,
    P.name AS product_name,
    OI.quantity
FROM
    Customers AS C
INNER JOIN
    Orders AS O ON C.customer_id = O.customer_id
INNER JOIN
    Order_Items AS OI ON O.order_id = OI.order_id
INNER JOIN
    Products AS P ON OI.product_id = P.product_id
LIMIT 0, 50;
-- --------------------------------------------------------------------
  SELECT
    P.name AS product_name,
    P.price,
    S.name As supplier_name
	FROM
    Products AS P
    INNER JOIN 
    Suppliers AS S ON P.supplier_id = S.supplier_id
	WHERE
    S.name = 'Macmillan Publishers'; 
-- ---------------------------------------------------------------------
-- B.SUBQUERIES
SELECT
    C.first_name,
    C.last_name,
    O.total_amount
FROM
    Customers AS C
INNER JOIN
    Orders AS O ON C.customer_id = O.customer_id
WHERE
    O.total_amount > ( SELECT AVG(total_amount) FROM Orders
    );
-- ------------------------------------------------------------------------
SELECT
    name
FROM
    Products
WHERE
    product_id NOT IN ( SELECT DISTINCT product_id FROM Order_Items
    );
-- -------------------------------------------------------------------------
SELECT
    AVG(T.product_count)
FROM
    (
        SELECT
            COUNT(product_id) AS product_count
        FROM
            Products
        GROUP BY
            supplier_id
    ) AS T;
SELECT
    S.name,
    COUNT(P.product_id) AS items_supplied
FROM
    Suppliers AS S
INNER JOIN
    Products AS P ON S.supplier_id = P.supplier_id
GROUP BY
    S.supplier_id, S.name
HAVING
    COUNT(P.product_id) > (
        SELECT 
            AVG(T.product_count)
        FROM
            (
                SELECT
                    COUNT(product_id) AS product_count
                FROM
                    Products
                GROUP BY
                    supplier_id
            ) AS T 
    );
    -- --------------------------------------------------------------
SELECT
    D.name AS department_name,
    SUM(OI.quantity * OI.unit_price) AS total_sales
FROM
    Departments AS D
INNER JOIN 
  Products AS P ON D.department_id = P.department_id
INNER JOIN
    Order_Items AS OI ON P.product_id = OI.product_id
GROUP BY
    D.name
ORDER BY
    total_sales DESC;
-- ----------------------------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sale_month, 
    SUM(total_amount) AS monthly_revenue
FROM
    Orders
GROUP BY
    sale_month
ORDER BY
    sale_month;
-- --------------------------------------------------------------------
SELECT
    C.first_name,
    C.last_name,
    AVG(O.total_amount) AS average_order_value
FROM
    Customers AS C
INNER JOIN
    Orders AS O ON C.customer_id = O.customer_id
GROUP BY
    C.customer_id, C.first_name, C.last_name,
    average_order_value DESC;
-- -------------------------------------------------------------------
-- C.AGGREGATE FUNCTIONS AND GROUPING
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM
    Orders
GROUP BY
    customer_id
ORDER BY
    total_spent DESC
LIMIT 5;
-- ---------------------------------------------------------------------
SELECT
    C.first_name,
    C.last_name,
    T1.total_spent,
    D.name AS department_name
FROM
    (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 5
) AS T1
INNER JOIN Customers AS C ON T1.customer_id = C.customer_id
INNER JOIN Orders AS O ON T1.customer_id = O.customer_id
INNER JOIN Order_Items AS OI ON O.order_id = OI.order_id
INNER JOIN Products AS P ON OI.product_id = P.product_id
INNER JOIN Departments AS D ON P.department_id = D.department_id
GROUP BY
    C.first_name,
    C.last_name,
    T1.total_spent,
    D.name
ORDER BY
    T1.total_spent DESC;

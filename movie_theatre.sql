DROP TABLE IF EXISTS vendor CASCADE;
CREATE TABLE vendor(
    vendor_id SERIAL PRIMARY KEY,
    vendor_name VARCHAR(50),
    vendor_phone VARCHAR(50)
);

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_film VARCHAR(50)
);

DROP TABLE IF EXISTS item CASCADE;
CREATE TABLE item(
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(50),
    "desc" TEXT, 
    item_price DECIMAL(10,2)
);

DROP TABLE IF EXISTS film CASCADE;
CREATE TABLE film(
    film_id SERIAL PRIMARY KEY,
    film_name VARCHAR(50),
    "desc" TEXT
);

DROP TABLE IF EXISTS vendor_item CASCADE;
CREATE TABLE vendor_item(
    vendor_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id),
    FOREIGN KEY(item_id) REFERENCES item(item_id)
);


DROP TABLE IF EXISTS ticket_order CASCADE;
CREATE TABLE ticket_order(
    customer_id SERIAL PRIMARY KEY,
    film_choice VARCHAR(50),
    ticket_price DECIMAL(18,2),
    film_time TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc', now()),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


DROP TABLE IF EXISTS inventory CASCADE;
CREATE TABLE inventory(
    inventory_id SERIAL PRIMARY KEY,
    item_id INTEGER NOT NULL UNIQUE,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);
--EXAMPLE PRIMARY KEY
CREATE TABLE Persons (
    ID SERIAL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);
--EXAMPLE FOREIGN KEY
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);


INSERT INTO customer (customer_name) VALUES
('Mary'),
('Heather'),
('Martha');


INSERT INTO film (film_name, "desc") VALUES
('Mary','The Mummy'),
('Heather', 'Chucky'),
('Martha', 'Jason');

INSERT INTO vendor(vendor_name, vendor_phone) VALUES
('popcorn services', '7804569856'),
('Coka Soda', '5648546556'),
('Candy Co', '1234567890');

INSERT INTO item(item_name, "desc", item_price) VALUES
('popcorn', 'Best Movie snack ever', 9.99),
('Pop', 'rots your teeth', 10.99),
('Candy', 'sweetest movie treat', 15);

INSERT INTO ticket_order(film_time, film_choice, ticket_price) VALUES
(10, 'Hero on the Roof' , 15.99),
(10, 'Happy Sad Mad', 15.99),
(11, 'Water Sun Wind', 12.99);

INSERT INTO vendor_item(vendor_id, item_id) VALUES
(1, 1),
(1, 2),
(3, 3),
(2, 1);

INSERT INTO cart(item_id, customer_id) VALUES
(1,1),
(1,1),
(1,2),
(1,1),
(2,2),
(2,1),
(3,3);

INSERT INTO "ticket"(customer_id) VALUES
(1),
(2),
(3);

INSERT INTO order_item(order_id, item_id) VALUES
(1,2),
(1,2),
(1,3),
(2,1),
(3,3),
(3,3);



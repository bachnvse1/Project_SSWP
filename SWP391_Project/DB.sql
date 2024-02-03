CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    display_name VARCHAR(255) CHARACTER SET UTF8MB4,
    is_admin bit DEFAULT FALSE, 
    is_verify bit default false,
    is_active bit DEFAULT False, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table Category (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) CHARACTER SET UTF8MB4,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	is_delete bit
);

Create table Product (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) CHARACTER SET UTF8MB4,
    price float(10,2),
    categoryID int,
    
    /*FOREIGN KEY (categoryID) REFERENCES category(id),*/
    
    description VARCHAR(255) CHARACTER SET UTF8MB4,
    image1 varchar(500),
    image2 varchar(500),
    image3 varchar(500),
    image4 varchar(500),
    
	transaction_Fees bit,
    contact_Method VARCHAR(255) CHARACTER SET UTF8MB4,
    create_by int,
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    hidden_content varchar(255),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by int,
    
    /*FOREIGN KEY (updated_by) REFERENCES users(id),*/
    
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete bit
);



create table intermediate_Orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    code varchar(255),
    productID int,
	total_received_amount float(10,2),
    total_paid_amount float(10,2),
	intermediary_fee float(10,2),
    status VARCHAR(255) CHARACTER SET UTF8MB4,
    create_by int,
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by int,
    /*FOREIGN KEY (updated_by) REFERENCES users(id),*/
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete bit
	
);

CREATE TABLE Order_Detail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    /* FOREIGN KEY (orderID) REFERENCES Intermediate_Orders(id) */
    productID INT,
    /* FOREIGN KEY (productID) REFERENCES Product(id) */
	price float(10,2),
    /* FOREIGN KEY (user_id) REFERENCES Users(id) */
    
    seller_name VARCHAR(255) CHARACTER SET UTF8MB4,
    buyer_name VARCHAR(255) CHARACTER SET UTF8MB4,
    product_name VARCHAR(255) CHARACTER SET UTF8MB4,
    create_by int,
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by int,
    /*FOREIGN KEY (updated_by) REFERENCES users(id),*/
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete bit
);


alter table Product
add foreign key (categoryID) references Category(id);
alter table Product
add foreign key (create_by) references users(id);
alter table Product
add foreign key (updated_by) references users(id);

alter table intermediate_Orders
add foreign key (productID) references Product(id);
alter table intermediate_Orders
add foreign key (create_by) references users(id);
alter table intermediate_Orders
add foreign key (updated_by) references users(id);

alter table Order_Detail
add foreign key (orderID) references intermediate_Orders(id);
alter table Order_Detail
add foreign key (productID) references Product(id);
alter table Order_Detail
add foreign key (create_by) references users(id);
alter table Order_Detail
add foreign key (updated_by) references users(id);

INSERT INTO Category (name, is_delete) VALUES ('Electronics', 0);
INSERT INTO Category (name, is_delete) VALUES ('Clothing', 0);
INSERT INTO Category (name, is_delete) VALUES ('Books', 0);

INSERT INTO Product (name, price, categoryID, description, image1, image2, image3, image4, transaction_Fees, contact_Method, create_by, hidden_content, updated_by, is_delete) VALUES
('Product 1', 50.99, 1, 'Description for Product 1', 'https://i.imgur.com/YxPwb7X.jpg', 'product1_2.jpg', 'product1_3.jpg', 'product1_4.jpg', 1, 'Contact Method for Product 1', 1, 'Hidden content for Product 1', 1, 0),
('Product 2', 39.95, 2, 'Description for Product 2', 'https://i.imgur.com/YxPwb7X.jpg', 'product2_2.jpg', 'product2_3.jpg', 'product2_4.jpg', 0, 'Contact Method for Product 2', 1, 'Hidden content for Product 2', 1, 0),
('Product 3', 99.50, 1, 'Description for Product 3', 'https://i.imgur.com/YxPwb7X.jpg', 'product3_2.jpg', 'product3_3.jpg', 'product3_4.jpg', 1, 'Contact Method for Product 3', 1, 'Hidden content for Product 3', 1, 0),
('Product 4', 149.75, 3, 'Description for Product 4', 'https://i.imgur.com/YxPwb7X.jpg', 'product4_2.jpg', 'product4_3.jpg', 'product4_4.jpg', 0, 'Contact Method for Product 4', 1, 'Hidden content for Product 4', 1, 0);

INSERT INTO users (username, password, email, display_name, is_admin, is_verify, is_active) 
VALUES ('bach', 'UPdqztViNgyMw0QyGVTpe0ud+dw=', 'example@example.com', 'Example User', 1, 1, 1);

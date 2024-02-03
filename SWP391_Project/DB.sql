

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
    image varchar(500),
    
    create_by int,
    
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    
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
   /* FOREIGN KEY (productID) REFERENCES Product(id),*/
    categoryID int,
   /* FOREIGN KEY (categoryID) REFERENCES Category(id),*/
    sellerID int,
    buyerID int,
	total_received_amount float(10,2),
    total_paid_amount float(10,2),
	intermediary_fee float(10,2),
    contact_Method VARCHAR(255) CHARACTER SET UTF8MB4,
    status VARCHAR(255) CHARACTER SET UTF8MB4,
    is_Public bit,
    fee_Payer bit,
    transaction_Fees bit,
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
add foreign key (categoryID) references Category(id);
alter table intermediate_Orders
add foreign key (sellerID) references users(id);
alter table intermediate_Orders
add foreign key (buyerID) references users(id);
alter table intermediate_Orders
add foreign key (create_by) references users(id);
alter table intermediate_Orders
add foreign key (updated_by) references users(id);

INSERT INTO Category (name, is_delete) VALUES ('Electronics', 0);
INSERT INTO Category (name, is_delete) VALUES ('Clothing', 0);
INSERT INTO Category (name, is_delete) VALUES ('Books', 0);

INSERT INTO users (username, password, email, display_name, is_admin, is_verify, is_active) 
VALUES ('bach', 'UPdqztViNgyMw0QyGVTpe0ud+dw=', 'example@example.com', 'Example User', 1, 1, 1);


delete from product
INSERT INTO Product (name, price, categoryID, description, image, create_by, updated_by, is_delete) VALUES
('Product 1', 50.99, 1, 'Description for Product 1', 'https://i.imgur.com/YxPwb7X.jpg', 1, 1, 0),
('Product 2', 39.95, 2, 'Description for Product 2', 'https://i.imgur.com/YxPwb7X.jpg', 1, 1, 0),
('Product 3', 99.50, 1, 'Description for Product 3', 'https://i.imgur.com/YxPwb7X.jpg', 1, 1, 0),
('Product 4', 149.75, 3, 'Description for Product 4', 'https://i.imgur.com/YxPwb7X.jpg', 1, 1, 0);



select * from user
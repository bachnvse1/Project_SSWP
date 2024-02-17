
use swp_demo
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

drop table intermediate_Orders
drop table Order_Detail

create table intermediate_Orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    code varchar(255),
    productID int,
    buyer_id int,
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


create table Report(
	id INT PRIMARY KEY AUTO_INCREMENT,
    type_report int,
    orderID int,
    status bit,
    description VARCHAR(255) CHARACTER SET UTF8MB4,
    create_by int,
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by int,
    /*FOREIGN KEY (updated_by) REFERENCES users(id),*/
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete bit
);

create table Wallet (
	id INT PRIMARY KEY AUTO_INCREMENT,
    balance float(10,2),
    create_by int,
    /*FOREIGN KEY (create_by) REFERENCES users(id),*/
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by int,
    /*FOREIGN KEY (updated_by) REFERENCES users(id),*/
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE feedback (
    id INT PRIMARY KEY auto_increment,
    title VARCHAR(100),
    content VARCHAR(500),
    create_at DATETIME,
    user_id INT,
    intermediary_order_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id)
    
    
);
INSERT INTO swp_demo.feedback (id, title, content, create_at, user_id, intermediary_order_id)
VALUES (1, 'Feedback Title', 'Feedback Content', '2024-02-08 12:00:00', 1, 1);
INSERT INTO swp_demo.feedback (id, title, content, create_at, user_id, intermediary_order_id)
VALUES (2, 'huehuehue', 'quaxinhgai', '2024-02-07 12:00:00', 1, 1);



drop table Report

alter table Report
add foreign key (orderID) references intermediate_Orders(id);
alter table Report
add foreign key (create_by) references users(id);
alter table Report
add foreign key (updated_by) references users(id);

alter table Wallet
add foreign key (create_by) references users(id);
alter table Wallet
add foreign key (updated_by) references users(id);

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

INSERT INTO Category (name, is_delete) VALUES ('Account', 0);
INSERT INTO Category (name, is_delete) VALUES ('Quizlet', 0);
INSERT INTO Category (name, is_delete) VALUES ('Netflix', 0);

delete from swp_demo.category


INSERT INTO users (username, password, email, display_name, is_admin, is_verify, is_active) 
VALUES ('bach', 'UPdqztViNgyMw0QyGVTpe0ud+dw=', 'example@example.com', 'Example User', 1, 1, 1);

INSERT INTO users (username, password, email, display_name, is_admin, is_verify, is_active) 
VALUES ('bach2', 'UPdqztViNgyMw0QyGVTpe0ud+dw=', 'example@example.com', 'buyer', 0, 1, 1);

INSERT INTO Wallet (balance, create_by, updated_by)
VALUES (10000000.00, 1, 1),
       (50000000.50, 2, 2);
       
update  Wallet 
set balance = 123
where create_by = 1 


delete from swp_demo.product where product.id = 5;
delete from swp_demo.intermediate_Orders where product.id = 5;
delete  from swp_demo.Order_Detail

select * from Category
select * from Product
select * from users
select * from intermediate_Orders where productID = 2
select * from Wallet where create_by = 2
select * from Report

select * from Product join intermediate_Orders
on Product.id = intermediate_Orders.productID
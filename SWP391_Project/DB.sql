SELECT * FROM swp_demo.users;
DELETE FROM swp_demo.users;

UPDATE swp_demo.users
SET is_active = 1
WHERE email = 'bachnvse@gmail.com';


drop table users;

create database swp_demo;


CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    display_name VARCHAR(255),
    is_admin bit DEFAULT FALSE, 
    is_verify bit default false,
    is_active bit DEFAULT False, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE userGoogle (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
	email VARCHAR(255) NOT NULL,
    is_active bit DEFAULT TRUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

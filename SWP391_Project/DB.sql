SELECT * FROM swp_demo.users;


SELECT * FROM swp_demo.usergoogle;

DELETE FROM swp_demo.users;
select * from swp_demo.usergoogle where email = 'bachnvse@gmail.com';

UPDATE swp_demo.users
SET is_active = 1
WHERE email = 'bachnvse@gmail.com';
INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES ('admin5', 'bachtk203@', 'bachnvse@gmail.com', 'bach', 1, 0, 1)
INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES ('admin', 'bachtk203@', 'sdfsdf', 'bach', 0, 0, 1)
INSERT userGoogle (id, name, email, is_active) VALUES ('54345345', 'hi', 'bachnv@gmail.com', 1);

drop table swp_demo.usergoogle;

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
    name nvarchar(255),
	email VARCHAR(255) NOT NULL,
    is_active bit DEFAULT TRUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

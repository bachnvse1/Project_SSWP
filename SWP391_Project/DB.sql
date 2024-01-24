SELECT * FROM swp_demo.users;


DELETE FROM swp_demo.users;

INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES ('admin', 'bachtk203@', 'bachnvse@gmail.com', 'bachhi', 1, 1, 1);
INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES ('admin2', 'bachtk203@', 'bachnvse@gmail.com', 'bachhi', 0, 1, 1);
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


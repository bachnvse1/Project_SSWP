INSERT users (username, password, email, display_Name, isAdmin, is_active) VALUES ('bach', '123', 'bachn@hii.com', 0, 1, 1);

Select * from users;
select * from swp_demo.otp_codes
drop table users;
use swp_demo
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    display_name VARCHAR(255),
    isAdmin bit DEFAULT FALSE, -- Thêm trường isAdmin, giả định là kiểu BOOLEAN
    is_active bit DEFAULT TRUE, -- Thêm trường is_active, giả định là kiểu BOOLEAN
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


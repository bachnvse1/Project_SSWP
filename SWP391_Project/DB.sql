INSERT users (username, password, email, display_Name, isAdmin, is_active) 
VALUES ('bach', '123', 'bachn@hii.com', 0, 1, 1),
('user1', 'password1', 'user1@example.com', 'User One', FALSE, TRUE),
('user2', 'password2', 'user2@example.com', 'User Two', FALSE, TRUE),
('user3', 'password3', 'user3@example.com', 'User Three', FALSE, TRUE),
('user4', 'password4', 'user4@example.com', 'User Four', FALSE, TRUE),
('user5', 'password5', 'user5@example.com', 'User Five', FALSE, TRUE),
('user6', 'password6', 'user6@example.com', 'User Six', FALSE, TRUE),
('user7', 'password7', 'user7@example.com', 'User Seven', FALSE, TRUE),
('user8', 'password8', 'user8@example.com', 'User Eight', FALSE, TRUE),
('user9', 'password9', 'user9@example.com', 'User Nine', FALSE, TRUE),
('user10', 'password10', 'user10@example.com', 'User Ten', FALSE, TRUE),
('user11', 'password11', 'user10@example.com', 'User 11', FALSE, FALSE);
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


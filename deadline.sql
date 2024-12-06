-- User
CREATE DATABASE IF NOT EXISTS users;
CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password_user VARCHAR(255)
)
INSERT INTO users (full_name,email,password_user) VALUES 
('Ben','ben872@gmail.com','2321'),
('Duck','duck2321@gmail.com','2321'),
('Han','han432@gmail.com','2321'),
('Tet','tet661@gmail.com','2321'),
('Jamie','jamie1010@gmail.com','2321'),
('Ngan','ngan1024@gmail.com','2321'),
('Henry','henry1092@gmail.com','2321'),
('Zet', 'zetzi322@gmail.com','2321')
-- Restaurant
CREATE DATABASE IF NOT EXISTS restaurant;
CREATE DATABASE IF NOT EXISTS rate_res;
CREATE DATABASE IF NOT EXISTS like_res;
CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
)
CREATE TABLE rate_res (
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)
CREATE TABLE like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)
INSERT INTO restaurant(res_name,image,description) VALUES
('Chicken Texas','https://seeklogo.com/images/T/texas-chicken-logo-E52D04187C-seeklogo.com.png','100% fresh chicken'),
('McDonalds','https://hipfonts.com/wp-content/uploads/2022/08/McDonalds-logo-cover.jpg','Im lovin it'),
('Pizza Hut','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu5Wgs7dbo4_HQr3m03xTbEvCdbjekxsB9RA&s','Make it great')
INSERT INTO rate_res(user_id,res_id,amount,date_rate) VALUES
(1, 1, 6, '2024-12-1 06:45:20'),
(2, 1, 1, '2024-12-1 23:02:01'),
(3, 2, 3, '2024-12-1 04:03:02'),
(4, 3, 2, '2024-12-1 11:30:44'),
(5, 2, 3, '2024-12-1 14:23:24')
INSERT INTO like_res(user_id,res_id,date_like) VALUES 
(8, 2, '2024-12-1 06:45:20'),
(1, 1, '2024-12-1 06:45:20'),
(1, 1, '2024-12-1 06:45:20'),
(1, 1, '2024-12-1 06:45:20'),
(1, 1, '2024-12-1 06:45:20'),
(1, 1, '2024-12-1 06:45:20'),
(2, 1, '2024-12-1 06:45:20'),
(3, 2, '2024-12-1 06:45:20'),
(4, 3, '2024-12-1 06:45:20'),
(5, 1, '2024-12-1 06:45:20'),
(2, 2, '2024-12-1 06:45:20'),
(3, 1, '2024-12-1 06:45:20'),
(2, 3, '2024-12-1 06:45:20')
-- Food
CREATE DATABASE IF NOT EXISTS food;
CREATE DATABASE IF NOT EXISTS food_type;
CREATE DATABASE IF NOT EXISTS food_sub;
CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)
CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)
CREATE TABLE food_sub (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO food(food_name,image,price,description,type_id) VALUES
('Chicken Texas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaBvs5ICh5gNtW_RcqnzhqaqwIg2YqVy8Emw&s', 5.40,'fast food', 1),
('ChickenBurger', 'https://mcdonalds.vn/uploads/2018/food/burgers/xmcchickendlx_bb.png.pagespeed.ic.xWRiMJ_Enc.webp',2.72, 'fast food', 2),
('Cheeseburger','https://mcdonalds.vn/uploads/2018/food/burgers/xcheesedlx_bb.png.pagespeed.ic.T9fdYoxRFN.webp', 2.13, 'fast food', 2),
('Pizza', 'https://new.pizzahut.vn/_next/image?url=https%3A%2F%2Fcdn.pizzahut.vn%2Fimages%2FWeb_V3%2FProducts_MenuTool%2FC02%40%40Pizza_hai_ssn_sot_pesto.webp&w=640&q=100', 6.21, 'fast food', 3)
INSERT INTO food_type(type_name) VALUES 
('Chicken'),
('Burger'),
('Pizza')
INSERT INTO food_sub(sub_name,sub_price,food_id) VALUES
('French Fries', 1.04, 1),
('Mixed Vegetables', 1.40, 1),
('French Fries', 1.20, 2),
('French Fries', 1.20, 3)
-- Oder 
CREATE DATABASE IF NOT EXISTS orders;
CREATE TABLE orders (
	user_id INT,	
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO orders(user_id,food_id,amount,code,arr_sub_id) VALUES
(1, 1, 3, '513','1, 2'),
(1, 1, 2, '872','1, 2'),
(2, 2, 1, '231','1, 2'),
(4, 1, 1, '121','1'),
(1, 2, 1, '214','1, 2'),
(3, 4, 1, '332','2'),
(2, 3, 1, '652','1, 2'),
(3, 1, 2, '853','2'),
(5, 2, 2, '947','1'),
(8, 2, 2, '247','1'),

-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT like_res.user_id AS 'ID', users.full_name AS 'Name', COUNT(like_res.user_id) AS 'Like'  FROM like_res
INNER JOIN users ON like_res.user_id = users.user_id
GROUP BY like_res.user_id ORDER BY 'Count' DESC
LIMIT 5
-- Tìm 2 nhà hàng có lượt like nhiêu nhẩt
SELECT like_res.res_id AS 'ID', restaurant.res_name AS 'Name', COUNT(like_res.res_id) AS 'Like' FROM like_res
INNER JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP BY like_res.res_id ORDER BY 'Count' DESC
LIMIT 2
-- Tìm người đã đặt hàng nhiều nhất
SELECT orders.user_id AS 'ID', users.full_name AS 'Name', COUNT(orders.user_id) AS 'Order' FROM orders
INNER JOIN users ON orders.user_id = users.user_id
GROUP BY orders.user_id ORDER BY 'Count' DESC
LIMIT 1
-- Tìm người dùng không hoạt động trong hệ thống ( không đặt hàng, không like, không đánh giá )
SELECT users.user_id AS 'ID', users.full_name AS 'Adjective', users.email AS 'Email' FROM users
LEFT JOIN orders ON users.user_id = orders.user_id
LEFT JOIN like_res ON users.user_id = like_res.user_id
LEFT JOIN rate_res ON users.user_id = rate_res.user_id
WHERE orders.user_id IS NULL AND like_res.user_id IS NULL AND rate_res.user_id IS NULL
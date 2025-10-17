-- Creating a Database/Schema and then using it.
Create database presentation;
Use presentation;

-- Creating Customers Table.
Create table Customers(
Customer_id int primary key not null,
Customer_name varchar(255) not null,
Email_id varchar(255),
Phone_No varchar(10),
Age tinyint not null,
Gender varchar(20) not null,
Location varchar(255) not null,
Signup_date date not null
);

-- Creating Products Table.
Create table Products(
Product_id int primary key not null,
Product_name varchar(255) not null,
Category varchar(255) not null,
Brand varchar(255) not null,
Price decimal(10,2) not null,
Stock_quantity tinyint not null
);

-- Creating Sellers Table.
Create table Sellers(
Seller_id int primary key not null,
Seller_name varchar(255) not null,
Location varchar(255) not null,
Rating decimal(3,2)
);

-- Creating Orders Table.
Create table Orders(
Order_id int primary key not null,
Product_id int not null,
Customer_id int not null,
Order_date date not null,
Total_amount decimal(20,2) not null,
Status varchar(255) not null,
Foreign key (product_id) references Products(product_id),
Foreign key (customer_id) references Customers(customer_id)
);

-- Creating Order Item Tables.
Create table order_item(
OrderItem_id int primary key not null,
Order_id int not null,
Product_id int not null,
Quantity int not null,
Price_per_unit decimal(10,2) not null,
Foreign key (product_id) references Products(product_id),
Foreign key (order_id) references Orders(order_id)
);

-- Creating Shipments Table
Create table Shipments(
Shipment_id int primary key not null,
Order_id int not null,
Product_id int not null,
Carrier varchar(255) not null,
Ship_date date not null,
Delivery_Date date,
Status varchar(255) not null,
Foreign key (order_id) references Orders(order_id),
Foreign key (Product_id) references Products(Product_id)
);

-- Inserting values into Customers Table.
INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', '9876543210', 32, 'Male', 'Mumbai', '2024-01-05'),
(2, 'Priya Singh', 'priya.singh@example.com', '9823456781', 28, 'Female', 'Delhi', '2024-02-12'),
(3, 'Rajesh Kumar', 'rajesh.kumar@example.com', '9812345678', 40, 'Male', 'Bengaluru', '2024-03-20'),
(4, 'Sneha Verma', 'sneha.verma@example.com', '9898765432', 25, 'Female', 'Pune', '2024-04-01'),
(5, 'Arjun Nair', 'arjun.nair@example.com', '9786543210', 35, 'Male', 'Kochi', '2024-01-15'),
(6, 'Neha Gupta', 'neha.gupta@example.com', '9922334455', 29, 'Female', 'Lucknow', '2024-05-18'),
(7, 'Vikram Reddy', 'vikram.reddy@example.com', '9877612345', 38, 'Male', 'Hyderabad', '2024-06-10'),
(8, 'Kavita Joshi', 'kavita.joshi@example.com', '9865123789', 30, 'Female', 'Jaipur', '2024-07-05'),
(9, 'Suresh Patil', 'suresh.patil@example.com', '9845671230', 45, 'Male', 'Nagpur', '2024-08-01'),
(10, 'Ananya Das', 'ananya.das@example.com', '9833456712', 27, 'Female', 'Kolkata', '2024-03-12'),
(11, 'Deepak Mehta', 'deepak.mehta@example.com', '9856231470', 33, 'Male', 'Chennai', '2024-04-15'),
(12, 'Ritu Malhotra', 'ritu.malhotra@example.com', '9845123786', 26, 'Female', 'Bhopal', '2024-06-22'),
(13, 'Manish Yadav', 'manish.yadav@example.com', '9812356789', 36, 'Male', 'Gurgaon', '2024-02-28'),
(14, 'Pooja Bansal', 'pooja.bansal@example.com', '9871234560', 31, 'Female', 'Chandigarh', '2024-05-10'),
(15, 'Rohit Sen', 'rohit.sen@example.com', '9891234567', 34, 'Male', 'Indore', '2024-07-18'),
(16, 'Meera Iyer', 'meera.iyer@example.com', '9823123456', 28, 'Female', 'Coimbatore', '2024-04-25'),
(17, 'Sanjay Pillai', 'sanjay.pillai@example.com', '9812765432', 42, 'Male', 'Thiruvananthapuram', '2024-01-30'),
(18, 'Aisha Khan', 'aisha.khan@example.com', '9845123098', 29, 'Female', 'Ahmedabad', '2024-03-08'),
(19, 'Karan Thakur', 'karan.thakur@example.com', '9865432109', 37, 'Male', 'Surat', '2024-02-15'),
(20, 'Divya Chawla', 'divya.chawla@example.com', '9832765410', 26, 'Female', 'Patna', '2024-06-05');

-- Inserting values into Products Table.
INSERT INTO Products VALUES
(101, 'Smartphone', 'Electronics', 'Samsung', 18999.00, 50),
(102, 'Laptop', 'Electronics', 'Dell', 54999.00, 30),
(103, 'Refrigerator', 'Appliances', 'LG', 25999.00, 20),
(104, 'Washing Machine', 'Appliances', 'Whirlpool', 18999.00, 15),
(105, 'LED TV', 'Electronics', 'Sony', 39999.00, 25),
(106, 'Mixer Grinder', 'Appliances', 'Prestige', 3999.00, 40),
(107, 'Air Conditioner', 'Appliances', 'Voltas', 32999.00, 12),
(108, 'Men T-Shirt', 'Clothing', 'Peter England', 999.00, 100),
(109, 'Women Kurti', 'Clothing', 'Biba', 1499.00, 80),
(110, 'Running Shoes', 'Footwear', 'Nike', 2999.00, 60),
(111, 'Backpack', 'Accessories', 'Wildcraft', 1999.00, 50),
(112, 'Microwave Oven', 'Appliances', 'IFB', 10999.00, 18),
(113, 'Headphones', 'Electronics', 'Boat', 1999.00, 75),
(114, 'Smartwatch', 'Electronics', 'Amazfit', 6999.00, 40),
(115, 'Sofa Set', 'Furniture', 'Godrej', 45999.00, 10),
(116, 'Dining Table', 'Furniture', 'Nilkamal', 18999.00, 8),
(117, 'Bed Sheet', 'Home Decor', 'Bombay Dyeing', 1199.00, 120),
(118, 'Ceiling Fan', 'Appliances', 'Havells', 2999.00, 35),
(119, 'Electric Kettle', 'Appliances', 'Philips', 2499.00, 45),
(120, 'Tablet', 'Electronics', 'Lenovo', 15999.00, 25);


-- Inserting values into Sellers Table.
INSERT INTO Sellers VALUES
(201, 'Ramesh Traders', 'Mumbai', 4.5),
(202, 'Kiran Electronics', 'Delhi', 4.2),
(203, 'South India Appliances', 'Chennai', 4.7),
(204, 'Star Home Needs', 'Hyderabad', 4.1),
(205, 'Elite Fashion Hub', 'Bengaluru', 4.3),
(206, 'FreshMart Grocery', 'Pune', 4.6),
(207, 'Modern Furniture World', 'Kolkata', 4.0),
(208, 'Urban Footwear', 'Ahmedabad', 4.4),
(209, 'Royal Kitchenware', 'Jaipur', 4.5),
(210, 'Digital World', 'Lucknow', 4.2),
(211, 'Trendz Clothing', 'Surat', 4.3),
(212, 'City Electronics', 'Nagpur', 4.1),
(213, 'Shree Home Decor', 'Indore', 4.0),
(214, 'Appliance King', 'Bhopal', 4.5),
(215, 'Lifestyle Mall', 'Coimbatore', 4.6),
(216, 'Fashion Fiesta', 'Patna', 4.2),
(217, 'SmartTech Store', 'Gurgaon', 4.4),
(218, 'Green Living', 'Thiruvananthapuram', 4.3),
(219, 'Mega Mart', 'Chandigarh', 4.1),
(220, 'Classic Choice', 'Lucknow', 4.5);


-- Inserting values into Orders Table.
INSERT INTO Orders VALUES
(301, 101, 1, '2024-02-10', 18999.00, 'Delivered'),
(302, 105, 2, '2024-03-05', 39999.00, 'Delivered'),
(303, 110, 3, '2024-04-15', 2999.00, 'Delivered'),
(304, 108, 4, '2024-05-01', 999.00, 'Delivered'),
(305, 103, 5, '2024-02-20', 25999.00, 'Delivered'),
(306, 114, 6, '2024-06-20', 6999.00, 'Delivered'),
(307, 107, 7, '2024-07-15', 32999.00, 'Pending'),
(308, 109, 8, '2024-08-05', 1499.00, 'Delivered'),
(309, 112, 9, '2024-08-20', 10999.00, 'Shipped'),
(310, 106, 10, '2024-04-01', 3999.00, 'Delivered'),
(311, 102, 11, '2024-05-10', 54999.00, 'Delivered'),
(312, 113, 12, '2024-07-02', 1999.00, 'Delivered'),
(313, 104, 13, '2024-03-15', 18999.00, 'Delivered'),
(314, 115, 14, '2024-06-25', 45999.00, 'Pending'),
(315, 111, 15, '2024-08-12', 1999.00, 'Delivered'),
(316, 116, 16, '2024-05-20', 18999.00, 'Delivered'),
(317, 118, 17, '2024-02-28', 2999.00, 'Delivered'),
(318, 119, 18, '2024-04-18', 2499.00, 'Shipped'),
(319, 120, 19, '2024-03-22', 15999.00, 'Delivered'),
(320, 117, 20, '2024-06-15', 1199.00, 'Delivered');


-- Inserting values into Order Items Table.
INSERT INTO Order_item VALUES
(401, 301, 101, 1, 18999.00),
(402, 302, 105, 1, 39999.00),
(403, 303, 110, 1, 2999.00),
(404, 304, 108, 2, 999.00),
(405, 305, 103, 1, 25999.00),
(406, 306, 114, 1, 6999.00),
(407, 307, 107, 1, 32999.00),
(408, 308, 109, 3, 1499.00),
(409, 309, 112, 1, 10999.00),
(410, 310, 106, 2, 3999.00),
(411, 311, 102, 1, 54999.00),
(412, 312, 113, 1, 1999.00),
(413, 313, 104, 1, 18999.00),
(414, 314, 115, 1, 45999.00),
(415, 315, 111, 2, 1999.00),
(416, 316, 116, 1, 18999.00),
(417, 317, 118, 2, 2999.00),
(418, 318, 119, 1, 2499.00),
(419, 319, 120, 1, 15999.00),
(420, 320, 117, 4, 1199.00);

-- Inserting values into Shipments Table.
INSERT INTO Shipments VALUES
(501, 301,101, 'Blue Dart', '2024-02-11', '2024-02-14', 'Delivered'),
(502, 302,102, 'DTDC', '2024-03-06', '2024-03-10', 'Delivered'),
(503, 303,103, 'Delhivery', '2024-04-16', '2024-04-20', 'Delivered'),
(504, 304,104, 'Ecom Express', '2024-05-02', '2024-05-06', 'Delivered'),
(505, 305,105, 'Blue Dart', '2024-02-21', '2024-02-25', 'Delivered'),
(506, 306,106, 'DTDC', '2024-06-21', '2024-06-24', 'Delivered'),
(507, 307,107, 'Delhivery', '2024-07-16', NULL, 'Pending'),
(508, 308,108, 'Ecom Express', '2024-08-06', '2024-08-09', 'Delivered'),
(509, 309,109, 'Blue Dart', '2024-08-21', NULL, 'Shipped'),
(510, 310,110, 'DTDC', '2024-04-02', '2024-04-05', 'Delivered'),
(511, 311,111, 'Delhivery', '2024-05-11', '2024-05-15', 'Delivered'),
(512, 312,112,'Ecom Express', '2024-07-03', '2024-07-07', 'Delivered'),
(513, 313,113, 'Blue Dart', '2024-03-16', '2024-03-20', 'Delivered'),
(514, 314,114, 'DTDC', '2024-06-26', NULL, 'Pending'),
(515, 315,115, 'Delhivery', '2024-08-13', '2024-08-17', 'Delivered'),
(516, 316,116, 'Ecom Express', '2024-05-21', '2024-05-25', 'Delivered'),
(517, 317,117, 'Blue Dart', '2024-02-29', '2024-03-03', 'Delivered'),
(518, 318,118, 'DTDC', '2024-04-19', NULL, 'Shipped'),
(519, 319,119, 'Delhivery', '2024-03-23', '2024-03-27', 'Delivered'),
(520, 320,120, 'Ecom Express', '2024-06-16', '2024-06-20', 'Delivered');
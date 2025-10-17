-- The syntax below helps us to view the whole table
Select * from Customers;
Select * from Products;
Select * from Sellers;
Select * from Orders;
Select * from Order_Item;
Select * from Shipments;

-- Using WHERE.
Select Customer_id,Customer_name,Gender from Customers where Gender="Male";


START TRANSACTION;
-- DROP(Deletes the table).

-- Update(Updates the values according to the condition).
Update customers set Customer_name="Anay Shrivastav" where customer_id=1;

-- ROLLBACK(Takes a step back just like undo).
Rollback;

-- COMMIT(Commit is used to permanently save the changes).
Commit;


-- Sorting.
-- Using ORDER BY in ASCENDING and DESCENDING ORDER(Helps us to sort data by placing them in a order).
-- Most costly Product.
Select Product_id, Product_name,Price from Products order by Price desc;
-- Lowest Stock quantity of an product.
Select Product_id, Product_name,Stock_quantity from Products order by stock_quantity asc;


-- Using AND operator(Used if both the values are true).
-- Products delivered by Blue dart. 
Select Shipment_id, Carrier,Status from Shipments where Carrier="Blue Dart" and Status="Delivered";

-- Using OR operator(Used if anyone of the value is true).
-- Pending Deliveries and Delhivery Carrier Status. 
Select Shipment_id, Carrier,Status from Shipments where Carrier="Delhivery" or Status="Pending";

-- Using BETWEEN operator(Used to find the value between 2 values).
-- Sigup`s in the first half of the year 2024.
Select Customer_id,Customer_name,Signup_Date from Customers where Signup_date between '2024-01-01' and '2024-06-01';

-- Using IN operator(IN is an alternative of OR).
-- Electronics products.
Select Product_id,Product_name,Category from Products where Category in ("Electronics");

-- Using NEGETION operator(NOT is used in negetion).
-- Products other than Electronics.
Select Product_id,Product_name,Category from Products where Category not in ("Electronics");

-- Using IS NULL operator(Checking if there is a null value).
-- The products whose delivery date is not yet calculated.
Select Shipment_id, Carrier,Ship_date,Delivery_date from Shipments where Delivery_Date is null;

-- Using LIKE operator(Like is for(If we dont know the specific vaue but we know thw first or last or other letters then we can use this)).
-- Customers name who have A in their name.
Select Customer_id, Customer_name from Customers where Customer_name like "%a%";

-- Using Arthimetic operators (>,<,+,-,/,* etc.)
-- Products which cost less than 4999.
Select OrderItem_id,price_per_unit from Order_item where price_per_unit<4999;

-- Products which cost more than 4999.
Select OrderItem_id,price_per_unit from Order_item where price_per_unit>4999;


-- Using STATISTICAL:
-- Using SUM()(To find the total sum of the column).
-- Total amount of the products delivered.
Select sum(total_amount) from orders where status="Delivered";

-- Total amount of products per unit that are ordered
Select sum(price_per_unit) from Order_Item;

-- Using MIN()(To find the minimum value in the column).
-- The cheapest product.
Select min(Price) from Products;

-- Electronics Product which has very less stock quantity.
Select min(Stock_quantity) from Products where Category="Electronics";

-- Using MAX()(To find the maximum value in the column).
-- Seller with the highest rating.
Select max(rating) from sellers;

-- The oldest and male customer in the customer table.
Select max(Age) from customers where Gender="Male";

-- Using COUNT()(To count the number of rows in the column).
-- Number of Deliveries,Pending,Shipped.
Select count(Delivery_Date) from Shipments;
-- Number of ordered item which has quantity of 1.
Select count(Quantity) from Order_item where Quantity=1;

-- Using AVERAGE()(To find the average value of the c ).
-- Average price of all products.
Select Avg(Price) from products;

-- Average price of clothing products.
Select Avg(Price) from products where Category="Clothing";

-- Using STRINGS:
-- Using LOWER()(Converts all the data in lower case).
Select lower(Customer_name) from customers;

-- Using UPPER()(Converts all the data in upper case).
Select upper(Brand) from products;

-- Using CONCAT()(Joins 2 data).
-- Seller's name and Location in a single cell.
Select concat(Seller_name," - ",Location) from Sellers;

-- Using MATHEMATICAL:
-- Using EXP( )(Exponent raised to e).
Select log(Age) from Customers;

-- Using TAN( )
Select tan(Price) from Products;

-- Using ATAN( )
Select atan(Stock_quantity) from Products;

-- Using SIN( )
Select sin(Phone_no) from customers;

-- Using COS( )
Select cos(total_amount) from orders;

-- Using FUNCTIONS:
-- Using CEILING( )(Shows the closet highest whole number).
Select ceiling(4.5);

-- Using FLOOR( )(Shows the closet lowest whole number).
Select floor(4.5);

-- Using TRIM( )(To remove a data from a cell).
Select trim("Anay Shrivastav");

-- Using LENGTH( )(To find the number of character in a string).
Select length(email_id) from customers;

-- Using AS (Used for naming a result column):
Select sum(Total_amount) as Total_Sales from orders;
Select concat(Seller_name," - ",Location) as Seller from Sellers;


-- Using JOIN:
-- Using INNER JOIN(Joins 2 tables through the common value ).
-- Shows the product name, product id and total amount.
Select O.Product_id,P.Product_name,O.Total_amount
From Orders O Inner Join Products P
On O.Product_id = P.Product_id;

-- Using RIGHT JOIN(Joins the 2 table through the right table)
Select OT.OrderItem_id,OT.Product_id,P.product_name,Price_per_unit
From Order_Item OT Right Join Products P
On OT.Product_id=P.Product_id;

-- Using LEFT JOIN.(Joins the 2 tables through the left table)
Select S.Shipment_id, S.Order_id,O.Order_date,S.Delivery_date,O.Total_amount
From Orders O Left Join Shipments S
On S.Order_id=O.Order_id;

-- Using CROSS JOIN.(Joins the 2 tables who dont have any common values)
Select Shipment_id,P.Product_id,Product_name,Delivery_Date 
From Products P Cross Join Shipments;

-- Using NESTED JOIN.(There are joins under join)
Select C.Customer_id,SH.Order_id,Sh.Carrier,SH.Delivery_Date,SH.Status
From Orders O
Join Customers C On C.Customer_id=O.Customer_id
Join Shipments SH On SH.Order_id=O.Order_id;

-- Using UNION.(Shows the data and skips the duplicate data)
Select Seller_name,Location,Rating From Sellers
Union
Select Product_name,Category,Price From Products;

-- Using UNION ALL.(Shows all of the data including the duplicate data)
Select Seller_name,Location,Rating From Sellers
Union All
Select Product_name,Category,Price From Products;

-- Ranks:
-- Using RANK(Shows values by ranking them from 1(Skips the rank when data is duplicate)).
Select Order_id,Product_id,Customer_id,Total_amount,Rank()over(partition by customer_id order by Total_amount desc) as Order_Rank from Orders;

-- Using DENSE RANK(Does the same as rank but does not skips the rank).
Select Product_id,Product_name,Brand,Price,Stock_Quantity,dense_rank()over(partition by product_id order by Stock_Quantity) as Stock From Products;

-- Using LEAD()(For the next).
Select Shipment_id,Order_id,Carrier,Ship_date,Delivery_date,Status, lead(Delivery_Date)over(partition by Order_id) as Next_Delivery_Date,
lead(Status)over(partition by Order_id) as Next_Delivery_Status 
From Shipments;

-- Using LAG()(For the previous).
Select Shipment_id,Order_id,Carrier,Ship_date,Delivery_date,Status, lag(Ship_date)over(partition by Order_id) as Last_Shipping_date,
lag(Delivery_date)over(partition by Order_id) as Last_Delivery_Date
From Shipments;

-- SUBQUERIES(NESTED QUERIES):
-- Here It shows us the Amount of the order which is higher than the average of all the orders.
Select Customer_id, Total_amount
From Orders
Where Total_amount>(Select Avg(Total_amount)
From Orders
);

-- Here it shows us the Customers Name whose name start with A.
Select Customer_id, Customer_name 
From Customers
Where Customer_name in (Select Customer_name 
From Customers
Where Customer_name like 'A%'
);

-- Here It shows us the top 5 product name and the date of delivery of the product According to their price.
Select P.Product_id,P.Product_name,S.Delivery_date,S.Status,P.Price
From Products P
Join Shipments S On P.Product_id=S.Product_id
Order by Price desc
Limit 5;
create table customer
( customer_id int Primary key,
   first_name varchar(10),
   last_name varchar(10),
   email varchar(25),
   address varchar(50),
   city varchar(15),
   state varchar(10),
   zip int
)

Insert into customer 
Values
(10, 'Kaustav', 'Dey', 'imkd2019@gmail.com' , 'Siliguri , Shaktigarh' , 'Siliguri' , 'W.B', 734005),
(20,'Debjit','Dutta','debjitnunku@gmail.com','Bonkers , Birbhum','Birbhum','W.B',736005),
(30,'Soumyadip','Das','soumyaisnoob@gmail.com','DumDum , Kolkata','Kolkata','W.B',730005),
(40,'Avi','Paul','hero@gmail.com','Kachrapra , Kolkata','Kolkata','W.B',738005),
(50,'Godfrey','Elden Lord','firsteldenlord@gmail.com','San Jose California','San Jose','U.S.A',12345)

create table Orders
( order_id int Primary key,
  order_date date,
  amount decimal(10,2),
  customer_id int references customer(customer_id)
)

Insert into  Orders
Values
(1,'10-Mar-2023',2299, 10),
(2,'26-Aug-2023',2050,20),
(3,'12-Sep-2023',1499,30),
(4,'17-Sep-2023',2499,40),
(5,'27-Sep-2023',1999,50)

2. Create a user-defined function which will multiply the given number with 10
3. Use the case statement to check if 100 is less than 200, greater than200or equal to 200 and print the corresponding value. 
4. Using a case statement, find the status of the amount. Set the statusof theamount as high amount, low amount or medium amount based uponthecondition. 
5. Create a user-defined function, to fetch the amount greater thanthengiveninput.

--1. Use the inbuilt functions and find the minimum, maximumand averageamount from the orders table

select Min(amount) as Minimum_Amount , Max(amount) as Maximum_Amount, Avg(amount) as Average_Amount from Orders

--2. Create a user-defined function which will multiply the given number with 10
create function Multi(@val int)
returns int 
as begin
return (@val *10) end

select Multi(amount) as Updated_Amount from Orders 

--3. Use the case statement to check if 100 is less than 200, greater than200or equal to 200 and print the corresponding value. 

select 
Value=
case
when 100 < 200 then  'SMALLER' 
when 100 > 200 then 'GREATER'
when 100 = 200 then 'EQUAL'
end

--4. Using a case statement, find the status of the amount. Set the statusof theamount as high amount, low amount or medium amount based uponthecondition. 

select amount,
STATUS =
case
when amount >2000 then 'HIGH AMOUNT'
when amount <2000 and amount >1500 then 'MEDIUM AMOUNT'
when amount <1500 then 'LOW AMOUNT'
end
from orders

--5. Create a user-defined function, to fetch the amount greater thanthengiveninput.

create function compare(@val1 int)
returns table 
return(
select * from orders where amount>@val1
)

select * from dbo.compare(1999)
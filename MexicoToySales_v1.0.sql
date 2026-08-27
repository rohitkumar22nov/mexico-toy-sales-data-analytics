
-- ==========================================
-- 1. DATABASE SETUP & TABLE CREATION
-- ==========================================

Create Database MexicoToySales
Use Mexicotoysales

-- Creating dim_date Table (Must be created first to populate data for constraints later)
Drop table if exists dim_date
Create table dim_date (
date date,
day_name varchar(50),
month_name varchar(50),
year_name varchar(50))


-- Creating Employees Table
Drop table if exists  Employees   
Create Table Employees (
emp_id int, --PK
store_id int, --FK
full_name varchar(max),
department varchar(max),
salary int,
manager_id int
)


-- ==========================================
-- 2. POPULATE DIM_DATE TABLE (Recursive CTE)
-- ==========================================

-- Populating the dates into the dim_date table based upon min & max dates:
;With date_range as (
Select CAST('1992-09-18' as date) as fullDate
Union All
Select DATEADD(day, 1, fullDate)
from date_range
where fulldate <'2018-09-30'
)

Insert into dim_date
Select
fulldate,format(fulldate, 'ddd'), format(fulldate, 'MMM'), format(fulldate, 'yyyy')
from date_range
OPTION (MAXRECURSION 10000)


-- ==========================================
-- 3. POPULATE EMPLOYEES TABLE
-- ==========================================

Insert into Employees 
values (1,1,' Carlos Santana ',' Management ',85000, NULL),
(2,1,' Sofia Vergara ',' Sales ',48000,1),
(3,2,' Mateo Gomez ',' Management ',82000, NULL),
(4,2,' Valentina Cruz ',' Sales ',47000,3),
(5,3,' Alejandro Rivas ',' Management ',88000, NULL),
(6,3,' Camila Ortiz ',' Sales ',49000,5),
(7,4,' Diego Morales ',' Management ',80000, NULL),
(8,4,' Lucia Ramos ',' Sales ',46000,7),
(9,5,' Gabriel Flores ',' Management ',90000, NULL),
(10,5,' Fernanda Castro ',' Sales ',50000,9),
(11,6,' Joaquin Ruiz ',' Management ',83000, NULL),
(12,6,' Ximena Silva ',' Sales ',47000,11),
(13,7,' Emiliano Mendoza ',' Management ',81000, NULL),
(14,7,' Martina Jimenez ',' Sales ',48000,13),
(15,8,' Sebastian Navarro ',' Management ',86000, NULL),
(16,8,' Antonella Vargas ',' Sales ',49000,15),
(17,9,' Matias Castillo ',' Management ',84000, NULL),
(18,9,' Renata Medina ',' Sales ',47000,17),
(19,10,' Lucas Herrera ',' Management ',87000, NULL),
(20,10,' Victoria Rojas ',' Sales ',51000,19),
(21,11,' Benjamin Silva ',' Management ',82000, NULL),
(22,11,' Sara Morales ',' Sales ',46000,21),
(23,12,' Daniel Ortiz ',' Management ',85000, NULL),
(24,12,' Paula Jimenez ',' Sales ',48000,23),
(25,13,' David Castro ',' Management ',89000, NULL),
(26,13,' Andrea Vargas ',' Sales ',50000,25),
(27,14,' Samuel Cruz ',' Management ',81000, NULL),
(28,14,' Nicole Medina ',' Sales ',47000,27),
(29,15,' Julian Rojas ',' Management ',84000, NULL),
(30,15,' Daniela Silva ',' Sales ',49000,29),
(31,16,' Adrian Morales ',' Management ',86000, NULL),
(32,16,' Gabriela Jimenez ',' Sales ',48000,31),
(33,17,' Tomas Castro ',' Management ',83000, NULL),
(34,17,' Mariana Vargas ',' Sales ',47000,33),
(35,18,' Nicolas Medina ',' Management ',88000, NULL),
(36,18,' Regina Silva ',' Sales ',51000,35),
(37,19,' Alejandro Morales ',' Management ',82000, NULL),
(38,19,' Jimena Jimenez ',' Sales ',46000,37),
(39,20,' Felipe Castro ',' Management ',87000, NULL),
(40,20,' Paulina Vargas ',' Sales ',49000,39),
(41,21,' Bruno Medina ',' Management ',84000, NULL),
(42,21,' Ariadna Silva ',' Sales ',48000,41),
(43,22,' Vicente Morales ',' Management ',81000, NULL),
(44,22,' Camila Jimenez ',' Sales ',47000,43),
(45,23,' Maximo Castro ',' Management ',89000, NULL),
(46,23,' Valeria Vargas ',' Sales ',50000,45),
(47,24,' Thiago Medina ',' Management ',85000, NULL),
(48,24,' Bianca Silva ',' Sales ',49000,47),
(49,25,' Gael Morales ',' Management ',83000, NULL),
(50,25,' Aitana Jimenez ',' Sales ',47000,49),
(51,26,' Dante Castro ',' Management ',86000, NULL),
(52,26,' Fatima Vargas ',' Sales ',48000,51),
(53,27,' Iker Medina ',' Management ',82000, NULL),
(54,27,' Regina Silva ',' Sales ',46000,53),
(55,28,' Ciro Morales ',' Management ',88000, NULL),
(56,28,' Julieta Jimenez ',' Sales ',51000,55),
(57,29,' Axel Castro ',' Management ',84000, NULL),
(58,29,' Eloisa Vargas ',' Sales ',48000,57),
(59,30,' Gael Medina ',' Management ',87000, NULL),
(60,30,' Renata Silva ',' Sales ',49000,59),
(61,31,' Leon Morales ',' Management ',81000, NULL),
(62,31,' Maya Jimenez ',' Sales ',47000,61),
(63,32,' Roman Castro ',' Management ',85000, NULL),
(64,32,' Chloe Vargas ',' Sales ',50000,63),
(65,33,' Simon Medina ',' Management ',83000, NULL),
(66,33,' Zoe Silva ',' Sales ',48000,65),
(67,34,' Lorenzo Morales ',' Management ',86000, NULL),
(68,34,' Alma Jimenez ',' Sales ',49000,67),
(69,35,' Gael Castro ',' Management ',82000, NULL),
(70,35,' Luna Vargas ',' Sales ',46000,69),
(71,36,' Dante Medina ',' Management ',89000, NULL),
(72,36,' Mia Silva ',' Sales ',51000,71),
(73,37,' Noah Morales ',' Management ',84000, NULL),
(74,37,' Emma Jimenez ',' Sales ',48000,73),
(75,38,' Liam Castro ',' Management ',87000, NULL),
(76,38,' Olivia Vargas ',' Sales ',49000,75),
(77,39,' Oliver Medina ',' Management ',81000, NULL),
(78,39,' Isabella Silva ',' Sales ',47000,77),
(79,40,' Lucas Morales ',' Management ',85000, NULL),
(80,40,' Sophia Jimenez ',' Sales ',50000,79),
(81,41,' Ethan Castro ',' Management ',83000, NULL),
(82,41,' Amelia Vargas ',' Sales ',48000,81),
(83,42,' Aiden Medina ',' Management ',86000, NULL),
(84,42,' Harper Silva ',' Sales ',49000,83),
(85,43,' Mason Morales ',' Management ',82000, NULL),
(86,43,' Evelyn Jimenez ',' Sales ',46000,85),
(87,44,' Logan Castro ',' Management ',89000, NULL),
(88,44,' Abigail Vargas ',' Sales ',51000,87),
(89,45,' Elijah Medina ',' Management ',84000, NULL),
(90,45,' Emily Silva ',' Sales ',48000,89),
(91,46,' James Morales ',' Management ',87000, NULL),
(92,46,' Elizabeth Jimenez ',' Sales ',49000,91),
(93,47,' Benjamin Castro ',' Management ',81000, NULL),
(94,47,' Sofia Vargas ',' Sales ',47000,93),
(95,48,' Lucas Medina ',' Management ',85000, NULL),
(96,48,' Victoria Silva ',' Sales ',50000,95),
(97,49,' Henry Morales ',' Management ',83000, NULL),
(98,49,' Camila Jimenez ',' Sales ',48000,97),
(99,50,' Alexander Castro ',' Management ',86000, NULL),
(100,50,' Valentina Vargas ',' Sales ',49000,99)


-- ==========================================
-- 4. PRIMARY & FOREIGN KEYS SETUP (CONSTRAINTS)
-- ==========================================

-- Adding PK to dim_date
Alter table dim_date
Alter column date Date not null

Alter table dim_date
Add constraint pk_dim_date Primary Key(date)


-- Adding PK to Employees
Alter table employees
Alter column emp_id int not null 

Alter table employees
Add constraint pk_employees  primary key (emp_id)


-- Adding FK to sales 
Alter table sales
add constraint product_id_fk
foreign key (product_id)
references products(product_id)

Alter table sales
Add constraint store_id_sales_fk 
Foreign key (store_id) 
References stores(store_id)

Alter table sales
Add Constraint date_sales_dim_date_fk
Foreign Key (date)
References dim_date(date)


-- Adding FK to Inventory
Alter table Inventory
add constraint store_id_fk
Foreign Key (store_id)
References Stores(store_id)

Alter table Inventory
Add Constraint product_id_inventory_fk
Foreign Key (product_id)
References products(product_id)


-- Adding FK to stores
Alter table stores
Add Constraint store_open_date_dim_date_fk
Foreign Key (store_open_date)
References dim_date(date)


-- Adding FK to Employees
Alter table employees
Add constraint store_id_employees_fk
Foreign Key (store_id)
References Stores(store_id)


-- ==========================================
-- 5. EXPLORATORY DATA ANALYSIS (EDA) QUERIES
-- ==========================================

-- Basic Checks & Counts
Select * from inventory
Select * from products
Select year(date), Count(*) as Total_Sales from Sales group by year(date)
Select Top 20 * from Sales
Select count(*) as stores_count from stores
Select Top 5 * from stores
Select count(distinct Store_ID) from stores
Select Top 3 * from stores
Select Top 3 * from stores order by Store_ID desc
Select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='Employees'
Select * from Employees
Select min(date) as minimum_sales, max(date) as maximum_sales from sales
Select min(Store_Open_Date) as minimum, max(Store_Open_Date) as maximum from stores
Select count(*) from dim_date


--1) Sales by Product Category:
With category_sales_summary as(
Select p.product_category, 
Count(Case when year(s.date) = 2017 then p.product_id end) as Sales_2017,
Count(Case when year(s.date) = 2018 then p.product_id end) as Sales_2018
from sales s left join products p
on s.product_id = p.Product_id
group by p.product_category)

Select *,
Cast (Cast ((sales_2018-sales_2017) as Decimal(10,2))/
Nullif(sales_2017,null) as Decimal(5,2))*100 as Percent_Change
from category_sales_summary


--2) Revenue & Profit Margin Analysis:
Select Year(s.date) as Year,
Round(Sum((p.product_price * s.units)),2) as Revenue,
Round(sum((p.product_price-product_cost)*s.units),2) as Profit
from sales s left join products p
on s.product_id = p.product_id
group by Year(s.date)


--3) Store Performance & Location Ranking
Select st.store_name,
st.Store_Location , 
sum(s.units) as Total_Units_Sold,
Round(sum(s.units * p.Product_Price),2) as Revenue,
Round(Avg(s.units * p.Product_Price),2) Avg_Revenue,
Dense_Rank() Over(order by Avg(s.units * p.Product_Price) desc) as ranked_store
from Sales  s left join stores st
on s.Store_ID = st.store_id
left join products p
on p.Product_ID = s.Product_ID
group by st.store_name, st.Store_Location


--4) Monthly Seasonality Trends
;With periodic_revenue as(
Select month(date) month, year(date) year,
Round(sum(p.product_price * s.Units),2) as Current_Revenue
from sales s left join products p
on s.Product_ID = p.Product_ID
group by month(date), year(date)),

Previous_period_revenue as(
Select *,
Lag(Current_Revenue) Over(Order by year asc, month asc) as Previous_Revenue
from periodic_revenue)

Select * , Round((Current_Revenue-Previous_Revenue),2) as Revenue_Comparison
from Previous_period_revenue


--5) Stockout Risk Analysis
--Criteria: Last 90 days selling + Units sold any day > 10 + Stock-in-hand<100
Select distinct pr.product_category, pr.product_name,
i.Stock_On_Hand, i.Store_ID
from inventory i left join products pr
on i.product_id = pr.product_id
left join sales s
on s.Store_ID = i.Store_ID
where s.date > (Select DATEADD(day, -90, max(date)) from sales)
and s.Units > 10
and i.Stock_On_Hand <100
order by i.stock_on_hand asc




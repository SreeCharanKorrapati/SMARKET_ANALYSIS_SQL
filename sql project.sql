-- SQL PROJECT - SREE CHARAN KORRAPATI
create database project;
use project;

-- This project is about different activites in a supermarket. 

-- creating tables
create table dealer(
	dealer_name varchar(255) not null,
    dealer_id int primary key,
    dealer_item varchar(255) not null
);

create table item(
	item_name varchar(255) not null,
    item_id int primary key,
    item_date date not null,
    dealer_id int not null,
    foreign key(dealer_id) references dealer(dealer_id)
    );
    
    create table sales(
		item_id int not null,
		foreign key(item_id) references item(item_id),
        price int not null,
        sales_date date not null
	);
    
    -- entering data into tables
    insert into dealer(dealer_name , dealer_id , dealer_item)
    values
    ('Charan', 1, 'milk'),
	('Ranga', 2, 'soaps'),
	('Phani', 3, 'Buckets'),
	('Arjun', 4, 'Perfumes'),
	('Udith', 5, 'Badam'),
	('Janardhan', 6, 'Bats'),
	('Suresh', 7, 'Shampoo'),
	('Divya', 8, 'Toothpaste'),
	('Priya', 9, 'Towels'),
	('Rajesh', 10, 'Shirts'),
	('Anusha', 11, 'Chocolates'),
	('Kumar', 12, 'Domex'),
	('Latha', 13, 'Rice'),
	('Manoj', 14, 'Oil'),
	('Gowri', 15, 'Bread');
    
    insert into item(item_name , item_id, item_date , dealer_id)
    values
    ('milk', 10, '2024-04-10', 1),
	('soaps', 21, '2024-04-05', 2),
	('Buckets', 35, '2024-02-21', 3),
	('Buckets', 37, '2024-02-23', 3),
	('Perfumes', 41, '2024-01-10', 4),
	('Badam', 53, '2024-03-15', 5),
	('Bats', 60, '2024-03-20', 6),
	('Shampoo', 71, '2024-02-28', 7),
	('Shampoo',74,'2024-03-01',7),
	('Toothpaste', 82, '2024-03-01', 8),
	('Towels', 93, '2024-04-01', 9),
	('Shirts', 104, '2024-04-02', 10),
	('Chocolates', 115, '2024-03-12', 11),
	('Chocolates',117,'2024-03-14',11),
	('Domex', 126, '2024-03-25', 12),
	('Rice', 132, '2024-02-10', 13),
	('Oil', 148, '2024-01-20', 14),
	('Bread', 154, '2024-04-05', 15);
    
    insert into sales(item_id , price , sales_date)
    values
	(10, 25, '2024-04-13'), -- Milk
	(21, 30, '2024-04-06'), -- Soaps
	(35, 75, '2024-02-22'), -- Buckets
	(37, 75, '2024-02-24'), -- Buckets
	(41, 400, '2024-01-20'), -- Perfumes
	(53, 500, '2024-03-20'), -- Badam
	(60, 350, '2024-03-25'), -- Bats
	(71, 150, '2024-03-05'), -- Shampoo
	(74, 200, '2024-03-10'), -- Shampoo
	(82, 30, '2024-03-05'), -- Toothpaste
	(93, 60, '2024-04-10'), -- Towels
	(104, 300, '2024-04-15'), -- Shirts
	(115, 25, '2024-03-20'), -- Chocolates
	(117, 30, '2024-03-25'), -- Chocolates
	(126, 50, '2024-04-01'), -- Domex
	(132, 40, '2024-03-01'), -- Rice
	(148, 150, '2024-02-01'), -- Oil
	(154, 25, '2024-04-10'); -- Bread
    
    -- queries
    -- 1
    select * from item;
    select * from dealer;
    select * from sales;
    
    -- 2 
    select * from dealer where dealer_id > 5;
    select * from item where item_id < 50;
    
    -- 3 
    select item_name from item where item_name like 's%';
    select dealer_name from dealer where dealer_name like 'd%';
    
    -- 4
    select item.item_name,sales.price from item
    right join sales on item.item_id = sales.item_id
    where sales.price between 130 and 370
    order by price;
    
    -- 5 
    select item_id,sales_date
    from sales
    where sales_date > '2024-01-15';
    
    -- 6
    select dealer.dealer_name,item.item_name from dealer
    left join item on dealer.dealer_id = item.dealer_id
    where item.item_id > 50;
    
    -- 7
    insert into item(item_name,item_id,item_date,dealer_id)
    values('soaps',23,'2024-04-08',2);
    insert into sales(item_id , price ,sales_date)
    values 
    (23,35,'2024-04-08');
    select * from sales;
    
    -- 8
    
    select item.item_name , round(avg(sales.price),2) as average from item
    right join sales on item.item_id = sales.item_id
    group by item.item_name
    having count(item.item_name) > 1;
    
    -- 9
    select sales.sales_date , item.item_name,sales.item_id from sales
    cross join item on sales.item_id = item.item_id
    where sales.sales_date between '2024-01-15' and '2024-04-15';
    
    -- 10
    alter table item
    add column expiry_date date;
        
	-- 11
    SELECT d.dealer_name, i.item_name, SUM(s.price) AS total_sales_price
	FROM dealer d
	INNER JOIN item i ON d.dealer_id = i.dealer_id
	INNER JOIN sales s ON i.item_id = s.item_id
	GROUP BY d.dealer_name, i.item_name;
    
    -- 12
    SELECT i.item_name, SUM(s.price) AS total_sales_price
	FROM item i
	LEFT JOIN sales s ON i.item_id = s.item_id
	GROUP BY i.item_name
	ORDER BY total_sales_price DESC
	LIMIT 5;
    
    -- 13
	SELECT YEAR(sales_date) AS sales_year, MONTH(sales_date) AS sales_month, AVG(price) AS average_sales_price
	FROM sales
	GROUP BY sales_year, sales_month;
    




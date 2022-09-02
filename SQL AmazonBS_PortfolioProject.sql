-- DATABASE[AmazonBS_PortfolioProject] 
-- TABLE [dbo].[Amazon Top 50 Best Selling Books Dataset]


--DQL EXAMPLES

--1 Fetch all data from the table (we will find name, author, user rating, reviews, price, 
--year & genre of each best seller book) 


select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--2 Filter data from the table using comparison operators
--(need books with user rating equal & high than 4)

select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where user_rating>=4;


--3 Filter selected columns from the table using comparison & logical operator
--(need books with user rating equal & higher than 4 and genre is fiction only)

select name, author, user_rating, genre 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where user_rating>=4 and genre='Fiction';

--4 Fetch maximum 10 rows from conditions same as 3

select top 10 name, author, user_rating, genre 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where user_rating>=4 and genre='Fiction';


--5 Fetch count of records 
--using aggregate function (we need total number of records in the table)

select count(*) as Total_Number_Records
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--6 Fetch maximum price 
--using aggregate function (we need maximum number of reviews in the table)

select  max(reviews) as Maximum_Number_Reviews
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--7 Fetch minimum price
--using aggregate funtion (we need minimum number of reviews in the table)

select min(reviews) as Minimum_Number_Reviews
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--8 Fetch total distinct authors
--using distict & aggregate function (we find total distinct authors)

select distinct count(Author) as Total_Number_Authors 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--9 Fetch distinct author names

select distinct author 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--10 Fetch average price
--using aggreagte function we find the average of books

select avg(price) as Average_Price
from [dbo].[Amazon Top 50 Best Selling Books Dataset]


--11 Fetch avg price for each genre
--using aggreate function with group by clause we find average price for each genre

select Genre, avg(price) as Average_Price
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
group by genre;


--12 Sort fetched records with condition 
--using comparison operator & order by clause we sort all records by genre with rating equal & high than 4 

select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where user_rating>=4
order by genre;


--13 Sort in descending order
--using order by clause we sort books decendingly

select name, author 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
order by name desc;


--DML EXAMPLE


--14 Aggregate and Filter
--using aggregate function, group by & having clause we find average rating for each genre

select genre, avg(user_rating) as Average_Rating
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
group by genre
having avg(user_rating)>4;


--15 Insert data(rows) into a table 

insert into  [dbo].[Amazon Top 50 Best Selling Books Dataset]
values('SQL Portfolio Project', 'Maria Khan', 5, 100, 10, 2022, 'Non Fiction'); 

--to check the row we inserted into the table 

select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where name='SQL Portfolio Project';


--16 Update data(value of column) of a table

update [dbo].[Amazon Top 50 Best Selling Books Dataset]
set name='Amazon Portfolio Project'
where author='Maria Khan';

--to check the row we updated into the table 

select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where name='Amazon Portfolio Project';


--17 Delete data(rows) from a table 

delete 
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where name='Amazon Portfolio Project';

--to check the row we deleted from the table 

select *
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where name='Amazon Portfolio Project';


--DDL EXAMPLES

--18 Create a table 

create table "Amazon Best Selling Fiction Books"(BS_ID int primary key, name varchar(50) not null, 
author varchar(50), user_rating float not null, reviews int not null, price int not null,
year int not null);


--19 Adding a new column to the table

alter table "Amazon Best Selling Fiction Books" 
add Genre varchar(25);


--20 Removing an existing column from the table

alter table "Amazon Best Selling Fiction Books"
drop column Genre;


--21 Modify the data type of existing column

alter table "Amazon Best Selling Fiction Books"
alter column name varchar(100) not null;


--22 Truncate(remove all data) a table

truncate table "Amazon Best Selling Fiction Books";


--23 Drop a table 

drop table "Amazon Best Selling Fiction Books";

 
--24 Find authors that wrote fiction & non fiction books using Table 1 Fiction Amazon BS 
--and Table 2 Non Fiction Amazon BS

select *
from [dbo].[Fiction Amazon BS] inner join [dbo].[Non Fiction Amazon BS]
on [dbo].[Fiction Amazon BS].Author = [dbo].[Non Fiction Amazon BS].Author;


--25 Creating a Temporary table with all columns with Genre Fiction only from 
--source table  [dbo].[Amazon Top 50 Best Selling Books Dataset]

select * 
into #TempFictionTable
from [dbo].[Amazon Top 50 Best Selling Books Dataset]
where Genre = 'Fiction';







CREATE DATABASE books_store;
use  books_store

 CREATE TABLE Books_table(
	book_id int identity(1,1) primary key,
	book_name varchar(50),
	author_name varchar(50),
	price int,
	rating float,
	quantity int,
	book_image varchar(250),
	registered_date datetime
	);
	
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('Think and Grow Rich','Napoleon Hill',299,4.5,30,'https://images-na.ssl-images-amazon.com/images/I/51Yngd0TjFS._SX460_BO1,204,203,200_.jpg','2019-12-1')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('Zero To One','Peter Thiel',380,4.5,30,'https://images-na.ssl-images-amazon.com/images/I/51z7mZZKRgL._SX317_BO1,204,203,200_.jpg','2014-09-18')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('Before You Start Up','Pankaj Goyal',199,4.3,30,'https://m.media-amazon.com/images/I/81luu9cp+xS._AC_UY218_.jpg','2017-11-24')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('The Entrepreneur Mind','Kevin D. Johnson',320,4.7,30,'https://images-na.ssl-images-amazon.com/images/I/41t209YGrZL._SX322_BO1,204,203,200_.jpg','2017-04-03')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('The Minimalist Entrepreneur','Sahil Lavingia',320,4.5,30,'https://images-na.ssl-images-amazon.com/images/I/41npnt15R+L._SY344_BO1,204,203,200_.jpg','2021-12-11')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('Measure What Matters','John Doerr',623.22,4.7,3,'https://images-na.ssl-images-amazon.com/images/I/41pP76e12vL._SX310_BO1,204,203,200_.jpg','2018-04-24')
	insert into Books_table (book_name,author_name,price,rating,quantity,book_image,registered_date)Values('The Bitcoin Standard','Sahil Lavingia',990,4.5,2,'https://images-eu.ssl-images-amazon.com/images/I/41x6NvXWekS._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','2018-06-08')
	
	select * from Books_table ;

	create table Address_table(
	address_id int identity(1,1) primary key,
	state_name varchar(250),
	city varchar(250),	
    );
	

	insert into Address_table (state_name,city) values ('Jharkhand','Ranchi')
	insert into Address_table (state_name,city) values ('Odisha','Bhubaneswar')
	insert into Address_table (state_name,city) values ('Maharashtra','Mumbai')
	insert into Address_table (state_name,city) values ('Sikkim','Gangtok')
	insert into Address_table (state_name,city) values ('Goa','Panji')
	insert into Address_table (state_name,city) values ('Gujarat','Gandhinagar')
	insert into Address_table (state_name,city) values ('Karnataka','Bengaluru')
	insert into Address_table (state_name,city) values ('TamilNadu','chennai')
	 select * from  Address_table
	 

	


	
 create table Payment_table(
	payment_id int  primary key,
	account_id int,
	order_id int,
	order_placed_date date,
	order_delevered_date date
   )
	

   insert into Payment_table values (1,101,5002341,'2021-10-10','2021-10-17')
   insert into Payment_table values (2,102,5002342,'2022-02-10','2022-02-17')
   insert into Payment_table values (3,103,5002343,'2019-10-23','2019-10-29')
   insert into Payment_table values  (4,104,5002344,'2019-03-13','2019-03-18')
   insert into Payment_table  values (5,105,5002345,'2022-10-20','2022-10-23')
   insert into Payment_table  values (6,106,5002346,'2017-04-12','2022-04-17')
   insert into Payment_table  values (7,107,5002347,'2022-03-20','2022-03-23')



    select * from  Payment_table
	drop table Payment_table

	create table order_table(
	order_id int  identity(1,1) primary key ,
	order_placedDate datetime default SYSDATETIME(),
	order_deliveredDate datetime,
	book_id int foreign key references Books_table(book_id),
	customer_id  int foreign key references Customer_table(customer_id)
	) 

	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),1,1)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),2,2)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),3,3)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),4,4)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),5,5)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),6,6)
	insert into order_table(order_deliveredDate,book_id,customer_id)values(DATEADD(DAY,7,SYSDATETIME()),7,7)
	select* from order_table;
	drop table order_table;

   
  create table Customer_table(
	customer_id int identity(1,1) primary key,
	fname varchar(80),
	lname varchar(80),
	email varchar(250) unique,
	book_id int foreign key references Books_table(book_id ),
	address_id int foreign key references Address_table(address_id)
	--order_id int foreign key references order_table(order_id)
   )

   
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Kajal','Singh','kajalsingh85654@gmail.com','1','1')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Shweta','Mahapatra','shweta@gmail.com','2','2')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Ayush','Ranjan','ayush@gmail.com','3','3')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Saket','Kumar','saket@gmail.com','4','4')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Ankita','Kumari','ankita@gmail.com','5','5')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Sanya','Dangaich','sanya@gmail.com','6','6')
  insert into Customer_table(fname,lname,email,book_id,address_id) values('Anushka','kumari','anushka@gmail.com','7','7')
   insert into Customer_table(fname,lname,email,book_id,address_id) values('Namrata','kumari','namrata@gmail.com','8','8')



   select * from Customer_table
   drop table Customer_table

   -- Add books using store procedure
Create procedure sp_AddBooks
(
	@book_name varchar(50),
	@author_name varchar(50),
	@price int,
	@rating float,
	@quantity int,
	@book_image varchar(250),
	@registered_date date
)
as
begin try
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) 
	values(@book_name,@author_name,@price,@rating,@quantity,@book_image,@registered_date)
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_AddBooks
	'THE POWER OF YOUR SUBCONCIOUS MIND','Joseph Murphy', 105, 4.5, 30, 'https://m.media-amazon.com/images/I/71UwSHSZRnS._AC_UY218_.jpg', '2015-02-01'

-- display books using store procedure
Create procedure sp_DisplayBook
As 
Begin try
	select * from Books
End try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_DisplayBook

-- update books using store procedure
Alter procedure sp_UpdateBook
(
	@book_name varchar(50),
	@author_name varchar(50),
	@price int,
	@rating float,
	@quantity int,
	@book_image varchar(250),
	@book_id int
)
As 
Begin try
	update Books set 
		book_name=@book_name, 
		author_name=@author_name, 
		price=@price, 
		rating=@rating, 
		quantity=@quantity,
		book_image=@book_image
		
	where 
		book_id=@book_id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_UpdateBook
'GREAT TRUTH THAT SET US FIRES','Joseph Murphy', 109, 4.6, 14, 'https://m.media-amazon.com/images/I/71doDXpFEnL._AC_UY218_.jpg', 8

-- delete books using store procedure
create procedure sp_DeleteBook (@id int)
As 
Begin try
delete from Books
where book_id=@id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_DeleteBook 9


-- search books using store procedure
alter procedure sp_SearchBook
(
	@bookname varchar(250),
	@authorname varchar(250)
)
as
begin try
	select * from Books where book_name=@bookname and author_name=@authorname
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch


exec sp_SearchBook
'The Bitcoin Standard', 'Sahil Lavingia'


 -- Add Customer using store procedure
create procedure sp_AddCustomer
(
	@fname varchar(50),
	@lname varchar(50),
	@email varchar,
	@book_id int,
	@address_id int
	
)
as
begin try
insert into Customer_table(fname,lname,email,book_id,address_id) 
	values(@fname,@lname,@email,@book_id,@address_id)
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

 execute sp_AddCustomer
 'Sneha','kumari','sneha@gmail.com',8,8

 -- view customers using store procedure
Create procedure sp_ViewCustomer
As 
Begin try
	select * from Customer_table
End try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_ViewCustomer;

-- update books using store procedure
alter procedure sp_UpdateCustomer
(
	@fname varchar(50),
	@lname varchar(50),
	@email varchar,
	@book_id int,
	@address_id int
	
)
As 
Begin try
	update Customer_table set 
		fname=@fname, 
		lname=@lname,
		email=@email,
		book_id=@book_id
	where 
		address_id=@address_id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_UpdateCustomer
  'Lakshita','kumari','lakshita@gmail.com',5,5

-- delete customer using store procedure
create procedure sp_DeleteCustomer (@id int)
As 
Begin try
delete from Customer_table
where customer_id=@id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_DeleteCustomer 13

 -- Add Address using store procedure
 create procedure sp_AddAddress (
	@state_name varchar(250),
	@city varchar(250)
  )
 as
 begin try
 insert into Address_table(state_name,city) 
 values(@state_name,@city)
 end try
 begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

 execute sp_AddAddress
 'Assam','Dispur'
 
 alter procedure sp_OrderPlaced (
  @book_id int,
  @customer_id int,
  @order_PlacedDate datetime
 )
 as
 begin try
 insert into order_table (book_id,customer_id,order_placedDate,order_deliveredDate)
 values (@book_id,@customer_id,@order_PlacedDate,DATEADD(DAY,7,@order_PlacedDate))
 end try
 begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

execute  sp_OrderPlaced
4,4,'2022-04-08 00:00:00'

--Updating the price of books  using sp

alter procedure sp_updateBookPrice
As 
Begin try
  WHILE (select MIN(price) FROM Books_table) < 1000
  BEGIN
   UPDATE Books_table SET price=price+1000;
    PRINT 'Books price are updated'
	IF (select MIN(price) FROM Books_table) > 1000
	 PRINT 'Books price is greater than 1000';
	   BREAK;
	   END
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch
exec sp_updateBookPrice
 select * from Books_table
 select * from Customer_table;

  -- Customer Details using stored procedure
  create procedure sp_customerDetailsMailWise (@email_address as varchar(250))
  AS
  BEGIN try 
  select book_name ,quantity,fname,lname
  from   Books_table b inner join  Customer_table c
  ON  b.book_id = c.book_id 
  where c.email = @email_address
  end try
 begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
 end catch

 execute sp_customerDetailsMailWise
 @email_address='shweta@gmail.com'

 ---cursor---

 select *from Books_table;
 
DECLARE @book_id int  
DECLARE @book_name varchar(80)  
DECLARE @price int 
DECLARE @registered_date datetime
  
DECLARE bookDetails_CURSOR CURSOR  
FOR  SELECT   book_id,book_name,price,registered_date FROM Books_table
OPEN  bookDetails_CURSOR 
FETCH NEXT FROM bookDetails_CURSOR INTO  @book_id,@book_name,@price,@registered_date
WHILE @@FETCH_STATUS = 0  
BEGIN  
PRINT  'BOOK_ID: ' +CAST(@book_id AS varchar) +  '  BOOK_NAME:'+@book_name +'  BOOK_PRICE:'+CAST(@price AS varchar)  +  ' BOOK_registeredDate:' +CAST(@registered_date AS varchar)  
FETCH NEXT FROM bookDetails_CURSOR INTO  @book_id,@book_name,@price,@registered_date 
END  
CLOSE bookDetails_CURSOR  
DEALLOCATE bookDetails_CURSOR
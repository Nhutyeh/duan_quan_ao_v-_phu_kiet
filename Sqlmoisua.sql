--Create a database called ESHOP_DB
CREATE DATABASE ESHOP_DB
GO

--Use ESHOP_DB
USE ESHOP_DB
GO

-- Create Category Table
Create table Category
(
  Id int primary key identity,
  CatName nvarchar(50)
)
GO
CREATE TABLE ProductCategory (
    CatId INT PRIMARY KEY IDENTITY(1,1),   -- Mã loại sản phẩm (tự tăng)
    CatName NVARCHAR(100) NOT NULL,        -- Tên loại sản phẩm
    Description NVARCHAR(255),             -- Mô tả chi tiết
    ParentCatId INT NULL,                  -- Cho phép phân cấp (loại cha)
    IsActive BIT DEFAULT 1,                -- Trạng thái hoạt động (1: đang dùng, 0: ngừng)
    FOREIGN KEY (ParentCatId) REFERENCES ProductCategory(CatId)
);
GO


--Create Product Table
Create table Product
(
  ProId int Primary Key Identity(1,1),
  ProName nvarchar(50),
  ProImage nvarchar(100),
  ProPrice decimal(18,2),
  CatId int
)
GO

-- Create Order Table
Create table [Order]
(
  OrderId int primary key identity,
  OrderName nvarchar(50),
  OrderDate date,
  PaymentType nvarchar(50),
  Status nvarchar(50),
  CustomerName nvarchar(100),
  CustomerPhone nvarchar(15),
  CustomerEmail nvarchar(100),
  CustomerAddress nvarchar(250)
)
GO

-- Create OrderDetail Table
Create table OrderDetail
(
  OrderId int,
  ProductId int,
  Price float,
  Quantity int
  Primary key(OrderId, ProductId),
  Foreign key(OrderId) references [Order](OrderId),
  Foreign key(ProductId) references Product(ProId)
)
GO

-- Create User Table
Create table [User]
(
 UserId int primary key identity(1,1),
 UserName varchar(50),
 UserPassword varchar(255)
)
GO

-- Insert some test data into Category Table
Insert into Category values('ao')
Insert into Category values('quan')
Insert into Category values('giay')
Insert into Category values('non')
Insert into Category values('thaclung')
GO

-- Add Foreign Key into Product Table Reference to the Category Table
Alter table Product add foreign key (CatId) references Category(Id)
GO

-- Insert Some Test data into Product Table
Insert into Product values('Sed ut perspiciati','product1.jpg',50.00,1)
Insert into Product values('At vero eos','product2.jpg',70.00,1)
Insert into Product values('On the other','product3.jpg',70.00,1)
Insert into Product values('Sed ut perspiciati','product4.jpg',50.00,1)
Insert into Product values('At vero eos','product5.jpg',70.00,1)
Insert into Product values('On the other','product6.jpg',70.00,1)
Insert into Product values('Sed ut perspiciati','product7.jpg',70.00,1)
Insert into Product values('At vero eos','product8.jpg',70.00,1)
Insert into Product values('A-line Black Skirt','product9.jpg',130.00,1)
Insert into Product values('Sleeveless Solid Blue Top','product10.jpg',140.00,1)
Insert into Product values('Skinny Jeans','product11.jpg',150.00,1)
Insert into Product values('Black Basic Shorts','product12.jpg',120.00,1)
GO
INSERT INTO ProductCategory (CatName, Description) VALUES
(N'Điện thoại', N'Sản phẩm điện thoại di động'),
(N'Máy tính', N'Laptop và máy tính để bàn'),
(N'Phụ kiện', N'Tai nghe, chuột, bàn phím'),
(N'Thời trang', N'Quần áo, giày dép, phụ kiện'),
(N'Gia dụng', N'Đồ dùng trong gia đình');
GO

--Create Product_Category View
Create view Product_Category as
Select ProId, ProName, ProImage, ProPrice, CatId, CatName
From Product inner join Category on Product.CatId=Category.Id
GO
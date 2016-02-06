USE [MyPetShop]

CREATE TABLE [Category] (
	[CategoryId] int  identity PRIMARY KEY,
	[Name] varchar(80) NULL,
	[Descn] varchar(255) NULL
)


CREATE TABLE [Supplier] (
	[SuppId] int  identity PRIMARY KEY,
	[Name] varchar(80) NULL,
	[Addr1] varchar(80) NULL,
	[Addr2] varchar(80) NULL,
	[City] varchar(80) NULL,
	[State] varchar(80) NULL,
	[Zip] varchar(5) NULL,
	[Phone] varchar(40) NULL 
)

CREATE TABLE [Product] (
	[ProductId] int  identity PRIMARY KEY,
	[CategoryId] int NOT NULL REFERENCES [Category]([CategoryId]),
	[ListPrice] decimal(10, 2) NULL,
        [UnitCost] decimal(10, 2) NULL,
	[SuppId] int NULL REFERENCES [Supplier]([SuppId]),
	[Name] varchar(80) NULL,
        [Descn] varchar(255) NULL,
	[Image] varchar(80) NULL,
        [Qty] int NOT NULL
)


CREATE TABLE [Order] (
	[OrderId] int  identity PRIMARY KEY,
	[UserName] varchar(80) NOT NULL,
	[OrderDate] datetime NOT NULL,
	[Addr1] varchar(80) NULL,
	[Addr2] varchar(80) NULL,
	[City] varchar(80) NULL,
	[State] varchar(80) NULL,
	[Zip] varchar(5) NULL,
	[Phone] varchar(40) NULL,
	[Status] varchar(10) NULL,
)
CREATE TABLE [OrderItem](
        ItemId int  identity  PRIMARY KEY,
        OrderId int NOT NULL REFERENCES [Order]([OrderId]),
        ProName varchar(80),
        ListPrice  decimal(10, 2) NULL,
        Qty int NOT NULL,
        TotalPrice decimal(10, 2) NULL,

)

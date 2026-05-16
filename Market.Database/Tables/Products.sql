create table Products
(
    Id          int primary key identity (1,1),
    CategoryId  int           not null references Categories (Id),
    ProductCode varchar(10)   not null unique,
    ProductName nvarchar(100) not null,
    Description nvarchar(500) null,
    Price       money         not null check (Price > 0),
    IsActive    bit           not null default 1,
    CreateDate  datetime      not null default getdate(),
    UpdateDate  datetime      null
);
create table Suppliers
(
    Id           int primary key identity (1, 1),
    SupplierName nvarchar(100) not null,
    Phone        nvarchar(50)  null,
    Email        nvarchar(100) null,
    Address      nvarchar(200) null,
    IsActive     bit           not null default 1,
    CreateDate   datetime      not null default getdate(),
    UpdateDate   datetime      null
);
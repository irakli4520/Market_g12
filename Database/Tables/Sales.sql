create table Sales
(
    Id         int primary key identity (1, 1),
    EmployeeId int            not null references Employees (Id),
    CustomerId int            not null references Customers (Id),
    Comment    nvarchar(1000) null,
    SaleDate   datetime       not null,
    SaleStatus tinyint        not null default 0 check (SaleStatus in (0, 1, 2)), -- 0: Pending, 1: Completed, 2: Cancelled
    CreateDate datetime       not null default getdate(),
    UpdateDate datetime       null
);
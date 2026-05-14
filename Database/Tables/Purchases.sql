create table Purchases
(
    Id             int primary key identity (1,1),
    SupplierId     int            not null references Suppliers (Id),
    Comment        nvarchar(1000) null,
    PurchaseDate   datetime       not null,
    PurchaseStatus tinyint        not null default 0 check (PurchaseStatus in (0, 1, 2)), -- 0: Pending, 1: Completed, 2: Cancelled
    CreateDate     datetime       not null default getdate(),
    UpdateDate     datetime       null
);
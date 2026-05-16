create table Discounts
(
    Id              int primary key identity (1,1),
    ProductId       int      not null references Products (Id),
    DiscountPercent money    not null check (DiscountPercent > 0),
    StartDate       datetime not null,
    EndDate         datetime null,
    IsActive        bit      not null default 1,
    CreateDate      datetime not null default getdate(),
    UpdateDate      datetime null
);
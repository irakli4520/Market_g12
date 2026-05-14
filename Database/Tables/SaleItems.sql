create table SaleItems
(
    SaleId     int      not null references Sales (Id),
    ProductId  int      not null references Products (Id),
    Quantity   int      not null,
    UnitPrice  money    not null,
    CreateDate datetime not null default getdate(),
    primary key (SaleId, ProductId)
);
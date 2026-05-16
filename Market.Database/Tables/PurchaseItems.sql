create table PurchaseItems
(
    PurchaseId int      not null references Purchases (Id),
    ProductId  int      not null references Products (Id),
    Quantity   int      not null,
    UnitPrice  money    not null,
    CreateDate datetime not null default getdate(),
    primary key (PurchaseId, ProductId)
);
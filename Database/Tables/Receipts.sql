create table Receipts
(
    SaleId        int primary key references Sales (Id),
    ReceiptNumber varchar(50) not null unique,
    PrintDate     datetime    not null,
    CreateDate    datetime    not null default getdate(),
);
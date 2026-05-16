create table ProductSuppliers
(
    ProductId  int not null references Products (Id),
    SupplierId int not null references Suppliers (Id),
    primary key (ProductId, SupplierId)
);
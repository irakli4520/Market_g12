create table ProductAttributes
(
    Id                  int primary key identity (1,1),
    CategoryAttributeId int            not null references CategoryAttributes (Id),
    ProductId           int            not null references Products (Id),
    StringValue         nvarchar(50)   null,
    NumericValue        decimal(18, 2) null,
    BooleanValue        bit            null,
    DateValue           datetime       null,
    IsActive            bit            not null default 1,
    CreateDate          datetime       not null default getdate(),
    UpdateDate          datetime       null,
    unique (ProductId, CategoryAttributeId)
);
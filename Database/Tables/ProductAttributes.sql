create table ProductAttributes
(
    CategoryAttributeId int            not null references CategoryAttributes (Id),
    ProductId           int            not null references Products (Id),
    StringValue         nvarchar(50)   null,
    NumericValue        decimal(18, 2) null,
    BooleanValue        bit            null,
    DateValue           datetime       null,
    CreateDate          datetime       not null default getdate(),
    UpdateDate          datetime       null,
    primary key (ProductId, CategoryAttributeId)
);
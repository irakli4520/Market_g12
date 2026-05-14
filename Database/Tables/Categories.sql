create table Categories
(
    Id           int primary key identity (1,1),
    ParentId     int           null references Categories (Id) check (ParentId is null or ParentId != Id),
    CategoryName nvarchar(100) not null unique check (len(CategoryName) > 2),
    Description  nvarchar(500) null,
    IsActive     bit           not null default 1,
    CreateDate   datetime      not null default getdate(),
    UpdateDate   datetime      null
);
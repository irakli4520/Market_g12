create table Customers
(
    Id             int primary key identity (1, 1),
    FirstName      nvarchar(50) not null check (len(FirstName) > 2),
    LastName       nvarchar(50) not null check (len(LastName) > 2),
    IdCard         nvarchar(15) not null unique check (len(IdCard) > 7),
    Gender         char(1)      not null check (Gender in ('F', 'M')),
    LoyaltyPoints  int          not null default 0 check (LoyaltyPoints >= 0),
    CustomerStatus tinyint      not null default 0 check (CustomerStatus in (0, 1, 2, 3)), -- 0 - none, 1 - bronze, 2 - silver, 3 - gold
    IsActive       bit          not null default 1,
    CreateDate     datetime     not null default getdate(),
    UpdateDate     datetime     null
);
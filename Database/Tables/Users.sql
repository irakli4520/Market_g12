create table Users
(
    Id           int primary key identity (1, 1),
    EmployeeId   int            not null references Employees (Id),
    Username     varchar(50)    not null unique check (len(Username) > 5),
    PasswordHash varbinary(255) not null,
    Email        nvarchar(100)  not null unique check (len(Email) > 5),
    IsEnabled    bit            not null default 1,
    IsActive     bit            not null default 1,
    CreateDate   datetime       not null default getdate(),
    UpdateDate   datetime       null
);
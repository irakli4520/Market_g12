create table Employees
(
    Id             int primary key identity (1, 1),
    FirstName      nvarchar(20) not null check (len(FirstName) > 2),
    LastName       nvarchar(20) not null check (len(LastName) > 2),
    IdCard         nvarchar(15) not null unique check (len(IdCard) > 7),
    EmployeeRoleId int          not null references EmployeeRoles (Id),
    BirthDate      datetime     not null check (BirthDate < getdate()),
    HireDate       datetime     not null,
    LeaveDate      datetime     null,
    Address        nvarchar(60) not null,
    Phone          nvarchar(24) not null unique,
    IsActive       bit          not null default 1,
    CreateDate     datetime     not null default getdate(),
    UpdateDate     datetime     null,
    constraint CK_Employees_LeaveDate check (LeaveDate is null or LeaveDate > HireDate)
);
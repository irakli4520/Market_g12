create table EmployeeRoles
(
    Id         int          not null primary key identity (1, 1),
    RoleName   nvarchar(50) not null unique,
    IsActive   bit          not null default 1,
    CreateDate datetime     not null default getdate(),
    UpdateDate datetime     null
);
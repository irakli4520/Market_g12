create procedure sp_EmployeeInsert
    @FirstName nvarchar(20),
    @LastName nvarchar(20),
    @IdCard nvarchar(15),
    @EmployeeRoleId int,
    @BirthDate datetime,
    @HireDate datetime,
    @Address nvarchar(60),
    @Phone nvarchar(24),
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from EmployeeRoles where Id = @EmployeeRoleId and IsActive = 1)
        begin
            raiserror('EmployeeRole not found or already inactive.', 16, 1);
            return 1;
        end

    insert into Employees (FirstName, LastName, IdCard, EmployeeRoleId, BirthDate, HireDate, Address, Phone)
    values (@FirstName, @LastName, @IdCard, @EmployeeRoleId, @BirthDate, @HireDate, @Address, @Phone);

    set @Id = scope_identity();

    return 0;
end
create procedure sp_EmployeeUpdate
    @Id int,
    @FirstName nvarchar(20),
    @LastName nvarchar(20),
    @EmployeeRoleId int,
    @LeaveDate datetime,
    @Address nvarchar(60),
    @Phone nvarchar(24)
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @Id and IsActive = 1)
        begin
            raiserror ('Employee not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from EmployeeRoles where Id = @EmployeeRoleId and IsActive = 1)
        begin
            raiserror ('EmployeeRole not found or already inactive.', 16, 1);
            return 1;
        end

    update Employees
    set FirstName      = @FirstName,
        LastName       = @LastName,
        EmployeeRoleId = @EmployeeRoleId,
        LeaveDate      = @LeaveDate,
        Address        = @Address,
        Phone          = @Phone,
        UpdateDate     = getdate()
    where Id = @Id
      and (
        FirstName != @FirstName or
        LastName != @LastName or
        EmployeeRoleId != @EmployeeRoleId or
        LeaveDate != @LeaveDate or
        (LeaveDate is null and @LeaveDate is not null) or
        (LeaveDate is not null and @LeaveDate is null) or
        Address != @Address or
        Phone != @Phone
        );

    return 0;
end
create procedure sp_EmployeeDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @Id and IsActive = 1)
        begin
            raiserror ('Employee not found or already inactive.', 16, 1);
            return 1;
        end

    if exists (select 1 from Users where EmployeeId = @Id and IsActive = 1)
        begin
            raiserror ('Cannot delete employee with an active user account', 16, 2);
            return 2;
        end

    if exists (select 1 from Sales where EmployeeId = @Id and SaleStatus = 0)
        begin
            raiserror ('Cannot delete employee with pending sales', 16, 2);
            return 2;
        end

    update Employees
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
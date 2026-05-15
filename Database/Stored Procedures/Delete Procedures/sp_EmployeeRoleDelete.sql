create procedure sp_EmployeeRoleDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from EmployeeRoles where Id = @Id and IsActive = 1)
        begin
            raiserror('EmployeeRole does not exists or is inactive', 16, 1);
            return 1;
        end

    if exists (select 1 from Employees where EmployeeRoleId = @Id and IsActive = 1)
        begin
            raiserror('Cannot delete role with active employees', 16, 2);
            return 2;
        end

    update EmployeeRoles
    set IsActive = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
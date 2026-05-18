create procedure sp_EmployeeRoleGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from EmployeeRoles where Id = @Id and IsActive = 1)
        begin
            raiserror('EmployeeRole with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from EmployeeRoles
    where Id = @Id;

    return 0;
end
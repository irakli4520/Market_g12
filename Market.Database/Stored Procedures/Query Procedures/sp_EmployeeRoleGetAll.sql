create procedure sp_EmployeeRoleGetAll
as
begin
    set nocount on;

    select *
    from EmployeeRoles
    where IsActive = 1;

    return 0;
end
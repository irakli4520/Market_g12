create procedure sp_EmployeeGetAll
as
begin
    set nocount on;

    select *
    from Employees
    where IsActive = 1;

    return 0;
end
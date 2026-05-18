create procedure sp_EmployeeGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @Id and IsActive = 1)
        begin
            raiserror('Employee with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from Employees
    where Id = @Id;

    return 0;
end
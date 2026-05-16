create procedure sp_EmployeeRoleInsert
    @RoleName nvarchar(20),
    @Id int output
as
begin
    set nocount on;

    insert into EmployeeRoles (RoleName)
    values (@RoleName);

    set @Id = scope_identity();

    return 0;
end
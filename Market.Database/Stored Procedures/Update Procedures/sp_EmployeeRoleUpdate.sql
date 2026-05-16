create procedure sp_EmployeeRoleUpdate
    @Id int,
    @RoleName nvarchar(50)
as
begin
    set nocount on;

    if not exists (select 1 from EmployeeRoles where Id = @Id and IsActive = 1)
        begin
            raiserror ('EmployRole not found or already inactive.', 16, 1);
            return 1;
        end

    update EmployeeRoles
    set RoleName    = @RoleName,
        UpdateDate  = getdate()
    where Id = @Id
      and (
        RoleName != @RoleName
        );

    return 0;
end
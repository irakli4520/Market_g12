create procedure sp_UpdateUser
    @Id int,
    @EmployeeId int,
    @Username nvarchar(100),
    @PasswordHash varbinary(255),
    @Email nvarchar(100),
    @IsEnabled bit = 1
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @EmployeeId and IsActive = 1)
        begin
            raiserror ('Employee not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Users where Id = @Id and IsActive = 1)
        begin
            raiserror ('User not found or already inactive.', 16, 1);
            return 1;
        end

    update Users
    set EmployeeId   = @EmployeeId,
        Username     = @Username,
        PasswordHash = @PasswordHash,
        Email        = @Email,
        IsEnabled    = @IsEnabled,
        UpdateDate   = getdate()
    where Id = @Id
      and (
        EmployeeId != @EmployeeId or
        Username != @Username or
        PasswordHash != @PasswordHash or
        Email != @Email or
        IsEnabled != @IsEnabled
        );

    return 0;
end
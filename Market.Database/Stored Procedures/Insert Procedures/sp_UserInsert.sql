create procedure sp_UserInsert
    @EmployeeId int,
    @Username nvarchar(100),
    @PasswordHash varbinary(255),
    @Email nvarchar(100),
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @EmployeeId and IsActive = 1)
        begin
            raiserror ('Employee not found or already inactive.', 16, 1);
            return 1;
        end

    insert into Users (EmployeeId, Username, PasswordHash, Email)
    values (@EmployeeId, @Username, @PasswordHash, @Email);

    set @Id = scope_identity();

    return 0;
end
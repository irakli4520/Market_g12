create procedure sp_UserGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Users where Id = @Id and IsActive = 1)
        begin
            raiserror('User with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from Users
    where Id = @Id;

    return 0;
end
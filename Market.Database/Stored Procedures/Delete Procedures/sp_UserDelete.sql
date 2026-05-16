create procedure sp_DeleteUser
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Users where Id = @Id and IsActive = 1)
        begin
            raiserror ('User not found or already inactive.', 16, 1);
            return 1;
        end

    update Users
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
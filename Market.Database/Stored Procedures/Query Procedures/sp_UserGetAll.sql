create procedure sp_UserGetAll
as
begin
    set nocount on;

    select *
    from Users
    where IsActive = 1;

    return 0;
end
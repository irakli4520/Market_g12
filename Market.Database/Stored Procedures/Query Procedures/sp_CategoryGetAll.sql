create procedure sp_CategoryGetAll
as
begin
    set nocount on;

    select *
    from Categories
    where IsActive = 1;

    return 0;
end
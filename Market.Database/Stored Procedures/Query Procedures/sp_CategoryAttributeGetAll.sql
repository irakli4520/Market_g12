create procedure sp_CategoryAttributeGetAll
as
begin
    set nocount on;

    select *
    from CategoryAttributes
    where IsActive = 1;

    return 0;
end
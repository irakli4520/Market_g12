create procedure sp_CustomerGetAll
as
begin
    set nocount on;

    select *
    from Customers
    where IsActive = 1;

    return 0;
end
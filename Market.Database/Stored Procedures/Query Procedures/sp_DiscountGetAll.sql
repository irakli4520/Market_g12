create procedure sp_DiscountGetAll
as
begin
    set nocount on;

    select *
    from Discounts
    where IsActive = 1;

    return 0;
end
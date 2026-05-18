create procedure sp_DiscountGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Discounts where Id = @Id and IsActive = 1)
        begin
            raiserror('Discount with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from Discounts
    where Id = @Id;

    return 0;
end
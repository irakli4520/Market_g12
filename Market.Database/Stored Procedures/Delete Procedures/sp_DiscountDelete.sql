create procedure sp_DiscountDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Discounts where Id = @Id and IsActive = 1)
        begin
            raiserror('Discount not found or already inactive.', 16, 1);
            return 1;
        end

    update Discounts
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
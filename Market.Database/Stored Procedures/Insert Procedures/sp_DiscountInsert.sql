create procedure sp_DiscountInsert
    @ProductId       int,
    @DiscountPercent money,
    @StartDate       datetime,
    @EndDate         datetime = null,
    @Id				 int output
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror('Product does not exists or is inactive', 16, 1);
            return 1;
        end

    if exists (select 1 from Discounts where ProductId = @ProductId and IsActive = 1)
        begin
            raiserror('Product already has an active discount', 16, 2);
            return 2;
        end

    insert into Discounts (ProductId,DiscountPercent,StartDate,EndDate)
    values (@ProductId,@DiscountPercent,@StartDate,@EndDate);

    set @Id = scope_identity();

    return 0;
end
create procedure sp_DiscountUpdate
    @Id int,
    @ProductId int,
    @DiscountPercent money,
    @StartDate datetime,
    @EndDate datetime
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror ('Product does not exists or is inactive', 16, 10);
            return 10;
        end

    if not exists (select 1 from Discounts where Id = @Id and IsActive = 1)
        begin
            raiserror ('Discount not found.', 16, 13);
            return 13;
        end

    update Discounts
    set ProductId       = @ProductId,
        DiscountPercent = @DiscountPercent,
        StartDate       = @StartDate,
        EndDate         = @EndDate,
        UpdateDate      = getdate()
    where Id = @Id
      and (
        ProductId != @ProductId or
        DiscountPercent != @DiscountPercent or
        StartDate = @StartDate or
        EndDate != @EndDate or
        (EndDate is null and @EndDate is not null) or
        (EndDate is not null and @EndDate is null)
        );

    return 0;
end
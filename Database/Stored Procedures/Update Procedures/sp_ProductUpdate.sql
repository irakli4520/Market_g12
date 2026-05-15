create procedure sp_ProductUpdate
    @Id int,
    @CategoryId int,
    @ProductCode varchar(10),
    @ProductName nvarchar(100),
    @Description nvarchar(500),
    @Price money
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @Id and IsActive = 1)
        begin
            raiserror ('Product not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Categories where Id = @CategoryId and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    update Products
    set CategoryId  = @CategoryId,
        ProductCode = @ProductCode,
        ProductName = @ProductName,
        Description = @Description,
        Price       = @Price,
        UpdateDate  = getdate()
    where Id = @Id
      and (
        CategoryId != @CategoryId or
        ProductCode != @ProductCode or
        ProductName != @ProductName or
        Description != @Description or
        (Description is null and @Description is not null) or
        (Description is not null and @Description is null) or
        Price != @Price
        );

    return 0;
end
create procedure sp_SaleItemAssign
    @SaleId int,
    @ProductId int,
    @Quantity int,
    @UnitPrice money
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror ('Product not found or inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Sales where Id = @SaleId and SaleStatus = 1)
        begin
            raiserror('Sale does not exist or is not completed', 16, 1);
            return 1;
        end

    if exists (select 1 from SaleItems where SaleId = @SaleId and ProductId = @ProductId)
        begin
            raiserror ('Product is already assigned to this sale.', 16, 4);
            return 4;
        end

    insert into SaleItems (SaleId, ProductId, Quantity, UnitPrice)
    values (@SaleId, @ProductId, @Quantity, @UnitPrice);

    return 0;
end
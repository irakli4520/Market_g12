create procedure sp_PurchaseItemAssign
    @ProductId int,
    @PurchaseId int,
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

    if not exists (select 1 from Purchases where Id = @PurchaseId)
        begin
            raiserror ('Purchase not found.', 16, 1);
            return 1;
        end

    if exists (select 1 from PurchaseItems where ProductId = @ProductId and PurchaseId = @PurchaseId)
        begin
            raiserror ('Purchase is already assigned to this item.', 16, 4);
            return 4;
        end

    insert into PurchaseItems (PurchaseId, ProductId , Quantity, UnitPrice)
    values (@PurchaseId, @ProductId , @Quantity, @UnitPrice);

    return 0;
end
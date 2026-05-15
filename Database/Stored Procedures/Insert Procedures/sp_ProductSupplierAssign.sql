create procedure sp_ProductSupplierAssign
    @ProductId int,
    @SupplierId int
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror ('Product not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Suppliers where Id = @SupplierId and IsActive = 1)
        begin
            raiserror ('Supplier not found or already inactive.', 16, 1);
            return 1;
        end

    if exists (select 1 from ProductSuppliers where ProductId = @ProductId and SupplierId = @SupplierId)
        begin
            raiserror ('Product is already assigned to this supplier.', 16, 4);
            return 4;
        end

    insert into ProductSuppliers (ProductId, SupplierId)
    values (@ProductId, @SupplierId);

    return 0;
end
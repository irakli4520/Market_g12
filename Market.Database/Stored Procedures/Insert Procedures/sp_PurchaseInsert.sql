create procedure sp_PurchaseInsert
    @SupplierId int,
    @Comment nvarchar(1000) = null,
    @PurchaseDate datetime,
    @PurchaseStatus tinyint = 0,
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Suppliers where Id = @SupplierId and IsActive = 1)
        begin
            raiserror ('Supplier not found or already inactive.', 16, 1);
            return 1;
        end

    insert into Purchases (SupplierId, Comment, PurchaseDate, PurchaseStatus)
    values (@SupplierId, @Comment, @PurchaseDate, @PurchaseStatus);

    set @Id = scope_identity();

    return 0;
end
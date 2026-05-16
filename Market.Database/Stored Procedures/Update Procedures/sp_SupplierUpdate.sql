create procedure sp_SupplierUpdate
    @Id int,
    @SupplierName nvarchar(100),
    @Phone nvarchar(50),
    @Email nvarchar(100),
    @Address nvarchar(200)
as
begin
    set nocount on;

    if not exists (select 1 from Suppliers where Id = @Id and IsActive = 1)
        begin
            raiserror ('Supplier not found or inactive.', 16, 26);
            return 26;
        end

    update Suppliers
    set SupplierName = @SupplierName,
        Phone        = @Phone,
        Email        = @Email,
        Address      = @Address,
        UpdateDate   = getdate()
    where Id = @Id
      and (
        SupplierName != @SupplierName or
        Phone != @Phone or
        (Phone is null and @Phone is not null) or
        (Phone is null and @Phone is not null) or
        Email != @Email or
        (Email is null and @Email is not null) or
        (Email is null and @Email is not null) or
        Address != @Address or
        (Address is null and @Address is not null) or
        (Address is null and @Address is not null)
        );

    return 0;
end
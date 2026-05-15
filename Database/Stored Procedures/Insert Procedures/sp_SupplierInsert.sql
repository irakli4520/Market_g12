create procedure sp_SupplierInsert
    @SupplierName nvarchar(100),
    @Phone nvarchar(50) = null,
    @Email nvarchar(100) = null,
    @Address nvarchar(200) = null,
    @Id int output
as
begin
    set nocount on;

    insert into Suppliers (SupplierName, Phone, Email, Address)
    values (@SupplierName, @Phone, @Email, @Address);

    set @Id = scope_identity();

    return 0;
end

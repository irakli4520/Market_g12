create procedure sp_SupplierDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Suppliers where Id = @Id and IsActive = 1)
        begin
            raiserror ('Supplier not found or already inactive.', 16, 1);
            return 1;
        end

    update Suppliers
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
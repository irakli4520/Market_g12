create procedure sp_ReceiptGetById
    @SaleId int
as
begin
    set nocount on;

    if not exists (select 1 from Receipts where SaleId = @SaleId)
        begin
            raiserror('Sale with Id %d does not exist or is inactive.', 16, 1, @SaleId);
            return 1;
        end

    select *
    from Receipts
    where SaleId = @SaleId;

    return 0;
end
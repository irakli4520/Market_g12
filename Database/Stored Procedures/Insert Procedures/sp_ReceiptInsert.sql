create procedure sp_ReceiptInsert
    @SaleId int,
    @ReceiptNumber varchar(50),
    @PrintDate datetime
as
begin
    set nocount on;

    if not exists (select 1 from Sales where Id = @SaleId and SaleStatus = 1)
        begin
            raiserror('Sale does not exist or is not completed', 16, 1);
            return 1;
        end

    insert into Receipts (SaleId, ReceiptNumber, PrintDate)
    values (@SaleId, @ReceiptNumber, @PrintDate);

    return 0;
end
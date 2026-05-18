create procedure sp_ReceiptGetAll
as
begin
    set nocount on;

    select *
    from Receipts;

    return 0;
end
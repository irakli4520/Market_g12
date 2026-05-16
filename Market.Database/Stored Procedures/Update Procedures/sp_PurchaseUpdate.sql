create procedure sp_PurchaseUpdate
    @Id int,
    @PurchaseStatus tinyint
as
begin
    set nocount on;

    if not exists (select 1 from Purchases where Id = @Id)
        begin
            raiserror ('Purchase not found', 16, 1);
            return 1;
        end

    update Purchases
    set PurchaseStatus = @PurchaseStatus,
        UpdateDate     = getdate()
    where Id = @Id
      and (
        PurchaseStatus != @PurchaseStatus
        );
    return 0
end
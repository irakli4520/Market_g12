create procedure sp_SaleUpdate
    @Id int,
    @Comment nvarchar(1000),
    @SaleStatus tinyint
as
begin
    set nocount on;

    if not exists (select 1 from Sales where Id = @Id)
        begin
            raiserror ('Sale not found', 16, 1);
            return 11;
        end

    update Sales
    set Comment    = @Comment,
        SaleStatus = @SaleStatus,
        UpdateDate = getdate()
    where Id = @Id
      and (
        Comment != @Comment or
        (Comment is null and @Comment is not null) or
        (Comment is not null and @Comment is null) or
        SaleStatus != @SaleStatus
        );
    return 0
end
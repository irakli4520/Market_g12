create procedure sp_ProductDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @Id and IsActive = 1)
        begin
            raiserror ('Product not found or already inactive..', 16, 1);
            return 1;
        end

    update Products
    set IsActive    = 0,
        UpdateDate  = getdate()
    where Id = @Id;

    return 0;
end
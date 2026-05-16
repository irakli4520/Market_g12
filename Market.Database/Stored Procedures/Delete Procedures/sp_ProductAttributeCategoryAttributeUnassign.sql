create procedure sp_ProductAttributeCategoryAttributeUnassign
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from ProductAttributes where Id = @Id and IsActive = 1)
        begin
            raiserror ('ProductAttribute not found or already inactive.', 16, 1);
            return 5;
        end

    if not exists (select 1 
                   from Products p
                   inner join ProductAttributes pa on p.Id = pa.ProductId
                   where pa.Id = @Id and p.IsActive = 1)
        begin
            raiserror ('Product not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 
                   from CategoryAttributes ca 
                   inner join ProductAttributes pa on ca.Id = pa.CategoryAttributeId
                   where pa.Id = @Id and ca.IsActive = 1)
        begin
            raiserror ('CategoryAttribute not found or already inactive.', 16, 1);
            return 1;
        end

    update ProductAttributes
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
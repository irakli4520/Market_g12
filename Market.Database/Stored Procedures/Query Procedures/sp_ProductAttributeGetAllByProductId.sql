create procedure sp_ProductAttributeGetAllByCategoryId
    @ProductId int
as
begin
    set nocount on;

    if not exists(select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror('Product with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end
    
    select *
    from ProductAttributes
    where ProductId = @ProductId and IsActive = 1;

    return 0;
end
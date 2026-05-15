create procedure sp_ProductAttributeCategoryAttributeAssignNumericValue
    @CategoryAttributeId int,
    @ProductId int,
    @DateValue datetime,
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @ProductId and IsActive = 1)
        begin
            raiserror ('Product not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from CategoryAttributes where Id = @CategoryAttributeId and IsActive = 1)
        begin
            raiserror ('CategoryAttribute not found or already inactive.', 16, 1);
            return 1;
        end

    if exists (select 1
               from ProductAttributes
               where ProductId = @ProductId and CategoryAttributeId = @CategoryAttributeId and IsActive = 1)
        begin
            raiserror ('ProductAttribute is already assigned to this CategoryAttribute.', 16, 4);
            return 4;
        end

    if not exists (select 1 from CategoryAttributes where Id = @CategoryAttributeId and AttributeType = 4)
        begin
            raiserror ('CategoryAttribute is not of date type.', 16, 6);
            return 6;
        end

    insert into ProductAttributes (CategoryAttributeId, ProductId, DateValue)
    values (@CategoryAttributeId, @ProductId, @DateValue);

    set @Id = scope_identity();

    return 0;
end
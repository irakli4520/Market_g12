create procedure sp_ProductAttributeCategoryAttributeAssignStringValue
    @CategoryAttributeId int,
    @ProductId int,
    @StringValue nvarchar(50),
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

    if not exists (select 1 from CategoryAttributes where Id = @CategoryAttributeId and AttributeType = 1)
        begin
            raiserror ('CategoryAttribute is not of string type.', 16, 6);
            return 6;
        end

    insert into ProductAttributes (CategoryAttributeId, ProductId, StringValue)
    values (@CategoryAttributeId, @ProductId, @StringValue);

    set @Id = scope_identity();

    return 0;
end
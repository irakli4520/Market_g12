create procedure sp_UpdateCategoryAttribute
    @Id int,
    @CategoryId int,
    @AttributeName nvarchar(50),
    @AttributeType tinyint,
    @OrderPosition int = 0
as
begin
    set nocount on;

    if not exists (select 1 from CategoryAttributes where Id = @Id and IsActive = 1)
        begin
            raiserror ('CategoryAttribute not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Categories where Id = @CategoryId and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    update CategoryAttributes
    set CategoryId    = @CategoryId,
        AttributeName = @AttributeName,
        AttributeType = @AttributeType,
        OrderPosition = @OrderPosition,
        UpdateDate    = getdate()
    where Id = @Id
      and (
        CategoryId != @CategoryId or
        AttributeName != @AttributeName or
        AttributeType != @AttributeType or
        OrderPosition != @OrderPosition
        );

    return 0;
end
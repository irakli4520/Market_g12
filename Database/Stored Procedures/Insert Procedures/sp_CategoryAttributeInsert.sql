create procedure sp_CategoryAttributeInsert
    @CategoryId int,
    @AttributeName nvarchar(50),
    @AttributeType tinyint,
    @OrderPosition int = 0,
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Categories where Id = @CategoryId and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    insert into CategoryAttributes (CategoryId, AttributeName, AttributeType, OrderPosition)
    values (@CategoryId, @AttributeName, @AttributeType, @OrderPosition);

    set @Id = scope_identity();
    return 0;
end

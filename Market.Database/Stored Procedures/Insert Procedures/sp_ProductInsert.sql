create procedure sp_ProductInsert
    @CategoryId int,
    @ProductCode varchar(10),
    @ProductName nvarchar(100),
    @Description nvarchar(500),
    @Price money,
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Categories where Id = @CategoryId and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    insert into Products (CategoryId, ProductCode, ProductName, Description, Price)
    Values (@CategoryId, @ProductCode, @ProductName, @Description, @Price);

    set @Id = scope_identity();

    return 0;
end

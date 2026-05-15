create procedure sp_CategoryInsert
    @ParentId int = null,
    @CategoryName nvarchar(100),
    @Description nvarchar(500) = null,
    @Id int output
as
begin
    set nocount on;

    insert into Categories (ParentId, CategoryName, Description)
    values (@ParentId, @CategoryName, @Description);

    set @Id = scope_identity();

    return 0;
end
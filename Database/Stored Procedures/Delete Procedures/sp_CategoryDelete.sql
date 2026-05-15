create procedure sp_CategoryDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Categories where Id = @Id and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    if exists (select 1 from Products where CategoryId = @Id and IsActive = 1)
        begin
            raiserror ('Cant delete category with active products', 16, 2);
            return 2;
        end

    update Categories
    set IsActive   = 0,
        UpdateDate = getdate()
    where Id = @Id;

    return 0;
end
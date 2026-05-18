create procedure sp_ProductGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Products where Id = @Id and IsActive = 1)
        begin
            raiserror('Product with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from Products
    where Id = @Id;

    return 0;
end
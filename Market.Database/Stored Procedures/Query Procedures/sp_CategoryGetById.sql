create procedure sp_CategoryGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Categories where Id = @Id and IsActive = 1)
        begin
            raiserror('Category with Id %d does not exist or is inactive.', 16, 1, @Id);
            return 1;
        end

    select *
    from Categories
    where Id = @Id;

    return 0;
end
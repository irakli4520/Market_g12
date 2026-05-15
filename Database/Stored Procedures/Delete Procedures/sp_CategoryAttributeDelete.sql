create procedure sp_CategoryAttributeDelete
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from CategoryAttributes where Id = @Id and IsActive = 1)
        begin
            raiserror ('CategoryAttribute not found or already inactive.', 16, 1);
            return 1;
        end

    if exists (select 1 from ProductAttributes where CategoryAttributeId = @Id)
        begin
            raiserror ('Cannot delete CategoryAttribute with active ProductAttributes', 16, 2);
            return 2;
        end

    update CategoryAttributes
    set IsActive    = 0,
        UpdateDate  = getdate()
    where Id = @Id;

    return 0;
end
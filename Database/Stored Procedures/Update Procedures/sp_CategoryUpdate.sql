create procedure sp_CategoryUpdate
    @Id int,
    @ParentId int,
    @CategoryName nvarchar(100),
    @Description nvarchar(500)
as
begin
    set nocount on;

    if not exists (select 1 from Categories where Id = @Id and IsActive = 1)
        begin
            raiserror ('Category not found or already inactive.', 16, 1);
            return 1;
        end

    if dbo.fn_DetectCircularReference(@ParentID, @ID) = 1
        begin
            raiserror ('Updating ParentID to %d would create a circular reference.', 16, 3, @ParentID);
            return 3; -- Return a non-zero value to indicate an error.
        end

    update Categories
    set ParentId     = @ParentId,
        CategoryName = @CategoryName,
        Description  = @Description,
        UpdateDate   = getdate()
    where Id = @Id
      and (
        ParentId != @ParentId or
        (ParentId is null and @ParentId is not null) or
        (ParentId is not null and @ParentId is null) or
        CategoryName != @CategoryName or
        Description != @Description or
        (Description is null and @Description is not null) or
        (Description is not null and @Description is null)
        );

    return 0;
end
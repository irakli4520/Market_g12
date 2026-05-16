create function fn_DetectCircularReference(
    @ParentID int,
    @CurrentID int
)
    returns bit
as
begin
    if @ParentID is null or @CurrentID is null
        return 0;

    declare @NextParentID int = @ParentID;
    declare @PreviousID int;

    declare @Visited table
                     (
                         ID int not null primary key
                     );

    while @NextParentID is not null
        begin
            -- Direct or indirect circular reference detected
            if @NextParentID = @CurrentID
                return 1;

            -- Existing broken circular hierarchy detected
            if exists
                (select 1
                 from @Visited
                 where ID = @NextParentID)
                return 1;

            insert into @Visited (ID)
            values (@NextParentID);

            set @PreviousID = @NextParentID;
            set @NextParentID = null;

            select @NextParentID = c.ParentID
            from dbo.Categories c
            where c.ID = @PreviousID;
        end;

    return 0;
end;
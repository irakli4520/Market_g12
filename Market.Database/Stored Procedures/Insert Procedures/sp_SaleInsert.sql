create procedure sp_SaleInsert
    @EmployeeId int,
    @CustomerId int,
    @Comment nvarchar(1000) = null,
    @SaleDate datetime,
    @SaleStatus tinyint = 0,
    @Id int output
as
begin
    set nocount on;

    if not exists (select 1 from Employees where Id = @EmployeeId and IsActive = 1)
        begin
            raiserror ('Employee not found or already inactive.', 16, 1);
            return 1;
        end

    if not exists (select 1 from Customers where Id = @CustomerId and IsActive = 1)
        begin
            raiserror ('Customer not found or already inactive.', 16, 1);
            return 1;
        end

    insert into Sales (EmployeeId, CustomerId, Comment, SaleDate, SaleStatus)
    values (@EmployeeId, @CustomerId, @Comment, @SaleDate, @SaleStatus);

    set @Id = scope_identity();

    return 0;
end

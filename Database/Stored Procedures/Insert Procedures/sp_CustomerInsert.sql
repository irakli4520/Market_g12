create procedure sp_CustomerInsert
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @IdCard nvarchar(15),
    @Gender char,
    @LoyaltyPoints int = 0,
    @CustomerStatus int = 0,
    @Id int output
as
begin
    set nocount on;

    insert into Customers (FirstName, LastName, IdCard, Gender, LoyaltyPoints, CustomerStatus)
    values (@FirstName, @LastName, @IdCard, @Gender, @LoyaltyPoints, @CustomerStatus);

    set @Id = scope_identity();

    return 0;
end
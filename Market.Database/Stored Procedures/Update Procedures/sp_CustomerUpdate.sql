create procedure sp_CustomerUpdate
    @Id int,
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @IdCard nvarchar(15),
    @Gender char,
    @LoyaltyPoints int,
    @CustomerStatus tinyint
as
begin
    set nocount on;

    if not exists (select 1 from Customers where Id = @Id and IsActive = 1)
        begin
            raiserror ('Customer not found or already inactive.', 16, 1);
            return 1;
        end

    update Customers
    Set FirstName = @FirstName,
        LastName = @LastName,
        IdCard = @IdCard,
        Gender = @Gender,
        LoyaltyPoints = @LoyaltyPoints,
        CustomerStatus = @CustomerStatus,
        UpdateDate = getdate()
    where Id = @Id and (
        FirstName != @FirstName or
        LastName != @LastName or
        IdCard != @IdCard or
        Gender != @Gender or
        LoyaltyPoints != @LoyaltyPoints or
        CustomerStatus != @CustomerStatus);

    return 0;
end
create procedure sp_PurchaseGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Purchases where Id = @Id)
        begin
            raiserror('Purchase with Id %d does not exist.', 16, 1, @Id);
            return 1;
        end

    select *
    from Purchases P
    left join PurchaseItems PI on P.Id = PI.PurchaseId
    where P.Id = @Id;

    return 0;
end
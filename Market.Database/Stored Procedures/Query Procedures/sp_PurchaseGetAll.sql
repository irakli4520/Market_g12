create procedure sp_PurchaseGetAll
as
begin
    set nocount on;

    select *
    from Purchases P
    left join PurchaseItems PI on P.Id = PI.PurchaseId;

    return 0;
end
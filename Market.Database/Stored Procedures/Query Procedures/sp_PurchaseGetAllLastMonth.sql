create procedure sp_PurchaseGetAllLastMonth
as
begin
    set nocount on;

    select *
    from Purchases P
    left join PurchaseItems PI on P.Id = PI.PurchaseId
    where P.PurchaseDate >= dateadd(month, -1, getdate())
    order by P.PurchaseDate desc;

    return 0;
end
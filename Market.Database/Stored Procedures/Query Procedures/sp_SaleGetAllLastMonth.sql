create procedure sp_SaleGetAllLastMonth
as
begin
    set nocount on;

    select *
    from Sales S 
    left join SaleItems SI on S.Id = SI.SaleId
    where S.SaleDate >= dateadd(month, -1, getdate())
    order by S.SaleDate desc;

    return 0;
end
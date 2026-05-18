create procedure sp_SaleGetAll
as
begin
    set nocount on;

    select *
    from Sales S
    left join SaleItems SI on S.Id = SI.SaleId;

    return 0;
end
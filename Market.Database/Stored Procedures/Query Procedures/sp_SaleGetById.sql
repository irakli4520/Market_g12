create procedure sp_SaleGetById
    @Id int
as
begin
    set nocount on;

    if not exists (select 1 from Sales where Id = @Id)
        begin
            raiserror('Sale with Id %d does not exist.', 16, 1, @Id);
            return 1;
        end

    select *
    from Sales S 
    left join SaleItems SI on S.Id = SI.SaleId
    where S.Id = @Id;

    return 0;
end
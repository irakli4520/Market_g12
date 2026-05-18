create procedure sp_SupplierGetAll
as
begin
    set nocount on;

    select *
    from Suppliers
    where IsActive = 1;

    return 0;
end
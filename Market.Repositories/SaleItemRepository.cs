using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class SaleItemRepository : BaseRepository<SaleItem>, ISaleItemRepository
{
    public SaleItemRepository(IDbConnection connection) : base(connection)
    {
    }

    public void Assign(SaleItem entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("SaleId", entity.SaleId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("Quantity", entity.Quantity);
        parameters.Add("UnitPrice", entity.UnitPrice);
        
        _connection.Execute(
            "sp_SaleItemAssign",
            parameters,
            commandType: CommandType.StoredProcedure
        );
    }
    
    public override object Insert(SaleItem entity)
    {
        throw new NotSupportedException();
    }

    public override void Update(SaleItem entity)
    {
        throw new NotSupportedException();
    }
    
    public override void Delete(object id)
    {
        throw new NotSupportedException();
    }
}
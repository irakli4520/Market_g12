using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class PurchaseItemRepository : BaseRepository<PurchaseItem>, IPurchaseItemRepository
{
    public PurchaseItemRepository(IDbConnection connection) : base(connection)
    {
    }

    public void Assign(PurchaseItem entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("PurchaseId", entity.PurchaseId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("Quantity", entity.Quantity);
        parameters.Add("UnitPrice", entity.UnitPrice);
        
        _connection.Execute(
            "sp_PurchaseItemAssign",
            parameters,
            commandType: CommandType.StoredProcedure
        );
    }
    
    public override object Insert(PurchaseItem entity)
    {
        throw new NotSupportedException();
    }

    public override void Update(PurchaseItem entity)
    {
        throw new NotSupportedException();
    }
    
    public override void Delete(object id)
    {
        throw new NotSupportedException();
    }
}
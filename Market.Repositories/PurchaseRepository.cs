using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class PurchaseRepository : BaseRepository<Purchase>, IPurchaseRepository
{
    public PurchaseRepository(IDbConnection connection) : base(connection)
    {

    }

    public void PurchaseGetAllLastMonth()
    {
        _connection.Query($"sp_PurchaseGetAllLastMonth", 
            commandType: CommandType.StoredProcedure);
    }
}
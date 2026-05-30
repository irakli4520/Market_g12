using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class SaleRepository : BaseRepository<Sale>, ISaleRepository
{
    public SaleRepository(IDbConnection connection) : base(connection)
    {

    }
}
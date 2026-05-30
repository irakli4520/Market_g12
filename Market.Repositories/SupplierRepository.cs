using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class SupplierRepository : BaseRepository<Supplier>, ISupplierRepository
{
    public SupplierRepository(IDbConnection connection) : base(connection)
    {

    }
}
using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class DiscountRepository : BaseRepository<Discount>, IDiscountRepository
{
    public DiscountRepository(IDbConnection connection) : base(connection)
    {

    }
}
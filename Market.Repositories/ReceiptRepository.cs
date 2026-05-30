using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class ReceiptRepository : BaseRepository<Receipt>, IReceiptRepository
{
    public ReceiptRepository(IDbConnection connection) : base(connection)
    {

    }
}
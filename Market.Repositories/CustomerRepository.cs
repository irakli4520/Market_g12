using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class CustomerRepository : BaseRepository<Customer>, ICustomerRepository
{
    public CustomerRepository(IDbConnection connection) : base(connection)
    {

    }
}
using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class EmployeeRepository : BaseRepository<Employee>, IEmployeeRepository
{
    public EmployeeRepository(IDbConnection connection) : base(connection)
    {

    }
}
using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class EmployeeRoleRepository : BaseRepository<EmployeeRole>, IEmployeeRoleRepository
{
    public EmployeeRoleRepository(IDbConnection connection) : base(connection)
    {

    }
}
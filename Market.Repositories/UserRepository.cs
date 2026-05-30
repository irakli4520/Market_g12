using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class UserRepository : BaseRepository<User>, IUserRepository
{
    public UserRepository(IDbConnection connection) : base(connection)
    {

    }

    public override object Insert(User entity)
    {
        DynamicParameters parameters = new DynamicParameters();
        
        parameters.Add("EmployeeId", entity.EmployeeId);
        parameters.Add("Username", entity.Username);
        parameters.Add("PasswordHash", entity.PasswordHash);
        parameters.Add("Email", entity.Email);
        parameters.Add("Id", dbType:DbType.Int32, direction:ParameterDirection.Output);
        
        _connection.Execute(
            $"sp_UserInsert",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return parameters.Get<object>("Id");
    }
}
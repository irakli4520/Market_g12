using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public abstract class BaseRepository<T> : IBaseRepository<T> where T : class
{
    protected readonly IDbConnection _connection;
    private readonly string _entityName;

    protected BaseRepository(IDbConnection connection)
    {
        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _entityName = typeof(T).Name;
    }

    public T? GetById(object id)
    {
        ArgumentNullException.ThrowIfNull(id, nameof(id));

        return _connection.QuerySingleOrDefault<T>(
            $"sp_{_entityName}GetById",
            new { Id = id },
            commandType: CommandType.StoredProcedure);
    }

    public IEnumerable<T> GetAll()
    {
        return _connection.Query<T>(
            $"sp_{_entityName}GetAll",
            commandType: CommandType.StoredProcedure);
    }

    public virtual object Insert(T entity)
    {
        ArgumentNullException.ThrowIfNull(entity, nameof(entity));

        var parameters = new DynamicParameters();
        foreach (var param in typeof(T).GetProperties()
                     .Where(p => p.Name != "Id" &&
                                 p.Name != "CreatedDate" &&
                                 p.Name != "UpdatedDate" &&
                                 p.Name != "IsActive"))
        {
            parameters.Add(param.Name, param.GetValue(entity));
        }

        parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

        _connection.Execute($"sp_{_entityName}Insert",
            parameters,
            commandType: CommandType.StoredProcedure);

        return parameters.Get<object>("Id");
    }

    public virtual void Update(T entity)
    {
        ArgumentNullException.ThrowIfNull(entity, nameof(entity));
        
        var parameters = new DynamicParameters();

        foreach(var param in typeof(T).GetProperties()
                    .Where(p => p.Name != "CreatedDate"
                                && p.Name != "UpdatedDate"
                                && p.Name != "IsActive"))
        {
            parameters.Add(param.Name, param.GetValue(entity));
        }

        _connection.Execute(
            $"sp_{_entityName}Update",
            parameters,
            commandType: CommandType.StoredProcedure);
    }

    public virtual void Delete(object id)
    {
        ArgumentNullException.ThrowIfNull(id, nameof(id));

        _connection.Execute(
            $"sp_{_entityName}Delete",
            new { Id = id },
            commandType: CommandType.StoredProcedure);
    }
}
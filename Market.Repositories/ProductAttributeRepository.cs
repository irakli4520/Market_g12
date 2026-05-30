using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class ProductAttributeRepository : BaseRepository<ProductAttribute>, IProductAttributeRepository
{
    public ProductAttributeRepository(IDbConnection connection) : base(connection)
    {
    }

    public object AssignBoolean(ProductAttribute entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("CategoryAttributeId", entity.CategoryAttributeId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("BooleanValue", entity.BooleanValue);

        parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

        _connection.Execute(
            "sp_ProductAttributeCategoryAttributeAssignBooleanValue",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return parameters.Get<int>("Id");
    }
    
    public object AssignDate(ProductAttribute entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("CategoryAttributeId", entity.CategoryAttributeId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("DateValue", entity.DateValue);

        parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

        _connection.Execute(
            "sp_ProductAttributeCategoryAttributeAssignDateValue",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return parameters.Get<int>("Id");
    }
    
    public object AssignNumeric(ProductAttribute entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("CategoryAttributeId", entity.CategoryAttributeId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("NumericValue", entity.NumericValue);

        parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

        _connection.Execute(
            "sp_ProductAttributeCategoryAttributeAssignNumericValue",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return parameters.Get<int>("Id");
    }
    
    public object AssignString(ProductAttribute entity)
    {
        var parameters = new DynamicParameters();

        parameters.Add("CategoryAttributeId", entity.CategoryAttributeId);
        parameters.Add("ProductId", entity.ProductId);
        parameters.Add("StringValue", entity.StringValue);

        parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

        _connection.Execute(
            "sp_ProductAttributeCategoryAttributeAssignStringValue",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return parameters.Get<int>("Id");
    }
    
    public override object Insert(ProductAttribute entity)
    {
        throw new NotSupportedException();
    }

    public override void Update(ProductAttribute entity)
    {
        throw new NotSupportedException();
    }
    
    public override void Delete(object id)
    {
        ArgumentNullException.ThrowIfNull(id, nameof(id));

        _connection.Execute(
            $"sp_ProductAttributeCategoryAttributeUnassign",
            new { Id = id },
            commandType: CommandType.StoredProcedure);
    }
}

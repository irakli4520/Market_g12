using Market.DTO;
using System.Data;
using Dapper;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class ProductRepository : BaseRepository<Product>, IProductRepository
{
    public ProductRepository(IDbConnection connection) : base(connection)
    {
    }

    public void AssignProductToSupplier(int productId, int supplierId)
    {
        DynamicParameters parameters = new DynamicParameters();

        parameters.Add("ProductId", productId);
        parameters.Add("Username", supplierId);

        _connection.Execute(
            $"sp_ProductSupplierAssign",
            parameters,
            commandType: CommandType.StoredProcedure
        );
    }

    public void ProductAttributeGetAllByProductId(int productId)
    {
        _connection.Query($"sp_ProductAttributeGetAllByProductId",
            commandType: CommandType.StoredProcedure);
    }
}
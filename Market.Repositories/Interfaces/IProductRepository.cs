using Market.DTO;

namespace Market.Repositories.Interfaces;

public interface IProductRepository : IBaseRepository<Product>
{
    public void AssignProductToSupplier(int productId, int supplierId);
    public void ProductAttributeGetAllByProductId(int productId);
}
using Market.DTO;

namespace Market.Repositories.Interfaces;

public interface IProductAttributeRepository : IBaseRepository<ProductAttribute>
{
    public object AssignBoolean(ProductAttribute entity);
    public object AssignDate(ProductAttribute entity);
    public object AssignNumeric(ProductAttribute entity);
    public object AssignString(ProductAttribute entity);
}
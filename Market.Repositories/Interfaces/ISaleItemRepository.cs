using Market.DTO;

namespace Market.Repositories.Interfaces;

public interface ISaleItemRepository : IBaseRepository<SaleItem>
{
    public void Assign(SaleItem entity);
}
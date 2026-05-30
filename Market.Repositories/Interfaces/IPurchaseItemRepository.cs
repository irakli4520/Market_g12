using Market.DTO;

namespace Market.Repositories.Interfaces;

public interface IPurchaseItemRepository : IBaseRepository<PurchaseItem>
{
    public void Assign(PurchaseItem entity);
}